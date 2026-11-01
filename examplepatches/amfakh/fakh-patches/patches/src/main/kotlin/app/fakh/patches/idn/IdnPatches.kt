package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_SETTINGS = "Lapp/fakh/extension/idn/IdnSettings;"

/** Makes IdnSettings.<method>() return true, marking a feature as patched in so its switch shows on the settings page. */
private fun BytecodePatchContext.markIncluded(method: String) {
    Fingerprint(
        definingClass = EXTENSION_SETTINGS,
        name = method,
        returnType = "Z",
        parameters = emptyList(),
    ).method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """,
    )
}

/** Declares the settings activity of the extension. */
private val settingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", "app.fakh.extension.idn.IdnSettingsActivity")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Fakh Patches")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            document.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }
}

/** SettingsFragment.onViewCreated: the app's Settings screen, where the "Fakh Patches" row goes. */
private object SettingsScreenFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/profile/presentation/setting/SettingsFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/** The "Fakh Patches" row on the app's Settings screen, and the page it opens. Every feature below depends on it. */
private val settingsPatch = bytecodePatch(description = "Adds a Fakh Patches page to the app's Settings screen.") {
    compatibleWith(COMPATIBILITY_IDN)
    dependsOn(settingsManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // p1 is the root view; the extension posts its work, so it runs after the app set its own listeners.
        SettingsScreenFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_SETTINGS->installEntry(Landroid/view/View;)V",
        )
    }
}

/** AdManagerAdView's loadAd(AdManagerAdRequest): every banner in the app is loaded through it. R8 renames the method. */
private object AdManagerLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;"),
)

/** CleverTap's InAppController.showInApp: shows a campaign popup, such as the full-screen promo at launch. */
private object ShowInAppFingerprint : Fingerprint(
    definingClass = "Lcom/clevertap/android/sdk/inapp/InAppController;",
    name = "showInApp",
    returnType = "V",
    parameters = listOf("Lcom/clevertap/android/sdk/inapp/CTInAppNotification;"),
)

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes the Google ad banners from the home, article, quiz, event and live screens, and the promo popups.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Ads")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isHideAdsIncluded")
        // Skip the ad request and collapse the frame that would hold the banner, unless the user turned ads back on.
        AdManagerLoadAdFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->hideAds()Z
                    move-result v0
                    if-eqz v0, :load
                    invoke-static { p0 }, Lapp/fakh/extension/idn/HideAds;->hide(Landroid/view/View;)V
                    return-void
                """,
                ExternalLabel("load", getInstruction(0)),
            )
        }
        // Drop every CleverTap campaign popup before it is shown; push notifications do not pass through here.
        ShowInAppFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->hideAds()Z
                    move-result v0
                    if-eqz v0, :show
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }
    }
}

/** MainInitRunner's first-run step: shows the tour that points at the Create button, then runs the start-up checks. */
private object CreateButtonTourFingerprint : Fingerprint(
    definingClass = "Lcom/idntimes/idntimes/presentation/main/MainInitRunner;",
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference?.toString() == "Lmedia/idn/onboarding/OnboardingScenario\$Builder;-><init>()V"
        } == true
    },
)

/** The constructor of the delegate that runs the "+" button; its second parameter is the main screen's view binding. */
private object CreateMenuDelegateFingerprint : Fingerprint(
    definingClass = "Lcom/idntimes/idntimes/presentation/main/MainCreateMenuDelegate;",
    name = "<init>",
)

