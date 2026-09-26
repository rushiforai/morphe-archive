package app.epxec.patches.shared.hoodles

import app.epxec.morphe.universal.getUniversalPatch

private const val HOODLES =
    "https://github.com/hoo-dles/morphe-patches/releases/download/" +
        "v1.44.0/patches-1.44.0.mpp"

val microG by lazy { getUniversalPatch(
    mppUrl = HOODLES,
    patchName = "MicroG integration",
    )
}

