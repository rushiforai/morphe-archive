package io.github.jordanwoodson.patches.twitch.emotes

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.isFreeRegister
import io.github.jordanwoodson.patches.twitch.shared.requireKept
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import io.github.jordanwoodson.patches.twitch.shared.matchKey
import io.github.jordanwoodson.patches.twitch.shared.Constants.TWITCH_VERSION
import io.github.jordanwoodson.patches.shared.Locators

/**
 * Chat images: Twitch fits each emote and badge image in a square, so wide third-party emotes and pronoun
 * badges would shrink. Before the image loads (where the chat image loader's Glide target takes the placeholder's
 * box), an image Lurk knows to be wide gets its width and is sized by height instead. Everything else keeps
 * Twitch's sizing.
 */
internal val chatImageSizePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        // The loader makes one target per placeholder; its constructor does the sizing this hook changes.
        // Another target class with the same constructor serves single images (its own loader method, a 24 dp
        // icon); only the line loader's is changed, as before 32.1.0.
        val loader = ChatImageLoaderFingerprint.twitchMatch("chat image loader").method
        val made = loader.implementation!!.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        val match = ChatImageTargetFingerprint.matchAllOrNull().orEmpty().singleOrNull { it.classDef.type in made }
            ?: throw PatchException("Twitch $TWITCH_VERSION: expected exactly one chat image target made by the loader")
        Locators.record(ChatImageTargetFingerprint.matchKey("chat image target"), match.originalMethod)
        match.method.apply {
            val instructions = implementation!!.instructions
            val call = match.instructionMatches.first().index
            val result = instructions[call + 1]
            if (result.opcode != Opcode.MOVE_RESULT) throw PatchException("Twitch: height constraint not kept")
            val constrained = (result as OneRegisterInstruction).registerA
            val store = call + 2
            if (instructions[store].opcode != Opcode.IPUT_BOOLEAN ||
                (instructions[store] as TwoRegisterInstruction).registerA != constrained) {
                throw PatchException("Twitch: height constraint isn't stored right away")
            }
            // The placeholder drawable is the constructor's second parameter; its only String field is the image URL.
            val placeholderType = parameterTypes[1].toString()
            val urlField = classDefBy(placeholderType).fields.singleOrNull {
                it.type == "Ljava/lang/String;" && !AccessFlags.STATIC.isSet(it.accessFlags)
            } ?: throw PatchException("Twitch: the chat image placeholder has no single URL field")
            val placeholder = parameterRegister(2) // p0 is this
            requireKept(-1, store, placeholder, "chat image placeholder")
            requireNotBranchTarget(store, "height constraint store")
            // The constructor has no locals of its own: any register dead at the store will do (the box size is).
            val scratch = (0 until minOf(implementation!!.registerCount, 16)).firstOrNull {
                it != constrained && it != placeholder && isFreeRegister(store, it)
            } ?: throw PatchException("Twitch: no free register in the chat image target")
            if (constrained > 15 || placeholder > 15) throw PatchException("Twitch: chat image registers out of range")
            addInstructions(store, """
                iget-object v$scratch, v$placeholder, $placeholderType->${urlField.name}:Ljava/lang/String;
                invoke-static { v$constrained, v$placeholder, v$scratch }, Lio/github/jordanwoodson/extension/shared/twitch/TwitchEmotes;->sizeEmote(ZLandroid/graphics/drawable/Drawable;Ljava/lang/String;)Z
                move-result v$constrained
            """)
        }
    }
}
