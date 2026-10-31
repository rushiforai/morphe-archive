// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.review

import app.morphe.patcher.Fingerprint

private const val REVIEW_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/review/ReviewLegacyImpl;"

/** Called from BaconReaderActivity.onResume: shows the feedback popup when enough time was spent in the app. */
internal object ReviewResumeFingerprint : Fingerprint(
    definingClass = REVIEW_CLASS_DESCRIPTOR,
    name = "resume",
    returnType = "V",
)

/** Called from BaconReaderActivity.onPause: adds the session time. */
internal object ReviewPauseFingerprint : Fingerprint(
    definingClass = REVIEW_CLASS_DESCRIPTOR,
    name = "pause",
    returnType = "V",
)

internal object ReviewShowFingerprint : Fingerprint(
    definingClass = REVIEW_CLASS_DESCRIPTOR,
    name = "showReview",
    returnType = "V",
)

internal object ReviewIsAvailableFingerprint : Fingerprint(
    definingClass = REVIEW_CLASS_DESCRIPTOR,
    name = "isAvailable",
    returnType = "Z",
)
