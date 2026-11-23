package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val FONT_CONTROLLER = "Lapp/voidhack/extension/applemusic/font/FontController;"

private val customFontResources = resourcePatch {
    execute {
        listOf("values", "values-ja").forEach { directory ->
            checkNotNull(
                SfTypefaceBuild::class.java.getResourceAsStream(
                    "/applemusic/font/$directory/voidhack_custom_font.xml",
                ),
            ).use { input ->
                document(input).use { translations ->
                    document("res/$directory/strings.xml").use { destination ->
                        val entries = translations.getElementsByTagName("string")
                        for (index in 0 until entries.length) {
                            destination.documentElement.appendChild(
                                destination.importNode(entries.item(index), true),
                            )
                        }
                    }
                }
            }
        }
    }
}

private object SfTypefaceBuild : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/graphics/Typeface;",
    filters = listOf(
        string("wght"),
        string("opsz"),
    ),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/apple/android/music/utils/") &&
            method.parameterTypes.size == 4 &&
            method.parameterTypes[0] == "Landroid/content/Context;"
    },
)

private object SfLetterSpacing : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "F",
    filters = listOf(
        string("getSfLetterSpacing(): calculated letter spacing is null. This should never happen!"),
    ),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/apple/android/music/utils/") &&
            method.parameterTypes.size == 5 &&
            method.parameterTypes[0] == "Landroid/content/Context;"
    },
)

private object SfTextViewApply : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/widget/TextView;",
            name = "setTypeface",
            returnType = "V",
        ),
        methodCall(
            definingClass = "Landroid/widget/TextView;",
            name = "setLetterSpacing",
            returnType = "V",
        ),
    ),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/apple/android/music/utils/") &&
            method.parameterTypes.size == 5 &&
            method.parameterTypes[0] == "Landroid/widget/TextView;"
    },
)

@Suppress("unused")
val customFontPatch = bytecodePatch(
    name = "Custom font",
    description = "Replaces Apple Music's font across views, Compose screens, and lyrics using imported .ttf/.otf/.ttc files or system fonts, with optional SF Pro Latin preservation and per-scope settings.",
) {
    dependsOn(customFontResources)
    compatibleWith(appleMusicCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Wrap central SF Typeface builder (m1.B / l1.B / i1.B).
        val fontClass = SfTypefaceBuild.classDef
        val buildMethod = SfTypefaceBuild.method
        val origBuildName = buildMethod.name
        val origBuildAccess = buildMethod.accessFlags
        val buildDesc = buildMethod.parameterTypes.joinToString("")
        val nativeBuildName = "voidhackNativeBuildTypeface"
        buildMethod.name = nativeBuildName

        val buildWrapper = ImmutableMethod(
            fontClass.type,
            origBuildName,
            buildMethod.parameters,
            "Landroid/graphics/Typeface;",
            origBuildAccess,
            null,
            null,
            MutableMethodImplementation(5),
        ).toMutable()
        buildWrapper.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p3}, ${fontClass.type}->$nativeBuildName($buildDesc)Landroid/graphics/Typeface;
                move-result-object v0
                invoke-static {p0, v0}, $FONT_CONTROLLER->resolveTypeface(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
                move-result-object v0
                return-object v0
            """,
        )
        fontClass.methods.add(buildWrapper)

        // 2. Wrap SF letter-spacing calculator (m1.A / l1.A / i1.A).
        val spacingMethod = SfLetterSpacing.method
        val origSpacingName = spacingMethod.name
        val origSpacingAccess = spacingMethod.accessFlags
        val spacingDesc = spacingMethod.parameterTypes.joinToString("")
        val nativeSpacingName = "voidhackNativeLetterSpacing"
        spacingMethod.name = nativeSpacingName

        val spacingWrapper = ImmutableMethod(
            fontClass.type,
            origSpacingName,
            spacingMethod.parameters,
            "F",
            origSpacingAccess,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable()
        spacingWrapper.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p4}, ${fontClass.type}->$nativeSpacingName($spacingDesc)F
                move-result v0
                invoke-static {p0, v0}, $FONT_CONTROLLER->adjustLetterSpacing(Landroid/content/Context;F)F
                move-result v0
                return v0
            """,
        )
        fontClass.methods.add(spacingWrapper)

        // 3. Wrap TextView apply helper (m1.q / l1.q / i1.q) to tag lyrics TextViews in ThreadLocal scope.
        val applyMethod = SfTextViewApply.method
        val origApplyName = applyMethod.name
        val origApplyAccess = applyMethod.accessFlags
        val applyDesc = applyMethod.parameterTypes.joinToString("")
        val nativeApplyName = "voidhackNativeApplyTextView"
        applyMethod.name = nativeApplyName

        val applyWrapper = ImmutableMethod(
            fontClass.type,
            origApplyName,
            applyMethod.parameters,
            "V",
            origApplyAccess,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable()
        applyWrapper.addInstructions(
            0,
            """
                invoke-static {p0}, $FONT_CONTROLLER->enterTextView(Landroid/widget/TextView;)V
                invoke-static/range {p0 .. p4}, ${fontClass.type}->$nativeApplyName($applyDesc)V
                invoke-static {}, $FONT_CONTROLLER->exitTextView()V
                return-void
            """,
        )
        fontClass.methods.add(applyWrapper)

        // 4. Add Custom font entry to Apple Music Settings.
        LibrarySettingsCreated.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $FONT_CONTROLLER->attachSettings(Ljava/lang/Object;)V",
        )
        LibrarySettingsItems.method.apply {
            checkNotNull(implementation).instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static/range {v$register .. v$register}, $FONT_CONTROLLER->withSettings(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """,
                    )
                }
        }
    }
}
