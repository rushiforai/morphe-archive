/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest

/**
 * The identity of the app as it was before any patch touched it. Clone renames the package and the patched APK is
 * signed with another key, but Google, Firebase and cloud logins still have to be shown the original ones.
 */
internal object OriginalApp {
    var packageName: String = ""
        private set

    /** SHA-1 of the first signing certificate of the unpatched APK, lower-case hex, or "" if it could not be read. */
    var signatureSha1: String = ""
        private set

    internal fun record(packageName: String, certificate: ByteArray?) {
        this.packageName = packageName
        signatureSha1 = certificate?.let { MessageDigest.getInstance("SHA-1").digest(it).joinToString("") { b -> "%02x".format(b) } }
            ?: ""
    }
}

/** Runs first (everything that needs the original identity depends on it) and only reads. */
internal val recordOriginalAppPatch = resourcePatch {
    execute {
        val metadata = packageMetadata
        val certificate = metadata.signingCertificates.values.firstOrNull()?.firstOrNull()?.encoded
        OriginalApp.record(metadata.packageName, certificate)
    }
}
