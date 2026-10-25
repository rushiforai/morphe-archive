package app.template.patches.moneycontrol.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MONEYCONTROL
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.failFlutterGmaPluginLoads
import app.template.patches.shared.misc.ads.neuterAdHooks
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Moneycontrol has no local "ad-free" switch that every placement reads. The entitlements
// ("ad_free" expiry) only set an AppData flag that hides the app wall and a few Pro news rows;
// the interstitial and most placements check the Pro flag instead, and forcing either flag would
// also flip Pro content, the launcher icon and analytics user type. Ad-free is really decided by
// the server: after a purchase the app re-fetches config and menu, and the menu's ad config
// (every slot: native, DFP, HTML, splash, sticky, Flutter screens) arrives without ads.
// So the patch empties that ad config on the device, the same "no slot configured" path the app
// already takes, and backstops the SDKs that could still be reached.
//
// MobileAds.initialize is left alone on purpose: the bundled google_mobile_ads Flutter plugin
// and the JJT ad SDK wait on its completion listener, so no-op'ing it could stall them. With
// every load below neutered the SDK initializes but never requests an ad.
//
// Load callbacks (checked on 14.6.2): the Java-side GMA loads (step 4) return without calling
// back, on purpose. No Java caller waits on the result, and a failure would do harm:
// - Utility's interstitial (AdManagerInterstitialAd.load) is fire-and-forget: it shows the ad
//   from onAdLoaded; onAdFailedToLoad only clears the page's "already shown" mark (so the next
//   page view would try again) and sends a CleverTap "Failed" event.
// - The JJT SDK walks a waterfall: a GAM failure moves on to its next ad unit, which can be a
//   Yandex banner or interstitial. JJT's interstitial handler is never created by the app; its
//   banners (AndBeyondHelper) only reset an "in progress" flag on failure.
// The Flutter screens' ads are Dart code that cannot be checked, so step 6 reports their loads
// to Dart as failed instead (the plugin then never reaches the Java loads).
private const val GMA = "Lcom/google/android/gms/ads/"
private const val TABOOLA_UNIT = "Lcom/taboola/android/TBLClassicUnit;"
private const val HASH_MAP = "Ljava/util/HashMap;"
private const val ACTIVITY = "Landroidx/fragment/app/FragmentActivity;"

// The preroll ad-tag URLs on the menu's BannerAd model, by their JSON keys. Every video screen
// (news video, article, video on demand, live TV and TV shows) skips the IMA preroll when the
// URL is null, "" or "null".
private val PREROLL_URL_FIELDS = setOf("video_preroll_url", "tv_preroll_url")

// Banner views: an AdView that never loads still measures to its AdSize (BaseAdView.onMeasure
// falls back to it with no child), so loadAd hides the view instead of leaving a blank slot.
// AdManagerAdView.loadAd(AdManagerAdRequest) does not call super.
private val GMA_BANNERS = listOf(GMA + "BaseAdView;", GMA + "admanager/AdManagerAdView;")

