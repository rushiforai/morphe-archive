package de.mobile.morphe.declutter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import de.mobile.morphe.shared.Constants.COMPATIBILITY_MOBILE_DE

private const val A = "Lde/mobile/android/"

private class Fp(
    cls: String,
    name: String,
    ret: String,
    params: List<String>? = null,
) : Fingerprint(
    definingClass = cls,
    name = name,
    returnType = ret,
    parameters = params,
)

private const val RETURN_VOID = "return-void"
private const val RETURN_FALSE = "const/4 v0, 0x0\nreturn v0"
private const val RETURN_NULL = "const/4 v0, 0x0\nreturn-object v0"

@Suppress("unused")
val removeAdsPatch = patch(
    name = "Werbung entfernen",
    description = "Entfernt Werbebanner in Suchliste, Inseratdetails, Startseite und Filterseite.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOBILE_DE)
    execute {
        var applied = 0
        fun stub(cls: String, name: String, ret: String, params: List<String>?, code: String) {
            val m = Fp(cls, name, ret, params).methodOrNull ?: return
            m.addInstructions(0, code)
            applied++
        }

        val ctl = "${A}advertisement/DefaultAdvertisementController;"
        stub(ctl, "isAdvertisementEnabled", "Z", emptyList(), RETURN_FALSE)
        stub(ctl, "initConfig", "V", listOf("Z"), RETURN_VOID)
        stub("${A}srp/ui/model/SrpInlineAdRuleForNewTopInCategory;", "advertisementNeeded", "Z", listOf("I"), RETURN_FALSE)

        val vipAd = "${A}vip/details/advertisement/"
        stub(
            "${vipAd}DefaultVipInlineAdvertisementMapper;", "mapTextLink",
            "${A}vip/model/VipCardData\$TextLinkAdvertisementCard;",
            listOf("${A}vip/VIPListing;", "Z"), RETURN_NULL,
        )
        stub(
            "${vipAd}DefaultVipInlineAdvertisementController;", "connectAdvertisement", "V",
            listOf("${A}advertisement/data/AdvertisementConfiguration;", "[${A}advertisement/data/AdvertisementConfiguration;"),
            """
                iget-object v0, p0, ${vipAd}DefaultVipInlineAdvertisementController;->adViewContainer:${vipAd}VipInlineAdvertisementViewContainer;
                invoke-interface {v0}, ${vipAd}VipInlineAdvertisementViewContainer;->hideAdView()V
                return-void
            """.trimIndent(),
        )

        val hf = "${A}homefeed/"
        val hfRet = "${hf}data/HomeFeedAdMapper\$MappedAdData;"
        stub("${hf}data/DefaultHomeFeedAdMapper;", "map", hfRet,
            listOf("${hf}ui/HomeFeedUiItem\$Advertisement;", "Landroid/content/Context;"), RETURN_NULL)
        stub("${hf}data/DefaultHomeFeedAdMapper;", "mapSponsoredListing", hfRet,
            listOf("${hf}ui/HomeFeedUiItem\$SponsoredListing;", "Landroid/content/Context;"), RETURN_NULL)

        val dsp = "${A}dsp/ui/searchfilters/"
        stub("${dsp}advertisement/DefaultDspAdvertisementMapper;", "map",
            "${dsp}advertisement/DspAdvertisementMapper\$MappedAdData;",
            listOf("${dsp}DSPUiItem\$Advertisement;", "Landroid/content/Context;"), RETURN_NULL)

        if (applied == 0) {
            throw PatchException("Werbung entfernen: keine passenden Zielmethoden gefunden.")
        }
    }
}

