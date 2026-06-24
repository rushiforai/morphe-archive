/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 */


/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/misc/quic/Fingerprints.kt
 */
package app.morphe.patches.shared.misc.quic

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object CronetEngineBuilderFingerprint : Fingerprint(
    definingClass = "/CronetEngine\$Builder;",
    name = "enableQuic",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    parameters = listOf("Z")
)

internal object ExperimentalCronetEngineBuilderFingerprint : Fingerprint(
    definingClass = "/ExperimentalCronetEngine\$Builder;",
    name = "enableQuic",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    parameters = listOf("Z")
)