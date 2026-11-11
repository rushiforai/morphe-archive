package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

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

/** Every reference the method's instructions carry, as smali text. */
private fun Method.references(): List<String> =
    implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() } ?: emptyList()

/** Whether [instruction] is a call to an app enum's valueOf(String); the enum class is obfuscated, so only its shape is checked. */
private fun isEnumValueOf(instruction: Instruction): Boolean {
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.name == "valueOf" && reference.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
        reference.returnType == reference.definingClass && !reference.definingClass.startsWith("Ljava/")
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

/** The Settings fragment's onViewCreated, where the "Fakh Patches" row goes. R8 renames the class; it reads the app version and the navigate_param argument. */
private object SettingsScreenFingerprint : Fingerprint(
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    strings = listOf("navigate_param", " build "),
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

/** CleverTap's InAppController, the step that shows a campaign popup such as the full-screen promo at launch. R8 renames the SDK class. */
private object ShowInAppFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Attempting to show next In-App"),
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
    returnType = "V",
    parameters = listOf(),
    strings = listOf("KEY_PREF_HOME_HIGHLIGHT_CREATE_CONTENT"),
)

/** The constructor of the delegate that runs the "+" button (it animates the CircleToSquareButton); its second parameter is the main screen's view binding. */
private object CreateMenuDelegateFingerprint : Fingerprint(
    name = "<init>",
    custom = { _, classDef ->
        val references = classDef.methods.flatMap { it.references() }
        references.any { it.startsWith("Lcom/idntimes/idntimes/util/component/CircleToSquareButton;->") } &&
            references.any { it.startsWith("Landroid/view/animation/AnimationUtils;->loadAnimation") }
    },
)

@Suppress("unused")
val hideCreateButtonPatch = bytecodePatch(
    name = "Hide Create button",
    description = "Removes the \"+\" button (write news, start a live stream) from the middle of the navigation bar. The switch is in Fakh Patches.",
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

/** The device security check (DeviceSecurityChecker): reports root and Developer options; the short movie player blocks playback on either. */
private object DeviceSecurityCheckFingerprint : Fingerprint(
    parameters = listOf("Z"),
    strings = listOf("development_settings_enabled", "su"),
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
    name = "<init>",
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList() ?: emptyList()
        val valueOf = instructions.firstOrNull(::isEnumValueOf)?.let { ((it as ReferenceInstruction).reference as MethodReference).returnType }
        valueOf != null && instructions.any {
            val field = (it as? ReferenceInstruction)?.reference as? FieldReference
            field != null && field.name == "UNKNOWN" && field.type == valueOf
        }
    },
)

@Suppress("unused")
val hideHomeTabsPatch = bytecodePatch(
    name = "Hide home tabs",
    description = "Adds switches to hide the Nonton, IDN Live, Berita and Quiz tabs in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isHideTabsIncluded")
        HomeTabsFingerprint.method.apply {
            val valueOf = instructions.indexOfFirst(::isEnumValueOf)
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

/** The bind method of a Nonton home carousel card: it starts the muted preview video, which is the only caller of setLowQualityTrailer. */
private object PreviewVideoBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lmedia/idn/videoPlayer/ExoVideoPlayerView;",
            name = "setLowQualityTrailer",
            parameters = listOf("Z"),
            returnType = "V",
        )
    ),
    custom = { method, _ -> method.parameterTypes.size == 2 },
)

@Suppress("unused")
val stopAutoplayPatch = bytecodePatch(
    name = "Stop autoplay",
    description = "Adds a switch to stop the video previews and the automatic sliding of the home banners in Fakh Patches.",
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
        val binds = PreviewVideoBindFingerprint.matchAllOrNull().orEmpty().map { it.method }
        if (binds.size != 2) throw PatchException("IDN: expected 2 home carousel card previews, found ${binds.size}.")
        binds.forEach {
            it.apply {
                // The card shows its cover and plays nothing when the preview url is null. The url is the first String field the card data is read for.
                val url = instructions.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type == "Ljava/lang/String;" &&
                        instruction.opcode == Opcode.IGET_OBJECT
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

/** TopUpGoldBottomSheet.show: shows the Gold packages sheet; the live rooms, the short movie player and the QR scanner call it. */
private object GoldSheetFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("topupgold_bottom_sheet"),
    custom = { method, _ -> method.parameterTypes.size == 2 && method.parameterTypes[1].toString() == "Ljava/lang/String;" },
)

/** ProfileActivity's screen router: opens the screen the activity was started for, such as Settings or Top up Gold. */
private object ProfileScreenFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/profile/presentation/ProfileActivity;",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.size == 1 && method.parameterTypes[0].toString() != "Landroid/os/Bundle;" },
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

private const val SKELETON_LAYOUT = "Lcom/faltenreich/skeletonlayout/SkeletonLayout;"

/** MySubscriptionStatusManager's bind: fills the subscription banner on the profile with one of its variants (the only one-argument method that sets card colors). */
private object SubscriptionBannerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(methodCall(name = "setCardBackgroundColor", parameters = listOf("I"), returnType = "V")),
    custom = { method, _ ->
        method.parameterTypes.size == 1 &&
            method.references().count { it.endsWith("->setCardBackgroundColor(I)V") } >= 2
    },
)

/** MySubscriptionStatusManager's loading switch: shows or hides the banner's frame and the loading skeleton while the status loads. */
private object SubscriptionFrameFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(checkCast(SKELETON_LAYOUT)),
)

