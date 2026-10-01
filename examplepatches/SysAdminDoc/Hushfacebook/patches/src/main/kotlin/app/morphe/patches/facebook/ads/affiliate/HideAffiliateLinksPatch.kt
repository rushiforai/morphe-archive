/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/a934b40608e5645cf119dd4101ded7767a9cdc73/patches/src/main/kotlin/app/andrewliang/patches/facebook/hideaffiliatelinks/HideAffiliateLinksPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: each answer goes through a switch instead of
 * being replaced.
 */
package app.morphe.patches.facebook.ads.affiliate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.refresh.enumConstant
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.filterBooleanReturns
import app.morphe.patches.facebook.misc.extension.filterObjectReturns
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.facebook.reels.prompts.findOverlayEnum
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val PATCH = "Hide affiliate product links"

/** The reel overlay enum's constant for the product card. */
internal const val AFFILIATE_EYEBROW = "AFFILIATE_EYEBROW"

/** The comment sheet's floating product card, a plugin that keeps its class name. */
internal const val FLOATING_CARD_PLUGIN = "Lcom/facebook/feedback/comments/plugins/indicatorpill/" +
    "organicaffiliatefloatingcta/OrganicAffiliateFloatingCtaPlugin;"

/** The start of the name the feed video plugin's footer check keeps. */
internal const val FOOTER_HIDDEN = "isFooterHidden\$"

internal const val STRING = "Ljava/lang/String;"

internal const val AFFILIATE_LINKS = "Lapp/morphe/extension/facebook/ads/AffiliateLinks;"
internal const val KEEP_REEL_CARD = "$AFFILIATE_LINKS->keepReelCard(I)Z"
internal const val KEEP_FOOTER = "$AFFILIATE_LINKS->keepFooter($STRING)$STRING"
internal const val KEEP_COMMENT_CARD = "$AFFILIATE_LINKS->keepCommentCard(Ljava/lang/Object;)Ljava/lang/Object;"

/**
 * The product cards of the shop links a creator attaches to a post go, in the three places
 * Facebook shows them, and the "Commission eligible" label stays. Each place asks its own
 * question first.
 *
 * - On a reel, the card is the overlay item AFFILIATE_EYEBROW of the reel overlay enum (580
 *   `LX/7fq;`, 577 `LX/7ZW;`). The overlay adds it to its list only when a static predicate (580
 *   `LX/8O4;->A0C`, 577 `LX/8qp;->A0C`) says yes, and asks the same predicate before building the
 *   card.
 * - Under a feed post, the card is the attachment's server-built (Bloks) footer. One lookup (580
 *   `LX/30r;->A00`, 577 `LX/33g;->A00`) answers its id, or null for an attachment without one. The
 *   footer builder and the video plugin both ask it, and with null the builder makes the plain
 *   footer, which is empty for these posts. Facebook logs every render of the Bloks footer as
 *   affiliate_footer_rendered.
 * - In the comment sheet, the card that floats over the comment box is OrganicAffiliateFloatingCtaPlugin.
 *   Its one static reader of the card model answers null for a post without a card, and the sheet
 *   then leaves the plugin out.
 *
 * Every answer of those three goes through the extension, which turns a yes into a no and an id or
 * a model into null while the switch is on.
 */
