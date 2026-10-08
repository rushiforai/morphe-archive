package patches.foodpanda

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * foodpanda (issue #19): the Order-Tracking Page ("OTP") shows (1) DeliveryHero adtech banner ads and
 * (2) a PandaMart "CrossSell" bottom sheet that is force-shown and keeps reappearing after you dismiss it.
 *
 * (1) PandaMart popup — the Compose lambda that renders the CrossSellBottomSheet reads a visibility
 *     State<Boolean>; when true it composes the sheet (and logs "CrossSellBottomSheet: shown with ").
 *     We anchor on that stable log string, then force the visibility boolean to false right before the
 *     gate (`if-eqz`), so the sheet never composes — which also removes the reappear-after-dismiss
 *     behaviour (there is nothing left to re-show). The obfuscated class/field names are never hardcoded.
 *
 * (2) adtech ads — DeliveryHero's own adtech SDK (no AdMob/AppLovin) renders ads from a server
 *     `CreativesResponse`; every placement reads `getCreatives()`. We override that getter to return an
 *     empty list, so no creative is ever rendered (OTP banner and all other adtech slots). Class/method
 *     names are the SDK's own (`com.deliveryhero.adtechsdk.*`), un-obfuscated, so this anchors cleanly.
 */
private const val ADTECH_CREATIVES = "Lcom/deliveryhero/adtechsdk/data/model/CreativesResponse;"

// The Compose lambda `invoke(Object, Object)Object` that renders the CrossSell bottom sheet.
internal val crossSellSheetFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(string("CrossSellBottomSheet: shown with ")),
)

// adtech ad-list getter.
internal val creativesGetterFingerprint = Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { m, c -> c.type == ADTECH_CREATIVES && m.name == "getCreatives" },
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes foodpanda's order-tracking ads (DeliveryHero adtech) and the forced, " +
        "repeatedly-reappearing PandaMart \"CrossSell\" promo popup on the order-tracking screen.",
) {
    compatibleWith(COMPATIBILITY_FOODPANDA)

    execute {
        // (1) Force the CrossSell sheet's visibility boolean false at its render gate.
        val sheet = crossSellSheetFingerprint.method
        val insns = sheet.instructions
        val boolIdx = insns.indexOfFirst {
            val r = (it as? ReferenceInstruction)?.reference as? MethodReference
            r != null && r.definingClass == "Ljava/lang/Boolean;" && r.name == "booleanValue"
        }
        check(boolIdx >= 0) { "foodpanda: CrossSell booleanValue() gate not found" }
        val ifIdx = (boolIdx + 1 until insns.size).first { insns[it].opcode == Opcode.IF_EQZ }
        val reg = (insns[ifIdx] as OneRegisterInstruction).registerA
        sheet.addInstructions(ifIdx, "const/4 v$reg, 0x0")

        // (2) adtech creatives -> empty list (no ad ever renders, OTP banner included).
        creativesGetterFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p0
                return-object p0
            """.trimIndent(),
        )
    }
}
