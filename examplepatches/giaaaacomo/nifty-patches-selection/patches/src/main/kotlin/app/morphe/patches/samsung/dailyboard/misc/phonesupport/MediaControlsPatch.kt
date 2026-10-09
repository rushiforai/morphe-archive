/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.samsung.dailyboard.misc.extension.sharedExtensionPatch
import app.morphe.patches.samsung.dailyboard.shared.Constants.COMPATIBILITY_DAILY_BOARD
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val NOTIFICATION_LISTENER = "app.morphe.extension.samsung.dailyboard.DailyBoardNotificationListener"
private const val MEDIA_SESSION_EXTENSION = "Lapp/morphe/extension/samsung/dailyboard/MediaSessionPatch;"

private val mediaListenerResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val listenerService = document.createElement("service").apply {
                setAttribute("android:name", NOTIFICATION_LISTENER)
                setAttribute("android:label", "Daily Board media access")
                setAttribute("android:permission", "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE")
                setAttribute("android:exported", "true")
            }
            val intentFilter = document.createElement("intent-filter")
            val listenerAction = document.createElement("action").apply {
                setAttribute(
                    "android:name",
                    "android.service.notification.NotificationListenerService"
                )
            }
            intentFilter.appendChild(listenerAction)
            listenerService.appendChild(intentFilter)
            application.appendChild(listenerService)
        }
    }
}

@Suppress("unused")
val dailyBoardMediaControlsPatch = bytecodePatch(
    name = "Enable media controls",
    description = "Restores media controls using Android notification access. Includes Enable phone support.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DAILY_BOARD)
    dependsOn(enableDailyBoardOnPhonesPatch, sharedExtensionPatch, mediaListenerResourcePatch)

    execute {
        MusicSessionListenerFingerprint.method.apply {
            val addListenerIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.definingClass == "Landroid/media/session/MediaSessionManager;" &&
                    reference.name == "addOnActiveSessionsChangedListener"
            }
            replaceInstruction(
                addListenerIndex,
                "invoke-static { v0, v2, v3 }, $MEDIA_SESSION_EXTENSION->startListening(" +
                    "Ljava/lang/Object;Landroid/media/session/MediaSessionManager;" +
                    "Landroid/media/session/MediaSessionManager\$OnActiveSessionsChangedListener;)" +
                    "Ljava/util/List;"
            )
            replaceInstruction(addListenerIndex + 1, "move-result-object v0")
            replaceInstruction(
                addListenerIndex + 2,
                "invoke-virtual { v3, v0 }, Lx0/a;->onActiveSessionsChanged(Ljava/util/List;)V"
            )
            replaceInstruction(addListenerIndex + 3, "nop")
            replaceInstruction(addListenerIndex + 4, "nop")
        }

    }
}
