package app.plyrs1.patches.com_gajihub_app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_GAJIHUB
import org.w3c.dom.Element

/**
 * Resource modifications for Disable Remote Updates:
 * - Rewrites CodePushServerUrl in res/values/strings.xml to loopback
 * - Clears CodePushDeploymentKey in res/values/strings.xml
 */
private val disableRemoteUpdatesResourcePatch = resourcePatch(
    name = null,
    description = "Internal: Neutralize CodePush and Revopush URLs in strings.xml",
    default = true
) {
    compatibleWith(COMPATIBILITY_GAJIHUB)

    execute {
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val elem = strings.item(i) as? Element ?: continue
                when (elem.getAttribute("name")) {
                    "CodePushServerUrl" -> elem.textContent = "http://127.0.0.1"
                    "CodePushDeploymentKey" -> elem.textContent = ""
                }
            }
        }
    }
}

@Suppress("unused")
val disableRemoteUpdatesPatch = bytecodePatch(
    name = "Disable Remote Updates",
    description = "Disables OTA JavaScript bundle updates, version queries, Revopush differential patching, " +
            "update dialogs, and hard-locks runtime bundle loading to the APK's local assets in GajiHub.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GAJIHUB)
    dependsOn(disableRemoteUpdatesResourcePatch)

    execute {
        // 1. Hard-lock CodePush.getJSBundleFile() to assets://index.android.bundle
        CodePushGetJSBundleFileFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const-string v0, "assets://index.android.bundle"
                return-object v0
            """
        )

        // 2. Neutralize CodePushNativeModule.setJSBundle(...) methods
        CodePushSetJSBundleFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.addInstructions(0, "return-void")
        }

        // 3. Neutralize downloadUpdate -> resolve null immediately
        CodePushDownloadUpdateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 4. Neutralize installUpdate -> resolve null immediately
        CodePushInstallUpdateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p4, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 5. Neutralize downloadAndReplaceCurrentBundle -> return-void
        CodePushDownloadAndReplaceBundleFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )

        // 6. Neutralize getUpdateMetadata -> resolve null
        CodePushGetUpdateMetadataFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 7. Neutralize getLatestRollbackInfo -> resolve null
        CodePushGetLatestRollbackInfoFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 8. Neutralize isFailedUpdate -> resolve false
        CodePushIsFailedUpdateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 9. Neutralize isFirstRun -> resolve false
        CodePushIsFirstRunFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """
        )

        // 10. Neutralize CodePushDialog.showDialog -> return-void
        CodePushShowDialogFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void"
        )

        // 11. Neutralize RevopushPatch.a(...) -> return -1 (v2.0.14+)
        RevopushPatchApplyFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, -0x1
                return v0
            """
        )
    }
}