@Suppress("unused")
val hideCreateButtonPatch = bytecodePatch(
    name = "Hide Create button",
    description = "Removes the \"+\" button (write news, start a live stream) from the middle of the bottom navigation. The switch for it is on the Fakh Patches page.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isHideCreateButtonIncluded")
        // p2 is the binding. The button and the bottom bar's empty "create" item are hidden at runtime, so the
        // switch can bring them back. The item stays in the menu, because the app disables it and selects the
        // tabs by index.
        CreateMenuDelegateFingerprint.method.addInstruction(
            0,
            "invoke-static { p2 }, $EXTENSION_SETTINGS->applyCreateButton(Ljava/lang/Object;)V",
        )
        // The tour snapshots the Create button and crashes on a fresh install once the button is gone. While it is
        // hidden, skip the tour and run the start-up checks (force logout, app update) it runs when already seen.
        CreateButtonTourFingerprint.method.apply {
            val startupChecks = instructions.firstNotNullOfOrNull {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { reference ->
                    reference.definingClass == definingClass && reference.parameterTypes.isEmpty() && reference.returnType == "V"
                }
            } ?: throw PatchException("IDN: the start-up checks call was not found in the Create button tour.")
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->hideCreateButton()Z
                    move-result v0
                    if-eqz v0, :tour
                    invoke-virtual { p0 }, $startupChecks
                    return-void
                """,
                ExternalLabel("tour", getInstruction(0)),
            )
        }
    }
}

/** DeviceSecurityChecker.a(Z): reports root and Developer options; the short movie player blocks playback on either. */
private object DeviceSecurityCheckFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/core/util/DeviceSecurityChecker;",
    returnType = "Lmedia/idn/core/util/DeviceSecurityStatus;",
    parameters = listOf("Z"),
    strings = listOf("development_settings_enabled"),
)

@Suppress("unused")
val allowDeveloperOptionsPatch = bytecodePatch(
    name = "Allow Developer options",
    description = "Lets short movies play while Developer options are turned on, instead of asking to turn them off.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Feature")

    execute {
        DeviceSecurityCheckFingerprint.method.apply {
            val getInt = instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroid/provider/Settings\$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I"
            }
            if (getInt < 0) throw PatchException("IDN: the Developer options read was not found.")
            val register = (instructions[getInt + 1] as OneRegisterInstruction).registerA
            // Read the setting as off; the root check next to it is left as is.
            addInstruction(getInt + 2, "const v$register, 0x0")
        }
    }
}

/** The constructor of the home tab adapter: it turns each tab of the remote config into a HomeMenu. */
private object HomeTabsFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/home/presentation/container/HomeContainerPagerAdapter;",
    name = "<init>",
)

@Suppress("unused")
val hideHomeTabsPatch = bytecodePatch(
    name = "Hide home tabs",
    description = "Adds switches to hide the Nonton, IDN Live, Berita and Quiz tabs, on a Fakh Patches page in the app's Settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isHideTabsIncluded")
        HomeTabsFingerprint.method.apply {
            val valueOf = instructions.indexOfFirst {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                reference?.name == "valueOf" && reference.definingClass.endsWith("/HomeMenu;")
            }
            if (valueOf < 0) throw PatchException("IDN: HomeMenu.valueOf was not found in the home tab adapter.")
            val name = (instructions[valueOf] as FiveRegisterInstruction).registerC
            // A hidden tab is renamed UNKNOWN, which the adapter already skips.
            addInstructions(
                valueOf,
                """
                    invoke-static { v$name }, $EXTENSION_SETTINGS->tab(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$name
                """,
            )
        }
    }
}

private const val CAROUSEL_PACKAGE = "Lmedia/idn/core/presentation/widget/imageslider"

/** The private autoPlay setter of the banner carousels; a carousel slides on its own while it is true. */
private fun autoPlaySetter(type: String) = Fingerprint(
    definingClass = "$CAROUSEL_PACKAGE/$type;",
    name = "setAutoPlay",
    returnType = "V",
    parameters = listOf("Z"),
)

/** The method of a Nonton home carousel card that starts its muted preview video: d(CarouselItem, ViewBinding). */
private fun previewVideo(listener: String) = Fingerprint(
    definingClass = "Lmedia/idn/shortmovie/presentation/home/view/$listener;",
    name = "d",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.size == 2 },
)

@Suppress("unused")
val stopAutoplayPatch = bytecodePatch(
    name = "Stop autoplay",
    description = "Adds a switch to stop the video previews and the automatic sliding of the home banners, on a Fakh Patches page in the app's Settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Feature")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isStopAutoplayIncluded")
        listOf(autoPlaySetter("carousel/Carousel"), autoPlaySetter("viewpager/CarouselViewPager")).forEach {
            it.method.addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_SETTINGS->autoPlay(Z)Z
                    move-result p1
                """,
            )
        }
        listOf(previewVideo("ShortMovieHomeCarouselVideoBigListener"), previewVideo("ShortMovieHomeCarouselVideoSmallListener")).forEach {
            it.method.apply {
                // The card shows its cover and plays nothing when the preview url is null.
                val url = instructions.indexOfFirst { instruction ->
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                        "Lmedia/idn/shortmovie/presentation/home/view/ShortMovieHomeDataView;->m:Ljava/lang/String;"
                }
                if (url < 0) throw PatchException("IDN: the preview url of a home carousel card was not found.")
                val register = (instructions[url] as TwoRegisterInstruction).registerA
                addInstructions(
                    url + 1,
                    """
                        invoke-static { v$register }, $EXTENSION_SETTINGS->previewUrl(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """,
                )
            }
        }
    }
}

