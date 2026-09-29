package io.github.bakwudo.uyu.patches.twitch.appearance

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
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

@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Adds options to hide the subscribe and Bits buttons above chat, the Bits button " +
        "in the chat box, the gift leaderboard and banners that advertise subscriptions. " +
        "All of them are hidden by default. They can be shown again in the Appearance section " +
        "of the uyu settings. Streams open in Twitch's native player instead of the new " +
        "React Native one, which this relies on.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(settingsPatch, nativeTheatrePatch)

    execute {
        setPatchIncluded("hidePromotions")
        hookViewDelegates()
        hookCommunityHighlights()
    }
}

/**
 * Lets the extension find the views to hide in every view delegate Twitch creates.
 */
private fun BytecodePatchContext.hookViewDelegates() {
    BaseViewDelegateConstructorFingerprint.method.apply {
        // p2, the root view, is passed to the extension at the end.
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

/**
 * Drops the community highlights that advertise subscriptions (SUBtember, gift discounts)
 * before they are added. Other highlights, such as predictions and hype trains, use the same
 * view, so it cannot be hidden.
 */
private fun BytecodePatchContext.hookCommunityHighlights() {
    // The event that adds a highlight holds the highlight, which holds its type. Every type
    // extends one base class, which holds the type id ("subtember").
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

    // Every highlight is added through this method of the presenter, which takes all highlight
    // events. The events share the superclass of the add event.
    val presenter = mutableClassDefBy(CommunityHighlightPresenterFingerprint.classDef.type)
    val eventType = addEvent.superclass
    val takeEvent = presenter.methods.singleOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf(eventType)
    } ?: throw PatchException("Community highlight event method not found in ${presenter.type}.")

    takeEvent.apply {
        // v0 is used before the method's own code runs, so it must not be a parameter.
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
