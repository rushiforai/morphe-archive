package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

private const val SETTINGS_ACTIVITY = "app.template.extension.settings.ModSettingsActivity"
private const val LABEL_STRING = "morphe_mod_settings"

/**
 * Registers [SETTINGS_ACTIVITY] in the manifest, adds a launcher long-press shortcut that opens
 * it, and a string for the shortcut label. The activity class itself ships in the extension.
 */
internal val modSettingsResourcePatch = resourcePatch {
    execute {
        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            val already = document.getElementsByTagName("string").let { nodes ->
                (0 until nodes.length).any { (nodes.item(it) as Element).getAttribute("name") == LABEL_STRING }
            }
            if (!already) {
                resources.appendChild(
                    document.createElement("string").apply {
                        setAttribute("name", LABEL_STRING)
                        textContent = "Letterboxd Mods"
                    },
                )
            }
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val hasVibrate = document.getElementsByTagName("uses-permission").let { nodes ->
                (0 until nodes.length).any {
                    (nodes.item(it) as Element).getAttribute("android:name") == "android.permission.VIBRATE"
                }
            }
            if (!hasVibrate) {
                manifest.appendChild(
                    document.createElement("uses-permission").apply {
                        setAttribute("android:name", "android.permission.VIBRATE")
                    },
                )
            }

            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                document.createElement("activity").apply {
                    setAttribute("android:name", SETTINGS_ACTIVITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:label", "@string/$LABEL_STRING")
                    // A platform theme: framework android.preference.* needs the
                    // ?android:attr/preference*Style chain that Theme.Material defines.
                    // The app's own Theme.Letterboxd is Material3/AppCompat and lacks it,
                    // which crashes the PreferenceFragment on inflation. NoActionBar —
                    // ModSettingsActivity draws its own header and applies insets.
                    setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                },
            )
        }

        val shortcuts = get("res/xml/shortcuts.xml")
        if (shortcuts.exists()) {
            document("res/xml/shortcuts.xml").use { document ->
                val intent = document.createElement("intent").apply {
                    setAttribute("android:action", "android.intent.action.VIEW")
                    setAttribute("android:targetPackage", "com.letterboxd.letterboxd")
                    setAttribute("android:targetClass", SETTINGS_ACTIVITY)
                }
                val shortcut = document.createElement("shortcut").apply {
                    setAttribute("android:shortcutId", "morphemods")
                    setAttribute("android:enabled", "true")
                    setAttribute("android:shortcutShortLabel", "@string/$LABEL_STRING")
                    appendChild(intent)
                }
                document.documentElement.appendChild(shortcut)
            }
        }
    }
}

internal object LetterboxdApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/LetterboxdApplication;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `MeFragment.configure(MaterialToolbar, Member)` sets the "Me" tab toolbar's navigation icon to
 * the settings gear and its click to open Letterboxd's own `SettingsActivity`. We add a long-press
 * on the same toolbar that opens the mod settings screen.
 */
internal object MeFragmentConfigureFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/user/MeFragment;",
    name = "configure",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/google/android/material/appbar/MaterialToolbar;",
        "Lcom/letterboxd/api/model/Member;",
    ),
)

/**
 * For the one-time welcome dialog. Hooked at `onResume` (protected, no args) rather than
 * `onCreate` so it fires after Letterboxd's splash / login flow.
 */
internal object MainActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/MainActivity;",
    name = "onResume",
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `PopularViewModel.UIState.MainView.getVideoStoreHomeData()` is read in exactly one place —
 * `SignedInPopularFilmsFragment$onViewCreated$3$1`, which shows the "Video Store" row on the
 * Films tab only when the value is non-null. Returning null there takes the branch that hides
 * the row (`videoStoreProductsLayout` → GONE) without touching the adapter, so nothing else about
 * the Video Store changes. Bundled directly into "Mod settings" (not its own patch) since it's
 * purely a Prefs-gated toggle now.
 */
internal object VideoStoreHomeDataFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/popular/PopularViewModel\$UIState\$MainView;",
    name = "getVideoStoreHomeData",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/letterboxd/api/model/VideoStoreHomeResponse;",
    parameters = emptyList(),
)

/** For the "Hide Where to Watch" toggle — hides the section's own fragment root view. */
internal object WhereToWatchOnViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/WhereToWatchFragment;",
    name = "onViewCreated",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/** For "Open in player" — adds the Stremio/Nuvio button beside `trailer_button`. */
internal object FilmHeaderOnViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmHeaderFragment;",
    name = "onViewCreated",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/**
 * `FilmRatingsHistogramFragment` hosts the community-ratings section on a film page; its root
 * view is `@id/ratingsViewWrapper`, and it can reach `FilmViewModel` (which exposes the viewing
 * relationship). The extension attaches a layout listener that hides the rating content until the
 * film is marked watched, replacing it with the chosen reveal style.
 */
