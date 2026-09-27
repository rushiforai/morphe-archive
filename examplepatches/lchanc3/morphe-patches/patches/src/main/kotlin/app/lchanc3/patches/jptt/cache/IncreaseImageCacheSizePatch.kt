package app.lchanc3.patches.jptt.cache

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_IMAGE_MEMORY_CACHE_CLASS
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
    description = "Keeps the images of the article you are reading in memory, so they are " +
        "not read again when you scroll back, and gives the memory back once the app has " +
        "been in the background for a while. A disk cache behind it covers coming back " +
        "after that.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    val memoryCacheSizeMb by intSliderOption(
        key = "memoryCacheSizeMb",
        min = 0,
        max = 1536,
        default = 256,
        step = 16,
        title = "Image memory cache size (MB)",
        description = "Starting value for the memory the image cache may use while the " +
            "app is open. 0 turns it off. Changeable in the app afterwards, under " +
            "Settings > Morphe.",
    )

    val releaseAfterMinutes by intSliderOption(
        key = "releaseAfterMinutes",
        min = 0,
        max = 120,
        default = 5,
        step = 1,
        title = "Release memory cache after (minutes)",
        description = "Starting value for how long the app may sit in the background " +
            "before the image memory cache is emptied. Changeable in the app afterwards, " +
            "under Settings > Morphe.",
    )

    val cacheSizeMb by intSliderOption(
        key = "cacheSizeMb",
        min = 16,
        max = 4096,
        default = 64,
        step = 8,
        title = "Image disk cache size (MB)",
        description = "Starting value for the maximum disk space the image cache may " +
            "use. Changeable in the app afterwards, under Settings > Morphe.",
    )

    execute {
        // The options are now only defaults: they are handed to the settings page,
        // which is what the values are actually read from.
        val onCreate = JpttApplicationOnCreateFingerprint.method
        requireFreeLocals(onCreate, 3)
        onCreate.addInstructions(
            0,
            """
                const/16 v0, $memoryCacheSizeMb
                const/16 v1, $releaseAfterMinutes
                const/16 v2, $cacheSizeMb
                invoke-static { v0, v1, v2 }, $EXTENSION_PATCH_SETTINGS_CLASS->registerImageCaches(III)V
                invoke-static { p0 }, $EXTENSION_IMAGE_MEMORY_CACHE_CLASS->install(Landroid/app/Application;)V
            """,
        )

        // Fresco's 4MB for encoded images, replaced by the extension's sizes each
        // time the cache asks. The rest of the method is left unreached.
        requireFreeLocals(EncodedMemoryCacheParamsFingerprint.method, 1)
        EncodedMemoryCacheParamsFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, $EXTENSION_IMAGE_MEMORY_CACHE_CLASS->params()Lcom/facebook/imagepipeline/cache/MemoryCacheParams;
                move-result-object v0
                return-object v0
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
