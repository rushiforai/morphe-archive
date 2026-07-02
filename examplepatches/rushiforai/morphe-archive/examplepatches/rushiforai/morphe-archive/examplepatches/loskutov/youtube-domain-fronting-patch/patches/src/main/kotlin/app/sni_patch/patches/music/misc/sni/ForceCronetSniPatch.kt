package app.sni_patch.patches.music.misc.sni

import app.sni_patch.patches.shared.misc.sni.forceCronetSniPatch
import app.sni_patch.patches.music.shared.Constants.COMPATIBILITY_MUSIC

@Suppress("unused")
val forceCronetSniPatchMusic = forceCronetSniPatch(
    name = "Force Cronet SNI (YouTube Music arm64)"
) {
    compatibleWith(COMPATIBILITY_MUSIC)
}