@Suppress("unused")
val hideAffiliateLinksPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Hide affiliate product links",
    description = "Removes the product cards of affiliate shop links from reels, feed posts and the " +
        "comment sheet. The \"Commission eligible\" label stays.",
) {
    category("Ads")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val anchors = findAffiliateAnchors()
        mutableClassDefBy(anchors.reelCardCheck.definingClass).findMutableMethodOf(anchors.reelCardCheck)
            .filterBooleanReturns(PATCH, KEEP_REEL_CARD)
        mutableClassDefBy(anchors.footerId.definingClass).findMutableMethodOf(anchors.footerId)
            .filterObjectReturns(PATCH, KEEP_FOOTER)
        mutableClassDefBy(FLOATING_CARD_PLUGIN).findMutableMethodOf(anchors.commentCard)
            .filterObjectReturns(PATCH, KEEP_COMMENT_CARD)
        enableStatus("affiliateLinks")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** The three methods the patch hooks. */
internal class AffiliateAnchors(val reelCardCheck: MethodReference, val footerId: MethodReference, val commentCard: Method)

/**
 * The static Z predicate [method] asks before it adds [eyebrow] to a list, for each place it does:
 * `invoke-static … Z`, `move-result vX`, `if-eqz vX`, `sget-object` of the constant, then a call to
 * `add` with it.
 */
internal fun reelCardChecks(method: Method, eyebrow: String): List<MethodReference> {
    val code = method.implementation?.instructions?.toList() ?: return emptyList()
    return code.indices.mapNotNull { index ->
        if (index < 3 || code[index].opcode != Opcode.SGET_OBJECT) return@mapNotNull null
        if ((code[index] as ReferenceInstruction).reference.toString() != eyebrow) return@mapNotNull null
        val add = (code.getOrNull(index + 1) as? ReferenceInstruction)?.reference as? MethodReference
        if (add?.name != "add") return@mapNotNull null
        val call = code[index - 3]
        val result = code[index - 2]
        val branch = code[index - 1]
        if (call.opcode != Opcode.INVOKE_STATIC && call.opcode != Opcode.INVOKE_STATIC_RANGE) return@mapNotNull null
        if (result.opcode != Opcode.MOVE_RESULT || branch.opcode != Opcode.IF_EQZ) return@mapNotNull null
        if ((result as OneRegisterInstruction).registerA != (branch as OneRegisterInstruction).registerA) return@mapNotNull null
        ((call as ReferenceInstruction).reference as MethodReference).takeIf { it.returnType == "Z" }
    }
}

/** Whether [method] is the feed video plugin's footer check, which keeps its name. */
internal fun isFooterHidden(method: Method): Boolean =
    method.name.startsWith(FOOTER_HIDDEN) && method.returnType == "Z" && method.implementation != null

/** The static calls [method] makes that answer a string: in the footer check, only the footer id lookup. */
internal fun footerIdCalls(method: Method): List<MethodReference> =
    method.implementation!!.instructions.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@mapNotNull null
        ((instruction as ReferenceInstruction).reference as MethodReference).takeIf { it.returnType == STRING }
    }

/** Whether [method] is the floating card plugin's reader of the card model: static, one argument, an object back. */
internal fun isCommentCardReader(method: Method): Boolean =
    AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 1 &&
        method.returnType.startsWith("L") && method.implementation != null

/** Finds all three anchors, each exactly once, in one pass over the app's classes. Changes nothing. */
internal fun BytecodePatchContext.findAffiliateAnchors(): AffiliateAnchors {
    val overlay = findOverlayEnum()
    val eyebrow = enumConstant(overlay, AFFILIATE_EYEBROW) ?: refuse("${overlay.type} stores no $AFFILIATE_EYEBROW constant")

    val reelChecks = mutableMapOf<String, MethodReference>()
    val footerIds = mutableMapOf<String, MethodReference>()
    classDefForEach { classDef: ClassDef ->
        if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
        for (method in classDef.methods) {
            reelCardChecks(method, eyebrow).associateByTo(reelChecks) { it.toString() }
            if (isFooterHidden(method)) footerIdCalls(method).associateByTo(footerIds) { it.toString() }
        }
    }
    val reelCheck = reelChecks.values.singleOrNull() ?: refuse(
        "expected one Z predicate in front of adding $eyebrow, found ${reelChecks.keys.ifEmpty { setOf("none") }}",
    )
    val footerId = footerIds.values.singleOrNull() ?: refuse(
        "expected one string lookup in $FOOTER_HIDDEN…, found ${footerIds.keys.ifEmpty { setOf("none") }}",
    )
    val readers = classDefBy(FLOATING_CARD_PLUGIN).methods.filter(::isCommentCardReader)
    val commentCard = readers.singleOrNull()
        ?: refuse("expected one static card reader on $FLOATING_CARD_PLUGIN, found ${readers.size}")
    return AffiliateAnchors(reelCheck, footerId, commentCard)
}

