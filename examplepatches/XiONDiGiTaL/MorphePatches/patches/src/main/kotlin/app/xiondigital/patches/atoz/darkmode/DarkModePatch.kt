package app.xiondigital.patches.atoz.darkmode

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.xiondigital.patches.atoz.shared.Constants.COMPATIBILITY_ATOZ_APK
import org.w3c.dom.Element

/**
 * Amazon A to Z's UI is React Native on Expo, painted from a Hermes bundle that contains no dark
 * palette — `colorScheme`, `useColorScheme` and `darkMode` do not occur in the bytecode bundle of
 * any inspected build. There is no source to recompile and no in-app appearance setting, so the only
 * mechanism that reaches JS-painted pixels is Android's own automatic dark transform ("Force Dark").
 *
 * AOSP `ViewRootImpl.updateForceDarkMode()` gates that transform on three things:
 *
 * 1. `Theme_forceDarkAllowed` — defaults to `false` on retail builds unless the theme opts in.
 * 2. `Theme_isLightTheme` — the transform is skipped when the theme reports a dark theme, which is
 *    what `Theme.AppCompat.DayNight` reports once night mode is on.
 * 3. `getConfiguration().uiMode & UI_MODE_NIGHT_MASK == NIGHT_YES` — the app's own night mode.
 *
 * So the patch does two things: the resource patch below satisfies 1 and 2, and the bytecode patch
 * satisfies 3 by asking AppCompat for night mode before the first activity is created.
 */

/**
 * Sets app-wide night mode. `AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)` is a one-int
 * static call, so it needs a single scratch register and nothing else; `0x2` is `MODE_NIGHT_YES`.
 *
 * The activity's `Resources` configuration is what `ViewRootImpl.getConfiguration()` returns, and
 * `com.amazon.atozm.MainActivity` is a `ReactActivity` extending `AppCompatActivity`, so AppCompat
 * owns that configuration and applies this at `attachBaseContext2`, before the window exists.
 * Injecting it in `Application.onCreate()` is early enough for that and late enough that the
 * AppCompat delegate is initialised.
 */
private const val FORCE_APP_NIGHT_MODE = """
    const/4 v0, 0x2
    invoke-static {v0}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V
"""

/** Theme names A to Z inherits from the React Native template, across every inspected build. */
private const val THEME_PREFIX = "AppTheme"

/**
 * `Theme.AppCompat.DayNight` reports `isLightTheme = false` in night mode, which switches the
 * automatic dark transform off — the opposite of what a JS-painted UI needs. Reparenting to the
 * Light variant keeps the same rendering in light mode while leaving the transform enabled, and the
 * night-mode call above is what makes the app dark in the first place.
 */
private val DAY_NIGHT_PARENTS = listOf(
    "Theme.AppCompat.DayNight" to "Theme.AppCompat.Light",
    "@style/Theme.AppCompat.DayNight" to "@style/Theme.AppCompat.Light",
)

private val FORCE_DARK_ITEM = mapOf("android:forceDarkAllowed" to "true")

/*
 * The system bars need no work here: A to Z's base theme already paints both of them with
 * @color/background (squid ink), in light and dark alike, so SystemUI draws them dark without the
 * patch touching them. They are drawn outside the transform, which is why a build whose night
 * overlay did move them would need its own rows — but neither 6.0.3553.0 nor 6.0.5098.0 defines
 * AppTheme in values-night, so there is nothing to add there either.
 */

/**
 * Opts the app's themes into the automatic dark transform.
 *
 * The patch edits the values files the APK already has instead of creating a `values-night`
 * overlay: a style variant defined for a configuration replaces the whole style for that
 * configuration rather than merging into the base one, so writing a partial night overlay would
 * drop the parent theme and every other item. Adding items to the existing styles is additive and
 * safe on every build.
 *
 * It is a hidden dependency of [forceDarkModePatch] — it has no name, so `PatchLoader` does not
 * list it as a patch the user can toggle on its own.
 */
