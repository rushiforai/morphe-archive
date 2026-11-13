package app.olaelectric.patches.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.olaelectric.patches.shared.Constants.COMPATIBILITY_OLA
import app.olaelectric.patches.shared.DetectDeviceRepoFingerprint
import app.olaelectric.patches.shared.DetectDeviceRootUseCaseFingerprint
import app.olaelectric.patches.shared.DeviceInfoRootFingerprint
import app.olaelectric.patches.shared.SplashRootDialogFingerprint

@Suppress("unused")
val bypassRootDetectionPatch = bytecodePatch(
    name = "Bypass Root Detection",
    description = "Disables root detection, allowing the app to run on rooted devices.",
    default = true
) {
    compatibleWith(COMPATIBILITY_OLA)

    execute {
        // 1. Filesystem SU check: Luq/j;->a(String)Z -> return false
        runCatching {
            DetectDeviceRepoFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // 2. DeviceInfo root check: Lsj/a$a;->b()Z -> return false
        runCatching {
            DeviceInfoRootFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // 3. Coroutine DetectDeviceUseCase isDeviceRooted -> return Either.Right(Boolean.FALSE)
        runCatching {
            DetectDeviceRootUseCaseFingerprint.method.addInstructions(
                0,
                """
                    new-instance p1, Lou/a${'$'}b;
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    invoke-direct {p1, v0}, Lou/a${'$'}b;-><init>(Ljava/lang/Object;)V
                    return-object p1
                """
            )
        }

        // 4. SplashActivity Rooted Dialog handler -> return Unit without showing dialog or quitting
        runCatching {
            SplashRootDialogFingerprint.method.addInstructions(
                0,
                """
                    sget-object p0, Lxu/p;->a:Lxu/p;
                    return-object p0
                """
            )
        }
    }
}
