/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.patches.youtube.general.toolbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.mapping.ResourceType.ID
import app.morphe.patches.shared.mapping.hasResourceId
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.patches.youtube.utils.extension.Constants.GENERAL_CLASS_DESCRIPTOR
import app.morphe.patches.youtube.utils.feature.booleanFeatureGetter
import app.morphe.patches.youtube.utils.feature.booleanFeatureGetterResult
import app.morphe.patches.youtube.utils.feature.booleanFeatureResult
import app.morphe.patches.youtube.utils.feature.overrideBooleanDecision
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SEARCH_ASK = 45763762L
private val SearchAskLegacyGetter = booleanFeatureGetter(SEARCH_ASK)

private object SearchAskFieldFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    filters = listOf(
        resourceLiteral(ID, "ai_mode"),
        methodCall(smali = "Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V"),
    ),
)

internal fun BytecodePatchContext.patchSearchAsk(): Boolean {
    if (!hasResourceId(ID, "ai_mode")) {
        printWarn("Hide search Ask: this YouTube version has no Ask button in the search field.")
        return false
    }

    val decision = findSearchAskDecision()
    if (decision == null) {
        printWarn("Hide search Ask: the native search field decision was not found.")
        return false
    }

    val (method, resultIndex) = decision
    method.overrideBooleanDecision(resultIndex, "$GENERAL_CLASS_DESCRIPTOR->showSearchAsk(Z)Z")
    return true
}

private fun BytecodePatchContext.findSearchAskDecision(): Pair<MutableMethod, Int>? {
    val field = SearchAskFieldFingerprint.matchOrNull() ?: return null
    val layoutInstructions = field.method.implementation!!.instructions
    val decisions = field.classDef.methods.filter { method ->
        method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                layoutInstructions.any { it.getReference<MethodReference>() == method }
    }

    // The search fragment uses this decision for both the Ask layout and the Ask-specific hint arguments.
    decisions.mapNotNull { method ->
        method.booleanFeatureResult(SEARCH_ASK)?.let { method to it }
    }.singleOrNull()?.let { return it }

    // 21.13 delegates through a search-fragment wrapper. Leave the getter and its suggestion adapter caller alone.
    val getter = SearchAskLegacyGetter.matchOrNull()?.originalMethod ?: return null
    return decisions.mapNotNull { method ->
        method.booleanFeatureGetterResult(getter)?.let { method to it }
    }.singleOrNull()
}
