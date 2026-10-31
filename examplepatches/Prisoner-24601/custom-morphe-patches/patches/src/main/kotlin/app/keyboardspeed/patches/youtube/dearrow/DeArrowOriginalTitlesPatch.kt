package app.keyboardspeed.patches.youtube.dearrow

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val EXTENSION_CLASS = "Lapp/keyboardspeed/extension/dearrow/DeArrowOriginalTitlePatch;"

private const val EXTENSION_COMBINE_TITLES =
    "$EXTENSION_CLASS->combineTitles(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"

/**
 * DeArrow title of a video, in the extension of the official Morphe YouTube patches.
 */
private const val DEARROW_TITLE_CLASS =
    "Lapp/morphe/extension/youtube/patches/dearrow/DeArrowBrandingRequest\$DeArrowTitle;"

/**
 * Copy of the unchanged `titleFor` method, which the changed method calls.
 */
private const val TITLE_FOR_WITHOUT_ORIGINAL = "titleForWithoutOriginalTitle"

private const val TITLE_ORDER_DEARROW_FIRST = "deArrowFirst"
private const val TITLE_ORDER_ORIGINAL_FIRST = "originalFirst"

private const val MORPHE_PATCHES_MISSING =
    "The DeArrow code of the Morphe YouTube patches was not found. " +
        "Apply this patch together with the official Morphe Patches source."

private fun MutableClass.findMethod(name: String, returnType: String, vararg parameters: String) =
    methods.firstOrNull { method ->
        method.name == name &&
            method.returnType == returnType &&
            method.parameterTypes.map { it.toString() } == parameters.toList()
    } ?: throw PatchException("$MORPHE_PATCHES_MISSING Missing method: $type->$name")

/**
 * @return The number of registers that are not parameter registers.
 */
private fun MutableMethod.localRegisterCount(): Int {
    val parameterRegisters = parameterTypes.map { if (it.toString() in setOf("J", "D")) 2 else 1 }.sum() +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return implementation!!.registerCount - parameterRegisters
}

/**
 * Escapes a string for a smali string literal.
 */
private fun String.toSmaliLiteral() = buildString {
    for (char in this@toSmaliLiteral) {
        when {
            char == '\\' -> append("\\\\")
            char == '"' -> append("\\\"")
            char == '\n' -> append("\\n")
            char == '\t' -> append("\\t")
            char.code in 0x20..0x7E -> append(char)
            else -> append("\\u%04x".format(char.code))
        }
    }
}

@Suppress("unused")
val deArrowOriginalTitlesPatch = bytecodePatch(
    name = "DeArrow original titles",
    description = "Shows both the DeArrow title and the original title, instead of only the DeArrow title. " +
        "Apply together with the Morphe YouTube patches, and turn on DeArrow titles in the Morphe settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/dearrow.mpe")

    val separator by stringOption(
        key = "separator",
        default = " | ",
        values = mapOf(
            "Vertical bar ( | )" to " | ",
            "Dash ( — )" to " — ",
            "Bullet ( • )" to " • ",
            "New line" to "\n",
        ),
        title = "Separator",
        description = "Text between the DeArrow title and the original title.",
        required = true,
    ) { !it.isNullOrEmpty() }

    val titleOrder by stringOption(
        key = "titleOrder",
        default = TITLE_ORDER_DEARROW_FIRST,
        values = mapOf(
            "DeArrow title first" to TITLE_ORDER_DEARROW_FIRST,
            "Original title first" to TITLE_ORDER_ORIGINAL_FIRST,
        ),
        title = "Title order",
        description = "Which title is shown first.",
        required = true,
    ) { it == TITLE_ORDER_DEARROW_FIRST || it == TITLE_ORDER_ORIGINAL_FIRST }

    execute {
        OriginalTitleFirstFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, ${if (titleOrder == TITLE_ORDER_ORIGINAL_FIRST) "0x1" else "0x0"}
                return v0
            """,
        )

        SeparatorFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "${separator!!.toSmaliLiteral()}"
                return-object v0
            """,
        )
    }

    // The DeArrow code is merged into the app by the Morphe YouTube patches, which can be executed
    // after this patch. All patches are executed before any patch is finalized.
    finalize {
        val titleClass = mutableClassDefByOrNull(DEARROW_TITLE_CLASS)
            ?: throw PatchException(MORPHE_PATCHES_MISSING)

        if (titleClass.fields.none { it.name == "title" && it.type == "Ljava/lang/String;" }) {
            throw PatchException("$MORPHE_PATCHES_MISSING Missing field: $DEARROW_TITLE_CLASS->title")
        }
        if (titleClass.methods.any { it.name == TITLE_FOR_WITHOUT_ORIGINAL }) {
            throw PatchException("The DeArrow titles are already changed by this patch")
        }

        // Morphe fetches the original title only if casual mode needs it.
        // Fetch it for every video that has a DeArrow title.
        titleClass.findMethod("needsOriginalTitle", "Z").apply {
            if (localRegisterCount() < 1) {
                throw PatchException("DeArrowTitle.needsOriginalTitle has no free register")
            }
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $DEARROW_TITLE_CLASS->title:Ljava/lang/String;
                    if-eqz v0, :original
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // titleFor returns the DeArrow title shown instead of the original title, which it receives
        // to check the casual mode votes. The original code is kept in a copy, and its result
        // is combined with the original title.
        val titleFor = titleClass.findMethod("titleFor", "Ljava/lang/String;", "Ljava/lang/String;")
        if (titleFor.localRegisterCount() < 1) {
            throw PatchException("DeArrowTitle.titleFor has no free register")
        }

        val implementation = titleFor.implementation!!
        titleClass.methods.add(
            ImmutableMethod(
                titleClass.type,
                TITLE_FOR_WITHOUT_ORIGINAL,
                titleFor.parameters,
                titleFor.returnType,
                AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                null,
                null,
                ImmutableMethodImplementation(
                    implementation.registerCount,
                    implementation.instructions,
                    implementation.tryBlocks,
                    implementation.debugItems,
                ),
            ).toMutable(),
        )

        // The original code after the inserted code is no longer reached.
        titleFor.addInstructions(
            0,
            """
                invoke-direct { p0, p1 }, $DEARROW_TITLE_CLASS->$TITLE_FOR_WITHOUT_ORIGINAL(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                invoke-static { v0, p1 }, $EXTENSION_COMBINE_TITLES
                move-result-object v0
                return-object v0
            """,
        )
    }
}
