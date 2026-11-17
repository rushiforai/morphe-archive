/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-16
 */
package app.morphe.patches.music.general.spoofappversion

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.playservice.is_6_27_or_greater
import app.morphe.patches.music.utils.playservice.versionCheckPatch
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.function.Supplier

private const val LEGACY_THEME_BRIDGE = "Lapp/morphe/extension/music/legacy/LegacyThemeBridge;"
private const val MESSAGE_LITE = "Lcom/google/protobuf/MessageLite;"

internal val legacyBrowseThemePatch = bytecodePatch(description = "Hydrate legacy Music browse themes") {
    dependsOn(sharedExtensionPatch, versionCheckPatch)

    // Extension suppliers run after dependencies. Do not merge any legacy helper into modern APKs.
    extendWithAll {
        if (is_6_27_or_greater) emptyList() else listOf(Supplier {
            object {}.javaClass.classLoader.getResourceAsStream("extensions/music-legacy-theme.mpe")
                ?: error("Missing legacy Music theme extension")
        })
    }

    execute {
        if (is_6_27_or_greater) return@execute

        val live = mutableClassDefByOrNull("Ladqc;")?.methods?.singleOrNull { method ->
            method.name == "W" && method.parameterTypes.size == 2 &&
                    method.parameterTypes.first() == "[B" && method.returnType == MESSAGE_LITE
        }
        val cachedClass = mutableClassDefByOrNull("Ladqg;")
        val cached = cachedClass?.methods?.singleOrNull { method ->
            method.name == "a" && method.parameterTypes.size == 2 && method.parameterTypes[0] == "[B" &&
                    method.parameterTypes[1] == MESSAGE_LITE && method.returnType == MESSAGE_LITE
        }
        val fallback = cachedClass?.methods?.singleOrNull { method ->
            method.name == "c" && method.parameterTypes.size == 2 && method.parameterTypes[0] == "[B" &&
                    method.parameterTypes[1] == MESSAGE_LITE && method.returnType == MESSAGE_LITE
        }
        val fallbackIndex = fallback?.implementation?.instructions?.indexOfFirst {
            it.getReference<MethodReference>()?.let { reference ->
                reference.name == "mergeFrom" && reference.parameterTypes.firstOrNull() == "[B"
            } == true
        } ?: -1

        if (live == null || cached == null || fallback == null || fallbackIndex < 0) {
            printWarn("Skipping legacy Music theme hydration: the 6.20 response-parser layout is unavailable.")
            return@execute
        }

        live.addInstructions(
            0,
            """
                invoke-static {p0}, $LEGACY_THEME_BRIDGE->hydrateResponse([B)[B
                move-result-object p0
            """,
        )
        cached.addInstructions(
            0,
            """
                invoke-static {p1}, $LEGACY_THEME_BRIDGE->hydrateResponse([B)[B
                move-result-object p1
            """,
        )
        fallback.addInstructions(
            fallbackIndex,
            """
                invoke-static {p0}, $LEGACY_THEME_BRIDGE->hydrateResponse([B)[B
                move-result-object p0
            """,
        )
    }
}
