/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.mega

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object AccountTypeMapperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lmega/privacy/android/domain/entity/AccountType;",
    parameters = listOf("I"),
    custom = { _, classDef ->
        classDef.type == "Lmega/privacy/android/data/mapper/AccountTypeMapper;"
    },
)

object AccountTypeIsPaidFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "Lmega/privacy/android/domain/entity/AccountType;" &&
            method.name == "isPaid"
    },
)

object GoogleAdsManagerCreateAdRequestFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf(
        "ca-app-pub-2135147798858967/9835644604",
        "Creating new AdRequest",
    ),
    custom = { _, classDef ->
        classDef.type == "Lmega/privacy/android/shared/ads/advertisements/GoogleAdsManager;"
    },
)

object AdsViewModelCheckAvailabilityFingerprint : Fingerprint(
    strings = listOf("Ads feature enabled: ", "Error getting feature flag value"),
    custom = { _, classDef ->
        classDef.type == "Lmega/privacy/android/shared/ads/advertisements/AdsViewModel;"
    },
)
