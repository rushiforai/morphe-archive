package app.sni_patch.patches.youtube.misc.sni

import app.sni_patch.patches.shared.misc.sni.forceCronetSniPatch
import app.sni_patch.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

@Suppress("unused")
val forceCronetSniPatchYouTube = forceCronetSniPatch(
    name = "Force Cronet SNI (YouTube arm64)"
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
}
