package org.ungoogled.patches.maps.location

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * The platform-provider mode dispatcher's GPS-only branch: start the GPS
 * listener, then stop the network one. This exact five-step sequence (l
 * field, z field, the START call on l, m field, the STOP call on m) is what
 * distinguishes this branch from the GPS+network branch, which restarts BOTH
 * l and m, and from the passive-only branch, which starts from n rather than
 * l. Verified unique across all ten dex files.
 */
internal object GpsOnlyModeFingerprint : Fingerprint(
    name = "c",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", name = "l"),
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", name = "z", location = MatchAfterImmediately()),
        methodCall(definingClass = "Lajea;", name = "b", opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", name = "m", location = MatchAfterImmediately()),
        methodCall(definingClass = "Lajea;", name = "a", opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterImmediately()),
    ),
)
