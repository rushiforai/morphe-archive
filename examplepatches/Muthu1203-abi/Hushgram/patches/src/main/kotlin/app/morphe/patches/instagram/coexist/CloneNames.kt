/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.coexist

import app.morphe.patcher.patch.PatchException

internal const val PATCH = "Install next to Instagram"

/** The package Meta ships Instagram under, which the second copy gives up. */
internal const val INSTAGRAM = "com.instagram.android"

internal const val DEFAULT_PACKAGE = "$INSTAGRAM.hush"
internal const val DEFAULT_LABEL = "Instagram Clone"

/** The extension's answer to "which package is this", which the patch rewrites to the copy's. */
internal const val OWN_PACKAGE_CLASS = "Lapp/hushgram/extension/instagram/misc/OwnPackage;"

internal fun refuse(why: String): Nothing = throw PatchException("$PATCH: $why")

private const val LONGEST_PACKAGE = 120
private const val LONGEST_LABEL = 50

private val PACKAGE_PART = Regex("[A-Za-z][A-Za-z0-9_]*")

/** Characters a home screen name may hold besides letters and digits. */
private const val LABEL_MARKS = " .-_()+!,&"

/**
 * Names the copy can't take. Instagram's own and its debug build's are what it moves away from,
 * and Instagram's code treats the rest as other Meta apps by these exact names.
 */
private val TAKEN = listOf(
    INSTAGRAM, "$INSTAGRAM.debug", "com.instagram.barcelona", "com.instagram.lite", "com.instagram.threadsapp",
    "com.facebook.katana", "com.facebook.orca", "com.facebook.lite", "com.facebook.mlite", "com.facebook.wakizashi",
    "com.facebook.pages.app", "com.facebook.appmanager", "com.facebook.services", "com.facebook.system",
    "com.whatsapp", "com.whatsapp.w4b",
)

/** Why Android or this patch can't use [name] as the copy's package, or null when it can. */
internal fun clonePackageProblem(name: String?): String? {
    if (name.isNullOrEmpty()) return "the package name is empty"
    if (name.length > LONGEST_PACKAGE) return "the package name is longer than $LONGEST_PACKAGE characters"
    val parts = name.split('.')
    if (parts.size < 2) return "the package name \"$name\" needs at least one dot, like $DEFAULT_PACKAGE"
    parts.firstOrNull { !PACKAGE_PART.matches(it) }?.let { part ->
        return "the package name \"$name\" has the part \"$part\". Each part starts with a letter and holds only " +
            "letters, digits and underscores"
    }
    TAKEN.firstOrNull { it.equals(name, ignoreCase = true) }?.let { return "\"$name\" is $it, another app's package" }
    return null
}

/**
 * Why [label] can't be the copy's name on the home screen, or null when it can. It starts with a
 * letter, so the manifest never reads it as a reference, a color or a number.
 */
internal fun cloneLabelProblem(label: String?): String? {
    if (label.isNullOrEmpty()) return "the app name is empty"
    if (label.length > LONGEST_LABEL) return "the app name is longer than $LONGEST_LABEL characters"
    if (!label.first().isLetter()) return "the app name \"$label\" has to start with a letter"
    if (label.last() == ' ') return "the app name \"$label\" ends with a space"
    label.firstOrNull { !it.isLetterOrDigit() && it !in LABEL_MARKS }?.let { mark ->
        return "the app name \"$label\" holds \"$mark\". Use letters, digits, spaces and these: ${LABEL_MARKS.trim()}"
    }
    if (label.equals("true", ignoreCase = true) || label.equals("false", ignoreCase = true)) {
        return "the app name \"$label\" would be read as a yes or no"
    }
    return null
}

/** [name] moved from Instagram's package to [clone]'s when it starts with Instagram's, else null. */
internal fun underClone(name: String, clone: String): String? =
    if (name == INSTAGRAM || name.startsWith("$INSTAGRAM.") || name.startsWith("$INSTAGRAM:")) clone + name.removePrefix(INSTAGRAM)
    else null

/**
 * The copy's authority for [authority]. One under Instagram's package moves to the copy's, and
 * any other gets the copy's package in front, since two apps can't declare one authority.
 */
internal fun cloneAuthority(authority: String, clone: String): String = underClone(authority, clone) ?: "$clone.$authority"
