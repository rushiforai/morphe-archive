package io.github.jordanwoodson.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.invoke
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import io.github.jordanwoodson.patches.twitch.shared.freeRegister
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val CACHE = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchImageCache;"
private const val STREAM = "Ljava/io/InputStream;"

/**
 * Third-party images (7TV, BetterTTV and FrankerFaceZ emotes, third-party badges) get a cache of Lurk's own.
 * Twitch loads all its images with Glide over OkHttp, into a 64 MB disk cache for the whole app; animated
 * third-party emotes are large enough to push each other out of it, so they were downloaded again and again
 * (issue 71). Glide's OkHttp fetcher is the one place every network image passes: before it makes a request,
 * an image Lurk has stored is handed to Glide instead; and the body of a successful response is copied into
 * Lurk's cache as Glide reads it. Every image that isn't on a third-party host takes Twitch's unchanged path
 * after one string comparison.
 */
internal val thirdPartyImageCachePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        val match = ImageFetcherResponseFingerprint.twitchMatch("image fetcher response")
        val fetcher = match.classDef
        // The fetcher keeps the URL it loads (Glide's GlideUrl, whose toString is the URL) from its constructor.
        val init = fetcher.methods.singleOrNull { it.name == "<init>" }
            ?: throw PatchException("Twitch: the image fetcher has more than one constructor")
        if (init.parameterTypes.size != 2) throw PatchException("Twitch: the image fetcher's constructor changed")
        val urlType = init.parameterTypes[1].toString()
        val url = fetcher.fields.singleOrNull { it.type == urlType }
            ?: throw PatchException("Twitch: the image fetcher doesn't keep its URL")
        val urlField = "${fetcher.type}->${url.name}:$urlType"

        // The response: Glide gets the body's stream wrapped in its own length-checking stream. The data
        // callback's "data ready" method is the interface call that takes that wrapper.
        val ready: MethodReference
        match.method.apply {
            val instructions = implementation!!.instructions
            val streams = instructions.indices.filter { i ->
                val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
                instructions[i].opcode == Opcode.INVOKE_VIRTUAL && ref?.returnType == STREAM && ref.parameterTypes.isEmpty()
            }
            val call = streams.singleOrNull() ?: throw PatchException("Twitch: expected one image body stream, found ${streams.size}")
            val result = instructions[call + 1]
            if (result.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Twitch: the image body stream isn't kept")
            val stream = (result as OneRegisterInstruction).registerA
            val callbacks = instructions.drop(call).filter { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_INTERFACE && ref?.returnType == "V" &&
                    ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;")
            }
            ready = (callbacks.singleOrNull() as? ReferenceInstruction)?.reference as? MethodReference
                ?: throw PatchException("Twitch: the image fetcher's data callback changed")
            val insert = call + 2
            requireNotBranchTarget(insert, "image body stream")
            val scratch = freeRegister(insert, listOf(stream), "image body stream")
            val self = parameterRegister(0)
            if (self > 15) throw PatchException("Twitch: image fetcher registers out of range")
            addInstructions(insert, """
                iget-object v$scratch, v$self, $urlField
                ${invokeStatic("$CACHE->store(Ljava/lang/Object;$STREAM)$STREAM", scratch, stream)}
                move-result-object v$stream
            """)
        }

        // The request: the fetcher's load method takes a priority and that callback.
        val load = fetcher.methods.singleOrNull { method ->
            method.returnType == "V" && method.parameterTypes.size == 2 &&
                method.parameterTypes[1].toString() == ready.definingClass
        } ?: throw PatchException("Twitch: the image fetcher's load method changed")
        Locators.record("twitch.image_cache.load", load)
        Locators.record("twitch.image_cache.url", urlField)
        load.apply {
            requireLocals(1)
            val self = parameterRegister(0)
            val callback = parameterRegister(2)
            if (self > 15) throw PatchException("Twitch: image fetcher registers out of range")
            addInstructionsWithLabels(0, """
                iget-object v0, v$self, $urlField
                ${invokeStatic("$CACHE->cached(Ljava/lang/Object;)$STREAM", 0)}
                move-result-object v0
                if-eqz v0, :lurk_request
                ${invoke("invoke-interface", ready.toString(), callback, 0)}
                return-void
            """, ExternalLabel("lurk_request", getInstruction(0)))
        }
    }
}