@Suppress("unused")
val hideFinancingWidgetsPatch = patch(
    name = "Finanzierungswidgets ausblenden",
    description = "Blendet Finanzierungs-Monatsraten, Finanzierungsrechner und das Finanzierungs-Popup nach Kontaktaufnahme aus.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOBILE_DE)
    execute {
        var applied = 0
        fun stub(cls: String, name: String, ret: String, params: List<String>?, code: String) {
            val m = Fp(cls, name, ret, params).methodOrNull ?: return
            m.addInstructions(0, code)
            applied++
        }

        val vipExt = "${A}vip/extensions/VIPListingExtensionKt;"
        stub(vipExt, "hasFinancePlan", "Z", listOf("${A}vip/VIPListing;"), RETURN_FALSE)
        stub(
            vipExt, "getFinancingMonthlyRate", "Ljava/lang/String;",
            listOf("${A}vip/VIPListing;"), "const-string v0, \"\"\nreturn-object v0",
        )
        stub("${A}srp/extensions/SearchResultModelExtensionsKt;", "hasFinancePlan", "Z",
            listOf("${A}srp/SRPListing;"), RETURN_FALSE)
        stub("${A}srp/ui/adapter/AdViewHolder;", "showPurchaseMonthlyRates", "V",
            listOf("${A}srp/SRPListing;"), RETURN_VOID)
        stub("${A}app/screens/vip/ui/DefaultVipNavigator;", "openFinancingAfterContactDialog", "V",
            null, RETURN_VOID)

        if (applied == 0) {
            throw PatchException("Finanzierungswidgets ausblenden: keine passenden Zielmethoden gefunden.")
        }
    }
}

@Suppress("unused")
val hideInsuranceAndPartnerWidgetsPatch = patch(
    name = "Versicherungs-, Carfax- & Partner-Widgets ausblenden",
    description = "Entfernt Versicherungs-/Check24-, Carfax-, Leasing-Partner-, IONITY- und E-Auto-Förderungs-Karten aus den Inseratdetails.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOBILE_DE)
    execute {
        var applied = 0
        fun stub(cls: String, name: String, ret: String, params: List<String>?, code: String) {
            val m = Fp(cls, name, ret, params).methodOrNull ?: return
            m.addInstructions(0, code)
            applied++
        }

        stub("${A}vip/details/partnership/DefaultPartnershipMapper;", "map",
            "${A}vip/model/VipCardData\$PartnershipCard;",
            listOf("${A}vip/VIPListing;", "${A}vip/details/partnership/InsuranceOfferUIModel;"), RETURN_NULL)
        stub("${A}vip/mapper/IonityCardMapper;", "map", "${A}vip/model/VipCardData\$IonityCard;",
            listOf("${A}vip/VIPListing;"), RETURN_NULL)
        stub("${A}vip/mapper/EvBonusInfoCardMapper;", "map", "${A}vip/model/VipCardData\$EvBonusInfoCard;",
            listOf("${A}vip/VIPListing;"), RETURN_NULL)

        if (applied == 0) {
            throw PatchException("Partner-Widgets ausblenden: keine passenden Zielmethoden gefunden.")
        }
    }
}

@Suppress("unused")
val hideExpressSellPatch = patch(
    name = "Express-Verkauf / Ankauf-Banner ausblenden",
    description = "Entfernt die \"Auto verkaufen\"-/Express-Verkauf-Teaser aus dem Parkplatz (standalone, ohne Archiv-Erweiterung).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOBILE_DE)
    execute {
        val method = Fp(
            "${A}parkedlistings/park/mapper/ParkedListingEntityToUiMapper;",
            "map",
            "Ljava/util/List;",
            listOf("${A}vehiclepark/ParkedListingResult;"),
        ).method

        // Pure bytecode patch: find every `new-instance ...VehicleParkExpressSell*`
        // and NOP out the immediately following `List.add(...)` call.
        val insns = method.instructions.toList()
        val addIndicesToNop = mutableListOf<Int>()
        for (i in insns.indices) {
            val insn = insns[i]
            if (insn.opcode == Opcode.NEW_INSTANCE && insn is ReferenceInstruction) {
                val type = (insn.reference as? TypeReference)?.type ?: continue
                if (type.contains("VehicleParkExpressSell")) {
                    for (j in (i + 1) until minOf(i + 6, insns.size)) {
                        val candidate = insns[j]
                        if (candidate.opcode == Opcode.INVOKE_INTERFACE && candidate is ReferenceInstruction) {
                            val ref = candidate.reference as? MethodReference
                            if (ref?.definingClass == "Ljava/util/List;" && ref.name == "add") {
                                addIndicesToNop.add(j)
                                break
                            }
                        }
                    }
                }
            }
        }
        if (addIndicesToNop.isEmpty()) {
            throw PatchException("Express-Verkauf ausblenden: keine ExpressSell-Einfügestellen in ParkedListingEntityToUiMapper.map gefunden.")
        }
        addIndicesToNop.sortedDescending().forEach { idx ->
            method.replaceInstruction(idx, "nop")
        }
    }
}

