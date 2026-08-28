package app.rafag00.patches.sony

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val ORIGINAL =
    "com.google.android.apps.youtube.music"

private const val REPLACEMENT =
    "app.morphe.android.apps.youtube.music"

private val youtubeMusicPackageFingerprint = Fingerprint(
    filters = listOf(
        string(ORIGINAL)
    )
)

private val sonySoundConnect = Compatibility(
    name = "Sony | Sound Connect",
    packageName = "com.sony.songpal.mdr",
    apkFileType = ApkFileType.APKM,
    targets = listOf(
        AppTarget(
            version = "13.2.1",
            versionCode = 130215029
        )
    )
)

@Suppress("unused")
val useMorpheYouTubeMusicPatch = bytecodePatch(
    name = "Use patched YouTube Music in Scene",
    description = "Redirects the YouTube Music Scene integration to the patched YouTube Music package.",
    default = false
) {
    compatibleWith(sonySoundConnect)

    execute {
        val matches =
            youtubeMusicPackageFingerprint.matchAllOrNull()?.toList()
                ?: error("YouTube Music package reference was not found")

        println("Found ${matches.size} YouTube Music package references")

        matches.forEach { match ->
            val index = match.instructionMatches[0].index

            val register =
                match.method
                    .getInstruction<OneRegisterInstruction>(index)
                    .registerA

            match.method.replaceInstruction(
                index,
                "const-string v$register, \"$REPLACEMENT\""
            )
        }
    }
}