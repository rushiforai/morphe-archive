package app.template.patches.me

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ME

/**
 * The main screen's pop-up queue (e6 in 7.20.6): `enqueue(Function1<Function0, Unit>)` shows one
 * dialog at a time and chains the next on "onComplete". Every startup nag goes through it: cloud
 * backup, full-screen caller-ID promo, Wear promo, "notify your contacts", profile-visit upsells.
 * Matched by the two "onComplete" strings of its bound continuation reference.
 */
internal object PopupQueueEnqueueFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lkotlin/jvm/functions/Function1;"),
    strings = listOf("onComplete", "onComplete()V"),
)

@Suppress("unused")
val disablePopupsPatch = bytecodePatch(
    name = "Disable pop-ups",
    description = "Drops every pop-up queued on the main screen: cloud-backup prompt, caller-ID and " +
        "Wear promos, \"notify your contacts\", upsells.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ME)

    execute {
        PopupQueueEnqueueFingerprint.method.addInstructions(0, "return-void")
    }
}

/**
 * Me works as a caller-ID companion with just phone + call log + overlay, but it nags about the rest
 * (default caller-ID role, battery optimisation, full-screen intent, write call log):
 *  - PermissionsCheckerService posts a "Caller ID will not be shown" notification on launch.
 *  - TroubleshootingInfo feeds the "N permissions are missing" warning in the menu/settings.
 * The service is stopped immediately, and TroubleshootingInfo reports every requirement as met
 * (isDefaultDialer, p7, is left alone because Me changes caller pop-up behaviour on it).
 */
@Suppress("unused")
val disablePermissionNagsPatch = bytecodePatch(
    name = "Disable permission nags",
    description = "Stops the \"Caller ID will not be shown\" notification and the \"permissions are missing\" " +
        "warnings, so Me runs quietly with only the permissions you chose to grant.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ME)

    execute {
        mutableClassDefBy("Lcom/nfo/me/android/subcomponents/services/PermissionsCheckerService;")
            .methods.first { it.name == "onStartCommand" }
            .addInstructions(
                0,
                """
                    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V
                    const/4 v0, 0x2
                    return v0
                """,
            )

        // TroubleshootingInfo(isDefaultCallerApp, hasPhone, hasCallLog, batteryIgnored, canDrawOverApps,
        //                     canUseFullScreenIntent, isDefaultDialer, ...) -> force p1..p6 true.
        mutableClassDefBy("Lcom/nfo/me/android/domain/models/TroubleshootingInfo;")
            .methods.first { it.name == "<init>" && it.parameterTypes.size == 12 && it.parameterTypes.all { p -> p.toString() == "Z" } }
            .addInstructions(
                0,
                (1..6).joinToString("\n") { "const/4 p$it, 0x1" },
            )
    }
}
