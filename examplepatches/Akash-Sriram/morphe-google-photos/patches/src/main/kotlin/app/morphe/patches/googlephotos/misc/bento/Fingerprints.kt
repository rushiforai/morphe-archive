package app.morphe.patches.googlephotos.misc.bento

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal

internal object BentoModelBuilderFingerprint : Fingerprint(
    filters = listOf(
        literal(0x7f1402cc),
    ),
)
