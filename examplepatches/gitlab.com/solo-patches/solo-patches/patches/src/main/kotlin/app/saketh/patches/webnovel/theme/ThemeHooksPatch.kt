package app.saketh.patches.webnovel.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.hookAt
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOOKS = "Lapp/saketh/extension/theme/ThemeHooks;"
private const val SKIN = "Lskin/support/content/res/SkinCompatResources;"
private const val CONTEXT = "Landroid/content/Context;"

/** Routes native skin colors, color resource IDs and reader palette inputs through ThemeHooks, and tracks night mode. */
internal val themeHooksPatch = patch {
    dependsOn(patchControlsRuntime)

    execute {
        patchReaderColors()
        val skin = mutableClassDefBy(SKIN)
        listOf(
            Triple("getColor", "I", "color"),
            Triple("getColorStateList", "Landroid/content/res/ColorStateList;", "stateList"),
            Triple("getDrawable", "Landroid/graphics/drawable/Drawable;", "drawable"),
        ).forEach { (name, type, hook) ->
            val method = skin.methods.single { it.name == name && it.parameterTypes == listOf(CONTEXT, "I") }
            check(method.implementation!!.registerCount in 3..16)
            val suffix = name.removePrefix("get")
            val move = if (type == "I") "move-result" else "move-result-object"
            val result = if (type == "I") "return" else "return-object"
            // Keep the private skin resolver, including the user's own skin and fallback behavior.
            method.removeInstructions(0, method.implementation!!.instructions.size)
            method.addInstructions(0, """
                invoke-static {}, $SKIN->getInstance()$SKIN
                move-result-object v0
                invoke-direct { v0, p0, p1 }, $SKIN->getSkin$suffix(${CONTEXT}I)$type
                $move v0
                invoke-static { p0, p1, v0 }, $HOOKS->$hook(${CONTEXT}I$type)$type
                $move v0
                $result v0
            """)
        }
        // Skin-aware XML backgrounds use a separate resolver from SkinCompatResources.
        val vectors = "Lskin/support/content/res/SkinCompatVectorResources;"
        mutableClassDefBy(vectors).methods.single {
            it.name == "getDrawableCompat" && it.parameterTypes == listOf(CONTEXT, "I")
        }.apply {
            check(implementation!!.registerCount in 3..16)
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(0, """
                invoke-static {}, $vectors->getInstance()$vectors
                move-result-object v0
                invoke-direct { v0, p0, p1 }, $vectors->getSkinDrawableCompat(${CONTEXT}I)Landroid/graphics/drawable/Drawable;
                move-result-object v0
                invoke-static { p0, p1, v0 }, $HOOKS->drawable(${CONTEXT}ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
                move-result-object v0
                return-object v0
            """)
        }
        // Rounded backgrounds, switches and other native views consume resource IDs, not ARGB values.
        NightResourceIdFingerprint.method.apply {
            implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }.reversed().forEach { (index, register) ->
                    hookAt(index, """
                        invoke-static/range { v$register .. v$register }, $HOOKS->resourceId(I)I
                        move-result v$register
                    """)
                }
        }
        // The night-mode writer stores the in-memory state through that holder's only setter.
        val setter = NightModeWriteFingerprint.method.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.single { call -> call.parameterTypes.map { it.toString() } == listOf("Z") && call.returnType == "V" }
        val mode = mutableClassDefBy(setter.definingClass)
        val setDark = mode.methods.single { it.name == setter.name && it.parameterTypes == listOf("Z") }
        val dark = setDark.implementation!!.instructions.single { it.opcode == Opcode.IPUT_BOOLEAN }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        setDark.addInstructions(0, "invoke-static/range { p1 .. p1 }, $HOOKS->setDark(Z)V")
        mode.methods.single { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions.orEmpty().any {
                    it.opcode == Opcode.IGET_BOOLEAN && (it as ReferenceInstruction).reference == dark
                }
        }.apply {
            implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }.reversed().forEach { (index, register) ->
                    addInstructions(index, """
                        invoke-static/range { v$register .. v$register }, $HOOKS->recordDark(Z)Z
                        move-result v$register
                    """)
                }
        }
    }
}

/** Maps a color resource ID to its night variant while night mode is active. */
private object NightResourceIdFingerprint : Fingerprint(
    isStatic = true,
    returnType = "I",
    parameters = listOf(CONTEXT, "I"),
    filters = listOf(methodCall(definingClass = "Lskin/support/content/res/SkinCompatUserThemeManager;", name = "getColorState")),
)

/** Persists the reader night setting, updates the in-memory night state and loads the night skin. */
private object NightModeWriteFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("I", "Z"),
    strings = listOf("SettingReadingIsNight", "night"),
)
