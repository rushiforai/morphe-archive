package xyz.rtrvr.pillo.data.persistence.database

import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.flow
import xyz.rtrvr.pillo.models.entities.tracker.TrackerEvent
import xyz.rtrvr.pillo.models.entities.tracker.TrackerType

class AppDatabaseManager {
    companion object {
        private val shared = AppDatabaseManager()
        fun getInstance() = shared
    }
    val trackerEventRepository = TestTrackerEventRepository()
}

class TestTrackerEventRepository {
    val records = mutableListOf<TrackerEvent>()
    var failWrite = false
    var writes = 0
    var failAfterWrites = Int.MAX_VALUE
    var rejectWrite = false
    fun findTrackedEventsByUserProfileIdAndTrackerType(profile: String, type: TrackerType) = flow {
        delay(5)
        emit(records.filter { it.userProfileId == profile && it.trackerType == type })
    }
    suspend fun insertManyWithConstraint(events: List<TrackerEvent>): List<Long> {
        // Native bulk insertion discards the group with no reminder ID.
        return events.filter { it.trackerId != null }.mapNotNull { insertWithConstraint(it) }
    }
    suspend fun insertWithConstraint(event: TrackerEvent): Long? {
        delay(5)
        if (failWrite || writes >= failAfterWrites) error("Simulated database failure")
        if (rejectWrite) return null
        val events = listOf(event)
        check(events.all { it.trackerEventId == 0L && it.trackerId == null && !it.isSkipped })
        check(events.all { it.ogAlarmAtEpochSec == null && it.curAlarmAtEpochSec == null && it.alarmedAtEpochSec == null })
        writes++
        records.addAll(events)
        return records.size.toLong()
    }
}
