package app.saketh.patches.webnovel.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.registerFeature
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOOKS = "Lapp/saketh/extension/theme/ThemeHooks;"

@Suppress("unused")
val materialYouPatch = patch(
    name = "Material You colors",
    description = "Adds wallpaper-based native app colors and a separate reader page/text palette on Android 12+. Preserves saved reader presets and layouts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(themeHooksPatch)

    execute {
        registerFeature("material_you")
        registerFeature("reader_material_you")
        val navigation = "Lcom/qidian/Int/reader/view/MainPageTabItemView;"
        val tabs = mutableClassDefBy(navigation)
        // The tab's only instance flag records whether it is selected.
        val selected = tabs.fields.single { it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) }.name
        val iconUpdates = tabs.methods.filter { method -> method.implementation?.instructions.orEmpty().any { it.isImageResourceCall() } }
        check(iconUpdates.size == 2) { "Expected selection and recolor tab icon updates, found ${iconUpdates.map { it.name }}" }
        iconUpdates.forEach { method ->
            method.apply {
                check(implementation!!.registerCount < 16)
                val call = implementation!!.instructions.withIndex().single { it.value.isImageResourceCall() }
                val registers = call.value as FiveRegisterInstruction
                // The stock resource ID is dead here. Keep the Glide branch's labels after this hook.
                addInstructions(call.index + 1, """
                    iget-boolean v${registers.registerD}, p0, $navigation->$selected:Z
                    invoke-static { v${registers.registerC}, v${registers.registerD} }, $HOOKS->navigationIcon(Landroid/widget/ImageView;Z)V
                """)
            }
        }
    }
}

private fun Instruction.isImageResourceCall(): Boolean {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference
    return reference?.definingClass == "Landroidx/appcompat/widget/AppCompatImageView;" &&
        reference.name == "setImageResource"
}
