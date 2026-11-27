/*
 * Copyright 2026 pixel10pro-camera-patches contributors
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.photos

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("UseMorpheGooglePhotosPatch")

/** Google Photos' original package name, as Pixel Camera hard-codes it. */
internal const val STOCK_PHOTOS_PACKAGE = "com.google.android.apps.photos"

/** Default package name of Google Photos patched by Morphe (GmsCore support). */
internal const val MORPHE_PHOTOS_PACKAGE = "app.morphe.android.apps.photos"

/** Authority of Photos' "mars" content provider in the stock app. */
internal const val STOCK_MARS_AUTHORITY = "com.google.android.libraries.photos.api.mars"

/**
 * Pure function that mirrors, for Pixel Camera, the renaming that Morphe's
 * Google Photos GmsCore support patch applies inside Photos itself
 * (Akash-Sriram/morphe-google-photos, `googlephotos/misc/gms/GmsCoreSupportPatch.kt`,
 * commit 059419c, and the shared GmsCore manifest transform):
 *
 * - the package name, exact match;
 * - `package:<pkg>` URIs (app-details settings intent);
 * - every string starting with `com.google.android.apps.photos.mars.` - this
 *   covers the review actions `…mars.api.ACTION_REVIEW` and `…_SECURE`,
 *   which the patched Photos declares as `<pkg>.mars.api.ACTION_REVIEW[_SECURE]`;
 * - the mars provider authority `com.google.android.libraries.photos.api.mars`
 *   (with or without `content://`), which becomes `<pkg>.api.mars`.
 *
 * Everything else is left untouched on purpose. In particular the intent
 * extras `com.google.android.apps.photos.api.secure_mode[_ids]`, the
 * `jetty` creator extras and actions, and fully qualified class names
 * (e.g. `…cameraassistant.CameraAssistantService`) are not renamed by the
 * Photos patch, so they must keep their original value here too.
 *
 * Returns null when [original] must not change.
 */
internal fun retargetPhotosString(original: String, photosPackage: String, marsAuthority: String): String? {
    if (photosPackage == STOCK_PHOTOS_PACKAGE) return null
    return when {
        original == STOCK_PHOTOS_PACKAGE -> photosPackage
        original == "package:$STOCK_PHOTOS_PACKAGE" -> "package:$photosPackage"
        original.startsWith("$STOCK_PHOTOS_PACKAGE.mars.") ->
            photosPackage + original.removePrefix(STOCK_PHOTOS_PACKAGE)
        original.startsWith(STOCK_MARS_AUTHORITY) ->
            marsAuthority + original.removePrefix(STOCK_MARS_AUTHORITY)
        original.startsWith("content://$STOCK_MARS_AUTHORITY") ->
            "content://" + marsAuthority + original.removePrefix("content://$STOCK_MARS_AUTHORITY")
        else -> null
    }
}

@Suppress("unused")
val useMorpheGooglePhotosPatch = bytecodePatch(
    name = "Use Morphe Google Photos",
    description = "Makes Pixel Camera open captured media in Google Photos patched with Morphe " +
        "(renamed package) instead of the stock Google Photos, including lock screen " +
        "(secure) review. Do not combine with \"Use third-party gallery\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PIXEL_CAMERA)

    val photosPackageOption = stringOption(
        key = "photosPackageName",
        default = MORPHE_PHOTOS_PACKAGE,
        values = mapOf(
            "Morphe Google Photos" to MORPHE_PHOTOS_PACKAGE,
            "ReVanced Google Photos" to "app.revanced.android.photos",
        ),
        title = "Google Photos package name",
        description = "Package name of the patched Google Photos installed on the device. " +
            "Check it in Morphe Manager or with: adb shell pm list packages photos",
        required = true,
    ) { !it.isNullOrBlank() && it.matches(Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+")) }

    val marsAuthorityOption = stringOption(
        key = "photosMarsAuthority",
        default = null,
        title = "Google Photos mars provider authority",
        description = "Authority of the patched Photos' mars content provider. Leave empty to " +
            "use \"<package name>.api.mars\", which is what Morphe's Photos patch produces.",
        required = false,
    )

    fun photosPackage(): String = photosPackageOption.value
        ?: throw PatchException("Google Photos package name is not set.")

    fun marsAuthority(): String = marsAuthorityOption.value?.takeIf { it.isNotBlank() }
        ?: "${photosPackage()}.api.mars"

    // Package visibility (Android 11+): Pixel Camera declares
    // <queries><package android:name="com.google.android.apps.photos"/></queries>.
    // Without the renamed package listed there, getPackageInfo() and
    // resolveActivity() on the patched Photos return null/throw.
    dependsOn(
        resourcePatch {
            execute {
                val target = photosPackage()
                var retargeted = 0
                document("AndroidManifest.xml").use { document ->
                    val packages = document.getElementsByTagName("package")
                    for (i in 0 until packages.length) {
                        val element = packages.item(i) as? Element ?: continue
                        if (element.parentNode?.nodeName != "queries") continue
                        if (element.getAttribute("android:name") == STOCK_PHOTOS_PACKAGE) {
                            element.setAttribute("android:name", target)
                            retargeted++
                        }
                    }
                }
                if (retargeted != 1) {
                    throw PatchException(
                        "Expected exactly one <queries><package> entry for $STOCK_PHOTOS_PACKAGE " +
                            "in Pixel Camera's manifest, found $retargeted.",
                    )
                }
            }
        },
    )

    execute {
        val target = photosPackage()
        val mars = marsAuthority()
        val counts = linkedMapOf<String, Int>()

        classDefForEach { classDef ->
            // Cheap read-only scan first; only classes with a hit become mutable.
            val hits = classDef.methods.mapNotNull { method ->
                val instructions = method.implementation?.instructions ?: return@mapNotNull null
                val indices = instructions.withIndex().filter { (_, ins) ->
                    (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) &&
                        retargetPhotosString(
                            ((ins as ReferenceInstruction).reference as StringReference).string,
                            target,
                            mars,
                        ) != null
                }.map { it.index }
                if (indices.isEmpty()) null else method to indices
            }
            if (hits.isEmpty()) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            for ((method, indices) in hits) {
                val mutableMethod = mutableClass.methods.first {
                    it.name == method.name &&
                        it.returnType == method.returnType &&
                        it.parameterTypes == method.parameterTypes
                }
                for (index in indices) {
                    val ins = mutableMethod.implementation!!.instructions[index]
                    val original = ((ins as ReferenceInstruction).reference as StringReference).string
                    val replacement = retargetPhotosString(original, target, mars)!!
                    val register = (ins as OneRegisterInstruction).registerA
                    val escaped = replacement.replace("\\", "\\\\").replace("\"", "\\\"")
                    mutableMethod.replaceInstruction(index, "const-string v$register, \"$escaped\"")
                    counts.merge(original, 1, Int::plus)
                }
            }
        }

        counts.forEach { (from, n) -> logger.info("Retargeted \"$from\" x$n") }

        // Sanity checks against the known shape of 11.1.040: the package name
        // (review intent, Photos probes, creator/service bindings) and both
        // review actions must have been found.
        val required = listOf(
            STOCK_PHOTOS_PACKAGE,
            "$STOCK_PHOTOS_PACKAGE.mars.api.ACTION_REVIEW",
            "$STOCK_PHOTOS_PACKAGE.mars.api.ACTION_REVIEW_SECURE",
        )
        val missing = required.filter { (counts[it] ?: 0) == 0 }
        if (missing.isNotEmpty()) {
            throw PatchException("Pixel Camera no longer references $missing; cannot retarget Google Photos.")
        }
    }
}