/** TopUpGoldBottomSheet.f0: shows the Gold packages sheet; the live rooms, the short movie player and the QR scanner call it. */
private object GoldSheetFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/core/presentation/widget/bottomsheet/topup/TopUpGoldBottomSheet;",
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/FragmentManager;", "Ljava/lang/String;"),
)

/** ProfileActivity.t: opens the screen the activity was started for, such as Settings or Top up Gold. */
private object ProfileScreenFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/profile/presentation/ProfileActivity;",
    returnType = "V",
    parameters = listOf("Lmedia/idn/profile/navigation/ProfileScreen;"),
)

@Suppress("unused")
val redirectGoldPurchasePatch = bytecodePatch(
    name = "Redirect Gold purchase",
    description = "Opens connect.idn.media/my-account/gold in the browser instead of the in-app Gold top up.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        // The packages sheet never shows.
        GoldSheetFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, $EXTENSION_SETTINGS->openGoldTopUp()V
                return-void
            """,
        )
        // The full-screen Top up Gold page, reached from the Gold card on the profile, opens the browser and closes.
        ProfileScreenFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_SETTINGS->redirectGold(Landroid/app/Activity;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :show
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }
    }
}

private const val SUBSCRIPTION_STATUS = "Lmedia/idn/profile/presentation/profile/mypage/MySubscriptionStatusManager;"
private const val BANNER_STATUS = "Lmedia/idn/profile/presentation/profile/mypage/SubscriptionBannerStatus"
private const val BANNER_DATA = "Lmedia/idn/profile/presentation/profile/mypage/SubscriptionBannerDataView;"

/** MySubscriptionStatusManager.b: fills the subscription banner on the profile with one of its variants. */
private object SubscriptionBannerFingerprint : Fingerprint(
    definingClass = SUBSCRIPTION_STATUS,
    returnType = "V",
    parameters = listOf(BANNER_DATA),
)

/** MySubscriptionStatusManager.c: shows or hides the banner's frame (and the loading skeleton) while the status loads. */
private object SubscriptionFrameFingerprint : Fingerprint(
    definingClass = SUBSCRIPTION_STATUS,
    returnType = "V",
    parameters = listOf("Z"),
)

private const val BIND_BANNER = "$SUBSCRIPTION_STATUS->b($BANNER_DATA)V"

/** The method that turns the subscription status into banners: it calls the manager's b() once per status. */
private object SubscriptionStatusCallerFingerprint : Fingerprint(
    custom = { method, _ ->
        method.implementation?.instructions?.count {
            (it as? ReferenceInstruction)?.reference?.toString() == BIND_BANNER
        }?.let { it >= 2 } == true
    },
)

@Suppress("unused")
val hidePackageBannerPatch = bytecodePatch(
    name = "Hide package banner",
    description = "Removes the \"Beli Paket\" banner from the profile, since packages cannot be bought in a patched app. The switch for it is on the Fakh Patches page.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isHidePackageBannerIncluded")

        // The server can send its own banner, so the banner object says nothing; the status does. A package is
        // available (Available), or none is active (Inactive): both read their banner field right before the branch
        // that falls back to the default banner, so the mark goes there, not before the bind call a branch jumps over.
        SubscriptionStatusCallerFingerprint.method.apply {
            val reads = instructions.withIndex()
                .filter {
                    val reference = (it.value as? ReferenceInstruction)?.reference?.toString()
                    reference == "$BANNER_STATUS\$Available;->b:$BANNER_DATA" || reference == "$BANNER_STATUS\$Inactive;->a:$BANNER_DATA"
                }
                .map { it.index }
            if (reads.size != 2) throw PatchException("IDN: the buy banner statuses were not found in the profile banner code.")
            // From the last, so the earlier indexes stay valid.
            reads.reversed().forEach { addInstruction(it, "invoke-static { }, $EXTENSION_SETTINGS->buyBanner()V") }
        }

        SubscriptionBannerFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->takeBuyBanner()Z
                    move-result v0
                    if-eqz v0, :show
                    iget-object v0, p0, $SUBSCRIPTION_STATUS->a:Lmedia/idn/profile/databinding/FragmentMyProfileBinding;
                    iget-object v0, v0, Lmedia/idn/profile/databinding/FragmentMyProfileBinding;->d:Lmedia/idn/profile/databinding/ViewBasicInformationBinding;
                    iget-object v0, v0, Lmedia/idn/profile/databinding/ViewBasicInformationBinding;->l:Lmedia/idn/profile/databinding/ViewProfileSubscriptionBinding;
                    iget-object v0, v0, Lmedia/idn/profile/databinding/ViewProfileSubscriptionBinding;->a:Landroid/widget/RelativeLayout;
                    const/16 v1, 0x8
                    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }

        // At the end of c() p0 is the banner's frame, which c(false) just made visible.
        SubscriptionFrameFingerprint.method.apply {
            val end = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstruction(end, "invoke-static { p0 }, $EXTENSION_SETTINGS->keepBannerHidden(Landroid/view/View;)V")
        }
    }
}

/** Switches the analytics SDKs off that have a manifest switch. The values replace the entry if the app already has it. */
private val analyticsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            val existing = document.getElementsByTagName("meta-data")
            val switches = mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
                "firebase_sessions_enabled" to "false",
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
                "CLEVERTAP_USE_GOOGLE_AD_ID" to "0",
            )
            switches.forEach { (name, value) ->
                val entry = (0 until existing.length).map { existing.item(it) as org.w3c.dom.Element }
                    .firstOrNull { it.getAttribute("android:name") == name }
                    ?: document.createElement("meta-data").also {
                        it.setAttribute("android:name", name)
                        application.appendChild(it)
                    }
                entry.setAttribute("android:value", value)
            }
        }
    }
}

/** IDNAppsFlyerHelper.initialize(IDNApp): starts AppsFlyer from the startup pipeline. */
private object AppsFlyerInitFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/core/util/appsflyer/IDNAppsFlyerHelper;",
    returnType = "V",
    parameters = listOf("Lcom/idntimes/idntimes/IDNApp;"),
    custom = { method, _ -> method.accessFlags and 0x8 != 0 },
)

/** CleverTapSdkInitializer.initialize: the startup step that sets CleverTap up. */
private object CleverTapInitFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/core/startup/initializers/CleverTapSdkInitializer;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

/** GtmSdkInitializer.initialize: the startup step that sets Google Tag Manager up. */
private object GtmInitFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/core/startup/initializers/GtmSdkInitializer;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

/** ComScoreInitializer.create: the androidx.startup entry that starts comScore. */
private object ComScoreInitFingerprint : Fingerprint(
    definingClass = "Lcom/idntimes/idntimes/util/initializer/ComScoreInitializer;",
    name = "create",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;"),
)

/** FirebaseSdkInitializer.initialize: it turns Crashlytics collection on right after Firebase starts. */
private object FirebaseInitFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/core/startup/initializers/FirebaseSdkInitializer;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops the analytics and crash reporting SDKs (AppsFlyer, CleverTap, Firebase Analytics, Crashlytics, Google Tag Manager, comScore and Facebook events) from collecting data. Push notifications stay.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Privacy")
    dependsOn(analyticsManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // The startup steps return Success without doing their work, so the pipeline treats them as started.
        val success = "sget-object p0, Lmedia/idn/core/startup/InitializationResult\$Success;->a:Lmedia/idn/core/startup/InitializationResult\$Success;\nreturn-object p0"
        GtmInitFingerprint.method.addInstructions(0, success)

        ComScoreInitFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object p0
            """,
        )

        // AppsFlyer starts later with start(); the extension stops it first, and a stopped SDK ignores start().
        AppsFlyerInitFingerprint.method.addInstruction(
            0,
            "invoke-static { }, Lapp/fakh/extension/idn/IdnAnalytics;->stopAppsFlyer()V",
        )

        // CleverTap stays for push and popups, but records nothing about the user.
        CleverTapInitFingerprint.method.addInstruction(
            0,
            "invoke-static { }, Lapp/fakh/extension/idn/IdnAnalytics;->optOutCleverTap()V",
        )

        FirebaseInitFingerprint.method.apply {
            val enable = instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->b(Z)V"
            }
            if (enable < 0) throw PatchException("IDN: the Crashlytics collection switch was not found.")
            val register = (instructions[enable] as FiveRegisterInstruction).registerD
            // Crashlytics collection stays off, whatever the app asks for.
            addInstruction(enable, "const/4 v$register, 0x0")
        }
    }
}
