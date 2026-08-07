/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.xodo.misc.signature

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.patches.xodo.shared.Constants

val disableSignatureCheckPatch = bytecodePatch{
    execute {
        SignatureCheckFingerprint.method.returnEarly()
    }
}