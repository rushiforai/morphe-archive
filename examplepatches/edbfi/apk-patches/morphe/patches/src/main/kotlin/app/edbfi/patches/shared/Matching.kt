// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.shared

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Whether the method has every one of [flags], whatever others it has. A fingerprint's `accessFlags` must equal the
 * method's flags, so a fingerprint that needs only some of them checks them with this in its `custom` condition.
 */
internal fun Method.hasFlags(vararg flags: AccessFlags): Boolean = flags.all { it.isSet(accessFlags) }

/** Whether [reference] names [method]: same class, name, parameter types and return type. */
internal fun isCallTo(
    reference: MethodReference?,
    method: MethodReference,
) = reference != null && reference.definingClass == method.definingClass && reference.name == method.name &&
    reference.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() } && reference.returnType == method.returnType
