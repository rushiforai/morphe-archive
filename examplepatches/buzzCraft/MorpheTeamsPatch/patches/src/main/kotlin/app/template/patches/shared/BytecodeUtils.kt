/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library
 *
 * Original code hard forked from:
 * https://github.com/ReVanced/revanced-patches/blob/724e6d61b2ecd868c1a9a37d465a688e83a74799/patches/src/main/kotlin/app/revanced/util/BytecodeUtils.kt
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
 *
 * NOTE (buzzCraft fork): trimmed from the original ~1800-line BytecodeUtils.kt
 * (part of rushiranpise/morphe-patches) down to only the returnEarly() /
 * returnEarly(Boolean) overloads actually used by the Teams integrity-bypass
 * and privacy patches in this repo, plus their direct dependencies. The
 * `returnLate` branch of overrideReturnValue() was dropped since it is never
 * reached by any call in this trimmed module (returnEarly always passes
 * returnLate = false) — behavior for the retained path is unchanged from the
 * original file.
 */

package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

private const val RETURN_TYPE_MISMATCH = "Mismatch between override type and Method return type"

fun Boolean.toHexString(): String = if (this) "0x1" else "0x0"

private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.overrideReturnValue(value: String?) {
    val instructions = if (value != null && (returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/CharSequence;")) {
        """
            const-string v0, "$value"
            return-object v0
        """
    } else when (returnType.first()) {
        // If return type is an object, always return null.
        'L', '[' -> {
            """
                const/4 v0, 0x0
                return-object v0
            """
        }

        'V' -> {
            "return-void"
        }

        'B', 'Z' -> {
            """
                const/4 v0, $value
                return v0
            """
        }

        'S', 'C' -> {
            """
                const/16 v0, $value
                return v0
            """
        }

        'I', 'F' -> {
            """
                const v0, $value
                return v0
            """
        }

        'J', 'D' -> {
            """
                const-wide v0, $value
                return-wide v0
            """
        }

        else -> throw Exception("Return type is not supported: $this")
    }

    addInstructions(0, instructions)
}

/**
 * Overrides the first instruction of a method with a return-void instruction.
 * None of the method code will ever execute.
 */
fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.returnEarly() {
    check(returnType.first() == 'V') {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(false.toHexString())
}

/**
 * Overrides the first instruction of a method with a constant `Boolean` return value.
 * None of the original method code will execute.
 *
 * For methods that return an object or any array type, calling this method with `false`
 * will force the method to return a `null` value.
 */
fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.returnEarly(value: Boolean) {
    check(returnType.first() == 'Z') {
        RETURN_TYPE_MISMATCH
    }
    overrideReturnValue(value.toHexString())
}
