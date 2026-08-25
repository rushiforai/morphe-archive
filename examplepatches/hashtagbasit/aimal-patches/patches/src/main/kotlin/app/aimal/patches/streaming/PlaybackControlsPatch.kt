package app.aimal.patches.streaming

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val CONTROLS = "$EXTENSION_STREAMING/Controls;"
private const val PLAYER_BRIDGE = "$EXTENSION_STREAMING/PlayerBridge;"

/**
 * Adds a floating panel with playback speed (1x / 1.25x / 1.5x / 2x) and an
 * aspect-ratio toggle (fit, stretch, crop and two fixed zoom steps) to HBO Max
 * and Disney+.
 *
 * Only two things are injected, both one instruction long:
 *
 *  1. The application context, so the extension can attach its panel.
 *  2. The player instance, captured as each ExoPlayer is constructed.
 *
 * Everything else happens at runtime in the extension: the video surface is
 * found by walking the view tree, the speed is set through media3's own
 * setPlaybackSpeed, and the picture is reshaped through media3's
 * AspectRatioFrameLayout.setResizeMode - all of which survive the apps'
 * obfuscation. That is why this needs no per-screen, per-layout or
 * per-version fingerprints, and why one patch covers two apps that share
 * nothing but their media stack.
 *
 * Nothing here touches DRM, licensing, entitlement or ad code.
 */
@Suppress("unused")
val playbackControlsPatch = bytecodePatch(
    name = "Playback speed and aspect ratio",
    description = "Adds a floating panel to change playback speed and stretch, crop or zoom the picture.",
    default = true,
) {
    compatibleWith(HBO_MAX, DISNEY_PLUS)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Hand the extension a context.
        //
        // HBO Max declares its own Application.onCreate, which is the earliest
        // and safest place. Disney+ does not - its Application inherits
        // onCreate from an obfuscated base class - so its main Activity is
        // used instead. Exactly one of these matches, depending on which app
        // is being patched.
        val contextHook = HboMaxApplicationFingerprint.methodOrNull
            ?: DisneyPlusMainActivityFingerprint.methodOrNull
            ?: throw PatchException(
                "Could not find a context hook. This patch targets HBO Max " +
                    "(com.wbd.stream) and Disney+ (com.disney.disneyplus)."
            )

        // Range form because a large method can push p0 past the 4-bit
        // register limit of a plain invoke-static.
        contextHook.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $CONTROLS->setContext(Landroid/content/Context;)V"
        )

        // 2. Capture every ExoPlayer as it is built.
        val playerConstructors = ExoPlayerConstructorFingerprint.matchAllOrNull()
            ?: throw PatchException(
                "No androidx.media3 ExoPlayer implementation found. The app " +
                    "has probably changed its media stack."
            )

        var hooked = 0

        playerConstructors.forEach { match ->
            val method = match.method

            // The call has to land on the constructor's normal exit path.
            //
            // Not instruction 0: a constructor must reach its super
            // constructor before `this` is usable, and handing a half-built
            // object out fails dex verification.
            //
            // And not the last instruction either, which is what the first
            // version of this patch did. media3's ExoPlayerImpl constructor
            // ends with a fill-array-data payload - dex stores those after the
            // code - and wraps its body in try/finally, so the tail of the
            // method is a payload block and a catchall handler. Neither runs
            // on a successful construction, which is why that build captured
            // no player at all while every other hook worked.
            //
            // Every return-void is hooked rather than just the first, so an
            // early exit path cannot slip through.
            val returnIndices = method.implementation!!.instructions
                .withIndex()
                .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
                .map { (index, _) -> index }

            // Reversed so the earlier indices stay valid as code is inserted.
            returnIndices.asReversed().forEach { index ->
                method.addInstruction(
                    index,
                    "invoke-static/range { p0 .. p0 }, " +
                        "$PLAYER_BRIDGE->onPlayerCreated(Ljava/lang/Object;)V"
                )
                hooked++
            }
        }

        if (hooked == 0) {
            throw PatchException(
                "Found ${playerConstructors.size} ExoPlayer constructor(s) but none had a " +
                    "return-void to hook, so the speed control would silently do nothing."
            )
        }
    }
}