internal object HistogramOnViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmRatingsHistogramFragment;",
    name = "onViewCreated",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/**
 * `MainActivity.setup(BottomNavigationView, Tab)` configures the bottom navigation bar (menu,
 * tint, listeners) once at startup. Injecting there lets the extension paint the bar's background
 * from a preference instead of hard-coding it in `styles.xml`.
 */
internal object MainActivitySetupBottomNavFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/MainActivity;",
    name = "setup",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/google/android/material/bottomnavigation/BottomNavigationView;",
        "Lcom/letterboxd/letterboxd/MainActivity\$Tab;",
    ),
)

@Suppress("unused")
val modSettingsPatch = bytecodePatch(
    name = "Mod settings",
    description = "HOW TO OPEN: long-press the settings gear on your profile tab. — This adds a \"Letterboxd Mods\" " +
        "screen that collects the other patches' options (theme, accent, hide ratings, hide video " +
        "store, hide where to watch, open in player, match bottom nav, etc.) so you can change them " +
        "inside the app instead of re-patching. Some changes apply immediately, others after a " +
        "restart, and you'll be prompted either way.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    dependsOn(modSettingsResourcePatch)

    extendWith("extensions/extension.mpe")

    val revealStyle by stringOption(
        key = "revealStyle",
        default = "panel",
        values = mapOf(
            "Frosted panel" to "panel",
            "Tap-to-show link" to "link",
            "Shimmer (Telegram-style)" to "shimmer",
            "Tap to burst" to "burst",
        ),
        title = "Cover",
        description = "How the hidden rating is covered, before you've changed it from the Mods " +
            "screen. 'Frosted panel' is an opaque panel with an eye glyph; 'Tap-to-show link' is a " +
            "plain text link under the section title; 'Shimmer' is a continuously animating " +
            "particle field; 'Tap to burst' is a static particle field that scatters when tapped. " +
            "The Mods screen also has a separate \"Reveal animation\" (default / crumble / " +
            "confetti) that changes how tapping any of the three opaque covers disappears, " +
            "independent of which one you pick here.",
    )

    execute {
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, Lapp/template/extension/settings/Prefs;->load(Landroid/content/Context;)V",
        )

        // In-app entry point: long-press the profile-tab settings icon. Optional — if the
        // fingerprint stops matching on a future app version the shortcut still works.
        runCatching {
            MeFragmentConfigureFingerprint.method.addInstruction(
                0,
                "invoke-static { p1 }, Lapp/template/extension/settings/ModEntryPoint;->attachToToolbar(Landroid/view/View;)V",
            )
        }

        // One-time welcome / changelog dialog. Optional.
        runCatching {
            MainActivityOnResumeFingerprint.method.addInstruction(
                0,
                "invoke-static { p0 }, Lapp/template/extension/settings/ModWelcome;->maybeShow(Landroid/app/Activity;)V",
            )
        }

        // "Hide Video Store on home" — off by default; Prefs.hideVideoStore() gates it.
        VideoStoreHomeDataFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, Lapp/template/extension/settings/Prefs;->hideVideoStore()Z
                move-result v0
                if-eqz v0, :keep
                const/4 v0, 0x0
                return-object v0
                :keep
                nop
            """,
        )

        // "Hide Where to Watch" — off by default.
        runCatching {
            WhereToWatchOnViewCreatedFingerprint.method.addInstruction(
                0,
                "invoke-static { p0 }, Lapp/template/extension/settings/HideSections;->enforceWhereToWatch(Landroidx/fragment/app/Fragment;)V",
            )
        }

        // "Open in player" — off by default.
        runCatching {
            FilmHeaderOnViewCreatedFingerprint.method.addInstruction(
                0,
                "invoke-static { p0 }, Lapp/template/extension/StreamingButton;->enforce(Landroidx/fragment/app/Fragment;)V",
            )
        }

        // "Hide ratings until watched" — on by default; Prefs.hide_ratings_enabled/_style can
        // override the baked reveal style below at runtime.
        run {
            val style = revealStyle ?: "panel"
            HistogramOnViewCreatedFingerprint.method.addInstructions(
                0,
                """
                    const-string v0, "$style"
                    invoke-static { p0, v0 }, Lapp/template/extension/HideRatingUntilWatched;->enforce(Landroidx/fragment/app/Fragment;Ljava/lang/String;)V
                """,
            )
        }

        // "Match bottom nav to top bar color" — on by default; Prefs.match_bottom_nav gates it.
        MainActivitySetupBottomNavFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, Lapp/template/extension/settings/ModChrome;->applyBottomNav(Landroid/view/View;)V",
        )
    }
}
