/*
 * Portions of this file are derived from the Morphe project.
 * https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/updates/DisablePlayStoreUpdatesPatch.kt
 * (MorpheApp/morphe-patches PR #2470: "Change manifest version code but preserve existing internal
 * version code checks".)
 *
 * Copyright 2026 Morphe. This file is part of a derivative work of the Morphe project, licensed under
 * the GNU General Public License version 3 with the additional Section 7 terms described in
 * https://github.com/MorpheApp/morphe-patches/blob/main/NOTICE - the original notices are preserved
 * here, and this derivative uses its own branding ("Forsigh Waze Patches"; no "Morphe" branding).
 * Portions of this software are provided "AS IS" by the Morphe software project. Any express or
 * implied warranties, including the implied warranties of merchantability and fitness for a
 * particular purpose, are disclaimed.
 */
package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Disable Play Store updates - Morphe's universal version-code lock, adapted to Waze.
 *
 * THE MECHANISM (upstream's): the Play Store only offers or applies an update when the store
 * listing's versionCode is higher than the installed one. Waze's manifest versionCode is raised above
 * Play's ceiling of 2,100,000,000, so the store can never see a newer build and stops offering
 * updates. Android itself accepts anything up to Int.MAX_VALUE, which the locked value stays under.
 *
 * WHERE THIS DIVERGES FROM UPSTREAM, AND WHY (both divergences are deliberate):
 *
 *  1. THE VALUE IS `2_100_000_000 + <minutes since 2026-01-01>`, NOT A FROZEN `Int.MAX_VALUE`.
 *     Waze re-extracts its bundled resources (the map skins this bundle edits) only when its
 *     versionCode *changes*; a frozen maximum would stop that re-extraction forever after the first
 *     patched install, silently freezing any later skin edit. The minutes-based value sits far above
 *     anything Waze will ever carry on Play (real codes are around 1.03 million) and moves forward on
 *     every re-patch, so the refresh keeps working. It stays below Int.MAX_VALUE with room to spare.
 *
 *  2. THE READ-PRESERVATION IS TARGETED, NOT "REWRITE EVERY READ" (upstream swaps every
 *     `PackageInfo.versionCode` read for an extension lookup returning the original value). Measured
 *     on Waze: the app's only reads of its OWN version code are the two resource-extraction gates in
 *     `com/waze/resources/h` (they must see the change - that is mechanism 1 working) and the generic
 *     accessor `com/waze/utils/n.a(Context)`, whose only callers are the push module's payload
 *     builders (`com/waze/push/p`). That one accessor is pinned here and made to report the pre-lock
 *     code, so push metadata keeps a sane number; everything else that reads `versionCode` reads
 *     other packages (GMS, Play Core, Firebase, Glide metadata) and is untouched by design.
 *     Upstream's blanket rewrite would actively break mechanism 1, which is why it is not ported.
 *
 * WHY NO EXTENSION MODULE: upstream ships its runtime helper as an extension dex. This bundle is
 * patches-only by design (see settings.gradle.kts), and the targeted accessor edit needs no runtime
 * heap - a single `const` replaces the one `iget` in that method.
 *
 * WHY THE WRITES SPLIT ACROSS PHASES: `finalize` blocks run after every patch's `execute`, so the
 * manifest write here is always the last word on the versionCode (the skin refresh's own execute
 * cannot step on it, and its guard skips a manifest that already carries a lock). The smali edit
 * runs in the bytecode patch's `finalize` because it needs `originalVersionCode`, which the resource
 * half reads during `execute` - the same read/write split upstream uses.
 *
 * Ported from MorpheApp/morphe-patches (GPLv3) - see `CREDITS.md` and the header
 * above. The original is a universal patch; everything Waze-specific here was measured on
 * 5.24.90.901 / 5.25.0.1 / 5.25.4.900 (targets fail loudly if an anchor stops binding).
 */
internal const val PLAY_LOCK_BASE = 2_100_000_000

/** Epoch minutes at 2026-01-01T00:00:00Z (1767225600 / 60). */
private const val MINUTES_AT_2026 = 29_453_760L

/** The lock value: base + minutes since 2026, so it advances on every re-patch. */
internal fun playLockVersionCode(nowMillis: Long): Int {
    val minutes = nowMillis / 60_000L - MINUTES_AT_2026
    return (PLAY_LOCK_BASE + minutes).toInt()
}

/**
 * Carries the pre-lock manifest versionCode from the resource half (execute) to the bytecode half
 * (finalize). One patcher run is single-threaded; upstream uses the same file-level pattern.
 */
private var originalVersionCode = 0

/**
 * `com.waze.utils.n.a(Context)I` - Waze's own "PackageUtils" version-code accessor. Pinned by the
 * two calls it makes (getPackageInfo + the versionCode iget) so a namesake method cannot bind.
 */
internal val PackageUtilsFingerprint = Fingerprint(
    definingClass = "Lcom/waze/utils/n;",
    name = "a",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "I",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/PackageManager;",
            name = "getPackageInfo",
            returnType = "Landroid/content/pm/PackageInfo;",
        ),
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "versionCode",
            type = "I",
        ),
    ),
)

