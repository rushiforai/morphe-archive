package com.openbubbles.wear.patch

import android.app.Application
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.ComponentName
import android.provider.Settings
import android.widget.Switch
import android.widget.TextView
import android.widget.Button
import org.json.JSONObject
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(manifest = Config.NONE, sdk = [32], application = Application::class)
class PatchSettingsTest {
    private val context get() = RuntimeEnvironment.getApplication()

    private val bridgeService get() = ComponentName(context, "com.openbubbles.wear.bridge.WearBridgeService")
    @Before fun reset() {
        context.getSharedPreferences(PatchSettings.PREFS, Context.MODE_PRIVATE).edit().clear().commit()
        shadowOf(context.packageManager).addServiceIfNotPresent(bridgeService)
    }

    @Test fun notificationSettingsWorkWithoutWearService() {
        shadowOf(context.packageManager).removeService(bridgeService)
        val controller = Robolectric.buildActivity(PatchSettingsActivity::class.java).setup()
        val controls = switches(controller.get().findViewById(android.R.id.content))
        assertEquals(1, controls.size)
        assertEquals("Hide ready-to-receive notification", controls.single().text)
        assertFalse(buttons(controller.get().findViewById(android.R.id.content))
            .any { it.text == "Send test notification" })
        controls.single().performClick()
        val intent = shadowOf(controller.get()).nextStartedActivity
        assertEquals(Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS, intent.action)
        assertEquals(PatchSettings.READY_NOTIFICATION_CHANNEL, intent.getStringExtra(Settings.EXTRA_CHANNEL_ID))
        controller.pause().stop().destroy()
    }

    @Test fun testNotificationButtonIsLastBridgeControlAndShowsScheduleFeedback() {
        val controller = Robolectric.buildActivity(PatchSettingsActivity::class.java).setup()
        val content = controller.get().findViewById<android.view.ViewGroup>(android.R.id.content)
        val button = buttons(content).single { it.text == "Send test notification" }
        val labels = mutableListOf<String>()
        fun collect(view: android.view.View) {
            when (view) {
                is TextView -> labels += view.text.toString()
                is Button -> labels += view.text.toString()
            }
            if (view is android.view.ViewGroup) for (index in 0 until view.childCount) collect(view.getChildAt(index))
        }
        collect(content)
        assertEquals("Send test notification", labels.last())
        assertTrue(labels.contains("Shows a fake message in 10 seconds. Lock your phone to test watch alerts, or leave it unlocked to test watch silence. No message is sent."))
        button.performClick()
        assertTrue(org.robolectric.shadows.ShadowToast.getTextOfLatestToast().toString()
            .startsWith("Test notification in 10 seconds"))
        controller.pause().stop().destroy()
    }
    @Test fun defaultsEnabledAndPersistsWithoutRepatching() {
        assertTrue(PatchSettings.isEnabled(context))
        PatchSettings.setEnabled(context, false)
        assertFalse(PatchSettings.isEnabled(context))
        PatchSettings.setEnabled(context, true)
        assertTrue(PatchSettings.isEnabled(context))
    }

    @Test fun notificationVisibilityAndBridgeToggleAreIndependent() {
        val manager = context.getSystemService(NotificationManager::class.java)
        assertFalse(PatchSettings.isReadyNotificationHidden(context))
        manager.createNotificationChannel(NotificationChannel(PatchSettings.READY_NOTIFICATION_CHANNEL,
            "Background connection", NotificationManager.IMPORTANCE_NONE))
        assertTrue(PatchSettings.isReadyNotificationHidden(context))
        assertTrue(PatchSettings.isEnabled(context))
        PatchSettings.setEnabled(context, false)
        assertTrue(PatchSettings.isReadyNotificationHidden(context))
        PatchSettings.setEnabled(context, true)
        assertTrue(PatchSettings.isReadyNotificationHidden(context))
    }

