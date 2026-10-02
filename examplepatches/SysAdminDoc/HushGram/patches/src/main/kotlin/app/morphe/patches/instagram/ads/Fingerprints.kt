/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The method that puts a sponsored item into a feed and answers whether it went in. It writes the
 * "Is ad pod" key into its debug map and flags a "cross_surface_duplicate_ad", strings no other
 * method in Instagram 449 carries. Its class and name are Redex names, so the fingerprint uses only
 * those strings and the method's shape.
 */
internal object AdInjectorFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("cross_surface_duplicate_ad", "Is ad pod"),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 3 },
)
