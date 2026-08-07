/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.superchinese.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.Opcode

object LogProducerClientCtorFingerprint : Fingerprint(
    definingClass = "Lcom/aliyun/sls/android/producer/LogProducerClient;",
    name = "<init>",
    filters = listOf(
        literal(1, listOf(Opcode.CONST_4))
    )
)