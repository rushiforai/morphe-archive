package sabp.morphe.patches.smartaudiobook

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// Patches are written against the decoded resources and dex of this exact release. Each new
// Smart AudioBook Player release needs its resource names and fingerprints re-checked before a
// version is added here.
internal val smartAudioBookCompatibility = Compatibility(
    name = "Smart AudioBook Player",
    packageName = "ak.alizandro.smartaudiobookplayer",
    appIconColor = 0x33B5E5,
    targets = listOf(AppTarget("11.7.8")),
)
