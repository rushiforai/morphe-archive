/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.macrofactor.misc.signature

import app.morphe.patcher.Fingerprint

object GetSignatureFingerprint : Fingerprint(
    definingClass = "/AndroidUtilsLight;",
    name = "getPackageCertificateHashBytes"
)