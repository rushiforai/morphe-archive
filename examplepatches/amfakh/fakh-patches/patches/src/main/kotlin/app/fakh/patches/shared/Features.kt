/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefBy

/**
 * A runtime switch of a patch, listed in the app's Fakh Patches settings and read by its hooks through the
 * extension's `Features.on(id)`.
 *
 * @param id The key the switch is saved under and the hooks ask for.
 * @param title The English title; the extension translates it.
 * @param section The group the settings list it under.
 * @param dependsOn The feature this one needs on; this one is off while that one is.
 * @param restart Whether a change applies only after the app restarts.
 * @param default Whether the switch is on until the user changes it.
 * @param description What the switch does, for a switch whose title does not say; the extension translates it.
 * @param group A header the settings list it under within its section; the features of a header are declared together.
 */
class Feature(
    val id: String,
    val title: String,
    val section: String,
    val dependsOn: Feature? = null,
    val restart: Boolean = true,
    val default: Boolean = true,
    val description: String = "",
    val group: String = "",
) {
    /** The settings list features in the order they are declared, so declare an app's features in one place. */
    internal val order = declared++

    private companion object {
        var declared = 0
    }
}

private val registered = linkedSetOf<Feature>()

private var store: String? = null

/**
 * Saves the switches in the app's own settings file [name] instead of `fakh_patches`, for an app whose own settings
 * screen saves them there.
 */
fun useStore(name: String) {
    store = name
}

/**
 * Lists [features] in the app's settings. Call it from the execute block of the patch that implements them, which
 * depends on [featuresPatch], so only the features of applied patches are listed.
 */
fun register(vararg features: Feature) {
    registered += features
}

/** Writes the features the applied patches registered into the extension's `Features.registry()`. */
val featuresPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    // Runs after every patch executed and registered its features. A patch may register before this patch executes,
    // so the list is emptied only once it is written, for the next patch run in the same process.
    finalize {
        val registry = registered
            .sortedBy { it.order }
            .joinToString("\n") {
                listOf(
                    it.id, it.title, it.section, it.dependsOn?.id.orEmpty(), it.restart, it.default, it.description,
                    it.group,
                ).joinToString("\t")
            }
        val literal = buildString {
            registry.forEach { c ->
                when (c) {
                    '"' -> append("\\\"")
                    '\\' -> append("\\\\")
                    '\n' -> append("\\n")
                    '\t' -> append("\\t")
                    else -> if (c.code < 0x20 || c.code > 0x7E) append("\\u%04x".format(c.code)) else append(c)
                }
            }
        }
        mutableClassDefBy("Lapp/fakh/extension/shared/Features;").methods.first { it.name == "registry" }.addInstructions(
            0,
            """
                const-string v0, "$literal"
                return-object v0
            """,
        )
        registered.clear()

        store?.let { name ->
            mutableClassDefBy("Lapp/fakh/extension/shared/Features;").methods.first { it.name == "store" }.addInstructions(
                0,
                """
                    const-string v0, "$name"
                    return-object v0
                """,
            )
        }
        store = null
    }
}
