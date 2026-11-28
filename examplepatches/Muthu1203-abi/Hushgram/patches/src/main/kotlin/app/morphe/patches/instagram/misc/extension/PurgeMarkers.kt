/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.extension

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/**
 * Instagram's build loads a marker string first thing in many of its methods, named for the class
 * and method they came from before the names were shortened: "android_purge_26_q3_" and then, for
 * instance, "ClipsFollowButtonComponent_render". The first part moves with the release, so a method
 * is found by the rest, which this pattern reads off.
 */
internal val PURGE_MARKER = Regex("""^android_purge_[^_]+_[^_]+_(.+)$""")

/** The class and method names of the markers [this] method loads. */
internal fun Method.markers(): List<String> =
    implementation?.instructions?.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return@mapNotNull null
        val string = ((instruction as ReferenceInstruction).reference as StringReference).string
        if (!string.startsWith("android_purge_")) null else PURGE_MARKER.find(string)?.groupValues?.get(1)
    }.orEmpty()

/**
 * The name Instagram's build kept for [this] class, or null. Some classes keep it in a static
 * field, "ReelOptionsOverflowHelper" or "MediaOptionsOverflowHelper", however short their own
 * name became.
 */
internal fun ClassDef.originalName(): String? =
    fields.firstOrNull { it.name == "__redex_internal_original_name" && AccessFlags.STATIC.isSet(it.accessFlags) }
        ?.let { (it.initialValue as? StringEncodedValue)?.value }