    @Test fun notificationToggleUsesSystemStateAndOnlyOpensTheBackendChannel() {
        val controller = Robolectric.buildActivity(PatchSettingsActivity::class.java).setup()
        fun notificationToggle() = switches(controller.get().findViewById(android.R.id.content))
            .single { it.text == "Hide ready-to-receive notification" }
        assertEquals(2, switches(controller.get().findViewById(android.R.id.content)).size)
        assertFalse(notificationToggle().isChecked)
        notificationToggle().performClick()
        // Opening settings or cancelling them must not falsely report the notification as hidden.
        assertFalse(notificationToggle().isChecked)
        val intent = shadowOf(controller.get()).nextStartedActivity
        assertEquals(Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS, intent.action)
        assertEquals(context.packageName, intent.getStringExtra(Settings.EXTRA_APP_PACKAGE))
        assertEquals(PatchSettings.READY_NOTIFICATION_CHANNEL, intent.getStringExtra(Settings.EXTRA_CHANNEL_ID))
        val manager = context.getSystemService(NotificationManager::class.java)
        val channel = manager.getNotificationChannel(PatchSettings.READY_NOTIFICATION_CHANNEL)
        assertEquals(NotificationManager.IMPORTANCE_MIN, channel.importance)
        assertEquals("Background connection", channel.name)
        assertTrue(PatchSettings.isEnabled(context))
        controller.pause()
        channel.importance = NotificationManager.IMPORTANCE_NONE
        manager.createNotificationChannel(channel)
        controller.resume()
        assertTrue(notificationToggle().isChecked)
        controller.recreate()
        assertTrue(notificationToggle().isChecked)
        assertTrue(PatchSettings.isEnabled(context))
        notificationToggle().performClick()
        assertTrue(notificationToggle().isChecked)
        assertEquals(NotificationManager.IMPORTANCE_NONE,
            manager.getNotificationChannel(PatchSettings.READY_NOTIFICATION_CHANNEL).importance)
        controller.pause().stop().destroy()
    }

    private fun buttons(view: android.view.View): List<Button> = when (view) {
        is Button -> listOf(view)
        is android.view.ViewGroup -> (0 until view.childCount).flatMap { buttons(view.getChildAt(it)) }
        else -> emptyList()
    }

    private fun switches(view: android.view.View): List<Switch> = when (view) {
        is Switch -> listOf(view)
        is android.view.ViewGroup -> (0 until view.childCount).flatMap { switches(view.getChildAt(it)) }
        else -> emptyList()
    }

    @Test fun embeddedBackendRejectsDisabledOperationsBeforeBackendAccess() {
        PatchSettings.setEnabled(context, false)
        val backend = EmbeddedBackend(context)
        for (op in listOf("chats", "thread", "send", "markRead")) {
            val reply = JSONObject(backend.execute("""{"apiVersion":1,"op":"$op"}"""))
            assertFalse(reply.getBoolean("ok"))
            assertFalse(reply.getBoolean("enabled"))
            assertTrue(reply.getString("error").contains("Morphe patches"))
        }
    }

    @Test fun embeddedBackendPreservesApiAndRequestSizeChecks() {
        val backend = EmbeddedBackend(context)
        val wrongApi = JSONObject(backend.execute("""{"apiVersion":99,"op":"send"}"""))
        assertFalse(wrongApi.getBoolean("ok"))
        assertTrue(wrongApi.getString("error").contains("API"))
        val oversized = JSONObject(backend.execute("x".repeat(16_385)))
        assertFalse(oversized.getBoolean("ok"))
        assertTrue(oversized.getString("error").contains("Invalid"))
    }

    @Test fun settingsScreenToggleSurvivesActivityRecreation() {
        val controller = Robolectric.buildActivity(PatchSettingsActivity::class.java).setup()
        val content = controller.get().findViewById<android.view.ViewGroup>(android.R.id.content)
        fun toggle(view: android.view.View): Switch? {
            if (view is Switch) return view
            if (view is android.view.ViewGroup) for (index in 0 until view.childCount) {
                toggle(view.getChildAt(index))?.let { return it }
            }
            return null
        }
        toggle(content)!!.isChecked = false
        controller.recreate()
        assertFalse(PatchSettings.isEnabled(context))
        assertFalse(toggle(controller.get().findViewById(android.R.id.content))!!.isChecked)
        val labels = mutableListOf<String>()
        fun collect(view: android.view.View) {
            when (view) {
                is TextView -> labels += view.text.toString()
                is android.widget.Button -> labels += view.text.toString()
            }
            if (view is android.view.ViewGroup) for (index in 0 until view.childCount) collect(view.getChildAt(index))
        }
        collect(controller.get().findViewById(android.R.id.content))
        assertTrue(labels.contains("Allow contacts access"))
        assertTrue(labels.contains("Clear bridge cache"))
        assertTrue(labels.any { it.contains("bridge") || it.contains("Bridge") })
        controller.pause().stop().destroy()
    }
}
