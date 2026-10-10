package xyz.rtrvr.pillo.models.entities.tracker

import xyz.rtrvr.pillo.models.entities.tracker.type.weight.WeightTrackerRecord

enum class TrackerType { WEIGHT }
class TrackerEvent(
    val trackerEventId: Long, val trackerId: Long?, val userProfileId: String,
    val trackerType: TrackerType, val ogAlarmAtEpochSec: Long?, val curAlarmAtEpochSec: Long?,
    val lastSnoozeReason: Any?, val isSkipped: Boolean, val recordedAtEpochSec: Long?,
    val alarmedAtEpochSec: Long?, val alarmShownAtEpochSec: Long?, val takenAtEpochSec: Long?,
    val alarmSuppressedAtEpochSec: Long?, val bpRecord: Any?, val weightRecord: WeightTrackerRecord?,
    val glucoseRecord: Any?, val heartRateRecord: Any?, val hba1cRecord: Any?, val waterRecord: Any?,
    val spO2Record: Any?, val bodyTemperatureRecord: Any?, val moodRecord: Any?, val sleepRecord: Any?
)
