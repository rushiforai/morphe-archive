/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.shared.misc.spans

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.instanceOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object CustomCharacterStyleFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Path;",
    parameters = listOf("Landroid/text/Layout;")
)

internal object InclusiveSpanFilterFingerprint : Fingerprint(
    definingClass = EXTENSION_SPANS_CLASS,
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SPUT_OBJECT,
            definingClass = "this",
            type = EXTENSION_FILTER_ARRAY
        )
    )
)

internal object GetSpanTypeFingerprint : Fingerprint(
    definingClass = EXTENSION_SPANS_CLASS,
    name = "getSpanType",
    filters = listOf(
        instanceOf("Landroid/text/style/CharacterStyle;")
    ),
    custom = { method, _ ->
        method.returnType != "Ljava/lang/String;"
    }
)
