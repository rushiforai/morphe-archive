/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Ported from anddea/revanced-patches.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.youtube.layout.notifications

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private val headerMapFilters = listOf(
    newInstance("Ljava/util/TreeMap;"),
    fieldAccess(
        opcode = Opcode.SGET_OBJECT,
        definingClass = "Ljava/lang/String;",
        name = "CASE_INSENSITIVE_ORDER",
        type = "Ljava/util/Comparator;",
    ),
)

/** Builds the case-insensitive header map for modern network responses. */
private object NetworkResponseHeadersFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Ljava/util/Map;",
    parameters = listOf("Ljava/util/List;"),
    filters = headerMapFilters,
)

internal object NetworkResponseBytesConstructorFingerprint : Fingerprint(
    classFingerprint = NetworkResponseHeadersFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf("I", "[B", "Ljava/util/Map;", "Ljava/util/List;", "Z"),
)

/** Buffer-backed response constructor on YouTube 21.45.90. */
internal object NetworkResponseBuffersConstructorFingerprint : Fingerprint(
    classFingerprint = NetworkResponseHeadersFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/Iterable;", "Ljava/util/List;", "Z", "Z"),
)

/** Buffer-backed response constructor on YouTube 21.13.164 and 21.39.525. */
internal object NetworkResponseBuffersConstructorLegacyFingerprint : Fingerprint(
    classFingerprint = NetworkResponseHeadersFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/Iterable;", "Ljava/util/List;"),
)

/**
 * YouTube 20.05.46 builds the header map in a constructor and uses only byte arrays for bodies.
 * Hook the shared constructor so delegating overloads transform the body once.
 */
internal object NetworkResponseBytesConstructorOldFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        name = "<init>",
        returnType = "V",
        parameters = listOf("I", "[B", "Ljava/util/List;"),
        filters = headerMapFilters,
    ),
    name = "<init>",
    returnType = "V",
    parameters = listOf("I", "[B", "Ljava/util/Map;", "Ljava/util/List;"),
)
