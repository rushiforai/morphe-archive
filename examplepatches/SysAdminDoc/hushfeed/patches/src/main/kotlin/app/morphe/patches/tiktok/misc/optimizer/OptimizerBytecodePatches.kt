/*
 * Adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.shared.requireRegisters
import app.morphe.util.implementationOrPatchException
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val instantLaunchSplashBlockerPatch = bytecodePatch(
    name = "Instant Launch & Splash Blocker",
    description = "Stops TikTok's splash-ad preload tasks and returns false from its reviewed splash and TopView gates. Other startup behavior is left in place. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val voidMethods = listOf(
            SplashPreloadTaskFingerprint.method,
            SplashPreloadEntryFingerprint.method,
        )
        fun reviewedBooleanMethods(classDescriptor: String, expectedCounts: List<Int>, boundary: String) =
            mutableClassDefBy(classDescriptor).methods.filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.FINAL.isSet(method.accessFlags)
            }.also { methods ->
                val counts = methods.map {
                    it.implementationOrPatchException("Instant Launch & Splash Blocker").instructions.count()
                }.sorted()
                if (counts != expectedCounts.sorted()) {
                    throw PatchException(
                        "Instant Launch & Splash Blocker: $boundary has unreviewed Boolean method shapes: $counts.",
                    )
                }
            }

        val fixedBooleanMethods = reviewedBooleanMethods(
            SPLASH_SETTING_DESCRIPTOR,
            listOf(9, 11),
            "SplashSettingServiceImpl",
        ) + reviewedBooleanMethods(
            REALTIME_SPLASH_DESCRIPTOR,
            listOf(3),
            "RealTimeSplashManagerImpl",
        )
        val splashService = mutableClassDefBy(SPLASH_SERVICE_DESCRIPTOR)
        val serviceGates = splashService.methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.FINAL.isSet(method.accessFlags)
        }
        val serviceGateInstructionCounts = serviceGates.map {
            it.implementationOrPatchException("Instant Launch & Splash Blocker").instructions.count()
        }
        if (!isReviewedSplashGateShape(serviceGateInstructionCounts)) {
            throw PatchException(
                "Instant Launch & Splash Blocker: SplashAdServiceImpl has unreviewed Boolean method shapes: " +
                    serviceGateInstructionCounts.sorted().joinToString(),
            )
        }

        (fixedBooleanMethods + serviceGates).forEach {
            it.requireRegisters("Instant Launch & Splash Blocker", 1)
        }
        voidMethods.forEach { it.returnEarly() }
        (fixedBooleanMethods + serviceGates).forEach { it.returnEarly(false) }
    }
}

@Suppress("unused")
val networkTrafficGovernorPatch = bytecodePatch(
    name = "Network & Background Traffic Governor",
    description = "Turns off TikTok's buffer-preload gate and skips its push initialization task. Videos may start buffering later, and TikTok push notifications may stop. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val bufferGate = BufferPreloadGateFingerprint.method
        val pushTask = InitPushTaskFingerprint.method
        bufferGate.requireRegisters("Network & Background Traffic Governor", 1)
        bufferGate.returnEarly(false)
        pushTask.returnEarly()
    }
}

@Suppress("unused")
val runtimeMemoryGovernorPatch = bytecodePatch(
    name = "Runtime Memory Governor",
    description = "Makes TikTok's reviewed Fresco animated-frame cache lookups return no cached frame. This can increase decoding work or change animation playback. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val frameCache = mutableClassDefBy(FRESCO_FRAME_CACHE_DESCRIPTOR)
        val indexed = frameCache.methods.filter { it.isIndexedFrameLookup() }
        val direct = frameCache.methods.filter { it.isDirectFrameLookup() }
        val removedDirect = frameCache.methods.filter { it.isRemovedDirectFrameLookup() }
        if (indexed.size != 1) {
            throw PatchException("Runtime Memory Governor: expected one indexed Fresco frame lookup, found ${indexed.size}.")
        }
        if (direct.size > 1 || (direct.isEmpty() && removedDirect.size != 1)) {
            throw PatchException(
                "Runtime Memory Governor: expected one direct Fresco lookup or its reviewed void replacement, " +
                    "found ${direct.size} lookup(s) and ${removedDirect.size} replacement(s).",
            )
        }

        val indexedInstructions = indexed.single()
            .implementationOrPatchException("Runtime Memory Governor").instructions.count()
        val directInstructions = direct.singleOrNull()
            ?.implementationOrPatchException("Runtime Memory Governor")?.instructions?.count()
        val removedInstructions = if (direct.isEmpty()) {
            removedDirect.single()
                .implementationOrPatchException("Runtime Memory Governor").instructions.count()
        } else {
            null
        }
        if (!isReviewedFrescoProfile(indexedInstructions, directInstructions, removedInstructions)) {
            throw PatchException(
                "Runtime Memory Governor: unreviewed Fresco lookup profile " +
                    "($indexedInstructions, $directInstructions, $removedInstructions).",
            )
        }

        (indexed + direct).forEach {
            it.requireRegisters("Runtime Memory Governor", 1)
            it.returnEarly(null as Void?)
        }
    }
}

@Suppress("unused")
val updatePromptSuppressorPatch = bytecodePatch(
    name = "Update Prompt Suppressor",
    description = "Skips TikTok's background and boot-finished device-ID update-check tasks. This may suppress some in-app update checks. Play Store updates are unaffected. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val methods = listOf(
            UpdateBackgroundTaskFingerprint.method,
            UpdateBootFinishedTaskFingerprint.method,
        )
        methods.forEach { it.returnEarly() }
    }
}

/** Bytecode half of Live Stream Suite Optimizer. It is selected only through the resource patch. */
internal val liveGiftEffectOptimizerPatch = bytecodePatch {
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val methods = listOf(
            LiveGiftInitViewFingerprint.method,
            LiveGiftOnCreateFingerprint.method,
        )
        methods.forEach { it.returnEarly() }
    }
}
