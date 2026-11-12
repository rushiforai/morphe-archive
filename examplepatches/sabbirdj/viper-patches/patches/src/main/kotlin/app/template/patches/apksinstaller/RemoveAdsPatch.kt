package app.template.patches.apksinstaller

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_APKS_INSTALLER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val apksInstallerRemoveAdsPatch = patch(
    name = "Remove ads (APKS Installer)",
    description = "Disables all ads by forcing the master ads flag MyApplication.m to false and making the ad initializer a no-op. Verified on APKS Installer 2.8-Google.",
    default = true
) {
    compatibleWith(COMPATIBILITY_APKS_INSTALLER)

    execute {
        // NOTE on method: the SAI Premium patch (v1.0.7) proved that
        // addInstructions before a branch target does NOT take effect even
        // though the patcher reports success -- the branch jumps over the
        // inserted code. The fix is replaceInstruction: a same-size swap
        // (1 code unit for 1 code unit) so nothing shifts and no label is
        // involved. Both edits below use it.

        // 1) MyApplication.onCreate: force m=false at startup.
        // In the clean APK, `const/4 v1, 0x1` runs only when both prefs
        // (privacy_agreed + setup_completed) are true, then the sput stores
        // v1 into m. Replace that const with `const/4 v1, 0x0` so m is
        // always false. It is the FIRST const/4 v1, 0x1 in the method (the
        // second one, later, belongs to the Y0 constructor call and is left alone).
        ApksInstallerMyApplicationFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("MyApplication.onCreate: no implementation")
            val constIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_4 &&
                    instr is OneRegisterInstruction && instr.registerA == 1 &&
                    instr is NarrowLiteralInstruction && instr.narrowLiteral == 1
            }
            require(constIndex >= 0) { "MyApplication.onCreate: const/4 v1, 0x1 not found" }
            it.method.replaceInstruction(constIndex, "const/4 v1, 0x0")
        }

        // 2) l2/N.a (ad initializer): make it return immediately so it never
        // sets m=true and never calls MobileAds.initialize().
        // The method is declared-synchronized and starts with monitor-enter.
        // Replace that first instruction (index 0) with return-void -- same
        // size (1 code unit), so nothing shifts. The VM still releases the
        // synchronized monitor on return.
        ApksInstallerAdsInitFingerprint.let {
            it.method.replaceInstruction(0, "return-void")
        }
    }
}
