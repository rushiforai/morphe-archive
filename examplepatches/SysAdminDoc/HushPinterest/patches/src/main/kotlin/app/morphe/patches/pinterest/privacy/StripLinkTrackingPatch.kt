/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.handleTargets
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val PATCH = "Strip link tracking"
private const val LINKS = "$EXTENSION_PACKAGE/privacy/LinkTracking;"

/** Framework boundaries catch both obfuscated share flows and copy-link callbacks. */
internal val OUTGOING_LINK_CALLS = mapOf(
    "Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;" to
        "$LINKS->putStringExtra(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;",
    "Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;" to
        "$LINKS->putTextExtra(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;",
    "Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;" to
        "$LINKS->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;",
)

@Suppress("unused")
val stripLinkTrackingPatch = bytecodePatch(
    name = PATCH,
    description = "Removes known tracking parameters from URLs shared or copied from Pinterest. " +
        "Keeps the destination, other parameters and opaque pin.it links. Turn it off or pause " +
        "HushPinterest to share the original URLs.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("stripLinkTracking")
        requireStatusMethod("linkTracking")
        val counts = redirectPrivacyCalls(OUTGOING_LINK_CALLS)
        val covered = handleTargets(PATCH, "outgoing link boundaries", listOf("shared text", "copied text")) { target ->
            val covered = counts.any { (call, count) -> count > 0 &&
                (if (target == "shared text") call.startsWith("Landroid/content/Intent;")
                else call.startsWith("Landroid/content/ClipData;")) }
            if (covered) null else "no $target boundary was found"
        }
        if (covered == 2) enableCapability("linkTracking")
        enableStatus("stripLinkTracking")
    }
}
