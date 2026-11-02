package app.morphe.patches.all.pairip.shared.patches.vmRunner

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val classConstructorPatch =
    bytecodePatch {
        execute {
            ClassConstructorFingerprint.matchSingle().method.returnEarly()
        }
    }

val invokePatch =
    bytecodePatch {
        execute {
            InvokeFingerprint.matchSingle().method.returnEarly(null)
        }
    }
