/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/** `FeaturedStoreWatchfaceSections` category header (`title`, optional `iconUrl`, `showArrow`, ...). */
private val categoryHeaderFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("title", "onClick"),
    custom = { method, _ ->
        val p = method.parameterTypes.map(CharSequence::toString)
        p.size == 9 &&
            p[0] == "Ljava/lang/String;" &&
            p[1] == "Ljava/lang/String;" &&
            p[2] == "Z" &&
            p[3] == "J" &&
            p[4] == "F"
    },
)

@Suppress("unused")
val hideCategoryHeaderEmojiPatch = patch(
    name = "Hide category header emoji",
    description = "Removes emoji and icons from category headers on the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Home")
    extendWith("extensions/extension.mpe")

    execute {
        categoryHeaderFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, Lapp/fakh/extension/facer/FacerHomeCleanup;->stripLeadingEmoji(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
                const/16 p1, 0x0
            """,
        )
    }
}