@Suppress("unused")
val hidePackageBannerPatch = bytecodePatch(
    name = "Hide package banner",
    description = "Removes the \"Beli Paket\" banner from the profile, since packages cannot be bought in a patched app. The switch is in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isHidePackageBannerIncluded")

        val bind = SubscriptionBannerFingerprint.method
        val bindCall = "${bind.definingClass}->${bind.name}(${bind.parameterTypes.joinToString("")})${bind.returnType}"
        val bannerType = bind.parameterTypes.single().toString()

        // The status code turns each subscription status into a banner: it calls the bind once per status that has a
        // default banner. The server can send its own banner, so the banner object says nothing; the status does. A package
        // is available, or none is active: both read their banner off the status right before the branch that falls back
        // to the default banner, so the mark goes there, not before the bind call a branch can jump over.
        val statusCaller = Fingerprint(
            filters = listOf(
                methodCall(
                    definingClass = bind.definingClass,
                    name = bind.name,
                    parameters = bind.parameterTypes.map { it.toString() },
                    returnType = bind.returnType,
                )
            )
        ).matchAllOrNull().orEmpty().lastOrNull { match -> match.originalMethod.references().count { it == bindCall } >= 2 }
            ?: throw PatchException("IDN: the profile banner status code was not found.")
        statusCaller.method.apply {
            val marks = sortedSetOf<Int>()
            instructions.forEachIndexed { index, instruction ->
                if ((instruction as? ReferenceInstruction)?.reference?.toString() != bindCall) return@forEachIndexed
                val read = (index - 1 downTo 0).firstOrNull {
                    val field = (instructions[it] as? ReferenceInstruction)?.reference as? FieldReference
                    instructions[it].opcode == Opcode.IGET_OBJECT && field != null &&
                        field.type == bannerType && field.definingClass != bind.definingClass
                }
                if (read != null) marks += read
            }
            if (marks.size != 2) throw PatchException("IDN: the buy banner statuses were not found in the profile banner code.")
            // From the last, so the earlier indexes stay valid.
            marks.reversed().forEach { addInstruction(it, "invoke-static { }, $EXTENSION_SETTINGS->buyBanner()V") }
        }

        // The loading switch runs before the bind and shows the frame; the extension remembers it and hides it for a buy banner.
        bind.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->takeBuyBanner()Z
                    move-result v0
                    if-eqz v0, :show
                    invoke-static { }, $EXTENSION_SETTINGS->hideBanner()V
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }

        // The last call of the loading switch shows the banner's frame; the extension keeps it hidden if it was.
        SubscriptionFrameFingerprint.method.apply {
            val show = instructions.indexOfLast {
                (it as? ReferenceInstruction)?.reference?.let { reference -> reference is MethodReference && reference.name == "setVisibility" } == true
            }
            if (show < 0) throw PatchException("IDN: the banner frame visibility call was not found.")
            val frame = (instructions[show] as FiveRegisterInstruction).registerC
            addInstruction(show + 1, "invoke-static { v$frame }, $EXTENSION_SETTINGS->keepBannerHidden(Landroid/view/View;)V")
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

/** IDNApp.onCreate: the app's entry point, where AppsFlyer is stopped before the startup steps set it up. */
private object AppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/idntimes/idntimes/IDNApp;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** The startup step that sets Google Tag Manager up; R8 merged it with other startup steps, which this method also runs for another case. */
private object GtmInitFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("Google Tag Manager initialization failed"),
)

/** ComScoreInitializer.create: the androidx.startup entry that starts comScore. */
private object ComScoreInitFingerprint : Fingerprint(
    definingClass = "Lcom/idntimes/idntimes/util/initializer/ComScoreInitializer;",
    name = "create",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;"),
)

/** The startup step that sets Firebase up: it turns Crashlytics collection on right after Firebase starts. */
private object FirebaseInitFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("Firebase initialization failed \u2014 disabling Crashlytics"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops the analytics and crash reporting SDKs (AppsFlyer, Firebase Analytics, Crashlytics, Google Tag Manager, comScore and Facebook events) from collecting data. CleverTap stays for push and popups, without the advertising ID.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Privacy")
    dependsOn(analyticsManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // GTM shares its method with another startup step. Its code starts at the first read of the static config
        // map; there it returns Success (the value the method returns on its normal exit) without doing the work.
        GtmInitFingerprint.method.apply {
            val success = instructions.withIndex().firstNotNullOfOrNull { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.type == it.definingClass && it.definingClass != definingClass }
            } ?: throw PatchException("IDN: the Success result of the Google Tag Manager step was not found.")
            val start = instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference.let { reference -> reference is FieldReference && reference.type == "Ljava/util/LinkedHashMap;" && it.opcode == Opcode.SGET_OBJECT }
            }
            if (start < 0) throw PatchException("IDN: the start of the Google Tag Manager step was not found.")
            addInstructions(
                start,
                """
                    sget-object v0, ${success.definingClass}->${success.name}:${success.type}
                    return-object v0
                """,
            )
        }

        ComScoreInitFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object p0
            """,
        )

        // AppsFlyer starts later with start(); the extension stops it first, and a stopped SDK ignores start().
        AppCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { }, Lapp/fakh/extension/idn/IdnAnalytics;->stopAppsFlyer()V",
        )

        FirebaseInitFingerprint.method.apply {
            val enable = instructions.indexOfFirst {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                reference != null && it.opcode == Opcode.INVOKE_VIRTUAL && reference.parameterTypes.map { type -> type.toString() } == listOf("Z") &&
                    reference.returnType == "V"
            }
            if (enable < 0) throw PatchException("IDN: the Crashlytics collection switch was not found.")
            val register = (instructions[enable] as FiveRegisterInstruction).registerD
            // Crashlytics collection stays off, whatever the app asks for.
            addInstruction(enable, "const/4 v$register, 0x0")
        }
    }
}
