package patches.rox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val SERVICE_PACKAGE = "Lcom/pravera/flutter_foreground_task/service"
private const val SERVICE_MANAGER = "$SERVICE_PACKAGE/ForegroundServiceManager;"
private const val RESTART_RECEIVER = "$SERVICE_PACKAGE/RestartReceiver;"
private const val REBOOT_RECEIVER = "$SERVICE_PACKAGE/RebootReceiver;"
private const val BACKGROUND_SERVICE = "Lapp/proxma/rox/BackgroundService;"
private const val CONTEXT = "Landroid/content/Context;"
private const val INTENT = "Landroid/content/Intent;"

internal val roxServiceManagerStartFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(CONTEXT, "Ljava/lang/Object;"),
    custom = { method, classDef ->
        classDef.type == SERVICE_MANAGER && method.name == "start"
    },
)

// No accessFlags filter: it is matched exactly and the flags drift between builds
// (`public` in 3.0.13, `public final` in 3.0.14). Class + name + signature pin each uniquely.
internal val roxRestartReceiverFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(CONTEXT, INTENT),
    custom = { method, classDef ->
        classDef.type == RESTART_RECEIVER && method.name == "onReceive"
    },
)

internal val roxRebootReceiverFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(CONTEXT, INTENT),
    custom = { method, classDef ->
        classDef.type == REBOOT_RECEIVER && method.name == "onReceive"
    },
)

@Suppress("unused")
val stopBackgroundServicePatch = bytecodePatch(
    name = "Stop background service",
    description = "Keeps ROX's background service from running. It can hold the phone awake, restarts " +
        "itself when the system stops it and starts again after a reboot, which drains the battery. " +
        "The check-in and the rest of the app don't need it.",
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")

    execute {
        // The plugin answers Dart with success after start() returns, so returning early leaves the
        // app's call looking normal while no service is created.
        roxServiceManagerStartFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $BACKGROUND_SERVICE->blockedStart()V
                return-void
            """,
        )
        roxRestartReceiverFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $BACKGROUND_SERVICE->blockedRestart()V
                return-void
            """,
        )
        roxRebootReceiverFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $BACKGROUND_SERVICE->blockedBoot()V
                return-void
            """,
        )
    }
}
