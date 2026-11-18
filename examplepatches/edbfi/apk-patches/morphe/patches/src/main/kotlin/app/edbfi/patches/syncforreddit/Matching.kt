// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

// R8 renamed Sync's classes but kept each one's SourceFile attribute, so its fingerprints name the class by that.

/** A fingerprint condition: the method's class is named [sourceFile] in its SourceFile attribute, and [and] holds. */
internal fun declaredIn(
    sourceFile: String,
    and: (Method) -> Boolean = { true },
): (Method, ClassDef) -> Boolean = { method, classDef -> classDef.sourceFile == sourceFile && and(method) }

/** The method of the class named [sourceFile] that holds every one of [strings], each a complete literal. */
internal open class SourceStringsFingerprint(
    sourceFile: String,
    vararg strings: String,
) : Fingerprint(
    strings = strings.toList(),
    custom = declaredIn(sourceFile),
)
