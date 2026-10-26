/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.feedtext

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val AWEME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"
private const val EXTENSION = "Lapp/pixkk/extension/feed/SoundUnderDescription;"
private const val PROMO_TAG = "Lcom/ss/android/ugc/aweme/music/model/MusicPromoTagInfo;"

/**
 * The video's music promo tag. TikTok shows the music row under a video's description only when
 * the video carries a tag with some text, so a tag handed out for a video that has none brings
 * that row up, drawn and styled by TikTok.
 */
internal object MusicPromoTagGetterFingerprint : Fingerprint(
    definingClass = AWEME,
    name = "getMusicPromoTagInfo",
    returnType = PROMO_TAG,
    parameters = emptyList(),
)

/**
 * The music component's bind that writes the promo tag's text into its view: the one method of
 * the class that reads the tag's text, writes a text view and hands that view a click state.
 */
internal object PromoTagViewBindFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/music/VideoMusicTitleAssem;",
    returnType = "V",
    parameters = emptyList(),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        instructions.any { it.getReference<FieldReference>()?.let { f -> f.definingClass == PROMO_TAG && f.name == "text" } == true } &&
            instructions.any { it.getReference<MethodReference>()?.let { m -> m.definingClass == TEXT_VIEW && m.name == "setText" } == true } &&
            instructions.any { it.getReference<MethodReference>()?.name == "setComponentClickStatusExperimental" }
    },
)

/**
 * The music row's title setter: a short `void(String)` method of the music component that does
 * nothing but write its argument into a text view and then touch the views around it.
 */
internal object MusicRowTitleFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/music/VideoMusicTitleAssem;",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        instructions.size <= 16 && instructions.any {
            it.getReference<MethodReference>()?.let { m -> m.definingClass == TEXT_VIEW && m.name == "setText" } == true
        }
    },
)

@Suppress("unused")
val soundUnderDescriptionPatch = bytecodePatch(
    name = "Sound name under description",
    description = "Shows the video's sound name on its own line under the description, the way " +
        "the feed did before the redesign. Starts off. Turn it on in the Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        // The getter is `iget-object v0, p0, ...; return-object v0`. The extension gets the Aweme
        // and the tag it has, and answers with that tag, or with one naming the sound if there is none.
        MusicPromoTagGetterFingerprint.method.apply {
            val returnIndex = implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIndex < 0) throw PatchException("Sound name under description: the getter no longer returns an object")
            addInstructions(
                returnIndex,
                """
                    invoke-static { p0, v0 }, $EXTENSION->promoTag(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v0
                    check-cast v0, $PROMO_TAG
                """,
            )
        }

        // p0 is the music component and p1 the title about to be written; the extension answers
        // with the title to write.
        MusicRowTitleFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->title(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """,
        )

        // Right after the tag's text is written into its view, the extension moves the text it
        // handed out into the row's title view.
        PromoTagViewBindFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val textIndex = instructions.indexOfFirst {
                it.getReference<FieldReference>()?.let { f -> f.definingClass == PROMO_TAG && f.name == "text" } == true
            }
            // Only a write after the tag's text was read can be the one that shows it.
            val setTextIndex = (textIndex + 1 until instructions.size).firstOrNull { i ->
                instructions[i].opcode == Opcode.INVOKE_VIRTUAL &&
                    instructions[i].getReference<MethodReference>()
                        ?.let { it.definingClass == TEXT_VIEW && it.name == "setText" } == true
            } ?: -1
            val setText = instructions.getOrNull(setTextIndex) as? FiveRegisterInstruction
            if (textIndex < 0 || setTextIndex < 0 || setText == null || setText.registerC > 15) {
                throw PatchException("Sound name under description: the promo tag's text view write is gone")
            }
            addInstruction(
                setTextIndex + 1,
                "invoke-static { v${setText.registerC} }, $EXTENSION->showInMusicTitle(Landroid/widget/TextView;)V",
            )
        }
    }
}
