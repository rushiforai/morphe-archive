package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

/**
 * Bytecode portion of rebranding — Telegram + About-screen credit.
 *
 * These strings live in dex, so they can only be changed by a bytecode patch. The
 * patch is wired as a dependency of [rebrandingPatch]: it only runs when that patch is
 * enabled, so a stock build stays completely untouched. Not recommended on its own:
 * it must always run together with [rebrandingPatch].
 *
 * - Points every Telegram contact link in the app to the handle configured by
 *   [rebrandingTelegramHandleOption] (default `CATSM0KER`) by replacing the original
 *   support username "animewitcher_support".
 * - Credits the builder inside the in-app About screen: appends a styled
 *   "✦ <credit> ✦" line (default "Patched by Catsmoker") under the version text.
 */
@Suppress("unused")
val rebrandingBytecodePatch = bytecodePatch(
    name = "Rebranding: Telegram & About",
    description = "Part of Rebranding: points Telegram links to the configured handle (default https://t.me/CATSM0KER) and adds a credit line to the About screen. Original APK: https://www.animewitcher.com/",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    val telegramHandleOption = stringOption(
        key = "telegramHandle",
        default = "CATSM0KER",
        title = "Telegram handle",
        description = "Telegram username used for every support/contact link in the app.",
        required = false,
    )

    val aboutCreditOption = stringOption(
        key = "aboutCredit",
        default = "Patched by Catsmoker",
        title = "About credit",
        description = "Extra credit line appended to the About screen.",
        required = false,
    )

    execute {
        val safeHandle = telegramHandleOption.value
            ?.takeIf { handle -> handle.matches(Regex("^[A-Za-z0-9_]+$")) }
            ?: "CATSM0KER"
        val safeCredit = (aboutCreditOption.value?.takeIf { it.isNotBlank() } ?: "Patched by Catsmoker")
            .replace("\\", "\\\\")
            .replace("\"", "\\\"")

        val replacements = mapOf(
            "animewitcher_support" to safeHandle,
            "https://t.me/animewitcher_support?text=" to "https://t.me/$safeHandle?text=",
            "اصدار التطبيق : 1.4.8" to "اصدار التطبيق : 1.4.8\\n\\n\u2726 $safeCredit \u2726",
        )

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach methodLoop@{ method ->
                val implementation = method.implementation ?: return@methodLoop

                val matches = implementation.instructions.withIndex().mapNotNull { (index, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
                    val oldValue = (reference as? StringReference)?.string
                    val newValue = oldValue?.let { old -> replacements[old] }
                    if (newValue == null) {
                        return@mapNotNull null
                    }
                    val register = (instruction as? OneRegisterInstruction)?.registerA
                    if (register == null) {
                        return@mapNotNull null
                    }
                    index to (register to newValue)
                }

                matches.asReversed().forEach { (index, registerAndValue) ->
                    method.removeInstruction(index)
                    method.addInstruction(
                        index,
                        "const-string v${registerAndValue.first}, \"${registerAndValue.second}\""
                    )
                }
            }
        }
    }
}

/**
 * Rebrands the modded build into its own "Anime Witcher +" entry. Recommended.
 * When enabled it does all of:
 *
 * - Changes the install/launcher package ("application id") to
 *   `app.catsmoker.anime.witcher` so the mod is its own app entry. Every manifest
 *   component that references a class by a relative `.Name` is rewritten to its
 *   absolute `com.anime.witcher.Name` form, because relative names resolve against
 *   the (new) package while the classes themselves stay put.
 * - Renames the visible app label to "Anime Witcher +".
 * - Adds a small red "+" badge to the launcher icon (adaptive foreground +
 *   legacy icons, all densities). The `android:banner` points at the same mipmap,
 *   so the TV banner picks up the badge automatically.
 * - Pulls in [rebrandingBytecodePatch] (the Telegram + About-screen credit), which
 *   can only exist as a bytecode patch because those strings live in dex.
 */
@Suppress("unused")
val rebrandingPatch = resourcePatch(
    name = "Rebranding",
    description = "Renames the app to 'Anime Witcher +', changes the package id to app.catsmoker.anime.witcher, badges the icon with a red +, points Telegram links to https://t.me/CATSM0KER and credits the About screen. Original APK: https://www.animewitcher.com/",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)
    dependsOn(rebrandingBytecodePatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            manifest.setAttribute("package", "app.catsmoker.anime.witcher")

            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:label", "Anime Witcher +")

            fun absolutizePackageRelative(el: Element, attribute: String) {
                val value = el.getAttribute(attribute)
                if (value.startsWith(".")) {
                    el.setAttribute(attribute, "com.anime.witcher$value")
                }
            }

            listOf(
                "application",
                "activity",
                "activity-alias",
                "service",
                "receiver",
                "provider",
            ).forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as Element
                    absolutizePackageRelative(el, "android:name")
                    absolutizePackageRelative(el, "android:process")
                    absolutizePackageRelative(el, "android:taskAffinity")
                }
            }

            // Permissions declared with an absolute name owned by the stock package
            // (DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION, C2D_MESSAGE, ...) collide on
            // devices where the stock app is installed: installing a second package
            // that redeclares them fails with INSTALL_FAILED_DUPLICATE_PERMISSION. Move
            // every com.anime.witcher.* permission under our own package instead.
            listOf("permission", "uses-permission").forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as Element
                    val value = el.getAttribute("android:name")
                    if (value.startsWith("com.anime.witcher.")) {
                        el.setAttribute("android:name", "app.catsmoker.anime.witcher${value.removePrefix("com.anime.witcher")}")
                    }
                }
            }
        }

        val densities = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")
        val variants = listOf("ic_launcher_foreground.png", "ic_launcher.png")

        densities.forEach { density ->
            variants.forEach { variant ->
                val path = "res/mipmap-$density/$variant"
                val icon =
                    try {
                        get(path, false)
                    } catch (e: Exception) {
                        null
                    }
                if (icon != null) {
                    IconBadger.badge(icon)
                }
            }
        }
    }
}

/**
 * The red "+" badge (with white outline) used to be drawn with AWT / javax.imageio,
 * which crashes the on-device patcher inside Morphe Manager (NoClassDefFoundError).
 * The drawing now lives in [IconBadger], a pure PNG decoder/drawer/encoder that runs
 * on both the desktop JVM and Android ART.
 */
