package patches.bol.promotions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.bol.shared.Constants.COMPATIBILITY_BOL
import patches.bol.shared.ModelValue
import patches.bol.shared.clearModelFields
import patches.bol.shared.restrictAirshipFeatures
import patches.bol.shared.modelFingerprint

@Suppress("unused")
val hidePromotionalContentPatch = bytecodePatch(
    name = "Hide promotional content",
    description = "Removes marketing banners, brand campaigns, Home merchandising, seasonal backgrounds and the offers footer, game promotions and promotional feeds. Search, product prices and checkout discounts remain available.",
) {
    compatibleWith(COMPATIBILITY_BOL)
    execute {
        // Airship feature bit 1 is in-app automation, a separate source of promotional overlays.
        restrictAirshipFeatures(1)
        // Shared fragments cover independent queries, deferred HomePage responses and cached responses.
        clearModelFields("TopBannersFragment(topBanners=", mapOf(
            "a" to ModelValue.EmptyList,
        ))
        clearModelFields("FlexBannersFragment(flexBanners=", mapOf(
            "a" to ModelValue.EmptyList,
        ))
        clearModelFields("Data(flexBanners=", mapOf("a" to ModelValue.EmptyList))
        clearModelFields("All_brand_campaign_page(items=", mapOf(
            "a" to ModelValue.EmptyList,
        ), expected = 2..2)
        clearModelFields("HomeContent(topBanners=", mapOf(
            "a" to ModelValue.EmptyList,
            "b" to ModelValue.Null,
            "d" to ModelValue.EmptyList,
            "e" to ModelValue.EmptyList,
            "f" to ModelValue.EmptyList,
            "g" to ModelValue.Null,
            "h" to ModelValue.Null,
            "i" to ModelValue.Null,
            "o" to ModelValue.EmptyList,
            "p" to ModelValue.Null, // day-deal promotion carousel
            "k" to ModelValue.Null, // server-named merchandising slot, including Trending Deals
            "m" to ModelValue.Null,
            "n" to ModelValue.Null,
        ))
        // Seasonal Home presentation is computed after HomeContent, independently of all banner data.
        val homeState = modelFingerprint("Content(backgroundColors=").matchSingle().classDef
        val seasonalType = homeState.fields.single { it.name == "g" }.type
        val variants = Fingerprint(definingClass = seasonalType, name = "<clinit>",
            strings = listOf("Control", "Animated", "Static")).matchSingle().method.instructions.toList()
        val controlIndex = variants.indexOfFirst { it.getReference<StringReference>()?.string == "Control" }
        val control = variants.drop(controlIndex).first { it.opcode == Opcode.SPUT_OBJECT }.getReference<FieldReference>()!!
        clearModelFields("Content(backgroundColors=", mapOf(
            "g" to ModelValue.StaticField(control),
            "h" to ModelValue.False,
        ))
        // This fixed marketing panel is rendered even when every Home content slot is empty.
        // Keep the non-null footer model contract; suppress only its composable before it opens a group.
        val footerType = modelFingerprint("HomeFooterState(viewMeasurements=").matchSingle().classDef.type
        Fingerprint(returnType = "V", custom = { method, _ ->
            method.parameterTypes.size == 5 && method.parameterTypes[0] == footerType &&
                method.parameterTypes[1] == "Lkotlin/jvm/functions/Function1;" && method.parameterTypes[4] == "I"
        }).matchSingle().method.addInstruction(0, "return-void")
        // Both older/newer promotional-feed response shapes are included. Leave ordinary product feeds intact.
        clearModelFields("Me(promotionalFeedV2=", mapOf(
            "a" to ModelValue.Null,
        ), expected = 2..2)
        clearModelFields("WelcomeState(userName=", mapOf(
            "c" to ModelValue.EmptyList,
        ))
    }
}
