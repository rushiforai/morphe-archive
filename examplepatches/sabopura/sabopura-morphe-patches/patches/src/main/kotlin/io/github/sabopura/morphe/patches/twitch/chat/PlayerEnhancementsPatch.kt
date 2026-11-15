package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import io.github.sabopura.morphe.patches.twitch.ui.enableTwitchFeature
import java.util.logging.Logger

private const val PLAYER="Lio/github/sabopura/morphe/extension/twitch/player/PlayerTools;"
private const val VOD_MODEL="Ltv/twitch/android/models/videos/VodModel;"
private const val CHANNEL_MODEL="Ltv/twitch/android/models/channel/ChannelModel;"
private object LiveManifest : Fingerprint(strings=listOf("usher.ttvnw.net","fast_bread"))

private fun Method.params()=parameterTypes.map { it.toString() }

/** Loads one page of VOD comments: (offset seconds, cursor) -> Rx source. */
internal fun isVodCommentsFetch(method: Method)=method.implementation!=null &&
    method.params()==listOf("I","Ljava/lang/String;") && method.returnType.startsWith("Lio/reactivex/")

/** Binds the comments provider to a VOD and its channel. */
internal fun isVodSetup(method: Method)=method.implementation!=null &&
    method.params()==listOf(VOD_MODEL,CHANNEL_MODEL) && method.returnType=="V"

/**
 * The VOD comments provider, found by its two entry points. Up to 31.9.0 its fetch method also held
 * the "parseChommentResponse" function reference; 32.0.0 moved that string into a shared lambda class.
 */
internal fun isVodCommentsProvider(type: ClassDef)=
    type.methods.count(::isVodCommentsFetch)==1 && type.methods.count(::isVodSetup)==1

@Suppress("unused")
val playerEnhancementsPatch=bytecodePatch(
    name="Player enhancements",
    description="Playback speed, seek steps, statistics, sleep timer, VOD chat offset and chapters. " +
        "Optional public manifest proxy, gestures, layout and Following feed controls in the player menu settings."
) {
    compatibleWith(TWITCH_SUPPORTED)
    dependsOn(chatEnhancementsPatch)
    dependsOn(layoutPatch)
    dependsOn(feedPatch)
    execute {
        val application=mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;")
        val create=application.methods.single { it.name=="onCreate" && it.parameterTypes.isEmpty() }
        // Android attaches the Application Context before invoking onCreate. Twitch moves its
        // super call into a helper, so do not assume an inline invoke-super here.
        create.addInstructions(0,"invoke-static/range {p0 .. p0}, $PLAYER->initialize(Landroid/content/Context;)V")
        val core=mutableClassDefBy("Lcom/amazonaws/ivs/player/CorePlayerImpl;")
        for((name,hook) in listOf("play" to "onPlay","release" to "onRelease")) {
            core.methods.single { it.name==name && it.parameterTypes.isEmpty() }.addInstructions(0,
                "invoke-static/range {p0 .. p0}, $PLAYER->$hook(Ljava/lang/Object;)V")
        }
        // Every way Twitch loads content: a URL, a clip manifest, or a preloaded source.
        val sources=setOf("Lcom/amazonaws/ivs/player/MediaPlayer\$LoadOptions;","Ljava/lang/String;","Lcom/amazonaws/ivs/player/Source;")
        val loads=core.methods.filter { it.name in setOf("load","loadClipManifest","loadSource") &&
            it.implementation!=null && it.parameterTypes.size in 1..2 && it.parameterTypes[0].toString() in sources }
        if(loads.none { it.name=="load" }) throw PatchException("Player enhancements: IVS load entry point missing")
        loads.forEach { it.addInstructions(0,"invoke-static/range {p0 .. p1}, $PLAYER->onLoad(Ljava/lang/Object;Ljava/lang/Object;)V") }
        val provider=classesMatching(::isVodCommentsProvider).uniqueContract("Player enhancements: VOD comments provider")
        val comments=mutableClassDefBy(provider.type)
        val fetch=comments.methods.single(::isVodCommentsFetch)
        fetch.addInstructions(0,"""
            invoke-static/range {p1 .. p1}, $PLAYER->commentTime(I)I
            move-result p1
        """)
        val setup=comments.methods.single(::isVodSetup)
        setup.addInstructions(0,"invoke-static/range {p1 .. p2}, $PLAYER->onVod(Ljava/lang/Object;Ljava/lang/Object;)V")
        val manifest=LiveManifest.method
        val returns=manifest.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_OBJECT }
        if(returns.isEmpty())throw PatchException("Player enhancements: live manifest return missing")
        returns.asReversed().forEach { (index,instruction)->
            val r=(instruction as OneRegisterInstruction).registerA
            manifest.addInstructions(index,"""
                check-cast v$r, Landroid/net/Uri;
                invoke-static/range {v$r .. v$r}, Lio/github/sabopura/morphe/extension/twitch/player/LiveProxy;->rewrite(Landroid/net/Uri;)Landroid/net/Uri;
                move-result-object v$r
            """)
        }
        Logger.getLogger("Sabopura.Player").info("Player enhancements: app init, IVS play/release, ${loads.size} IVS load hook(s), VOD setup/offset, ${returns.size} manifest hook(s)")
    }
    finalize {
        enableTwitchFeature("playerPatch")
    }
}