@Suppress("unused")
val disableSurveysAndRatingsPatch = patch(
    name = "Umfragen & Bewertungs-Popups deaktivieren",
    description = "Unterdrückt App-Bewertungsdialoge, Survicate-Umfragen und CSAT/NPS-Abfragen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOBILE_DE)
    execute {
        var applied = 0
        fun stub(cls: String, name: String, ret: String, params: List<String>?, code: String) {
            val m = Fp(cls, name, ret, params).methodOrNull ?: return
            m.addInstructions(0, code)
            applied++
        }

        // Omit R8-obfuscated parameter types (FragmentActivity / Continuation) so the patch survives app updates.
        val rm = "Lde/mobile/customersupport/DefaultRatingManager;"
        stub(rm, "ruleTriggered", "V", null, RETURN_VOID)
        stub(rm, "showRatingDialog", "V", null, RETURN_VOID)
        stub("${A}survey/DefaultShouldShowSurveyUseCase;", "invoke", "Ljava/lang/Object;", null, RETURN_NULL)
        stub("${A}survey/DefaultShouldShowVipMobeeCsatUseCase;", "invoke", "Z", emptyList(), RETURN_FALSE)
        stub("${A}survey/DefaultShouldShowCsatUseCase;", "invoke", "Z", listOf("Ljava/lang/String;"), RETURN_FALSE)
        stub("${A}surveys/survicate/DefaultSurveyManager;", "initialize", "V",
            listOf("Landroid/content/Context;"), RETURN_VOID)
        stub("${A}vip/details/VipFragment;", "showMobeeCsatBottomSheet", "V", emptyList(), RETURN_VOID)
        stub("${A}app/screens/vip/ui/DefaultVipNavigator;", "showSurveyDialog", "V", null, RETURN_VOID)

        if (applied == 0) {
            throw PatchException("Umfragen & Bewertungs-Popups deaktivieren: keine passenden Zielmethoden gefunden.")
        }
    }
}

@Suppress("unused")
val hideSponsoredListingsPatch = patch(
    name = "Gesponserte & Top-Inserate ausblenden",
    description = "Entfernt bezahlte Top-of-Page- und Top-in-Kategorie-Inserate aus der Suchergebnisliste.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOBILE_DE)
    execute {
        var applied = 0
        fun stub(cls: String, name: String, ret: String, params: List<String>?, code: String) {
            val m = Fp(cls, name, ret, params).methodOrNull ?: return
            m.addInstructions(0, code)
            applied++
        }

        val ext = "${A}srp/extensions/SearchResultModelExtensionsKt;"
        val lsr = listOf("${A}listing/ListingSearchResult;")
        stub(ext, "topOfPageLeaderIsNeeded", "Z", lsr, RETURN_FALSE)
        stub(ext, "topInCategoryItemIsNeeded", "Z", lsr, RETURN_FALSE)

        if (applied == 0) {
            throw PatchException("Gesponserte & Top-Inserate ausblenden: keine passenden Zielmethoden gefunden.")
        }
    }
}
