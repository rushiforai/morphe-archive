package app.xiondigital.tandemstudy

import android.app.Application
import app.xiondigital.tandemstudy.data.ServiceLocator
import app.xiondigital.tandemstudy.work.Reminders

class StudyApp : Application() {

    override fun onCreate() {
        super.onCreate()
        ServiceLocator.init(this)
        Reminders.ensureChannel(this)
    }
}
