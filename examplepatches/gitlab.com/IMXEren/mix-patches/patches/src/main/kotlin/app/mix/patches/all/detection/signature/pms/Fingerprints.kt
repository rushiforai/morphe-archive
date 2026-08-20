/**
 * Copyright 2026 jkennethcarino, IMXEren.
 * https://github.com/jkennethcarino/adobo
 * https://github.com/IMXEren/mix-patches
 */

package app.mix.patches.all.detection.signature.pms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object StaticConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.CONST_STRING,
        Opcode.CONST_STRING,
    ),
    strings = listOf("<package-name>", "<signature>"),
    custom = { _, classDef ->
        classDef.type.endsWith("/SignatureHookApp;")
    }
)