// GMA loads with nothing to show: return at once. The app (CommonAdLoader, AndBeyondHelper,
// Utility's interstitial, the JJT SDK) only ever reaches these and the banners above.
private val GMA_LOADS = GMA_LOAD_HOOKS - GMA_BANNERS.toSet()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_MONEYCONTROL)

    execute {
        // 1. Every lookup on the ad repository answers null ("no ad configured for this slot"),
        // which covers both the fresh menu config and the copy persisted in its DataStore. The
        // repository is the class the ad-config parser hands its HashMap to; its lookups unwrap
        // one AdsTypeModel (instance-of) out of the slot map (Map.get) and return a Map, List or
        // AdEntity. AppData's wrappers already return null before the repository exists, so every
        // caller handles it.
        val parser = AdConfigParserFingerprint.method
        val repositoryType = parser.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(HASH_MAP) }
            .map { it.definingClass }
            .distinct()
            .singleOrNull()
            ?: throw PatchException("Disable ads: the ad-config parser has no single (HashMap)V repository call")

        val lookups = mutableClassDefBy(repositoryType).methods.filter { it.isAdLookup() }
        val returnTypes = lookups.map { it.returnType }.toSet()
        if ("Ljava/util/Map;" !in returnTypes || "Ljava/util/List;" !in returnTypes ||
            returnTypes.none { it != "Ljava/util/Map;" && it != "Ljava/util/List;" }
        ) {
            throw PatchException("Disable ads: $repositoryType lookups not found (return types $returnTypes)")
        }
        // Every lookup takes the slot key, so p1 is free to hold the null.
        lookups.forEach { it.addInstructionsChecked(0, "const/4 p1, 0x0\nreturn-object p1") }

        // 2. The sticky bottom-ad container is never shown: "show" hides it instead.
        val show = ShowStickyAdFingerprint.method
        val hide = HideStickyAdFingerprint.method
        if (show.definingClass != hide.definingClass || AccessFlags.STATIC.isSet(hide.accessFlags) ||
            AccessFlags.STATIC.isSet(show.accessFlags)
        ) {
            throw PatchException("Disable ads: sticky ad show/hide are not instance methods of one class")
        }
        val invoke = if (AccessFlags.PRIVATE.isSet(hide.accessFlags)) "invoke-direct" else "invoke-virtual"
        show.addInstructionsChecked(
            0,
            """
                $invoke {p0, p1}, ${hide.definingClass}->${hide.name}($ACTIVITY)V
                return-void
            """,
        )

        // 3. No IMA video preroll: the BannerAd preroll URL getters answer null.
        val prerollModels = mutableListOf<String>()
        classDefForEach { classDef ->
            val names = classDef.fields.filter { it.type == "Ljava/lang/String;" }.map { it.name }.toSet()
            if (names.containsAll(PREROLL_URL_FIELDS)) prerollModels += classDef.type
        }
        val prerollModel = prerollModels.singleOrNull()
            ?: throw PatchException("Disable ads: expected one class with $PREROLL_URL_FIELDS, found $prerollModels")
        val modelMethods = mutableClassDefBy(prerollModel).methods
        for (field in PREROLL_URL_FIELDS) {
            val getters = modelMethods.filter { it.isGetterOf(prerollModel, field) }
            if (getters.isEmpty()) throw PatchException("Disable ads: no getter for $prerollModel->$field")
            getters.forEach { it.addInstructionsChecked(0, "const/4 v0, 0x0\nreturn-object v0") }
        }

        // 4. GMA backstops for any slot that does not come from the repository. They return
        // without calling back on purpose (see the load-callback notes at the top).
        neuterAdHooks(GMA_LOADS)
        for (owner in GMA_BANNERS) {
            val targets = (mutableClassDefByOrNull(owner) ?: throw PatchException("Disable ads: $owner not found"))
                .methods.filter {
                    it.name == "loadAd" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
                }
            if (targets.isEmpty()) throw PatchException("Disable ads: no concrete $owner->loadAd")
            // The request parameter is dead once we return, so p1 carries View.GONE.
            targets.forEach {
                it.addInstructionsChecked(
                    0,
                    """
                        const/16 p1, 0x8
                        invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V
                        return-void
                    """,
                )
            }
        }

        // 5. Taboola's "Below Article Thumbnails" sponsored links (news and article detail):
        // fetchContent hides the unit (and the progress bar the app showed first) and fetches
        // nothing. It returns the unit itself for chaining.
        val fetchContent = (mutableClassDefByOrNull(TABOOLA_UNIT) ?: throw PatchException("Disable ads: $TABOOLA_UNIT not found"))
            .methods.singleOrNull {
                it.name == "fetchContent" && it.parameterTypes.isEmpty() && it.returnType == TABOOLA_UNIT &&
                    it.implementation != null
            } ?: throw PatchException("Disable ads: no concrete $TABOOLA_UNIT->fetchContent()")
        if (fetchContent.implementation!!.registerCount < 2) {
            throw PatchException("Disable ads: $TABOOLA_UNIT->fetchContent() has no free register")
        }
        fetchContent.addInstructionsChecked(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                return-object p0
            """,
        )

        // 6. The Flutter screens (home, watchlist, technical hub, business house) show banner and
        // native ads through the google_mobile_ads plugin. Each plugin load reports NO_FILL to
        // Dart, so their Dart listeners get a load result instead of waiting for good.
        failFlutterGmaPluginLoads()
    }
}

// An instance lookup that unwraps a typed entry (instance-of) from the repository's slot map.
private fun Method.isAdLookup(): Boolean {
    val instructions = implementation?.instructions ?: return false
    return !AccessFlags.STATIC.isSet(accessFlags) && returnType.startsWith("L") && parameterTypes.isNotEmpty() &&
        parameterTypes.all { it.toString() == "Ljava/lang/String;" } &&
        instructions.any { it.opcode == Opcode.INSTANCE_OF } &&
        instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/util/Map;" && ref.name == "get"
        }
}

// A no-argument String getter that reads [field] of [owner] and has a spare register for the null.
private fun Method.isGetterOf(owner: String, field: String): Boolean {
    val implementation = implementation ?: return false
    return returnType == "Ljava/lang/String;" && parameterTypes.isEmpty() &&
        !AccessFlags.STATIC.isSet(accessFlags) && implementation.registerCount >= 2 &&
        implementation.instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
            it.opcode == Opcode.IGET_OBJECT && ref?.definingClass == owner && ref.name == field
        }
}
