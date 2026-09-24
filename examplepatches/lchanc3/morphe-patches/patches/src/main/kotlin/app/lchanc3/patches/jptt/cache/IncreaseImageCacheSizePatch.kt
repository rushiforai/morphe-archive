package app.lchanc3.patches.jptt.cache

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_PATCH_SETTINGS_CLASS
import app.lchanc3.patches.jptt.shared.JpttApplicationOnCreateFingerprint
import app.lchanc3.patches.jptt.shared.requireFreeLocals
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intSliderOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val increaseImageCacheSizePatch = bytecodePatch(
    name = "Increase image cache size",
    description = "Raises the image cache limit so images you have already seen are " +
        "not downloaded again when you scroll back.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    val cacheSizeMb by intSliderOption(
        key = "cacheSizeMb",
        min = 40,
        max = 4096,
        default = 512,
        step = 8,
        title = "Image cache size (MB)",
        description = "Starting value for the maximum disk space the image cache may " +
            "use. Changeable in the app afterwards, under Settings > lchanc3.",
    )

    execute {
        // The option is now only the default: it is handed to the settings page,
        // which is what the value is actually read from.
        requireFreeLocals(JpttApplicationOnCreateFingerprint.method, 1)
        JpttApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, $cacheSizeMb
                invoke-static { v0 }, $EXTENSION_PATCH_SETTINGS_CLASS->registerImageCacheSize(I)V
            """,
        )

        val match = DiskCacheConfigBuilderFingerprint.instructionMatches.first()
        val method = DiskCacheConfigBuilderFingerprint.method
        val register = method.getInstruction<OneRegisterInstruction>(match.index).registerA

        // Fresco's own default, replaced by whatever the setting says at the time
        // the cache is configured. The register pair the constant occupied takes
        // the returned long.
        method.removeInstruction(match.index)
        method.addInstructions(
            match.index,
            """
                invoke-static { }, $EXTENSION_PATCH_SETTINGS_CLASS->imageCacheBytes()J
                move-result-wide v$register
            """,
        )
    }
}
