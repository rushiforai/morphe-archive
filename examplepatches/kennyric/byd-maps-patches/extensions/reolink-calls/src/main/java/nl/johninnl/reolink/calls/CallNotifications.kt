package nl.johninnl.reolink.calls

import android.app.Notification
import android.app.PendingIntent
import android.app.Person
import android.content.Context
import android.graphics.drawable.Icon
import android.os.Build

/** Shared by incoming/active service states; always supplies a concrete resource Icon. */
object CallNotifications {
    @JvmStatic
    fun build(context: Context, channel: String, name: String, active: Boolean,
              answer: PendingIntent, end: PendingIntent): Notification {
        val caller = Person.Builder().setName(name).setImportant(true).build()
        val builder = Notification.Builder(context, channel)
            .setSmallIcon(Icon.createWithResource("android", android.R.drawable.sym_call_incoming))
            .setContentTitle(name).setContentText(if (active) "Doorbell audio call" else "Incoming doorbell call")
            .setCategory(Notification.CATEGORY_CALL).setOngoing(true).addPerson(caller).setOnlyAlertOnce(true)
        if (Build.VERSION.SDK_INT >= 31) {
            builder.setStyle(if (active) Notification.CallStyle.forOngoingCall(caller, end)
                else Notification.CallStyle.forIncomingCall(caller, end, answer))
        } else {
            // These platforms use Core-Telecom's legacy ConnectionService and an explicit foreground service.
            // Keep real phone actions without requiring the target app's optimized AndroidX resource classes.
            val dutch = context.resources.configuration.locales[0].language == "nl"
            builder.addAction(Notification.Action.Builder(null,
                if (active) { if (dutch) "Ophangen" else "Hang up" } else { if (dutch) "Weigeren" else "Decline" }, end).build())
            if (!active) builder.addAction(Notification.Action.Builder(null, if (dutch) "Opnemen" else "Answer", answer).build())
        }
        return builder.build()
    }
}
