/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.mutable
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PATCH = "Hide ads"
private const val ADS = "$EXTENSION_PACKAGE/ads/Ads;"

/** The consent vendor Pinterest names when it starts Google's mobile ads SDK, an enum constant. */
internal const val GOOGLE_MOBILE_ADS = "GOOGLE_MOBILE_ADS"

/**
 * Takes promoted pins out of the home feed, search, related pins and boards, and folds away the
 * views Pinterest only builds for an ad.
 *
 * The pins go where every page of items reaches one of three list holders ([feedListHookPatch]),
 * so an ad is gone before Pinterest counts it as shown. The four ad-only views keep their names.
 * Each one's own `setVisibility` and `onMeasure` hold it at GONE and zero size while the switch is
 * on, so it stays folded away however often Pinterest shows it again (the closeup's floating ad bar
 * shows itself on scroll). A build that renamed all four still gets the list filter, with a warning.
 *
 * Pinterest's main screen also starts Google's mobile ads SDK for accounts in its GMA experiment.
 * That launch step returns first while the switch is on, so the SDK never starts and Pinterest's own
 * "started" check keeps every Google ad load, resume and pause path idle (2026-10-05).
 *
 * The four views keep their names in 14.38.0.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = PATCH,
    description = "Removes promoted pins from your home feed, search, related pins and boards, and hides panels " +
        "that only hold ads. Good for a cleaner feed. On by default. Turn it off in HushPinterest " +
        "settings > Feed.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch, pinterestExtensionPatch, feedListHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideAds")
        requireStatusMethod("feedAds")
        requireStatusMethod("adViews")
        requireStatusMethod("googleAds")
        val googleAds = googleAdsStart()
        val answer = googleAds?.freeLocalsAt(PATCH, 0, 1)?.single()

        if (feedListHoldersHooked > 0) enableCapability("feedAds")

        var folded = 0
        AD_ONLY_VIEWS.forEach { type ->
            val view = mutableClassDefByOrNull(type)
            if (view == null) {
                patchLog.warning("$PATCH: this build has no $type, so that panel isn't folded away")
                return@forEach
            }
            val held = listOf(
                Triple("setVisibility", listOf("I"), "adViewVisibility"),
                Triple("onMeasure", listOf("I", "I"), "adViewMeasureSpec"),
            ).count { (name, parameters, helper) -> hold(view, name, parameters, helper) }
            if (held == 0) {
                patchLog.warning("$PATCH: $type can't take an override of setVisibility or onMeasure, so that panel isn't folded away")
                return@forEach
            }
            folded++
        }
        if (folded > 0) enableCapability("adViews")
        else patchLog.warning("$PATCH: none of the ${AD_ONLY_VIEWS.size} ad-only views is in this build; the list filter still runs")

        if (googleAds != null && answer != null) {
            googleAds.addInstructionsWithLabels(0, """
                invoke-static { }, $ADS->skipGoogleAds()Z
                move-result v$answer
                if-eqz v$answer, :hush_start_google_ads
                return-void
            """, ExternalLabel("hush_start_google_ads", googleAds.getInstruction(0)))
            enableCapability("googleAds")
        }

        enableStatus("hideAds")
    }
}

/**
 * Pinterest's one launch step that starts Google's mobile ads SDK: the instance method, taking
 * nothing, that names the [GOOGLE_MOBILE_ADS] consent vendor. Null, with a warning, unless exactly
 * one method fits.
 */
private fun BytecodePatchContext.googleAdsStart(): MutableMethod? {
    val starts = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(starts) { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.SGET_OBJECT &&
                        ((instruction as ReferenceInstruction).reference as FieldReference).let { it.name == GOOGLE_MOBILE_ADS && it.type == it.definingClass }
                } == true
        }
    }
    if (starts.size != 1) {
        patchLog.warning("$PATCH: ${starts.size} launch steps start Google's ad SDK in this build instead of one, so it starts as usual")
        return null
    }
    return mutable(starts.single())
}

/**
 * Passes each int parameter of [view]'s own [name] through [helper] before anything else runs: at
 * the start of the method when the view declares it, or in an override added here that hands the
 * result to the superclass. Returns false, changing nothing, when a class above declares the method
 * final, which an override would break at class load.
 */
private fun BytecodePatchContext.hold(view: MutableClass, name: String, parameters: List<String>, helper: String): Boolean {
    val signature = parameters.joinToString("")
    val rewrite = parameters.indices.joinToString("\n") { index ->
        val register = "p${index + 1}"
        "invoke-static/range { $register .. $register }, $ADS->$helper(I)I\nmove-result $register"
    }
    val declared = view.methods.firstOrNull { method ->
        method.name == name && method.returnType == "V" && method.parameterTypes.map { it.toString() } == parameters
    }
    if (declared != null) {
        if (declared.implementation == null) return false
        declared.addInstructions(0, rewrite)
        return true
    }
    var above = view.superclass
    while (above != null) {
        val owner = classDefByOrNull(above) ?: break // a framework class: View's own aren't final
        val inherited = owner.methods.firstOrNull { method ->
            method.name == name && method.parameterTypes.map { it.toString() } == parameters
        }
        if (inherited != null && AccessFlags.FINAL.isSet(inherited.accessFlags)) return false
        above = owner.superclass
    }
    val method = ImmutableMethod(
        view.type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(parameters.size + 1),
    ).toMutable()
    method.addInstructions(
        0,
        """
            $rewrite
            invoke-super/range { p0 .. p${parameters.size} }, ${view.superclass}->$name($signature)V
            return-void
        """,
    )
    view.methods.add(method)
    return true
}
