/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original code hard forked from:
 * https://github.com/ReVanced/revanced-patches/blob/724e6d61b2ecd868c1a9a37d465a688e83a74799/patches/src/main/kotlin/app/revanced/patches/shared/misc/mapping/ResourceMappingPatch.kt
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the Morphe patches
 * LICENSE file: https://github.com/MorpheApp/morphe-patches/blob/main/NOTICE
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * File-Specific Exception to Section 7b:
 * -------------------------------------
 * Section 7b (Attribution Requirement) of the Morphe patches LICENSE
 * does not apply to THIS FILE. Use of this file does NOT require any
 * user-facing, in-application, or UI-visible attribution.
 *
 * For this file only, attribution under Section 7b is satisfied by
 * retaining this comment block in the source code of this file.
 *
 * Distribution and Derivative Works:
 * ----------------------------------
 * This comment block MUST be preserved in all copies, distributions,
 * and derivative works of this file, whether in source or modified
 * form.
 *
 * All other terms of the Morphe Patches LICENSE, including Section 7c
 * (Project Name Restriction) and the GPLv3 itself, remain fully
 * applicable to this file.
 */

package app.yydarlinker.patches.shared

import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.w3c.dom.Element

/**
 * Minimal derivative of Morphe's ResourceMappingPatch needed only for the two stable YouTube CC
 * accessibility strings. Keeping this local lets the standalone translator patch retain Morphe's
 * exact CC-controller fingerprint without depending on the full Morphe patches source tree.
 */
internal enum class CaptionResourceType(val value: String) {
    STRING("string")
}

private val captionResourceIds = HashMap<String, Long>()

private fun key(type: CaptionResourceType, name: String) = type.value + ':' + name

private fun captionResourceId(type: CaptionResourceType, name: String): Long =
    captionResourceIds[key(type, name)]
        ?: throw PatchException("Could not find resource type: $type name: $name")

internal class CaptionResourceLiteralFilter(
    private val type: CaptionResourceType,
    private val name: String,
    location: InstructionLocation,
) : OpcodesFilter(null as List<Opcode>?, location) {
    override fun matches(enclosingMethod: Method, instruction: Instruction): Boolean {
        if (!super.matches(enclosingMethod, instruction)) return false
        return instruction is WideLiteralInstruction &&
            instruction.wideLiteral == captionResourceId(type, name)
    }
}

internal fun captionResourceLiteral(
    type: CaptionResourceType,
    name: String,
    location: InstructionLocation = InstructionLocation.MatchAfterAnywhere(),
) = CaptionResourceLiteralFilter(type, name, location)

/** Decode the target APK's public resource table before bytecode fingerprints are resolved. */
internal val captionResourceMappingPatch = resourcePatch {
    execute {
        captionResourceIds.clear()
        document(get("res/values/public.xml").inputStream()).use { document ->
            val resources = document.documentElement.childNodes
            for (i in 0 until resources.length) {
                val node = resources.item(i) as? Element ?: continue
                if (node.nodeName != "public") continue
                val type = node.getAttribute("type")
                if (type != CaptionResourceType.STRING.value) continue
                val name = node.getAttribute("name")
                if (name.startsWith("APKTOOL")) continue
                val rawId = node.getAttribute("id")
                if (!rawId.startsWith("0x")) continue
                captionResourceIds[key(CaptionResourceType.STRING, name)] =
                    rawId.substring(2).toLong(16)
            }
        }
    }
}
