/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.czyeru.patches.tiktok.interaction.sharesheet

import app.czyeru.util.getReference
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PANEL_MARKER = "share_panel_action"

/** The share model's constructor, built from the share model builder (its one parameter). */
internal object ShareSnapshotFingerprint : Fingerprint(
    strings = listOf("click_to_respond_duration", "config_duration"),
    custom = { method, _ -> method.name == "<init>" && method.parameterTypes.size == 1 },
)

/**
 * The share sheet's action panel attach: a FrameLayout whose onAttachedToWindow names
 * `share_panel_action`. Unlike Hushfeed's version, the panel's rows are not validated here,
 * since only Copy bio and IDs hooks it (at its start).
 */
internal fun resolveSharePanel(classes: Iterable<ClassDef>): Method {
    val candidates = classes.flatMap { classDef ->
        classDef.methods.filter { method ->
            method.name == "onAttachedToWindow" && method.returnType == "V" &&
                method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.implementation?.instructions?.any {
                    it.getReference<StringReference>()?.string == PANEL_MARKER
                } == true
        }.map { classDef to it }
    }
    val (owner, method) = candidates.singleOrNull()
        ?: throw PatchException("Share sheet: expected one native action panel attach method, found ${candidates.size}.")
    if (owner.superclass != "Landroid/widget/FrameLayout;") {
        throw PatchException("Share sheet: the native action panel is no longer a FrameLayout.")
    }
    return method
}
