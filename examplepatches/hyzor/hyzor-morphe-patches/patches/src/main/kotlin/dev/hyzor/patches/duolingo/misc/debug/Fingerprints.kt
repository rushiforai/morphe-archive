package dev.hyzor.patches.duolingo.misc.debug

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `BuildTarget` provider: a map that contains `BUILD_TARGET` = `"debug"` or `"release"`, chosen
 * by the boolean field read here (`Lgo3;->a:Z` in 6.104.3).
 */
object BuildTargetFieldFingerprint : Fingerprint(
    strings = listOf("BUILD_TARGET", "debug", "release"),
    filters = listOf(
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.IF_EQZ),
        string("debug"),
    ),
)
