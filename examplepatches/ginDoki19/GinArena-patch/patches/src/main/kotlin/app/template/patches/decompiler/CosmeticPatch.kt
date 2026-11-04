package app.template.patches.decompiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_APK_DECOMPILER
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private object HomeToolbar : Fingerprint(definingClass = "LO00O0oOoOo00o/o0o0oOO0O00O00o;", name = "run", returnType = "V", parameters = emptyList())
private object SettingsCards : Fingerprint(definingClass = "LOo00oO0oO00/oooOOO0o0O0OO;", name = "<init>", returnType = "V", parameters = listOf("Lcom/apktools/decompile/ui/MainActivity;", "Landroid/widget/LinearLayout;"))
private object HomeCards : Fingerprint(definingClass = "Lcom/apktools/decompile/ui/MainActivity;", name = "O0Oo00Oo00o", returnType = "V", parameters = emptyList())
private object QuickEditUi : Fingerprint(definingClass = "Lcom/apktools/decompile/workbench/ImportActivity;", name = "onCreate", returnType = "V", parameters = listOf("Landroid/os/Bundle;"))
private object ApplyUi : Fingerprint(definingClass = "Lcom/apktools/decompile/workbench/o00OO0OoO0O00o;", name = "OOOOOo0o000oO00", returnType = "V", parameters = emptyList())
private object TextUi : Fingerprint(definingClass = "LOOOOo0OOOO0OO/o000Oooo00o;", name = "<init>", returnType = "V", parameters = listOf("LOo00oO0oO00/oO0OOOoOoOooOO;", "Lcom/apktools/decompile/workbench/PackageToolsModel;", "LOo00oO0oO00/OooO0O0o0OO;"))
private object AnalysisTextUi : Fingerprint(definingClass = "Lcom/apktools/decompile/premium/PremiumActivity;", name = "o0O0ooOOOOoo0", returnType = "V", parameters = emptyList())
private object ImageSaveUi : Fingerprint(definingClass = "Lcom/apktools/decompile/premium/ProjectImagesActivity;", name = "OOoo0o0ooo0O", returnType = "V", parameters = emptyList())

private fun guard(ok: Boolean, message: String) {
    if (!ok) throw PatchException("Cosmetic patch 4.12.0 structural check failed: $message")
}

private fun MutableMethod.fieldIndexes(field: String) = instructions.withIndex().filter {
    val f = (it.value as? ReferenceInstruction)?.reference as? FieldReference
    f?.name == field && it.value.opcode == Opcode.SGET
}.map { it.index }

private fun MutableMethod.hasCallAt(index: Int, owner: String, name: String): Boolean {
    val i = instructions.getOrNull(index) ?: return false
    val r = (i as? ReferenceInstruction)?.reference as? MethodReference
    return r?.definingClass == owner && r.name == name
}

private fun MutableMethod.exactSuffixIndex(fieldName: String): Int {
    val matches = instructions.withIndex().filter {
        val ref = (it.value as? ReferenceInstruction)?.reference as? StringReference
        (it.value.opcode == Opcode.CONST_STRING || it.value.opcode == Opcode.CONST_STRING_JUMBO) && ref?.string == " · VIP"
    }
    guard(matches.size == 1, "$definingClass->$name suffix count ${matches.size}")
    val idx = matches.single().index
    guard(fieldIndexes(fieldName).any { it in (idx - 6)..(idx - 1) }, "$definingClass->$name label resource")
    guard(hasCallAt(idx - 1, "Ljava/lang/StringBuilder;", "append") && hasCallAt(idx + 1, "Ljava/lang/StringBuilder;", "append") &&
        hasCallAt(idx + 2, "Ljava/lang/StringBuilder;", "toString") &&
        hasCallAt(idx + 4, "Landroid/widget/TextView;", "setText"), "$definingClass->$name label flow")
    return idx
}

private fun MutableMethod.clearSuffix(idx: Int) {
    val register = (instructions[idx] as? OneRegisterInstruction)?.registerA
        ?: throw PatchException("Cannot resolve VIP suffix destination register")
    replaceInstruction(idx, "const-string v$register, \"\"")
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks local premium tools and cleans up VIP labels.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_APK_DECOMPILER)
    dependsOn(decompilerCorePatch)
    execute {
        // Validate all sites before making any cosmetic changes.
        val suffixSites = listOf(
            QuickEditUi.method to "pkg_quick_title",
            ApplyUi.method to "pkg_apply_changes",
            TextUi.method to "ai_complete",
            AnalysisTextUi.method to "ai_complete",
            ImageSaveUi.method to "save",
        ).map { (method, field) -> method to method.exactSuffixIndex(field) }

        val home = HomeCards.method
        val badgeSites = home.instructions.withIndex().filter {
            val r = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            it.value.opcode == Opcode.INVOKE_VIRTUAL && r?.definingClass == "LOo00oO0oO00/o00OOOo0000000;" && r.name == "O0ooOOOO00OOOOO" && r.parameterTypes.isEmpty() && r.returnType == "V"
        }
        guard(badgeSites.size == 1, "home compare badge count")
        val badgeIndex = badgeSites.single().index
        guard(home.fieldIndexes("flow_compare_supported").any { it in (badgeIndex - 20) until badgeIndex }, "compare card anchor")

        val toolbar = HomeToolbar.method
        val toolbarFields = toolbar.fieldIndexes("wb_pro")
        guard(toolbarFields.size == 1, "home VIP entry anchor")
        val ti = toolbarFields.single()
        guard(toolbar.hasCallAt(ti + 1, "LOo00oO0oO00/O00O0o0Oooo0O;", "o00OO0OoO0O00o") &&
            toolbar.instructions.getOrNull(ti + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            (toolbar.instructions[ti + 2] as? OneRegisterInstruction)?.registerA == 0 &&
            toolbar.instructions.getOrNull(ti + 3)?.opcode == Opcode.NEW_INSTANCE &&
            (toolbar.instructions[ti + 3] as? OneRegisterInstruction)?.registerA == 3, "home button/register shape")

        val settings = SettingsCards.method
        val sf = settings.fieldIndexes("wb_pro")
        guard(sf.size == 1, "settings VIP entry anchor")
        val si = sf.single()
        guard(settings.hasCallAt(si - 2, "Lcom/google/android/material/card/MaterialCardView;", "setCardBackgroundColor") &&
            settings.instructions.getOrNull(si - 1)?.opcode == Opcode.SGET &&
            (settings.instructions[si - 1] as? OneRegisterInstruction)?.registerA == 2, "settings card/register shape")
        val invoke = settings.instructions[si - 2] as? FiveRegisterInstruction
        guard(invoke?.registerC == 0 && invoke.registerD == 2, "settings card receiver")

        suffixSites.forEach { (method, index) -> method.clearSuffix(index) }
        home.replaceInstruction(badgeIndex, "nop")
        // v3 is immediately overwritten by NEW_INSTANCE in this stock method.
        toolbar.addInstructions(ti + 3, """
            const/16 v3, 0x8
            invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V
        """.trimIndent())
        // v2 is immediately overwritten by the existing SGET; v0 is the card.
        settings.addInstructions(si - 1, """
            const/16 v2, 0x8
            invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V
        """.trimIndent())
    }
}
