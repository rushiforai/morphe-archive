package app.xiondigital.tandemstudy.work

import android.content.Context
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import app.xiondigital.tandemstudy.data.ServiceLocator

class ReminderWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        val due = runCatching { ServiceLocator.repo().dueCount() }.getOrDefault(0)
        if (due > 0) Reminders.showNotification(applicationContext, due)
        return Result.success()
    }
}
