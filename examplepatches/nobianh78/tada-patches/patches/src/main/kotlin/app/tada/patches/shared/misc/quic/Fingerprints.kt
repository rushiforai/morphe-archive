/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.shared.misc.quic

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object CronetEngineBuilderFingerprint : Fingerprint(
    definingClass = $$"/CronetEngine$Builder;",
    name = "enableQuic",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    parameters = listOf("Z")
)

internal object ExperimentalCronetEngineBuilderFingerprint : Fingerprint(
    definingClass = $$"/ExperimentalCronetEngine$Builder;",
    name = "enableQuic",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    parameters = listOf("Z")
)