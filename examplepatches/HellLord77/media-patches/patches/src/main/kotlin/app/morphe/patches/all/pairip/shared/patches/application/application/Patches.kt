package app.morphe.patches.all.pairip.shared.patches.application.application

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle

val attachBaseContextPatch =
    bytecodePatch {
        execute {
            AttachBaseContextFingerprint.matchSingle().apply {
                classDef.methods.remove(originalMethod)
            }
        }
    }