@Suppress("unused")
private val disablePlayStoreUpdatesResourcePatch = resourcePatch {
    // Unnamed helper (not a row): reads the pre-lock code, then is the LAST writer of the manifest
    // versionCode. The same split as upstream's resource half.
    execute {
        document("AndroidManifest.xml").use { dom ->
            originalVersionCode = dom.documentElement.getAttribute("android:versionCode").toIntOrNull()
                ?: throw PatchException(
                    "playStoreUpdatesPatch: Waze's manifest carries no numeric android:versionCode, " +
                        "so the Play-lock has nothing to preserve - refusing to continue",
                )
        }
    }

    finalize {
        val locked = playLockVersionCode(System.currentTimeMillis())
        document("AndroidManifest.xml").use { dom ->
            dom.documentElement.setAttribute("android:versionCode", locked.toString())
        }
        println(
            "playStoreUpdatesPatch: versionCode locked at $locked " +
                "(above Play's 2100000000 ceiling - the store sees no newer build)",
        )
    }
}

@Suppress("unused")
val disablePlayStoreUpdatesPatch = bytecodePatch(
    name = "Disable Play Store updates",
    description = "Stops the Play Store updating Waze.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Privacy & Updates")

    dependsOn(disablePlayStoreUpdatesResourcePatch)

    finalize {
        // The targeted read-preservation: Waze's own accessor reports the pre-lock code, so the push
        // module's payloads keep a sane number instead of the lock. Runs after every execute, so
        // originalVersionCode is set by now.
        if (originalVersionCode <= 0) {
            throw PatchException(
                "playStoreUpdatesPatch: the resource half never read the manifest versionCode; " +
                    "refusing to report a preservation that was not applied",
            )
        }
        val method = PackageUtilsFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("playStoreUpdatesPatch: com.waze.utils.n.a has no implementation")
        var target = -1
        implementation.instructions.forEachIndexed { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (instruction.opcode == Opcode.IGET &&
                reference is FieldReference &&
                reference.definingClass == "Landroid/content/pm/PackageInfo;" &&
                reference.name == "versionCode" &&
                reference.type == "I"
            ) {
                target = index
            }
        }
        if (target < 0) {
            throw PatchException(
                "playStoreUpdatesPatch: com.waze.utils.n.a no longer reads PackageInfo.versionCode - " +
                    "refusing to report a preservation that was not applied",
            )
        }
        val dest = (implementation.instructions.elementAt(target) as TwoRegisterInstruction).registerA
        val params = method.parameterTypes.size +
            if ((method.accessFlags and AccessFlags.STATIC.value) != 0) 0 else 1
        val locals = implementation.registerCount - params
        val destination = if (dest < locals) "v$dest" else "p${dest - locals}"
        method.replaceInstruction(target, "const $destination, 0x${originalVersionCode.toString(16)}")
        println(
            "playStoreUpdatesPatch: com.waze.utils.n.a now reports the pre-lock code $originalVersionCode " +
                "(its push-metadata callers keep a sane number)",
        )
    }
}
