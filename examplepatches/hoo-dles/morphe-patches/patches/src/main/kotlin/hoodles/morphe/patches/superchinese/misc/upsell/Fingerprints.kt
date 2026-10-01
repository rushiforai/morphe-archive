package hoodles.morphe.patches.superchinese.misc.upsell

import app.morphe.patcher.Fingerprint

object UpsellFetchFingerprint : Fingerprint(
    definingClass = "/MainActivity;",
    strings = listOf("/v2/publicity/index")
)