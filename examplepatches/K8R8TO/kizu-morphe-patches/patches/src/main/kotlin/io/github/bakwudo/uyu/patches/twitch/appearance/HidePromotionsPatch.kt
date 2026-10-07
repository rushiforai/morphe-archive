package io.github.bakwudo.uyu.patches.twitch.appearance

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.bakwudo.uyu.patches.twitch.settings.setPatchIncluded
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE
import io.github.bakwudo.uyu.patches.twitch.theatre.nativeTheatrePatch
import io.github.bakwudo.uyu.patches.util.addInstructionsAtControlFlowLabel
import io.github.bakwudo.uyu.patches.util.instanceField
import io.github.bakwudo.uyu.patches.util.replaceMethodBody
import io.github.bakwudo.uyu.patches.util.thisRegister
import io.github.bakwudo.uyu.patches.util.writesRegister

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/appearance/HidePromotionsPatch;"

internal val hidePromotionsPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(settingsPatch, nativeTheatrePatch)

    execute {
        setPatchIncluded("hidePromotions")
        hookViewDelegates()
        hookFollowingContentSections()
        hookFollowingGoAdFreeButton()
        hookCommunityHighlights()
    }
}

/**
 * Hooks the exact Twitch 31.3.1 Following-feed builder found in the supplied APKM.
 * The two lists passed to the verified ResumeWatching and OfflineChannels constructors are
 * freshly-created lists. We keep their original contents and conditionally clear them before
 * the section models are constructed.
 */
private fun BytecodePatchContext.hookFollowingContentSections() {
    val instructions = FollowingContentBuilderFingerprint.method.instructions

    fun findConstructor(type: String): Pair<Int, FiveRegisterInstruction> {
        val index = instructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT) return@indexOfFirst false
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == type &&
                reference.name == "<init>" &&
                reference.returnType == "V" &&
                reference.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
        }
        if (index < 0) throw PatchException("Following $type constructor call not found.")

        val invoke = instructions[index] as? FiveRegisterInstruction
            ?: throw PatchException("Following $type constructor call is not a five-register invoke.")
        if (invoke.registerCount != 2) {
            throw PatchException("Following $type constructor call does not take exactly two registers.")
        }
        return index to invoke
    }

    val resume = findConstructor("Ll2i;")
    val offline = findConstructor("Lj2i;")

    listOf(
        resume to "filterResumeWatchingList",
        offline to "filterOfflineChannelsList",
    ).sortedByDescending { it.first.first }.forEach { (match, helper) ->
        val register = match.second.registerD
        FollowingContentBuilderFingerprint.method.addInstructions(
            match.first,
            "invoke-static { v$register }, $EXTENSION_CLASS->$helper(Ljava/util/List;)V",
        )
    }
}

private fun BytecodePatchContext.hookFollowingGoAdFreeButton() {
    FollowingGoAdFreeButtonFingerprint.method.apply {
        addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->bindGoAdFree(Landroid/view/View;)V",
        )
    }
}

private fun BytecodePatchContext.hookViewDelegates() {
    BaseViewDelegateConstructorFingerprint.method.apply {
        val viewRegister = thisRegister + 2
        if (writesRegister(viewRegister)) {
            throw PatchException("BaseViewDelegate constructor reuses the register of the view.")
        }

        val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
        if (returnIndices.isEmpty()) throw PatchException("BaseViewDelegate constructor has no return.")

        returnIndices.asReversed().forEach { returnIndex ->
            addInstructionsAtControlFlowLabel(
                returnIndex,
                "invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->onViewCreated(Landroid/view/View;)V",
            )
        }
    }
}

private fun BytecodePatchContext.hookCommunityHighlights() {
    val addEvent = AddCommunityHighlightToStringFingerprint.classDef
    val highlightField = addEvent.fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("Highlight field not found in ${addEvent.type}.")
    val highlightTypeClass = SubtemberHighlightTypeFingerprint.classDef.superclass
        ?: throw PatchException("Base class of highlight types not found.")
    val typeField = classDefBy(highlightField.type).instanceField(highlightTypeClass)
    val idField = classDefBy(highlightTypeClass).instanceField("Ljava/lang/String;")

    replaceMethodBody(
        EXTENSION_CLASS,
        "highlightType",
        2,
        """
            instance-of v0, p0, ${addEvent.type}
            if-eqz v0, :other
            check-cast p0, ${addEvent.type}
            iget-object v0, p0, ${addEvent.type}->${highlightField.name}:${highlightField.type}
            iget-object v0, v0, ${typeField.definingClass}->${typeField.name}:${typeField.type}
            iget-object v0, v0, ${idField.definingClass}->${idField.name}:Ljava/lang/String;
            return-object v0
            :other
            const/4 v0, 0x0
            return-object v0
        """,
    )

    val presenter = mutableClassDefBy(CommunityHighlightPresenterFingerprint.classDef.type)
    val eventType = addEvent.superclass
    val takeEvent = presenter.methods.singleOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf(eventType)
    } ?: throw PatchException("Community highlight event method not found in ${presenter.type}.")

    takeEvent.apply {
        if (thisRegister == 0) throw PatchException("Community highlight event method has no free register.")
        addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->hideCommunityHighlight(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :add
                return-void
                :add
                nop
            """,
        )
    }
}
