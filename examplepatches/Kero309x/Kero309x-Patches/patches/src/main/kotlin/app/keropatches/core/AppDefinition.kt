// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.core

import app.morphe.patcher.patch.Compatibility

/**
 * Metadata for one supported application.
 *
 * The framework discovers patches by inspecting public static members of the
 * bundle, so this type does not register anything with the runtime. It is the
 * single source of truth for the registry, validation and tests, so that adding
 * an application is a data change rather than a change to shared code.
 *
 * @param id Stable identifier, lowercase, used in package names and spec paths.
 * @param compatibility Package, versions and signing certificates of the stock app.
 * @param specDirectory Repository-relative directory holding the behaviour specs.
 * @param extensionBundle Resource path of the runtime extension, when the app needs one.
 */
data class AppDefinition(
    val id: String,
    val compatibility: Compatibility,
    val specDirectory: String,
    val extensionBundle: String? = null,
) {
    init {
        require(ID_PATTERN.matches(id)) {
            "Application id '$id' must be lowercase alphanumeric and start with a letter."
        }

        require(compatibility.packageName != null) {
            "Application '$id' must declare the package name of the stock app."
        }

        require(compatibility.targets.isNotEmpty()) {
            "Application '$id' must declare at least one supported version."
        }

        compatibility.signatures?.forEach { signature ->
            require(CERTIFICATE_PATTERN.matches(signature)) {
                "Application '$id' has a signing certificate that is not a SHA-256 hex digest: '$signature'."
            }
        }
    }

    /** Package name of the stock application. */
    val packageName: String get() = compatibility.packageName!!

    /** Versions this definition claims support for, newest first. */
    val versions: List<String>
        get() = compatibility.targets.mapNotNull { it.version }

    private companion object {
        val ID_PATTERN = Regex("^[a-z][a-z0-9]*$")
        val CERTIFICATE_PATTERN = Regex("^[0-9a-f]{64}$")
    }
}
