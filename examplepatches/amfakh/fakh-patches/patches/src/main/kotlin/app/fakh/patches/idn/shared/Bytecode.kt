/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn.shared

import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Every reference the method's instructions carry, as smali text. */
internal fun Method.references(): List<String> =
    implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() } ?: emptyList()