private val forceDarkThemePatch = resourcePatch(
    description = "Opts Amazon A to Z's AppTheme styles into Android's automatic dark transform.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ATOZ_APK)

    execute {
        val styleFiles = listDecodableFiles("res/values*/styles.xml")
        check(styleFiles.isNotEmpty()) {
            "No res/values*/styles.xml in this APK; the theme this patch edits is not where it " +
                "was in every build inspected, so the patch needs re-checking before it is used."
        }

        var patchedStyles = 0
        styleFiles.forEach { path ->
            document(path).use { document ->
                patchedStyles += document.patchThemes()
            }
        }

        check(patchedStyles > 0) {
            "Found no style named $THEME_PREFIX* in res/values*/styles.xml. Amazon A to Z renamed " +
                "its themes, so the patch needs re-checking before it is used."
        }
    }
}

/**
 * Turns on Amazon A to Z's night mode for good, regardless of the system setting.
 *
 * The app has no appearance setting of its own and never calls `AppCompatDelegate`, so without this
 * the UI only goes dark when the phone is in dark mode — and even then the JS-painted surfaces stay
 * light, because the bundle has no dark palette. This is the switch that makes the automatic dark
 * transform above actually reach them.
 *
 * Runs on every version: any version is accepted, and the patch fails instead of guessing if the
 * theme or `MainApplication.onCreate()` it anchors on ever moves.
 */
@Suppress("unused")
val forceDarkModePatch = bytecodePatch(
    name = "Force dark mode",
    description = "Turns on Amazon A to Z's night mode before the first screen is created and opts " +
        "the app into Android's automatic dark transform, so the interface is dark even when the " +
        "phone is set to light mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ATOZ_APK)

    dependsOn(forceDarkThemePatch)

    execute {
        val method = MainApplicationOnCreateFingerprint.method

        val registerCount = method.implementation?.registerCount
            ?: error("com.amazon.atozm.MainApplication.onCreate() has no body to patch.")

        check(registerCount > 1) {
            "MainApplication.onCreate() declares only $registerCount register(s), so the injected " +
                "night-mode call would overwrite 'this'. The patch needs re-checking on this build."
        }

        method.addInstructions(0, FORCE_APP_NIGHT_MODE)
    }
}

/**
 * Adds [FORCE_DARK_ITEM] to every `AppTheme*` style in one decoded values file.
 *
 * @return How many styles were edited.
 */
private fun org.w3c.dom.Document.patchThemes(): Int {
    val styles = getElementsByTagName("style")
    var patchedStyles = 0

    for (index in 0 until styles.length) {
        val style = styles.item(index) as? Element ?: continue
        if (!style.getAttribute("name").startsWith(THEME_PREFIX)) continue

        style.useLightParent()
        FORCE_DARK_ITEM.forEach { (name, value) -> style.setItem(this, name, value) }
        patchedStyles++
    }

    return patchedStyles
}

/** Reparents a DayNight theme to its Light variant, so the transform is not switched off. */
private fun Element.useLightParent() {
    val parent = getAttribute("parent").takeIf { it.isNotEmpty() } ?: return

    DAY_NIGHT_PARENTS.firstOrNull { (from, _) ->
        parent == from || parent.startsWith("$from.")
    }?.let { (from, to) ->
        setAttribute("parent", to + parent.removePrefix(from))
    }
}

/** Sets a `<item>` in a style, replacing the existing one of that name if there is one. */
private fun Element.setItem(document: org.w3c.dom.Document, name: String, value: String) {
    val existing = getElementsByTagName("item")

    for (index in 0 until existing.length) {
        val item = existing.item(index) as? Element ?: continue
        if (item.getAttribute("name") != name) continue

        item.textContent = value
        return
    }

    document.createElement("item").also { item ->
        item.setAttribute("name", name)
        item.textContent = value
        appendChild(item)
    }
}
