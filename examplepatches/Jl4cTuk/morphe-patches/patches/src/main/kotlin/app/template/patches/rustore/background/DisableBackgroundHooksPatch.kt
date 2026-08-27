package app.template.patches.rustore.background

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.all.analytics.childrenNamed
import app.template.patches.all.analytics.disableComponentsByName
import app.template.patches.all.analytics.removeChildren
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableRuStoreBackgroundHooks")

private val returnWorkerSuccess = """
    sget-object v0, Landroidx/work/b;->b:Landroidx/work/b;
    new-instance v1, Landroidx/work/c${'$'}a${'$'}c;
    invoke-direct {v1, v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>(Landroidx/work/b;)V
    return-object v1
""".trimIndent()

private val removedPermissions = setOf(
    "android.permission.CHANGE_WIFI_STATE",
    "android.permission.CHANGE_NETWORK_STATE",
)

private const val CONNECT_SERVICE =
    "ru.vk.store.feature.connect.session.impl.presentation.ConnectSessionService"
private const val NETWORK_PROVIDER = "ru.mail.network.NetworkStateListenerProvider"
private const val WORK_MANAGER_RESCHEDULE_RECEIVER =
    "androidx.work.impl.background.systemalarm.RescheduleReceiver"
private const val BOOT_COMPLETED = "android.intent.action.BOOT_COMPLETED"

private val disableBackgroundHooksManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.childrenNamed("application").single() as Element
            val permissionNodes = manifest.childrenNamed(
                "uses-permission",
                "uses-permission-sdk-23",
            )
            val matchingPermissions = permissionNodes.filter {
                it.getAttribute("android:name") in removedPermissions
            }
            val permissionCounts = removedPermissions.associateWith { permission ->
                matchingPermissions.count { it.getAttribute("android:name") == permission }
            }
            if (permissionCounts.values.any { it != 1 }) {
                throw PatchException(
                    "Unexpected background-hook permission inventory: $permissionCounts",
                )
            }
            manifest.removeChildren(matchingPermissions)

            val disabledComponents = application.disableComponentsByName(
                CONNECT_SERVICE,
                NETWORK_PROVIDER,
            )
            if (disabledComponents != 2) {
                throw PatchException(
                    "Expected the Connect service and network provider, " +
                        "found $disabledComponents components",
                )
            }

            val bootReceivers = application.childrenNamed("receiver").filter { receiver ->
                receiver.childrenNamed("intent-filter")
                    .flatMap { it.childrenNamed("action") }
                    .any { it.getAttribute("android:name") == BOOT_COMPLETED }
            }
            val workManagerReceivers = bootReceivers.filter {
                it.getAttribute("android:name") == WORK_MANAGER_RESCHEDULE_RECEIVER
            }
            val nonWorkManagerReceivers = bootReceivers - workManagerReceivers.toSet()
            if (workManagerReceivers.size != 1 || nonWorkManagerReceivers.size != 3) {
                throw PatchException(
                    "Unexpected BOOT_COMPLETED receiver inventory: " +
                        "WorkManager=${workManagerReceivers.size}, " +
                        "other=${nonWorkManagerReceivers.size}",
                )
            }
            nonWorkManagerReceivers.forEach { receiver ->
                receiver.setAttribute("android:enabled", "false")
                receiver.setAttribute("android:exported", "false")
            }

            val receiveBootPermissionCount = permissionNodes.count {
                it.getAttribute("android:name") ==
                    "android.permission.RECEIVE_BOOT_COMPLETED"
            }
            if (receiveBootPermissionCount != 1) {
                throw PatchException(
                    "WorkManager boot permission inventory changed: " +
                        receiveBootPermissionCount,
                )
            }

            logger.info(
                "Removed ${matchingPermissions.size} network-control permissions, " +
                    "disabled the Connect VPN service, network listener provider, " +
                    "and ${nonWorkManagerReceivers.size} non-WorkManager boot receivers",
            )
        }
    }
}

@Suppress("unused")
val disableBackgroundHooksPatch = bytecodePatch(
    name = "Disable background hooks",
    description =
        "Disables RuStore network-state monitoring, built-in VPN sessions, and startup hooks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)
    dependsOn(disableBackgroundHooksManifestPatch)

    execute {
        NetworkStateListenerProviderCreateFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        NetworkCallbackStateProviderInitFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")

        ConnectSessionLauncherStartFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")

        ConnectSessionServiceStartFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V\n" +
                    "const/4 v0, 0x2\nreturn v0",
            )

        ConnectSessionEstablishTunnelFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        ConnectSessionProtectSocketFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        ConnectSessionExternalVpnCheckFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\n" +
                    "return-object v0",
            )

        ConnectDownloadWorkerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, returnWorkerSuccess)

        logger.info(
            "Disabled network callback initialization, Connect session launch, " +
                "VPN tunnel creation, socket protection, external VPN detection, " +
                "and the Connect download worker",
        )
    }
}
