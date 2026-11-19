/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.pawxy.rate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchSingle
import org.w3c.dom.Element

private const val DEFAULT_TITLE = "Lustx was here"
private const val DEFAULT_BODY = "This build was patched. The original rating prompt was replaced."
private const val DEFAULT_CONFIRM = "Nice"

private object RatePopupTriggerFingerprint : Fingerprint(
    definingClass = "Lcom/pawxy/browser/core/surf/y0;",
    name = "run",
    returnType = "V",
    parameters = emptyList(),
)

@Suppress("unused")
val ratePopupTextPatch = patch(
    name = "Rate-us popup",
    description = "Removes or rewrites the rate-us popup text.",
) {
    compatibleWith(
        Compatibility(
            name = "Pawxy - Fast VPN & Web Browser",
            packageName = "com.pawxy.browser",
            apkFileType = ApkFileType.APKS_REQUIRED,
            appIconColor = 0x00E4FF,
            targets = listOf(
                AppTarget(version = "1.15.1", versionCode = 104, minSdk = 26),
            ),
        ),
    )

    val removePopup by booleanOption(
        key = "removePopup",
        default = true,
        title = "Remove popup entirely",
        description = "Prevents the rate-us dialog from ever appearing. " +
            "Off = rewrite mode (change text instead of removing).",
    )

    val customTitle = stringOption(
        key = "customTitle",
        default = DEFAULT_TITLE,
        values = mapOf(DEFAULT_TITLE to DEFAULT_TITLE),
        title = "Dialog title",
        description = "Replaces rate_app_title and rate_head. Only used if remove is off.",
        required = false,
    )

    val customBody = stringOption(
        key = "customBody",
        default = DEFAULT_BODY,
        values = mapOf(DEFAULT_BODY to DEFAULT_BODY),
        title = "Dialog body",
        description = "Replaces rate_request and rate_app_propose. Only used if remove is off.",
        required = false,
    )

    val customConfirm = stringOption(
        key = "customConfirm",
        default = DEFAULT_CONFIRM,
        values = mapOf(DEFAULT_CONFIRM to DEFAULT_CONFIRM),
        title = "Confirm button",
        description = "Replaces rate_rate_now. Only used if remove is off.",
        required = false,
    )

    execute {
        if (removePopup == true) {
            RatePopupTriggerFingerprint.matchSingle().method.addInstruction(0, "return-void")
        } else {
            val title = customTitle.value.orEmpty()
            val body = customBody.value.orEmpty()
            val confirm = customConfirm.value.orEmpty()
            if (title.isEmpty() && body.isEmpty() && confirm.isEmpty()) return@execute

            document("res/values/strings.xml").use { doc ->
                val nodes = doc.getElementsByTagName("string")
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) as Element
                    val replacement = when (element.getAttribute("name")) {
                        "rate_app_title", "rate_head" -> title
                        "rate_request", "rate_app_propose" -> body
                        "rate_rate_now" -> confirm
                        else -> ""
                    }
                    if (replacement.isNotEmpty()) element.textContent = replacement
                }
            }
        }
    }
}
