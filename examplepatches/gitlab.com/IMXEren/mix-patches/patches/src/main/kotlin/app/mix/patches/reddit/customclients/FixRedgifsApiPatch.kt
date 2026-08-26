/*
 * Copyright 2026 wchill, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.customclients

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

fun fixRedgifsApiPatch(
    extensionPatch: Patch<*>,
    block: BytecodePatchBuilder.() -> Unit = {},
) = bytecodePatch(
    name = "Fix Redgifs API",
    default = true
) {
    dependsOn(
        extensionPatch,
        bytecodePatch {
            execute {
                Fingerprint(
                    definingClass = "Lapp/mix/extension/shared/fixes/redgifs/BaseFixRedgifsApiPatch;",
                    name = "isPatchIncluded",
                ).method.returnEarly(true)
            }
        }
    )

    block()
}
