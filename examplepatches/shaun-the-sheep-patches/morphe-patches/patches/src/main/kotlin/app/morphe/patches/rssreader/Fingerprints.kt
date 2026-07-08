package app.morphe.patches.rssreader

import app.morphe.patcher.Fingerprint

object RssReaderPremiumFingerprintA : Fingerprint(
    definingClass = "Lf84;",
    name = "a",
    returnType = "Lu64;"
)

object RssReaderPremiumFingerprintB : Fingerprint(
    definingClass = "Lf84;",
    name = "b",
    parameters = listOf("Z"),
    returnType = "Lu64;"
)

object RssReaderPremiumFingerprintC : Fingerprint(
    definingClass = "Lf84;",
    name = "c",
    returnType = "Lu64;"
)
