/*
 * Adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.shared.requireRegisters
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.addInstruction
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val instantLaunchSplashBlockerPatch = bytecodePatch(
    name = "Skip the splash ad",
    description = "Stops the full-screen ad TikTok can show while it starts up. It has no " +
        "switch, so only patching again without it brings the ad back.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        // DeferredSplashAdManagerPreloadTask (47.1.x) only calls SplashAdManagerPreloadTask.run.
        val voidMethods = listOf(
            SplashPreloadTaskFingerprint.method,
            SplashPreloadEntryFingerprint.method,
            TopViewPreloadTaskFingerprint.method,
            RealTimeSplashTaskFingerprint.method,
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
    name = "Limit background traffic",
    description = "Stops TikTok loading upcoming videos ahead of time, which uses less data " +
        "in the background, but videos may take a moment longer to start. It has no switch, so " +
        "only patching again without it undoes it.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())

    val skipPushSetup by booleanOption(
        "skipPushSetup",
        default = false,
        title = "Skip notification setup",
        description = "Stops TikTok setting up notifications, so you won't get any, messages " +
            "included. Pausing Hushfeed won't bring them back. Patch again with this off to get them " +
            "back.",
        required = false,
    )

    execute {
        val bufferGate = BufferPreloadGateFingerprint.method
        bufferGate.requireRegisters("Network & Background Traffic Governor", 1)
        bufferGate.returnEarly(false)
        if (skipPushSetup == true) InitPushTaskFingerprint.method.returnEarly()
    }
}

@Suppress("unused")
val runtimeMemoryGovernorPatch = bytecodePatch(
    name = "Drop the animated image cache",
    description = "Makes TikTok keep only the frame on screen for stickers and GIFs instead " +
        "of every frame, so they use less memory and still play smoothly. It has no switch, so " +
        "only patching again without it undoes it.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        // Fresco's keep-last-frame cache (caching strategy 3) holds the one frame on screen,
        // which is also the frame the next one is composed onto. The earlier version nulled the
        // FrescoFrameCache reads instead, so every frame walked back toward the first and
        // nothing was saved, since the preparer still filled the cache (#100).
        val factory = AnimatedDrawableFactoryFingerprint.method
        val strategy = factory.cachingStrategyRead()
            ?: throw PatchException("Drop the animated image cache: the caching strategy read has an unreviewed shape.")
        if (strategy.keepLastClass == FRESCO_FRAME_CACHE_DESCRIPTOR) {
            throw PatchException("Drop the animated image cache: strategy $KEEP_LAST_FRAME_STRATEGY builds FrescoFrameCache.")
        }
        val keepLast = mutableClassDefBy(strategy.keepLastClass)
        val fieldTypes = keepLast.fields.map { it.type }
        if (fieldTypes.size != 2 || fieldTypes.count { it == "I" } != 1 || fieldTypes.count { it.startsWith("L") } != 1) {
            throw PatchException("Drop the animated image cache: ${strategy.keepLastClass} isn't the keep-last-frame cache.")
        }

        // The preparer decodes frames ahead into the cache. The keep-last cache drops them, so
        // each would be decoded twice, and composed from frames it no longer holds.
        val builderCall = factory.backendBuilderCall()
            ?: throw PatchException("Drop the animated image cache: no animation backend builder call.")
        val builder = mutableClassDefBy(factory.definingClass).methods.single {
            it.name == builderCall.name && it.parameterTypes.map(CharSequence::toString) == builderCall.parameterTypes.map(CharSequence::toString) &&
                it.returnType == builderCall.returnType
        }
        val gate = builder.framePreparerGateIndex()
            ?: throw PatchException("Drop the animated image cache: the frame preparer gate has an unreviewed shape.")
        val gateRegister = builder.getInstruction<OneRegisterInstruction>(gate).registerA

        builder.addInstruction(gate, "const/16 v$gateRegister, 0x0")
        factory.addInstruction(strategy.resultIndex + 1, "const/16 v${strategy.register}, $KEEP_LAST_FRAME_STRATEGY")
    }
}

@Suppress("unused")
val updatePromptSuppressorPatch = bytecodePatch(
    name = "Skip update checks",
    description = "Stops two background tasks TikTok uses to check for updates, one of them " +
        "when your phone starts. Some in-app update prompts may stop. Play Store updates still " +
        "work. It has no switch, so only patching again undoes it.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        val methods = listOf(
            UpdateBackgroundTaskFingerprint.method,
            UpdateBootFinishedTaskFingerprint.method,
        )
        methods.forEach { it.returnEarly() }
    }
}

/** Bytecode half of LIVE Stream Suite Optimizer. It is selected only through the resource patch. */
internal val liveGiftEffectOptimizerPatch = bytecodePatch {
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        LiveGiftInitViewFingerprint.method.returnEarly()
        LiveGiftOnCreateFingerprint.method.keepOnlyLiveWidgetCreate()
    }
}

/**
 * Returns right after the gift widget's call to LiveWidget.onCreate, skipping the widget's own
 * setup. That call creates the CompositeDisposable LiveWidget.onDestroy disposes without a null
 * test, so returning before it crashed TikTok on leaving a LIVE room (#119).
 */
internal fun MutableMethod.keepOnlyLiveWidgetCreate() {
    val superCreate = liveWidgetCreateIndex()
        ?: throw PatchException("Remove LIVE extras: the gift widget's onCreate doesn't start with LiveWidget.onCreate.")
    addInstruction(superCreate + 1, "return-void")
}

/** The index of the method's opening LiveWidget.onCreate super call, or null when it opens with anything else. */
internal fun Method.liveWidgetCreateIndex(): Int? {
    val first = implementation?.instructions?.firstOrNull() ?: return null
    val call = first.getReference<MethodReference>() ?: return null
    // A method with more than 16 registers gets the range form of the same call.
    val superCall = first.opcode == Opcode.INVOKE_SUPER || first.opcode == Opcode.INVOKE_SUPER_RANGE
    val opensWithSuper = superCall && call.definingClass == LIVE_WIDGET_DESCRIPTOR &&
        call.name == "onCreate" && call.parameterTypes.isEmpty() && call.returnType == "V"
    return if (opensWithSuper) 0 else null
}
