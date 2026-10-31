/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.feedsound

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.ControlFlow
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val STORY_PATCH = "Keep feed videos muted (stories)"
internal const val STORY_SOUND = "$EXTENSION_PACKAGE/media/StorySound;"
internal const val OWN_STORY_VOLUME = "$STORY_SOUND->volume(F)F"

/**
 * The reason the story viewer logs for a story heard as it is, a plain string in its one volume
 * setter (StoryViewerVideoComponentSpec's). Its other reasons sit in the same method.
 */
internal const val STORY_AUDIBLE = "stories_video_default_audible"

/**
 * The story viewer's volume setter [method] in [owner]. It builds a volume request with a
 * new-instance at [askAt] and its constructor right after, then hands the request and the volume in
 * [volume] to the player in one call.
 */
internal class StoryVolume(val owner: String, val method: Method, val askAt: Int, val volume: Int)

private fun isVolumeCall(reference: MethodReference?) = reference != null && reference.returnType == "V" &&
    reference.parameterTypes.size == 2 && reference.parameterTypes[1].toString() == "F" &&
    reference.parameterTypes[0].toString().startsWith("L")

/**
 * The volume setter in [owner]: its one static void method holding [STORY_AUDIBLE], with one
 * player call taking a request and a float. The request is built by the two instructions right
 * before that call, and nothing but the instruction in front of them flows into the three. Throws
 * for any other shape.
 */
internal fun storyVolume(owner: ClassDef): StoryVolume {
    val setters = owner.methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && holdsString(it, STORY_AUDIBLE)
    }
    val method = setters.singleOrNull()
        ?: throw PatchException("$STORY_PATCH: ${owner.type} has ${setters.size} static setters holding $STORY_AUDIBLE")
    val where = "${owner.type}->${method.name}"
    val code = method.implementation!!.instructions.toList()
    val calls = code.indices.filter {
        code[it].opcode == Opcode.INVOKE_VIRTUAL && isVolumeCall((code[it] as ReferenceInstruction).reference as? MethodReference)
    }
    val call = calls.singleOrNull()
        ?: throw PatchException("$STORY_PATCH: $where makes ${calls.size} player calls taking a request and a volume")
    val invoke = code[call] as FiveRegisterInstruction
    val request = ((code[call] as ReferenceInstruction).reference as MethodReference).parameterTypes[0].toString()
    val build = code.getOrNull(call - 2)
    val init = code.getOrNull(call - 1)
    val built = build?.opcode == Opcode.NEW_INSTANCE && ((build as ReferenceInstruction).reference as TypeReference).type == request
    val initReference = (init as? ReferenceInstruction)?.reference as? MethodReference
    val inits = init?.opcode == Opcode.INVOKE_DIRECT && initReference?.name == "<init>" &&
        initReference.definingClass == request &&
        (init as FiveRegisterInstruction).registerC == (build as OneRegisterInstruction).registerA &&
        invoke.registerD == build.registerA
    if (!built || !inits) throw PatchException("$STORY_PATCH: $where doesn't build its volume request right before the player call")
    val volume = invoke.registerE
    if (volume >= 16) throw PatchException("$STORY_PATCH: $where holds its volume past v15")
    if ((build as OneRegisterInstruction).registerA == volume) {
        throw PatchException("$STORY_PATCH: $where builds its request in the volume's register")
    }

    // The ask goes in front of the new-instance, so only the instruction before it may lead there,
    // and nothing may jump into the request's build or the call either.
    val askAt = call - 2
    val flow = ControlFlow.of(method)
    for (index in code.indices) {
        val next = flow.normal[index] + flow.exceptional[index]
        for (target in askAt..call) {
            if (target in next && index != target - 1) throw PatchException("$STORY_PATCH: $where has a jump into its volume call")
        }
    }
    return StoryVolume(owner.type, method, askAt, volume)
}

/** The story viewer's volume setter, from the one class outside the extension holding [STORY_AUDIBLE]. */
internal fun BytecodePatchContext.storyVolume(): StoryVolume {
    val owners = classDefByStrings(STORY_AUDIBLE, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
    val owner = owners.singleOrNull()
        ?: throw PatchException("$STORY_PATCH: found ${owners.size} classes holding $STORY_AUDIBLE, expected one")
    return storyVolume(owner)
}

/**
 * Asks StorySound for the story's volume right before the setter builds its request, and puts the
 * answer back in the volume's own register, so the request and the call run as Facebook wrote them.
 */
internal fun BytecodePatchContext.askStorySound(volume: StoryVolume) {
    mutableClassDefBy(volume.owner).findMutableMethodOf(volume.method).addInstructions(
        volume.askAt,
        """
            invoke-static { v${volume.volume} }, $OWN_STORY_VOLUME
            move-result v${volume.volume}
        """,
    )
}
