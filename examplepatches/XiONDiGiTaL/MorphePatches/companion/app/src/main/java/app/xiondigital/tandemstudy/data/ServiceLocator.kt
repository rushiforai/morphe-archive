package app.xiondigital.tandemstudy.data

import android.content.Context

/**
 * One repository for the process. A full DI container buys nothing at this size.
 */
object ServiceLocator {

    @Volatile
    private var repository: StudyRepository? = null

    fun init(context: Context) {
        if (repository == null) {
            synchronized(this) {
                if (repository == null) repository = StudyRepository(context.applicationContext)
            }
        }
    }

    fun repo(): StudyRepository = repository
        ?: error("ServiceLocator.init() has not run — StudyApp must be the application class")
}
