package app.hoitruyenchu.patches.itruyenchu.audio.backgroundreading

import app.morphe.patcher.Fingerprint

private const val JAVA_TIMER_MANAGER = "Lcom/facebook/react/modules/core/JavaTimerManager;"

internal object TimerManagerOnHostPauseFingerprint : Fingerprint(
    definingClass = JAVA_TIMER_MANAGER,
    name = "onHostPause",
    returnType = "V",
    parameters = listOf(),
)

internal object TimerManagerOnHostResumeFingerprint : Fingerprint(
    definingClass = JAVA_TIMER_MANAGER,
    name = "onHostResume",
    returnType = "V",
    parameters = listOf(),
)
