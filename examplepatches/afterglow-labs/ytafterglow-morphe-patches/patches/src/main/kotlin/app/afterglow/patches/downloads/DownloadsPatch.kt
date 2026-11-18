package app.afterglow.patches.downloads

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.settings.afterglowSettingsPatch
import app.afterglow.patches.morphe.morpheSettingsBridgePatch
import app.afterglow.patches.playback.overlayButtonsHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.youtube.interaction.downloads.ResolveCommandFingerprint
import app.morphe.patches.youtube.interaction.downloads.SaveOfflineVideoCallFingerprint
import app.morphe.patches.youtube.misc.auth.authHookPatch
import app.morphe.patches.shared.misc.fix.proto.fixProtoLibraryPatch
import org.w3c.dom.Element

internal val afterglowDownloadsResourcesPatch=resourcePatch {
    dependsOn(afterglowSettingsPatch)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest=doc.documentElement
            val application=doc.getElementsByTagName("application").item(0) as Element
            for(permission in listOf("android.permission.FOREGROUND_SERVICE", "android.permission.FOREGROUND_SERVICE_DATA_SYNC", "android.permission.WAKE_LOCK")) {
                val existing=doc.getElementsByTagName("uses-permission")
                if((0 until existing.length).none { (existing.item(it) as Element).getAttribute("android:name")==permission })
                    manifest.appendChild(doc.createElement("uses-permission").apply { setAttribute("android:name",permission) })
            }
            fun component(tag:String,name:String,configure:Element.()->Unit) {
                val list=doc.getElementsByTagName(tag)
                if((0 until list.length).none { (list.item(it) as Element).getAttribute("android:name")==name })
                    application.appendChild(doc.createElement(tag).apply {
                        setAttribute("android:name",name);setAttribute("android:exported","false");configure()
                    })
            }
            component("activity","app.afterglow.extension.ui.VaultActivity") {
                setAttribute("android:theme","@android:style/Theme.DeviceDefault.DayNight")
                setAttribute("android:configChanges","orientation|screenSize|screenLayout|smallestScreenSize|keyboardHidden|uiMode")
            }
            component("activity","app.afterglow.extension.ui.VaultPlayerActivity") {
                setAttribute("android:theme","@android:style/Theme.DeviceDefault.DayNight")
                setAttribute("android:configChanges","orientation|screenSize|screenLayout|smallestScreenSize|keyboardHidden|uiMode")
            }
            component("service","app.afterglow.extension.downloads.DownloadService") {
                setAttribute("android:foregroundServiceType","dataSync")
            }
            component("provider","app.afterglow.extension.downloads.DownloadsProvider") {
                setAttribute("android:authorities",manifest.getAttribute("package")+".afterglow.downloads")
                setAttribute("android:grantUriPermissions","true")
            }
        }
    }
}

/** Own sheet/queue/Vault; only signed-stream compatibility is shared with playback. */
internal val afterglowDownloadsHookPatch=bytecodePatch {
    dependsOn(afterglowDownloadsResourcesPatch,morpheSettingsBridgePatch,overlayButtonsHookPatch,
        authHookPatch,fixProtoLibraryPatch,app.morphe.patches.youtube.misc.spoof.spoofVideoStreamsPatch)
    execute {
        val hooks="$EXTENSION_PACKAGE/downloads/DownloadHooks;"
        ResolveCommandFingerprint.method.addInstructionsWithLabels(0,"""
            invoke-static/range { p1 .. p1 }, $hooks->nativeCommand(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :afterglow_original_command
            return-void
            :afterglow_original_command
            nop
        """)
        SaveOfflineVideoCallFingerprint.instructionMatches.first().getMethodCalled().apply {
            require(parameterTypes.first().toString()=="Ljava/lang/String;" && returnType=="V")
            addInstructionsWithLabels(0,"""
                invoke-static/range { p1 .. p1 }, $hooks->nativeButton(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :afterglow_original_download
                return-void
                :afterglow_original_download
                nop
            """)
        }
    }
}
