package patches.weeronline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private fun method(definingClass: String, name: String, returnType: String, parameters: List<String>) =
    Fingerprint(definingClass = definingClass, name = name, returnType = returnType, parameters = parameters)

private fun org.w3c.dom.Document.singleElement(attribute: String, value: String): Element {
    val elements = getElementsByTagName("*")
    val matches = (0 until elements.length).map { elements.item(it) as Element }
        .filter { it.getAttribute(attribute) == value }
    check(matches.size == 1) { "Expected one $attribute=$value, found ${matches.size}" }
    return matches.single()
}

private val hideAdPlaceholders = resourcePatch {
    execute {
        // Audience Network loads its bundled DEX at every launch from this provider;
        // otherwise it is only reached through Google Mobile Ads mediation.
        document("AndroidManifest.xml").use { doc ->
            doc.singleElement("android:name", "com.facebook.ads.AudienceNetworkContentProvider")
                .setAttributeNS(ANDROID, "android:enabled", "false")
        }
        // Detail screens reserve the banner height in this container even for Plus users.
        listOf(
            "fragment_two_days", "fragment_next_hour", "fragment_rain_radar", "fragment_rain_graph_main",
            "fragment_weather_alarm", "fragment_wintersport_webcam", "fragment_sun_graph_24h",
            "fragment_hay_fever", "fragment_migraine", "fragment_rheuma",
        ).forEach { layout ->
            document("res/layout/$layout.xml").use { doc ->
                doc.singleElement("android:id", "@id/ad_placeholder").apply {
                    setAttributeNS(ANDROID, "android:visibility", "gone")
                    setAttributeNS(ANDROID, "android:layout_height", "0dp")
                }
            }
        }
    }
}

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Removes banner, sticky, feed, news, interstitial and sponsored ads and video pre-, mid- and " +
        "post-rolls, and does not start Google Mobile Ads or Audience Network. Plus features stay locked.",
) {
    compatibleWith(weeronline)
    dependsOn(hideAdPlaceholders)
    execute {
        // Plus shares its flag with paid tile customisation, so each ad surface is
        // disabled on its own instead of reporting the user as ad-free.
        for (manager in listOf("GoogleAdViewManager", "OpenWrapAdViewManager", "AdStateImpl")) {
            method("$APP/ui/ads/$manager;", "loadAd", "V", emptyList()).method.addInstructions(0, "return-void")
        }
        // View-based banners: collapse the container instead of loading.
        method("$APP/ads/AdViewContainer;", "loadAd", "V", emptyList()).method.addInstructions(0, """
            const/16 v0, 0x8
            invoke-virtual {p0, v0}, $APP/ads/AdViewContainer;->setVisibility(I)V
            return-void
        """.trimIndent())
        // Compose banners (feed card, two weeks, winter sport, news content) emit nothing.
        Fingerprint(definingClass = "$APP/ui/ads/AdContainerKt;", name = "AdContainer", returnType = "V")
            .matchAll(2..2).forEach { it.method.addInstructions(0, "return-void") }

        // Main feed: no ad cards are inserted between the weather cards.
        Fingerprint(definingClass = "$APP/screen/main/city/CityFragment;", returnType = "Ljava/util/List;",
            filters = listOf(newInstance("$APP/screen/main/city/CardItem\$AdCardItem;"))).method
            .addInstructions(0, """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                return-object v0
            """.trimIndent())
        // News list: the constructor's flag only controls inserting ad items.
        method("$APP/screen/main/news/NewsDataSource;", "<init>", "V", listOf(
            "$APP/data/repository/NewsRepository;", "Z", "$APP/ui/screens/news/NewsTagUiModel;",
        )).method.addInstructions(0, "const/4 p2, 0x1")

        // Blue Billywig player: the SDK's own disabled-ads result, so playback proceeds
        // to the content without a VAST/IMA request (ad scheduling and MSAS controllers).
        val phase = "Lcom/bluebillywig/bbnativeshared/enums/Phase;"
        listOf(
            Fingerprint(returnType = "Z", parameters = listOf(phase),
                strings = listOf("/ad-scheduling/document/vmap/1.0?scheduleCode=")),
            Fingerprint(returnType = "Z", parameters = listOf(phase, "Z")),
        ).forEach { it.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }

        // Interstitials between screens: remote-config and capping gate for both providers.
        method("$APP/mainkmp/ads/interstitial/InterstitialAdVisibility;", "shouldShowAd", "Z", listOf("Z"))
            .method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Google Mobile Ads startup coroutine; setAppMuted there requires initialize, so both are skipped.
        Fingerprint(definingClass = "$APP/App\$initAds\$1;", name = "invokeSuspend", returnType = "Ljava/lang/Object;",
            filters = listOf(methodCall(definingClass = "Lcom/google/android/gms/ads/MobileAds;", name = "initialize")))
            .method.addInstructions(0, "sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;\nreturn-object v0")

        // PubMatic OpenWrap: store/app info set in App.onCreate, and the PPID as external user ID.
        method("Lcom/pubmatic/sdk/common/OpenWrapSDK;", "setApplicationInfo", "V",
            listOf("Lcom/pubmatic/sdk/common/models/POBApplicationInfo;")).method.addInstructions(0, "return-void")
        Fingerprint(definingClass = "$APP/App;", returnType = "V",
            parameters = listOf("$APP/App;", "Linfoplaza/network/consent/ConsentData;"),
            strings = listOf("openwrap consent updated ")).method.addInstructions(0, "return-void")

        // Sponsored tiles and weather advice (Vue cinema campaign).
        Fingerprint(name = "isExpired", returnType = "Z", parameters = emptyList(),
            custom = { _, classDef -> classDef.type.startsWith("$APP/branded/BrandedActivity") })
            .matchAll(2..2).forEach { it.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0") }
    }
}

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(
    name = "Hide Premium banner",
    description = "Hides the Weeronline Plus menu entry, the startup Plus screen, the app-launch promotion paywall, " +
        "the Plus screen opened after declining consent, and the Plus footer in tile settings. Tapping a locked " +
        "feature still explains Plus.",
) {
    compatibleWith(weeronline)
    execute {
        // Startup: full-screen subscription push.
        method("$APP/data/repository/UserRepositoryImpl;", "shouldShowSubscriptionPushScreen", "Z", emptyList())
            .method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // App launch: remote-config promotion offers for the RevenueCat paywall overlay.
        Fingerprint(returnType = "Ljava/util/List;", parameters = emptyList(), strings = listOf("promotions"),
            custom = { _, classDef -> classDef.type.startsWith("Linfoplaza/network/billing/paywall/") }).method
            .addInstructions(0, """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent())

        // Declining consent opens the Plus screen from these screens. Onboarding keeps its own
        // handler, which continues the flow.
        listOf("main/MainFragment", "main/menu/MenuFragment", "details/news/NewsDetailFragment",
            "details/weathertext/WeatherTextFragment").forEach { screen ->
            Fingerprint(definingClass = "$APP/screen/$screen\$observeConsent\$2;", name = "invokeSuspend").method.apply {
                val checks = instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.INSTANCE_OF &&
                        ((instruction as ReferenceInstruction).reference as TypeReference).type ==
                        "Linfoplaza/network/consent/ConsentEvent\$a;"
                }
                check(checks.size == 1) { "Expected one consent-declined check in $screen" }
                val register = getInstruction<TwoRegisterInstruction>(checks.single().index).registerA
                replaceInstruction(checks.single().index, "const/4 v$register, 0x0")
            }
        }

        // Menu: the Plus row and its "active" label are shown in both subscription states.
        Fingerprint(definingClass = "$APP/screen/main/menu/MenuFragment;", name = "access\$renderMenuState",
            returnType = "V").method.apply {
            val hidden = setOf("menuItemSubscription", "menuItemAdsActive")
            fun Instruction.methodName() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.name
            val calls = instructions.withIndex().filter { (index, instruction) ->
                instruction.methodName() == "setVisible" &&
                    instructions.subList(maxOf(0, index - 4), index).any {
                        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name in hidden
                    }
            }.map { it.index }
            check(calls.size == 4) { "Expected four Plus menu visibility calls, found ${calls.size}" }
            calls.sortedDescending().forEach { index ->
                // The view-name string register of the preceding null check is dead afterwards.
                val nullCheck = (index - 1 downTo 0).first { instructions[it].methodName() == "e" }
                val spare = getInstruction<FiveRegisterInstruction>(nullCheck).registerD
                check(spare < 16) { "Unexpected register v$spare" }
                val call = getInstruction<FiveRegisterInstruction>(index)
                replaceInstruction(index, "invoke-static {v${call.registerC}, v$spare}, " +
                    (call as ReferenceInstruction).reference)
                addInstruction(index, "const/4 v$spare, 0x0")
            }
        }

        // Tile settings footer: "not ad-free" adds one Plus row to the count and view types.
        val tiles = "$APP/screen/main/menu/tile/TileSettingsAdapter;"
        listOf(method(tiles, "getItemCount", "I", emptyList()), method(tiles, "getItemViewType", "I", listOf("I")))
            .forEach { fingerprint ->
                fingerprint.method.apply {
                    val flips = instructions.withIndex().filter { it.value.opcode == Opcode.XOR_INT_LIT8 }
                    check(flips.size == 1) { "Expected one footer flag in ${fingerprint.method.name}" }
                    val register = getInstruction<TwoRegisterInstruction>(flips.single().index).registerA
                    replaceInstruction(flips.single().index, "const/4 v$register, 0x0")
                }
            }
    }
}
