/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.flag

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object FeatureFlagFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        returnType = "V",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        parameters = listOf("Ljava/lang/String;"),
        filters = listOf(
            string("experiment_name"),
            string("max_length")
        )
    ),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;", "Z")
)
