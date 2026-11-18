package app.morphe.patches.viber.ui

import app.morphe.patcher.Fingerprint

internal object BottomNavigationInitFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("explore")
)