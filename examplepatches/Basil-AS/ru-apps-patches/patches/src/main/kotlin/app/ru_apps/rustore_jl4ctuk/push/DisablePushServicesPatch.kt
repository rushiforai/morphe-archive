// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/push/DisablePushServicesPatch.kt.
package app.ru_apps.rustore_jl4ctuk.push

import app.shared.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.ru_apps.rustore_jl4ctuk.shared.Constants.COMPATIBILITY_RUSTORE
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableRuStorePushServices")

private val returnWorkerSuccess = """
    sget-object v0, Landroidx/work/b;->b:Landroidx/work/b;
    new-instance v1, Landroidx/work/c${'$'}a${'$'}c;
    invoke-direct {v1, v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>(Landroidx/work/b;)V
    return-object v1
""".trimIndent()

private val returnUnit = """
    sget-object v0, Lut0/e0;->a:Lut0/e0;
    return-object v0
""".trimIndent()

private val disablePushManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.childrenNamed("application").single() as Element

            val cloudMessagingPermissions = manifest.childrenNamed(
                "uses-permission",
                "uses-permission-sdk-23",
            ).filter { permission ->
                permission.getAttribute("android:name") ==
                    "com.google.android.c2dm.permission.RECEIVE"
            }
            if (cloudMessagingPermissions.size != 1) {
                throw PatchException(
                    "Expected one cloud messaging permission, " +
                        "found ${cloudMessagingPermissions.size}",
                )
            }
            manifest.removeChildren(cloudMessagingPermissions)

            val disabledComponents = application.disableComponentsByPrefix(
                "ru.rustore.sdk.pushclient.",
                "ru.vk.store.feature.push.client.",
                "com.vk.push.",
            )
            // Live 1.111.0.3 manifest has 13, not the 14 this guard was written against
            // (confirmed via aapt2 dump xmltree, 2026-10-08) - one push/VK-push component
            // present in the older build is gone. disableComponentsByPrefix() disables by
            // prefix match regardless of count, so this is purely a staleness tripwire.
            if (disabledComponents != 13) {
                throw PatchException(
                    "Expected thirteen push manifest components, " +
                        "found $disabledComponents",
                )
            }

            logger.info(
                "Removed cloud messaging permission and disabled " +
                    "$disabledComponents RuStore/VK Push components",
            )
        }
    }
}

@Suppress("unused")
val disablePushServicesPatch = bytecodePatch(
    name = "Disable push services",
    description = "Disables RuStore and VK remote push services and background tasks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)
    dependsOn(disablePushManifestPatch)

    execute {
        RuStorePushInitializeFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")
        RuStorePushInitProviderFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        RuStorePushArbiterReceiverFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "return-void")

        RuStoreMessagingServiceBindFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        RuStoreMessagingServiceCreateFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "invoke-super {p0}, Landroid/app/Service;->onCreate()V\nreturn-void",
            )
        RuStoreMessagingServiceStartFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x2\nreturn v0")
        listOf(
            RuStoreMessageReceivedFingerprint,
            RuStorePushTokenReceivedFingerprint,
        ).forEach { fingerprint ->
            fingerprint
                .matchAll(1..1)
                .single()
                .method
                .addInstructions(0, "return-void")
        }

        listOf(
            VkPushProviderInitializedFingerprint,
            VkPushAuthInitializedFingerprint,
        ).forEach { fingerprint ->
            fingerprint
                .matchAll(1..1)
                .single()
                .method
                .addInstructions(0, returnUnit)
        }
        vkPushLifecycleFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "return-void")
                ?: throw PatchException(
                    "VK Push lifecycle method changed: " +
                        vkPushLifecycleMethods.keys.elementAt(index),
                )
        }
        vkPushReceiverFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "return-void")
                ?: throw PatchException(
                    "VK Push receiver changed: ${vkPushReceiverClasses[index]}",
                )
        }

        VkPushBaseServiceBindFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        VkPushBaseServiceCreateFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                "invoke-super {p0}, Landroid/app/Service;->onCreate()V\nreturn-void",
            )
        VkPushBaseServiceStartFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x2\nreturn v0")

        vkPushDirectServiceBindFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                ?: throw PatchException(
                    "VK Push service bind method changed: " +
                        vkPushDirectServiceClasses[index],
                )
        }
        vkPushDirectServiceStartFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "const/4 v0, 0x2\nreturn v0")
                ?: throw PatchException(
                    "VK Push service start method changed: " +
                        vkPushDirectServiceClasses[index],
                )
        }
        vkPushBinderServiceFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                ?: throw PatchException(
                    "VK Push binder service changed: " +
                        vkPushBinderServiceClasses[index],
                )
        }

        VkPushDeviceIdProviderCreateFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        VkPushDeviceIdProviderQueryFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        pushWorkerFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, returnWorkerSuccess)
                ?: throw PatchException(
                    "Push worker changed: ${pushWorkerClasses[index]}",
                )
        }

        logger.info(
            "Disabled RuStore Push and VK Push initialization, messaging, " +
                "receivers, services, device ID provider, lifecycle hooks, and " +
                "${pushWorkerFingerprints.size} background workers",
        )
    }
}
