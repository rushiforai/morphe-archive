package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

// Which apps this bundle is for. Gradle sets BUNDLE_FLAVOR from -Pflavor:
//
//   all   (default) the phone and Android TV patches in one bundle, as released today.
//   phone           phone apps only. No Android TV target is listed, so Morphe
//                   Manager never suggests a TV version to a phone.
//   tv              Android TV apps only, for the planned tv-morphe-patches source.
//
// Morphe Manager keeps one recommended version per package and does not look at
// the form factor, so when a phone app and its Android TV app share a package
// (Apple TV, NewsNation, Tubi, JustWatch) a combined bundle suggests the TV
// version to phones. Splitting the bundles is the fix.

/** True in the phone-only bundle. */
val isPhoneBundle: Boolean get() = BUNDLE_FLAVOR == "phone"

/** True in the Android TV-only bundle. */
val isTvBundle: Boolean get() = BUNDLE_FLAVOR == "tv"

/** True when [compatibility] belongs in this bundle. */
fun inBundle(compatibility: Compatibility): Boolean = when {
    isTvBundle -> compatibility.formFactor == FormFactor.TV
    isPhoneBundle -> compatibility.formFactor != FormFactor.TV
    else -> true
}

/**
 * Keeps the entries that belong in this bundle, for a patch that lists both
 * phone and Android TV apps. Use it as compatibleWith(*forBundle(...)).
 *
 * Loading the bundle fails if nothing is left, because a patch without
 * compatibility entries is not tied to any app. Leave such a patch out of the
 * flavor's sources in patches/build.gradle.kts instead. Run list-patches on
 * each flavor's .mpp to catch this before release.
 */
fun forBundle(vararg compatibility: Compatibility): Array<Compatibility> =
    compatibility.filter(::inBundle).toTypedArray().also {
        check(it.isNotEmpty()) {
            "No compatibility entries left for the $BUNDLE_FLAVOR bundle. " +
                "Exclude this patch from that flavor in patches/build.gradle.kts."
        }
    }

/**
 * Picks the compatibility entry for this bundle. splitByBundle() covers the
 * usual case.
 */
fun byBundle(all: Compatibility, phone: Compatibility, tv: Compatibility): Compatibility = when {
    isTvBundle -> tv
    isPhoneBundle -> phone
    else -> all
}

private const val PHONE_BUILD = "Phone build"
private const val TV_BUILD = "Android TV build"

/** A target for the Android TV build, with or without the combined bundle's TV source label. */
private val AppTarget.isTvBuild: Boolean get() = description == TV_BUILD || description == TV_BUILD_LABEL

/**
 * Splits an entry from the combined bundle into a phone entry and an Android TV
 * entry, for an app whose phone and Android TV builds share a package. The
 * combined bundle keeps this entry as is.
 *
 * By default a target described as "Android TV build" goes to the TV entry
 * only, one described as "Phone build" to the phone entry only, and any other
 * target to both, as when the builds share a version name. Keep the targets in
 * the Compatibility(...) literal: the issue triage and the update bot read and
 * edit them there.
 */
fun Compatibility.splitByBundle(
    phoneTargets: List<AppTarget> = targets.filter { !it.isTvBuild },
    tvTargets: List<AppTarget> = targets.filter { it.description != PHONE_BUILD },
    phoneDescription: String? = description,
    tvDescription: String? = description,
): Compatibility = byBundle(
    all = withTvSourceLabel(),
    phone = Compatibility(
        name = checkNotNull(name),
        packageName = checkNotNull(packageName),
        description = phoneDescription,
        apkFileType = apkFileType,
        appIconColor = appIconColor,
        signatures = signatures,
        targets = phoneTargets,
    ),
    tv = asTvEntry(tvTargets, tvDescription),
)

private const val TV_SUFFIX = " (Android TV)"

/**
 * [name] without " (Android TV)" in the TV bundle, where every app is an
 * Android TV app. The phone and combined bundles keep the suffix, because there
 * the phone and Android TV patches for one package sit side by side.
 */
fun tvName(name: String): String = if (isTvBundle) name.removeSuffix(TV_SUFFIX) else name

