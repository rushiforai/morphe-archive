/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.primevideo.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object EnterServerInsertedAdBreakStateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lcom/amazon/avod/fsm/Trigger;"),
    returnType = "V",
    name = "enter",
    definingClass = "Lcom/amazon/avod/media/ads/internal/state/ServerInsertedAdBreakState;"
)

object DoTriggerFingerprint : Fingerprint(
    returnType = "V",
    name = "doTrigger",
    definingClass = "Lcom/amazon/avod/fsm/StateBase;"
)

// The owning class has changed for these methods in v3.0.443. Just look for method names in non-abstract class.
object OnSeekPastUnwatchedAdFingerprint : Fingerprint(
    name = "onSeekPastUnwatchedAd",
    custom = {_, classDef -> !AccessFlags.ABSTRACT.isSet(classDef.accessFlags) }
)
object OnSeekBehindUnwatchedAdFingerprint : Fingerprint(
    name = "onSeekBehindUnwatchedAd",
    custom = {_, classDef -> !AccessFlags.ABSTRACT.isSet(classDef.accessFlags) }
)