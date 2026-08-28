package app.mobilkincstar.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mobilkincstar.patches.shared.Constants.COMPATIBILITY_MOBILKINCSTAR
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val antiTamperPatch = bytecodePatch(
    name = "Disable Tamper Protection",
    description = "Aggressively bypasses the protector's monitoring services and initialization.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOBILKINCSTAR)

    execute {
        // 1. Disable the reporter that triggers the crash
        TamperReporterFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // 2. Disable the watchdog thread starter
        TamperThreadStarterFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // 3. Force Integrity Flag to false (tampered = false)
        // De-native to avoid signature checks in libdorsum_clavis_kincstar.so
        IntegrityStatusFingerprint.method.apply {
            accessFlags = accessFlags and AccessFlags.NATIVE.inv()
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // 4. Disable Protector Initialization completely (Don't load native library)
        ProtectorInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // 5. De-native other protector entry points
        ProtectorBaseOnCreateFingerprint.method.apply {
            accessFlags = accessFlags and AccessFlags.NATIVE.inv()
            addInstructions(
                0,
                """
                    invoke-super {p0}, Landroid/app/Application;->onCreate()V
                    return-void
                """
            )
        }

        // 6. Force React Native Initialization in MainApplication
        MainApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0}, Ligknimiyn/O;->onCreate()V
                invoke-static {p0}, Lcom/facebook/react/z;->a(Landroid/content/Context;)V
                return-void
            """
        )

        // 7. Disable Protector's isolated process services
        ProtectorService1Fingerprint.method.addInstructions(0, "return-void")
        ProtectorService2Fingerprint.method.addInstructions(0, "return-void")
        ProtectorService3Fingerprint.method.addInstructions(0, "return-void")
        
        // 8. Disable activity lifecycle callbacks
        ProtectorLifecycleFingerprint.method.addInstructions(0, "return-void")
    }
}
