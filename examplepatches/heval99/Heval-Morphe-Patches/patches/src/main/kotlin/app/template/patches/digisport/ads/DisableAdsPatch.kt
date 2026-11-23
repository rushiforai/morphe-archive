package app.template.patches.digisport.ads

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun MutableMethod.label() = "$definingClass->$name"

private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

private fun Instruction.readsField(field: FieldReference): Boolean {
    if (opcode != Opcode.IGET_OBJECT) return false
    val ref = (this as ReferenceInstruction).reference as? FieldReference ?: return false
    return ref.definingClass == field.definingClass && ref.name == field.name && ref.type == field.type
}

// Digi Sport shows AdMob banners as rows in articles and the live EPG list (VHSectionAd ->
// AdMobManager), and IMA pre-rolls before live channels and article/VOD videos. Live channels can
// also be IMA DAI streams with server-inserted ads; those are left to "Disable live stream ads",
// so this patch never changes how a live stream is built. The ad slots come from server "ads"
// lists and <ad-api> elements in article bodies; steps 6, 7 and 8 drop them at the data level, so
// the spacer rows around them go too. MobileAds is not touched (the app never calls initialize or
// any other MobileAds static; MobileAdsInitProvider is left alone), and neither is SatiManager.
// Since 1.1.16 (R8) AdMobManager.loadAd is inlined into VHSectionAd.bind (step 2 covers it) and
// GetArticleDetailsWidgets.addAdWidget into a parser lambda that reads the article's ad list,
// which step 6 already empties (addAdWidget had its own step up to 1.1.15).
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes banner ads and video ads."
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // 1. AdMobManager: requestAd (the only AdView build + loadAd) and putAd return at once,
        // which also covers the posted runnable and the AdListener's re-entries.
        adMobRequestAdFingerprint.method.returnEarly()
        adMobPutAdFingerprint.method.returnEarly()

        // 2. The ad row itself takes no space: bind (with the inlined loadAd) sets itemView GONE,
        // zeroes its layout height (the row root is a wrap_content RelativeLayout without margins)
        // and returns before it posts the ad request. A VHSectionAd only ever holds ad rows, so a
        // recycled holder stays hidden. RecyclerView is renamed too, so ViewHolder.itemView is the
        // View field bind itself reads. Only p0/p1 are used: p1 (the UIAd) is dropped for the
        // view, then p0 (this) is reused for GONE and the layout params, and p1 for the 0 height.
        val bind = sectionAdBindFingerprint.method
        val itemView = bind.implementation!!.instructions.firstNotNullOfOrNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { instruction.opcode == Opcode.IGET_OBJECT && it.type == "Landroid/view/View;" }
        } ?: throw PatchException("Disable ads: ${bind.label()} reads no ViewHolder itemView")
        // The field must belong to the holder itself or one of its superclasses in the app.
        val holderChain = generateSequence(bind.definingClass) { classDefByOrNull(it)?.superclass }.toList()
        if (itemView.definingClass !in holderChain) {
            throw PatchException(
                "Disable ads: ${bind.label()} reads a View field of ${itemView.definingClass}, " +
                    "which is not its class or a superclass ($holderChain)"
            )
        }
        bind.addInstructionsWithLabelsChecked(
            0,
            """
                iget-object p1, p0, ${itemView.definingClass}->${itemView.name}:Landroid/view/View;
                const/16 p0, 0x8
                invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V
                invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
                move-result-object p0
                if-eqz p0, :collapsed
                const/4 p1, 0x0
                iput p1, p0, Landroid/view/ViewGroup${'$'}LayoutParams;->height:I
                :collapsed
                return-void
            """,
        )

        // 3. Live channel pre-roll: createPlayerInput skips the "Reclama" pre-roll item.
        uiLivePrerollEnableFingerprint.method.returnEarly(false)

        // 4. Article and VOD pre-roll: the getter is inlined since 1.1.16, so every read of the
        // ad tag field outside its own class reads "" instead (the field is a non-null String and
        // the VOD builder calls isBlank on it), and no pre-roll item is added there. The other
        // reader still adds a blank.mp4 item with an empty ad tag; step 5 makes that item play
        // without ads. Writers and the data class's own equals/hashCode/toString are untouched.
        val toString = articleApiPayloadsToStringFingerprint.method
        val toStringInsns = toString.implementation!!.instructions.toList()
        val label = toStringInsns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == VIDEO_PREROLL_LABEL
        }
        val preroll = toStringInsns.drop(label + 1).firstNotNullOfOrNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { instruction.opcode == Opcode.IGET_OBJECT && it.definingClass == toString.definingClass }
        } ?: throw PatchException("Disable ads: no field after \"$VIDEO_PREROLL_LABEL\" in ${toString.label()}")
        if (preroll.type != "Ljava/lang/String;") {
            throw PatchException("Disable ads: the pre-roll field ${preroll.name} is ${preroll.type}, not a String")
        }
        val readers = mutableListOf<Pair<String, Method>>()
        classDefForEach { classDef ->
            if (classDef.type == preroll.definingClass) return@classDefForEach
            classDef.methods.filter { method ->
                method.implementation?.instructions?.any { it.readsField(preroll) } == true
            }.forEach { readers += classDef.type to it }
        }
        if (readers.isEmpty()) throw PatchException("Disable ads: nothing reads the pre-roll field ${preroll.name}")
        readers.forEach { (type, reader) ->
            val method = mutableClassDefBy(type).methods.single { it.sameSignature(reader) }
            method.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
                if (instruction.readsField(preroll)) {
                    val register = (instruction as TwoRegisterInstruction).registerA
                    method.replaceInstruction(index, "const-string v$register, \"\"")
                }
            }
        }

        // 5. Backstop: the player's IMA client-side ads loader provider answers null, so media3
        // plays every item with an ads configuration without ads ("Playing media without ads, as
        // no AdsLoader was provided."). PlayerService.onCreate ignores the result, and every
        // reader of the never-set loader field null-checks it.
        initImaAdsFingerprint.method.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 6. Data level: the server's ad lists for articles, the EPG, listings and soccer results
        // read as a new empty list (not null: the EPG ad extraction loops over its list without a
        // null check), so no ad item or the spacer around it is ever built. The article list also
        // feeds the ad section between article widgets (addAdWidget up to 1.1.15).
        listOf(
            apiArticleDataAdsFingerprint,
            apiEpgDataAdsFingerprint,
            listingDataAdsListFingerprint,
            apiResultsResponseDataAdsFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructionsChecked(
                0,
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                    return-object v0
                """,
            )
        }

        // 7. In-article <ad-api> elements are never treated as ads (adConstraints, inlined into
        // the article body parser since 1.1.16): its hasAttr("data-slot") result reads false, so
        // neither the ad section nor its spacer is added and the parser goes on to its next check.
        val adSlot = articleAdSlotCheckFingerprint
        val moveResult = adSlot.instructionMatches[2].index
        val hasSlot = (adSlot.method.implementation!!.instructions.elementAt(moveResult) as OneRegisterInstruction).registerA
        adSlot.method.addInstructionsChecked(
            moveResult + 1,
            if (hasSlot < 16) "const/4 v$hasSlot, 0x0" else "const/16 v$hasSlot, 0x0",
        )

        // 8. The EPG cache never gets ad rows.
        syncEpgAddBannerFingerprint.method.returnEarly()
    }
}
