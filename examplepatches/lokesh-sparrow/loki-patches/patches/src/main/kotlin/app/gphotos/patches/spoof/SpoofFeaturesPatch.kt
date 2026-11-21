/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.gphotos.patches.spoof

import app.gphotos.patches.menu.photosAccountRowPatch
import app.morphe.patcher.patch.PatchException
import app.gphotos.patches.shared.Constants.COMPATIBILITY_GPHOTOS
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * The one place Google Photos asks Android whether the device has a Pixel feature.
 *
 * Photos models its device features as an enum (Pixel 2016 … Pixel 2025, and `NEXUS_PRELOAD` for the original
 * Pixel XL) and decides availability through a `Predicate<Object>.test(Object)` that, for the enum case, reads the
 * enum's feature-name String and passes it to `PackageManager.hasSystemFeature`. The interface method keeps its
 * name under R8, and exactly one method of that shape calls `hasSystemFeature`, so this finds it in every version
 * without pinning any obfuscated class name (`baal`/`aojp` in 8.1.0).
 */
private val featurePredicate = Fingerprint(
    name = "test",
    returnType = "Z",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            target?.definingClass == "Landroid/content/pm/PackageManager;" && target.name == "hasSystemFeature"
        } == true
    },
)


/** Google Photos, when it reads the phone's identity (android.os.Build) anywhere in its own code. */
private const val HELPER = "Lapp/loki/extension/PhotosDevice;"

/** The android.os.Build fields that describe the phone. Version, ABI, chip and serial stay real. */
private val IDENTITY_FIELDS = setOf(
    "MODEL", "DEVICE", "PRODUCT", "BOARD", "HARDWARE", "BRAND", "MANUFACTURER",
    "FINGERPRINT", "ID", "DISPLAY", "TAGS", "TYPE",
)

/** Indexes of every `sget-object vX, Landroid/os/Build;->FIELD:Ljava/lang/String;` in the method. */
private fun identityReads(method: Method): List<Pair<Int, String>> {
    val instructions = method.implementation?.instructions ?: return emptyList()
    val hits = mutableListOf<Pair<Int, String>>()
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
        val field = (instruction as ReferenceInstruction).reference as? FieldReference ?: return@forEachIndexed
        if (field.definingClass == "Landroid/os/Build;" && field.type == "Ljava/lang/String;" &&
            field.name in IDENTITY_FIELDS
        ) {
            hits += index to field.name
        }
    }
    return hits
}

/** Lets the Loki Patches screen show the switch and report the patch. */
private val spoofFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.pixelspoof") }
    }
}

/**
 * Device spoof (Pixel XL), on by default with a switch in Loki Patches.
 *
 * Answers the feature question ourselves: `NEXUS_PRELOAD` reads as present, which is what Google Photos checks to
 * grant the original Pixel's unlimited original-quality backup, and every newer Pixel feature reads as absent so
 * the app never expects the paid storage tiers. Anything else the predicate asks about is left to the app
 * (the helper answers -1 for "no opinion"), so nothing outside the backup decision changes.
 */
@Suppress("unused")
val spoofFeaturesPatch = bytecodePatch(
    name = "Unlimited backup (Pixel XL)",
    description = "One switch for the whole Pixel XL entitlement: Photos believes it may back up unlimited original-" +
        "quality photos, and every upload reports this phone as a Pixel XL so Google marks it free. New photos then " +
        "read \"doesn't take up space in your account storage\". Google lists the phone as a Pixel XL under your " +
        "account's devices; creations Google renders on its servers still use your quota.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GPHOTOS)
    dependsOn(menuPatch, spoofFlag, photosAccountRowPatch)

    execute {
        val method = featurePredicate.method
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, Lapp/loki/extension/PhotosDevice;->answer(Ljava/lang/Object;)I
                move-result v0
                if-ltz v0, :ask_android
                return v0
            """,
            ExternalLabel("ask_android", method.getInstruction(0)),
        )

        // What makes the entitlement real: whether an upload is free is decided by Google's server, once, from the
        // device the upload says it came from. So every identity read in Photos' own code is followed by a call that
        // swaps in the Pixel XL value while the switch is on. Anchored on Android's field names, which no obfuscation
        // renames; Loki's own classes are left alone so the diagnostic report still names the real phone.
        var total = 0
        classDefForEach { def ->
            if (def.type.startsWith("Lapp/")) return@classDefForEach
            if (def.methods.none { identityReads(it).isNotEmpty() }) return@classDefForEach
            mutableClassDefBy(def).methods.forEach { method ->
                identityReads(method).asReversed().forEach { (index, name) ->
                    val register = (method.implementation!!.instructions.elementAt(index) as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index + 1,
                        """
                            invoke-static/range { v$register .. v$register }, $HELPER->build$name(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v$register
                        """,
                    )
                    total++
                }
            }
        }
        if (total == 0) throw PatchException("Unlimited backup: no android.os.Build identity reads found")
    }
}
