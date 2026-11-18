package io.github.sabopura.morphe.patches.twitch.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.app.playerRetryHook
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private const val PLAYER = "Lio/github/sabopura/morphe/extension/twitch/player/PlayerTools;"
private const val PROXY = "Lio/github/sabopura/morphe/extension/twitch/player/LiveProxy;"
private const val URI_BUILD = "Landroid/net/Uri\$Builder;->build()Landroid/net/Uri;"
private val log: Logger = Logger.getLogger("SabopuraTwitch.Player")

private const val VOD_MODEL = "Ltv/twitch/android/models/videos/VodModel;"
private const val CHANNEL_MODEL = "Ltv/twitch/android/models/channel/ChannelModel;"

private fun Method.params() = parameterTypes.map { it.toString() }

/** Loads one page of VOD comments: (offset seconds, cursor) -> Rx source. */
internal fun isVodCommentsFetch(method: Method) = method.implementation != null &&
    method.params() == listOf("I", "Ljava/lang/String;") && method.returnType.startsWith("Lio/reactivex/")

/** Binds the comments provider to a VOD and its channel. */
internal fun isVodSetup(method: Method) = method.implementation != null &&
    method.params() == listOf(VOD_MODEL, CHANNEL_MODEL) && method.returnType == "V"

/**
 * The VOD comments provider, found by its two entry points. Up to 31.9.0 its fetch method also held
 * the "parseChommentResponse" function reference; 32.0.0 moved that string into a shared lambda class.
 */
internal fun isVodCommentsProvider(type: ClassDef) =
    type.methods.count(::isVodCommentsFetch) == 1 && type.methods.count(::isVodSetup) == 1

private fun BytecodePatchContext.vodComments() =
    mutableClassDefBy(classesMatching(::isVodCommentsProvider).uniqueContract("VOD comments provider").type)

/** Tracks every IVS player, so the tools act on the one on screen. */
internal val ivsPlayerHooks = bytecodePatch {
    dependsOn(playerRetryHook)
    extendWith(TWITCH_EXTENSION)
    execute {
        val core = mutableClassDefBy("Lcom/amazonaws/ivs/player/CorePlayerImpl;")
        for ((name, hook) in listOf("play" to "onPlay", "release" to "onRelease")) {
            core.methods.single { it.name == name && it.parameterTypes.isEmpty() }.addInstructions(
                0, "invoke-static/range {p0 .. p0}, $PLAYER->$hook(Ljava/lang/Object;)V",
            )
        }
        val sources = setOf("Lcom/amazonaws/ivs/player/MediaPlayer\$LoadOptions;", "Ljava/lang/String;", "Lcom/amazonaws/ivs/player/Source;")
        val loads = core.methods.filter {
            it.name in setOf("load", "loadClipManifest", "loadSource") && it.implementation != null &&
                it.parameterTypes.size in 1..2 && it.parameterTypes[0].toString() in sources
        }
        if (loads.none { it.name == "load" }) throw PatchException("Player: IVS load entry point missing")
        loads.forEach {
            it.addInstructions(0, "invoke-static/range {p0 .. p1}, $PLAYER->onLoad(Ljava/lang/Object;Ljava/lang/Object;)V")
        }
        log.info("Player: IVS play, release and ${loads.size} load hook(s)")
    }
}

/** Tells the tools and the chat which VOD Twitch set up. */
internal val vodContextHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val setup = vodComments().methods.single(::isVodSetup)
        // The extension reads these by name; a rename must stop the patch, not leave VODs without their channel.
        fun ClassDef.getter(vararg names: String) = methods.any { it.name in names && it.parameterTypes.isEmpty() }
        if (!classDefBy(VOD_MODEL).getter("getId")) throw PatchException("VOD: VodModel.getId is gone")
        val channel = classDefBy(CHANNEL_MODEL)
        if (!channel.getter("getName") || !channel.getter("getTuid", "getId"))
            throw PatchException("VOD: ChannelModel no longer has getName and getTuid or getId")
        setup.addInstructions(0, "invoke-static/range {p1 .. p2}, $PLAYER->onVod(Ljava/lang/Object;Ljava/lang/Object;)V")
    }
}

internal val vodOffsetHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        vodComments().methods.single(::isVodCommentsFetch).addInstructions(0, """
            invoke-static/range {p1 .. p1}, $PLAYER->commentTime(I)I
            move-result p1
        """)
    }
}

/** The index of the only `return Uri$Builder.build()` in this method, or null. */
private fun manifestReturn(method: Method): Int? {
    val code = method.implementation?.instructions?.toList() ?: return null
    return code.indices.filter { index ->
        index >= 2 && code[index].opcode == Opcode.RETURN_OBJECT && code[index - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            ((code[index - 2] as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == URI_BUILD
    }.singleOrNull()
}

/**
 * R8 merges the manifest builder into one lambda class with unrelated Compose branches, so only
 * the return that hands back the built manifest URL may be touched.
 */
internal val streamProxyHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val owner = classesWithStrings("usher.ttvnw.net", "fast_bread")
            .filter { c -> c.methods.any { manifestReturn(it) != null } }
            .uniqueContract("live manifest builder")
        val method = mutableClassDefBy(owner).methods.filter { manifestReturn(it) != null }
            .uniqueContract("live manifest builder method")
        val index = manifestReturn(method)!!
        val register = method.instructions[index].let { (it as OneRegisterInstruction).registerA }
        method.addInstructions(index, """
            invoke-static/range {v$register .. v$register}, $PROXY->rewrite(Landroid/net/Uri;)Landroid/net/Uri;
            move-result-object v$register
        """)
    }
}

/** Makes the player's root view report where the video is. */
internal val playerGestureRoot = resourcePatch {
    execute {
        document("res/layout/player_view_delegate.xml").use { document ->
            val root = document.documentElement
            if (root.tagName != "FrameLayout") throw PatchException("Gestures: unexpected player root")
            document.renameNode(root, null, "io.github.sabopura.morphe.extension.twitch.player.PlayerGestureFrame")
        }
    }
}
