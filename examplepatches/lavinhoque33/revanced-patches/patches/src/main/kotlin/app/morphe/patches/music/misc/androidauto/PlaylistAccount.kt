/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.patches.music.misc.androidauto

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Native old/lock-fix stores coexist. Their preferences describe selection, unlike identity constructors. */
internal fun BytecodePatchContext.patchPlaylistAccount() {
    val stores = Fingerprint(
        strings = listOf("user_account", "user_identity_id", "datasync_id", "IS_INCOGNITO_SESSION_IDENTITY"),
    ).matchAll().map { it.originalClassDef.type }.distinct()
    check(stores.size == 2) { "Android Auto: expected both selected identity stores" }

    val constructors = stores.map { type ->
        val owner = mutableClassDefBy(type)
        val method = owner.methods.single {
            it.name == "<init>" && it.parameterTypes.size == 7 &&
                it.parameterTypes.first().toString() == "Landroid/content/SharedPreferences;"
        }
        check(owner.fields.any { it.type == "Landroid/content/SharedPreferences;" })
        val initialized = method.implementation!!.instructions.indexOfFirst {
            val call = it.getReference<MethodReference>()
            call?.name == "<init>" && call.definingClass == owner.superclass
        }
        check(initialized >= 0) { "Android Auto: identity store superclass constructor missing" }
        method to initialized + 1
    }
    constructors.forEach { (method, index) ->
        method.addInstruction(index, "invoke-static/range {p1 .. p1}, " +
            "Lapp/morphe/extension/music/patches/androidauto/AndroidAutoPlaylistAccount;" +
            "->capture(Landroid/content/SharedPreferences;)V")
    }
}
