/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.duolingo.misc.debug

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

object BuildTargetFieldFingerprint : Fingerprint(
    strings = listOf("BUILD_TARGET", "debug", "release"),
    filters = listOf(
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.IF_EQZ),
        string("debug")
    )
)