/**
 * For an entry only an Android TV app uses: in the TV bundle, the same entry
 * without " (Android TV)" in its name or the "Android TV build" label on its
 * versions, and with [tvDescription]. Other bundles keep this entry as is.
 */
fun Compatibility.forTvSource(tvDescription: String? = description): Compatibility = when {
    isTvBundle -> asTvEntry(targets, tvDescription)
    isPhoneBundle -> this
    else -> withTvSourceLabel(TV_SOURCE_NOTICE)
}

// The combined bundle is the last one from this source with the Android TV
// apps: from 1.2.0 they are released only from tv-morphe-patches. Its Android
// TV versions say so in Morphe Manager. The label is added here, not in each
// Constants.kt, because the issue triage and the update bot read the literal
// "Android TV build" there.
private const val TV_BUILD_LABEL = "Android TV build. From 1.2.0, only in the TV patch source"
private const val TV_SOURCE_NOTICE = "From 1.2.0, these Android TV patches are only in the TV patch " +
    "source, tv-morphe-patches."

private fun Compatibility.withTvSourceLabel(notice: String? = null) = Compatibility(
    name = checkNotNull(name),
    packageName = checkNotNull(packageName),
    description = if (notice == null) description else listOfNotNull(description, notice).joinToString(" "),
    apkFileType = apkFileType,
    appIconColor = appIconColor,
    signatures = signatures,
    targets = targets.map { target ->
        if (!target.isTvBuild) {
            target
        } else {
            AppTarget(
                version = target.version,
                versionCodes = target.versionCodes,
                isExperimental = target.isExperimental,
                minSdk = target.minSdk,
                description = TV_BUILD_LABEL,
            )
        }
    },
    formFactor = formFactor,
)

private fun Compatibility.asTvEntry(tvTargets: List<AppTarget>, tvDescription: String?) = Compatibility(
    name = tvName(checkNotNull(name)),
    packageName = checkNotNull(packageName),
    description = tvDescription,
    apkFileType = apkFileType,
    appIconColor = appIconColor,
    signatures = signatures,
    targets = tvTargets.map { target ->
        if (!target.isTvBuild) {
            target
        } else {
            AppTarget(
                version = target.version,
                versionCodes = target.versionCodes,
                isExperimental = target.isExperimental,
                minSdk = target.minSdk,
                description = null,
            )
        }
    },
    formFactor = FormFactor.TV,
)

/** [text] without " in the Android TV app" in the TV bundle, where every app is an Android TV app. */
fun tvText(text: String): String = if (isTvBundle) text.replace(" in the Android TV app", "") else text

/**
 * This entry without its "Android TV build" targets, for a patch that only
 * works on the phone build. The patch must also be left out of the TV flavor in
 * patches/build.gradle.kts. Use it as compatibleWith(Constants.COMPATIBILITY.phoneOnly()),
 * so no bundle offers the patch for an Android TV version.
 */
fun Compatibility.phoneOnly(): Compatibility = Compatibility(
    name = checkNotNull(name).also {
        // In the TV bundle this entry has only Android TV targets, so nothing
        // would be left, and an entry without targets matches every version.
        check(!isTvBundle) { "$it: a phone-only patch is in the TV bundle; exclude it in patches/build.gradle.kts" }
    },
    packageName = checkNotNull(packageName),
    description = description,
    apkFileType = apkFileType,
    appIconColor = appIconColor,
    signatures = signatures,
    targets = targets.filter { !it.isTvBuild },
)

/**
 * This entry with only its Android TV targets, for a patch that only works on
 * the Android TV build. The patch must also be listed in tvOnlySources in
 * patches/build.gradle.kts, so the phone bundle leaves it out.
 */
fun Compatibility.tvOnly(): Compatibility = Compatibility(
    name = tvName(checkNotNull(name).removeSuffix(" (Android TV)") + " (Android TV)").also {
        check(!isPhoneBundle) { "$it: an Android TV-only patch is in the phone bundle; list it in tvOnlySources" }
    },
    packageName = checkNotNull(packageName),
    description = description,
    apkFileType = apkFileType,
    appIconColor = appIconColor,
    signatures = signatures,
    targets = targets.filter { it.description != PHONE_BUILD },
    formFactor = FormFactor.TV,
)
