/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.fotmob.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

object EntitlementInfosCtorFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "<init>",
    parameters = listOf("Ljava/util/Map;", "L")
)

object PeriodTypeClassFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("NORMAL", "INTRO", "TRIAL", "PREPAID")
)

object StoreTypeClassFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("APP_STORE", "MAC_APP_STORE", "PLAY_STORE", "STRIPE")
)

object OwnershipTypeClassFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("PURCHASED", "FAMILY_SHARED", "UNKNOWN")
)

object VerifiedTypeClassFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("NOT_REQUESTED", "VERIFIED", "FAILED", "VERIFIED_ON_DEVICE")
)

object SetLogoFingerprint : Fingerprint(
    name = "setLogo",
    definingClass = "Landroidx/appcompat/widget/Toolbar;",
    parameters = listOf("I")
)