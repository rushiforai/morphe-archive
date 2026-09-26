package app.epxec.patches.shared.blazeftl

import app.epxec.morphe.universal.getUniversalPatch

private const val BLAZEFTL =
    "https://github.com/BlazeFTL/FTL-Patches/releases/download/" +
        "v1.43.1/patches-1.43.1.mpp"

val spoofAppSignature by lazy {
    getUniversalPatch(
        mppUrl = BLAZEFTL,
        patchName = "Spoof App Signature",
    )
}

