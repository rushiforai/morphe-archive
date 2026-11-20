/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library/pull/63
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file.
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * Section 7b: Notice Preservation
 * -------------------------------
 * This entire comment block must be preserved in all copies,
 * distributions, and derivative works of this file, in both
 * original and modified source forms.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

// Modified for Heval's Morphe Patches (2026-10-11): derived from
// app.morphe.patches.all.misc.gms.gmsCorePackageQueriesPatch (morphe-patches-library dev), which
// is not in the morphe-patches-library 1.0.4 this bundle uses. A plain function called by the
// "GmsCore support" resource patch instead of a separate patch; skips packages already listed.

package app.template.patches.shared.misc.gms

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Package names that can hold a MicroG install. Android 11+ hides other packages from the app
 * unless they are listed in `<queries>`, so the extension could not see MicroG RE otherwise.
 */
internal val GMS_CORE_QUERY_PACKAGES = listOf(
    "$GMS_CORE_VENDOR_GROUP_ID.android.gms",
    "com.mgoogle.android.gms",
    "org.microg.gms",
)

/**
 * Makes every known MicroG / GMS variant visible to the package manager.
 */
internal fun Document.addGmsCorePackageQueries() {
    val queries = getElementsByTagName("queries").item(0) as? Element
        ?: createElement("queries").also { documentElement.appendChild(it) }

    val existing = buildSet {
        val packages = queries.getElementsByTagName("package")
        for (i in 0 until packages.length) {
            (packages.item(i) as? Element)?.getAttribute("android:name")?.let(::add)
        }
    }

    GMS_CORE_QUERY_PACKAGES.filter { it !in existing }.forEach { packageName ->
        queries.appendChild(
            createElement("package").apply { setAttribute("android:name", packageName) },
        )
    }
}
