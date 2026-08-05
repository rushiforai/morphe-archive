/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library
 *
 * Original code hard forked from:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
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

package io.github.david419kr.niconicoyt.patches.shared

import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.w3c.dom.Element

internal enum class ResourceType(val value: String) {
    ID("id"),
    STRING("string");

    companion object {
        fun fromValue(value: String) = entries.firstOrNull { it.value == value }
    }
}

private data class ResourceElement(val type: ResourceType, val name: String, val id: Long)

private lateinit var resourceMappings: MutableMap<String, ResourceElement>

private fun getResourceId(type: ResourceType, name: String) =
    resourceMappings[type.value + name]?.id
        ?: throw PatchException("Could not find resource type: $type name: $name")

internal class ResourceLiteralFilter(
    type: ResourceType,
    name: String,
    location: InstructionLocation,
) : OpcodesFilter(null as List<Opcode>?, location) {
    private val literalValue by lazy { getResourceId(type, name) }

    override fun matches(enclosingMethod: Method, instruction: Instruction): Boolean {
        return super.matches(enclosingMethod, instruction) &&
            instruction is WideLiteralInstruction &&
            instruction.wideLiteral == literalValue
    }
}

internal fun resourceLiteral(
    type: ResourceType,
    name: String,
    location: InstructionLocation = InstructionLocation.MatchAfterAnywhere(),
) = ResourceLiteralFilter(type, name, location)

internal val resourceMappingPatch = resourcePatch(default = false) {
    execute {
        document(get("res/values/public.xml").inputStream()).use { document ->
            val resources = document.documentElement.childNodes
            resourceMappings = HashMap(2 * resources.length)

            for (index in 0 until resources.length) {
                val node = resources.item(index) as? Element ?: continue
                if (node.nodeName != "public") continue

                val type = ResourceType.fromValue(node.getAttribute("type")) ?: continue
                val name = node.getAttribute("name")
                if (name.startsWith("APKTOOL")) continue
                val id = node.getAttribute("id").substring(2).toLong(16)
                resourceMappings[type.value + name] = ResourceElement(type, name, id)
            }
        }
    }

    finalize {
        resourceMappings.clear()
    }
}
