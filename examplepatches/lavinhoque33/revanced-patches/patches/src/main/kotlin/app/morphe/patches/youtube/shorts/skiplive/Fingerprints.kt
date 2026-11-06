/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.shorts.skiplive

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

/**
 * Finds a read of a field of the method's own class by field type.
 * Match it against a specific method.
 */
internal fun getInstanceFieldGetFingerprint(fieldType: String) = object : Fingerprint(
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = fieldType
        )
    )
) {}
