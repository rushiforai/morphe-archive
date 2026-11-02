package org.ungoogled.patches.maps.account

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * The account sheet's "Sign in" pill: a FrameLayout wrapping a MaterialButton.
 * The 26.43 wrapper has no surviving setter name. Match its FrameLayout base,
 * MaterialButton and immutable text-list fields through onMeasure, then patch
 * every constructor.
 */
internal object SignInButtonWrapperFingerprint : Fingerprint(
    name = "onMeasure",
    returnType = "V",
    parameters = listOf("I", "I"),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/widget/FrameLayout;" &&
            classDef.fields.any { it.type == "Lcom/google/android/material/button/MaterialButton;" } &&
            classDef.fields.any { it.type == "Lcom/google/common/collect/ImmutableList;" }
    },
)

/**
 * Binder for the "More from this app" section title on the account sheet: it
 * resolves the title against a Context, sets it on a TextView, then hands the
 * section's rows to their adapter. The title is non-nullable in the data model,
 * so the view is hidden after binding rather than the title removed.
 *
 * A second binder shares the first four steps; only this one passes a List to
 * its adapter straight after setText. Verified unique across all ten dex files.
 */
internal object SectionTitleBinderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        checkCast("Landroid/widget/TextView;"),
        methodCall(definingClass = "Landroid/widget/TextView;", name = "getContext"),
        methodCall(opcode = Opcode.INVOKE_STATIC, returnType = "Ljava/lang/String;"),
        methodCall(definingClass = "Landroid/widget/TextView;", name = "setText"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("Ljava/util/List;"),
            returnType = "V",
            location = MatchAfterWithin(4),
        ),
    ),
)
