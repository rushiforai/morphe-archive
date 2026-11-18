// Afterglow adaptation of pinned Morphe v2.0.0; see docs/morphe-compatibility.md.
/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.afterglow.patches.compat.morphe.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object CastContextFetchFingerprint : Fingerprint(
    filters = listOf(
        string("Error fetching CastContext.")
    )
)

internal object PrimeMethodFingerprint : Fingerprint(
    filters = listOf(
        string("com.android.vending"),
        string("com.google.android.GoogleCamera")
    )
)

//
// YouTube / YT Music fingerprints
//

internal object BuildInnerTubeProtoRequestUriFingerprint : Fingerprint(
    returnType = $$"Landroid/net/Uri$Builder;",
    parameters = listOf(),
    filters = listOf(
        string("key"),
        string("asig"),
        checkCast("Ljava/lang/String;"),
        methodCall($$"Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;"),
        opcode(
            opcode = Opcode.RETURN_OBJECT,
            location = MatchAfterWithin(5)
        )
    )
)

internal object BuildInnerTubeProtoRequestUriLegacyFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("key"),
        string("asig"),
        checkCast("Ljava/lang/String;"),
        methodCall($$"Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;"),
        // Must be last. Above appendQueryParameter can be inside a loop that is not always executed.
        methodCall($$"Landroid/net/Uri$Builder;->build()Landroid/net/Uri;")
    )
)

