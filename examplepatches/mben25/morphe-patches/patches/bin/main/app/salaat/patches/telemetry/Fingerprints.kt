package app.salaat.patches.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Salaat First bundles two network-measurement / data-harvesting SDKs — OpenSignal and
 * CellRebel — each wrapped by a kept `org.hicham.salaat.thirdpartynetworks.*Network` class
 * that gates SDK init behind a remote flag and the "partners reporting" setting. Forcing the
 * eligibility check to return false stops the SDK from ever initializing, regardless of the
 * remote flag or the user toggle.
 */

/**
 * `OpensignalNetwork.initializeSdkIfEligible$1()Z` — checks the `"opensignal"` pref, the
 * partners-reporting setting and the remote `"enable_opensignal"` flag, then calls into
 * `OpensignalSdk`. Returning false skips init entirely.
 */
object OpensignalInitFingerprint : Fingerprint(
    definingClass = "Lorg/hicham/salaat/thirdpartynetworks/OpensignalNetwork;",
    name = "initializeSdkIfEligible\$1",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("enable_opensignal"),
)

/**
 * `CellRebelNetwork.initializeSdkIfEligible()Z` — same gating pattern, then
 * `CRMeasurementSDK.init(ctx, "zksmhjdhhp")`. Returning false skips init entirely.
 */
object CellRebelInitFingerprint : Fingerprint(
    definingClass = "Lorg/hicham/salaat/thirdpartynetworks/CellRebelNetwork;",
    name = "initializeSdkIfEligible",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("enable_cellrebel", "zksmhjdhhp"),
)
