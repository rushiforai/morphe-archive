package com.anderson.applemusic.core.update

import androidx.compose.runtime.Immutable

/**
 * One APK published in the `updates.json` asset of a GitHub release.
 *
 * [versionCode] is the version code carried by the APK itself (the companion's
 * `appVersionCode` or the engine's `versionCode`); `null` when the release did not
 * declare it.
 */
@Immutable
data class UpdateAsset(
    val name: String,
    val url: String,
    val sha256: String,
    val size: Long,
    val versionCode: Long?,
)

/** Parsed `updates.json` of the latest release (`apps-<version>`). */
@Immutable
data class UpdateInfo(
    val version: String,
    val versionCode: Long,
    val releasedAt: String?,
    val assets: Map<String, UpdateAsset>,
)

/** One installable part of an [UpdatePlan], in install order. */
@Immutable
data class UpdateStep(
    val engine: Boolean,
    val label: String,
    val asset: UpdateAsset,
)

/** Engine (when outdated) first, then the companion. */
@Immutable
data class UpdatePlan(
    val info: UpdateInfo,
    val steps: List<UpdateStep>,
)

enum class UpdatePhase {
    IDLE,
    CHECKING,
    UP_TO_DATE,
    AVAILABLE,
    DOWNLOADING,
    INSTALLING,
    DONE,
    ERROR,
}

/** State exposed to the Compose UIs; the controller owns all the work. */
@Immutable
data class UpdateUiState(
    val phase: UpdatePhase = UpdatePhase.IDLE,
    val plan: UpdatePlan? = null,
    val progress: Int = 0,
    val stepIndex: Int = 0,
    val message: String? = null,
)

/** Result broadcast by `PackageInstaller` when a session finishes. */
@Immutable
data class InstallResult(val status: Int, val message: String)
