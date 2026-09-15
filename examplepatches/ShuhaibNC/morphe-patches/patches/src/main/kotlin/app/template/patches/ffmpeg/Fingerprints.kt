package app.template.patches.ffmpeg

import app.morphe.patcher.Fingerprint

object DonateFingerprint : Fingerprint(
    definingClass = "Lcom/silentlexx/ffmpeggui/config/Config;",
    name = "getDonated",
    returnType = "Z",
    parameters = emptyList(),
)