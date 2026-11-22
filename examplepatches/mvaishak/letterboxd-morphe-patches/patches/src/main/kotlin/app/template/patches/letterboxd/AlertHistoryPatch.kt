package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private const val ME = "Lcom/letterboxd/letterboxd/ui/fragments/user/MeFragment"
private const val TAB = "$ME\$Tab;"
private const val HOST_TOOLBAR = "Lcom/google/android/material/appbar/MaterialToolbar;"
private const val BELL = "Lapp/template/extension/alerts/AlertHistoryUi;"
private const val NATIVE_HISTORY = "Lapp/template/extension/alerts/NativeAlertHistory;"
private const val FIREBASE_DISPLAY = "Lcom/google/firebase/messaging/DisplayNotification;"

private val notificationDelegation = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val key = "firebase_messaging_notification_delegation_enabled"
            val metadata = application.getElementsByTagName("meta-data")
            val entry = (0 until metadata.length).map { metadata.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == key }
                ?: manifest.createElement("meta-data").also {
                    it.setAttribute("android:name", key)
                    application.appendChild(it)
                }
            entry.setAttribute("android:value", "false")
        }
    }
}

internal val alertHistoryPatch = bytecodePatch {
    dependsOn(modSettingsPatch, notificationDelegation)

    execute {
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $NATIVE_HISTORY->initialize(Landroid/content/Context;)V",
        )
        // The initial toolbar config runs before the pager selects its default Profile tab.
        MeFragmentConfigureFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-direct { p0 }, $ME;->getCurrentTab()$TAB
                move-result-object v0
                if-eqz v0, :attach
                sget-object v1, $TAB->Profile:$TAB
                if-ne v0, v1, :stock
                :attach
                invoke-static { p1 }, $BELL->attach(${HOST_TOOLBAR})V
                :stock
                nop
            """,
        )

        val tabSelected = Fingerprint(
            definingClass = "$ME\$configurePager\$2;",
            name = "onTabSelected",
            returnType = "V",
            parameters = listOf("Lcom/google/android/material/tabs/TabLayout\$Tab;"),
        ).method
        val inflation = tabSelected.implementation!!.instructions.withIndex().single {
            (it.value as? ReferenceInstruction)?.reference?.toString() ==
                "$HOST_TOOLBAR->inflateMenu(I)V"
        }.index

        // Every inner tab clears its menu. Add the bell before the native More action on Profile.
        tabSelected.addInstructionsWithLabels(
            inflation,
            """
                sget-object v2, $TAB->Profile:$TAB
                if-ne p1, v2, :inflate
                invoke-static { v0 }, $BELL->attach(${HOST_TOOLBAR})V
                :inflate
                nop
            """,
        )

        val service = Fingerprint(
            definingClass = "Lcom/letterboxd/letterboxd/services/NotificationMessagingService;",
            name = "onMessageReceived",
            returnType = "V",
            parameters = listOf("Lcom/google/firebase/messaging/RemoteMessage;"),
        ).method
        val sent = service.implementation!!.instructions.withIndex().single {
            (it.value as? ReferenceInstruction)?.reference?.toString() ==
                "Landroidx/core/app/NotificationManagerCompat;->notify(ILandroid/app/Notification;)V"
        }.index
        service.addInstructions(
            sent + 1,
            """
                const/4 v1, 0x0
                invoke-static { p0, v1, v0, p1 }, $NATIVE_HISTORY->posted(Landroid/content/Context;Ljava/lang/String;ILandroid/app/Notification;)V
            """,
        )

        val display = Fingerprint(
            definingClass = FIREBASE_DISPLAY,
            name = "showNotification",
            returnType = "V",
            parameters = listOf("Lcom/google/firebase/messaging/CommonNotificationBuilder\$DisplayNotificationInfo;"),
        ).method
        val displayed = display.implementation!!.instructions.withIndex().single {
            (it.value as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V"
        }.index
        display.addInstructions(
            displayed + 1,
            """
                iget-object v0, p0, $FIREBASE_DISPLAY->context:Landroid/content/Context;
                invoke-static { v0, v1, v2, p1 }, $NATIVE_HISTORY->posted(Landroid/content/Context;Ljava/lang/String;ILandroid/app/Notification;)V
            """,
        )
    }
}
