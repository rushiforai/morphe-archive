package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

val androidAutofillPatch = bytecodePatch(
    name = "Android autofill",
    description = "Allows Google's system autofill service in regular tabs only. Enable Autofill using another service in Chrome settings. Android autofill is disabled in Incognito.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(settingsPatch)
    execute {
        requireTarget(packageMetadata)
        val provider = mutableClassDefBy("Lorg/chromium/chrome/browser/autofill/AutofillClientProviderUtils;")
        for (name in listOf("getAndroidAutofillFrameworkAvailability", "updatePackageUsedForAutofill")) {
            val method = provider.methods.single { it.name == name }
            check(method.parameterTypes.first() == "Lorg/chromium/components/prefs/PrefService;")
            check(method.hasString("autofill.third_party_package_used_for_platform_autofill"))
            val instructions = method.implementation!!.instructions.toList()
            val google = instructions.withIndex().single {
                ((it.value as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.google.android.gms"
            }.index
            val equals = (instructions[google + 1] as? ReferenceInstruction)?.reference as? MethodReference
            check(equals?.toString() == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z")
            val result = instructions[google + 2]
            check(result.opcode == Opcode.MOVE_RESULT && instructions[google + 3].opcode == Opcode.IF_EQZ)
            // Permit Google in the same path as other valid Android providers. Keep
            // enterprise policy, platform availability, explicit user selection,
            // web-origin data and the provider's authentication completely native.
            method.replaceInstruction(google + 2,
                "const/4 v${(result as OneRegisterInstruction).registerA}, 0x0")
        }

        // Google does not recognize a replacement browser's private tabs. Never
        // create their Android provider: suppressing commit alone still exposes
        // private fields and can allow a save prompt when the view disappears.
        val profileType = "Lorg/chromium/chrome/browser/profiles/Profile;"
        val offTheRecord = classDefBy(profileType).methods.single {
            it.name == "i" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        val profileCode = offTheRecord.implementation!!.instructions.toList()
        check(profileCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.IF_EQZ,
            Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN))
        check(((profileCode.first() as ReferenceInstruction).reference as FieldReference).type ==
            "Lorg/chromium/chrome/browser/profiles/OtrProfileId;")

        val tab = mutableClassDefBy("Lorg/chromium/chrome/browser/tab/TabImpl;")
        val prepare = tab.methods.single { it.hasString("AutofillProvider.constructor") }
        check(prepare.parameterTypes.isEmpty() && prepare.returnType == "V")
        val code = prepare.implementation!!.instructions.toList()
        val profileField = code.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? FieldReference
        }.distinctBy { it.toString() }.single { it.type == profileType }
        val pref = code.withIndex().single {
            ((it.value as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                "autofill.using_virtual_view_structure"
        }.index
        check(code[pref + 1].opcode == Opcode.INVOKE_VIRTUAL &&
            code[pref + 2].opcode == Opcode.MOVE_RESULT && code[pref + 3].opcode == Opcode.IF_EQZ)
        val register = (code[pref + 2] as OneRegisterInstruction).registerA
        val disabled = (code[pref + 3] as BuilderOffsetInstruction).target.location.instruction!!
        // Reuse the native disabled path: detach any existing provider and mark
        // ContentView IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS. This applies
        // to every off-the-record profile, including private Custom Tabs.
        prepare.addInstructionsWithLabels(pref + 4, """
            iget-object v$register, p0, $profileField
            invoke-virtual {v$register}, $offTheRecord
            move-result v$register
            if-nez v$register, :platform_autofill_disabled
        """.trimIndent(), ExternalLabel("platform_autofill_disabled", disabled))
        println("Android autofill: reject off-the-record profiles in $prepare")
    }
}
