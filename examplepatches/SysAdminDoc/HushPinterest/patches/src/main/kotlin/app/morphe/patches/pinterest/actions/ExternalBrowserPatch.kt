/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireLocals
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val PATCH = "Open links in your browser"

/** Android 11+ needs these queries to find actual browsers before sending the Visit URL. */
internal val browserQueriesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val nodes = document.getElementsByTagName("queries")
            val queries = nodes.item(0) as? Element ?: document.createElement("queries").also {
                document.documentElement.appendChild(it)
            }
            for (scheme in listOf("http", "https")) {
                val existing = (0 until nodes.length).flatMap { index ->
                    val intents = (nodes.item(index) as Element).getElementsByTagName("intent")
                    (0 until intents.length).map { intents.item(it) as Element }
                }.any { intent ->
                    val actions = intent.getElementsByTagName("action")
                    val categories = intent.getElementsByTagName("category")
                    val data = intent.getElementsByTagName("data")
                    (0 until actions.length).any { (actions.item(it) as Element).getAttribute("android:name") == "android.intent.action.VIEW" } &&
                        (0 until categories.length).any { (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.BROWSABLE" } &&
                        data.length == 1 && (data.item(0) as Element).let {
                            it.attributes.length == 1 && it.getAttribute("android:scheme") == scheme
                        }
                }
                if (existing) continue
                val intent = document.createElement("intent")
                intent.appendChild(document.createElement("action").apply {
                    setAttribute("android:name", "android.intent.action.VIEW")
                })
                intent.appendChild(document.createElement("category").apply {
                    setAttribute("android:name", "android.intent.category.BROWSABLE")
                })
                intent.appendChild(document.createElement("data").apply { setAttribute("android:scheme", scheme) })
                queries.appendChild(intent)
            }
        }
    }
}

@Suppress("unused")
val externalBrowserPatch = bytecodePatch(
    name = PATCH,
    description = "Opens a pin's Visit link and profile websites in your web browser. Pinterest links and sign-in " +
        "work as before. Good if you prefer your own browser. Starts off. Turn it on in HushPinterest " +
        "settings > More settings > Links.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch, browserQueriesPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("externalBrowser")
        requireStatusMethod("visitLinks")
        val pin = pinType()
        // The long dispatcher grew a parameter in 14.38, but keeps these two literals and its pin.
        val method = Fingerprint(
            returnType = "V",
            filters = listOf(string("android_client_tracking_params_consistency"), string("_url")),
            custom = { candidate, _ -> candidate.parameterTypes.take(2).map { it.toString() } == listOf("Ljava/lang/String;", pin) },
        ).methodOrNull ?: throw PatchException("$PATCH: no pin Visit dispatcher with both URL tracking anchors")
        val header = Fingerprint(
            name = "onClick", returnType = "V", parameters = listOf("Landroid/view/View;"),
            strings = listOf("website_link"),
            custom = { candidate, _ -> candidate.fields().any { it.name == "BUSINESS_PROFILE_WEBSITE_LINK" } },
        ).methodOrNull ?: throw PatchException("$PATCH: no profile website click handler")
        val references = header.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }
        val navigation = references.distinct().singleOrNull {
            it.definingClass == "Lcom/pinterest/navigation/Navigation;" &&
                it.parameterTypes.map { type -> type.toString() } == listOf(
                    "Lcom/pinterest/framework/screens/ScreenLocation;", "Ljava/lang/String;",
                ) && it.returnType == "Lcom/pinterest/navigation/NavigationImpl;"
        } ?: throw PatchException("$PATCH: profile website navigation changed")
        val getter = references.distinct().singleOrNull {
            it.definingClass.startsWith("Lcom/pinterest/api/model/") &&
                it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        } ?: throw PatchException("$PATCH: profile website getter changed")
        val about = Fingerprint(
            name = "onClick", returnType = "V", parameters = listOf("Landroid/view/View;"),
            custom = { candidate, _ ->
                val calls = candidate.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference }
                candidate.definingClass != header.definingClass && calls != null && getter in calls && navigation in calls
            },
        ).methodOrNull ?: throw PatchException("$PATCH: no About website click handler")
        Fingerprint(
            strings = listOf("websiteUrlView"),
            custom = { candidate, _ ->
                val body = candidate.implementation?.instructions ?: return@Fingerprint false
                body.any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as? ReferenceInstruction)?.reference?.toString() == about.definingClass } &&
                    body.any {
                        val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                        call?.definingClass?.endsWith("/GestaltText;") == true &&
                            "Landroid/view/View\$OnClickListener;" in call.parameterTypes
                    }
            },
        ).methodOrNull ?: throw PatchException("$PATCH: About website listener binding changed")
        // Resolve both sites and prove scratch liveness before changing any host method.
        val websites = listOf(header, about).map { target ->
            val site = target.implementation!!.instructions.withIndex().singleOrNull {
                it.value.opcode == Opcode.INVOKE_STATIC && (it.value as? ReferenceInstruction)?.reference == navigation
            } ?: throw PatchException("$PATCH: ambiguous profile website navigation")
            val urlRegister = (site.value as FiveRegisterInstruction).registerD
            Triple(target, site.index, urlRegister to target.freeLocalsAt(PATCH, site.index, 1, highest = 255).single())
        }
        method.requireLocals(PATCH, 1)
        val url = method.parameterRegister(0)
        val model = method.parameterRegister(1)
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { $url .. $model }, $EXTENSION_PACKAGE/actions/ExternalBrowser;->open(Ljava/lang/String;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :hush_original_visit
                return-void
            """,
            ExternalLabel("hush_original_visit", method.getInstruction(0)),
        )
        for ((target, at, registers) in websites) {
            val (website, scratch) = registers
            target.addInstructionsWithLabels(
                at,
                """
                    invoke-static/range { v$website .. v$website }, $EXTENSION_PACKAGE/actions/ExternalBrowser;->openProfile(Ljava/lang/String;)Z
                    move-result v$scratch
                    if-eqz v$scratch, :hush_original_website
                    return-void
                """,
                ExternalLabel("hush_original_website", target.getInstruction(at)),
            )
        }
        enableCapability("visitLinks")
        enableStatus("externalBrowser")
    }
}
