package nl.johninnl.reolink.calls

import android.app.Notification
import android.app.PendingIntent
import android.content.Intent
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28, 34])
class CallNotificationsTest {
    @Test fun incomingAndActiveCallsHaveAConcreteIconAndRemainIdentifiableToAndroid() {
        val context = RuntimeEnvironment.getApplication()
        val answer = PendingIntent.getBroadcast(context, 1, Intent("test.ANSWER"), PendingIntent.FLAG_IMMUTABLE)
        val end = PendingIntent.getBroadcast(context, 2, Intent("test.END"), PendingIntent.FLAG_IMMUTABLE)
        for (active in listOf(false, true)) {
            val notification = CallNotifications.build(context, "doorbell", "Front door", active, answer, end)
            assertNotNull(notification.smallIcon)
            assertEquals(Notification.CATEGORY_CALL, notification.category)
            assertEquals("Front door", notification.extras.getCharSequence(Notification.EXTRA_TITLE).toString())
            assertTrue(notification.flags and Notification.FLAG_ONGOING_EVENT != 0)
            assertTrue(notification.actions.any { it.actionIntent == end })
            if (!active) assertTrue(notification.actions.any { it.actionIntent == answer })
        }
    }
}
