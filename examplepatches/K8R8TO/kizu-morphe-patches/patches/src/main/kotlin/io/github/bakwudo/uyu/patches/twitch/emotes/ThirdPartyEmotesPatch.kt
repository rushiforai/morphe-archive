package io.github.bakwudo.uyu.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch

private const val EXTENSION = "Lapp/morphe/extension/twitch/emotes/EmoteSupport;"
private const val CHANNEL_CLASS = "Ltv/twitch/android/shared/chat/pub/messages/data/ChannelChatConnectionKey;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val BUFFER_TYPE = "Landroid/widget/TextView\$BufferType;"

internal val thirdPartyEmotesPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(sharedExtensionPatch)

    execute {
        val channelClassDef = classDefByOrNull(CHANNEL_CLASS)
            ?: throw PatchException("Kizu emotes: exact Twitch 31.3.1 channel connection class was not found.")
        val channelClass = mutableClassDefBy(channelClassDef)

        val channelConstructor = channelClass.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } ==
                    listOf("Ljava/lang/String;", "Ljava/lang/String;")
        } ?: throw PatchException(
            "Kizu emotes: expected one ChannelChatConnectionKey(String,String) constructor.",
        )

        val returnIndex = channelConstructor.instructions.indexOfLast { it.opcode.name == "return-void" }
        if (returnIndex < 0) {
            throw PatchException("Kizu emotes: channel connection constructor has no return-void.")
        }

        channelConstructor.addInstructions(
            returnIndex,
            "invoke-static {p1, p2}, $EXTENSION->onChannelChanged(Ljava/lang/String;Ljava/lang/String;)V",
        )

        // Locate Twitch's chat-row binder structurally. R8 class/method names are
        // not stable across Twitch releases, while the MessageRecyclerItem signature and
        // TextView.setText call provide a useful behavioral fingerprint.
        val messageClass = MessageRecyclerItemClassFingerprint.classDef

        fun isChatBindMethod(method: Method): Boolean {
            val instructions = method.implementation?.instructions ?: return false
            return method.returnType == "V" &&
                method.parameterTypes.size == 2 &&
                method.parameterTypes[0].toString() == messageClass.type &&
                method.parameterTypes[1].toString() == "Z" &&
                instructions.count { instruction ->
                    val reference =
                        (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == TEXT_VIEW &&
                        reference.name == "setText" &&
                        reference.returnType == "V" &&
                        reference.parameterTypes.map { it.toString() } ==
                            listOf(CHAR_SEQUENCE, BUFFER_TYPE)
                } == 1
        }

        fun methodSignature(method: Method): String =
            method.name + "(" + method.parameterTypes.joinToString("") { it.toString() } + ")" + method.returnType

        val candidates = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods
                .filter(::isChatBindMethod)
                .forEach { method -> candidates += classDef.type to methodSignature(method) }
        }

        val uniqueCandidates = candidates.distinct()
        val selected = uniqueCandidates.singleOrNull()
            ?: throw PatchException(
                "Kizu emotes: expected one Twitch chat row binder, found " + uniqueCandidates.size + ".",
            )

        val rowClass = mutableClassDefBy(selected.first)
        val bindMethod = rowClass.methods.singleOrNull {
            methodSignature(it) == selected.second && isChatBindMethod(it)
        } ?: throw PatchException("Kizu emotes: selected chat row bind method disappeared.")

        val textCalls = bindMethod.instructions.withIndex().filter { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == TEXT_VIEW &&
                reference.name == "setText" &&
                reference.returnType == "V" &&
                reference.parameterTypes.map { it.toString() } ==
                    listOf(CHAR_SEQUENCE, BUFFER_TYPE)
        }.toList()

        val textCall = textCalls.singleOrNull()
            ?: throw PatchException("Kizu emotes: expected one chat TextView.setText call.")

        val registers = textCall.value as? FiveRegisterInstruction
            ?: throw PatchException("Kizu emotes: chat TextView.setText is not a 35c invoke.")
        if (registers.registerCount != 3) {
            throw PatchException("Kizu emotes: unexpected chat TextView.setText register count.")
        }

        val textViewRegister = registers.registerC
        bindMethod.addInstructions(
            textCall.index + 1,
            "invoke-static {v$textViewRegister}, $EXTENSION->bind(Landroid/widget/TextView;)V",
        )
    }
}