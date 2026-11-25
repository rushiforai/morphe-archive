/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

// Adapted from the video ad hooks of HideAdsPatch.kt in morphe-patches: YouTube Kids has the same ads library.

package app.jofslash.patches.youtubekids.ads

import app.jofslash.patches.youtubekids.shared.Constants.COMPATIBILITY_YOUTUBE_KIDS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** The trigger category that expires an ad slot (it removes the slot). */
private const val SLOT_EXPIRATION_TRIGGER_CATEGORY = 6

/**
 * Handles the activated triggers of the ad slots, such as the triggers that enter a slot
 * and the triggers that expire a slot.
 */
internal object LoadVideoAdsFingerprint : Fingerprint(
    strings = listOf(
        "TriggerBundle doesn't have the required metadata specified by the trigger ",
        "Ping migration no associated ping bindings for activated trigger: ",
    ),
    filters = listOf(
        // The triggers are sorted by their category.
        fieldAccess(opcode = Opcode.IGET, type = "I"),
        methodCall(
            smali = "Landroid/util/SparseArray;->get(I)Ljava/lang/Object;",
            location = MatchAfterImmediately()
        )
    )
)

/** Builds the player ad (the ad before or in a video) from the ad slot's layout. */
internal object PlayerBytesAdLayoutFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf(
        "Bootstrapped layout construction resulted in non PlayerBytesLayout. PlayerAds count: ",
    )
)

@Suppress("unused")
val hideVideoAdsPatch = bytecodePatch(
    name = "Hide video ads",
    description = "Stops the ads YouTube Kids plays before and during videos: no ad slot is entered " +
            "and no player ad is built.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_YOUTUBE_KIDS)

    execute {
        PlayerBytesAdLayoutFingerprint.method.addInstructions(0, "return-void")

        // Only the triggers that expire the ad slots are handled, so no ad slot is entered.
        // The slots are kept until they expire, so the expiring triggers still have to run.
        LoadVideoAdsFingerprint.let {
            val categoryField =
                (it.instructionMatches.first().instruction as ReferenceInstruction).reference as FieldReference

            val filterTriggersMethod = ImmutableMethod(
                it.classDef.type,
                "patch_filterVideoAdTriggers",
                listOf(ImmutableMethodParameter("Ljava/util/List;", null, null)),
                "Ljava/util/List;",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(6),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        new-instance v0, Ljava/util/ArrayList;
                        invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                        invoke-interface { p0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
                        move-result-object v1
                        const/16 v4, $SLOT_EXPIRATION_TRIGGER_CATEGORY
                        :next_trigger
                        invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
                        move-result v2
                        if-eqz v2, :filtered_triggers
                        invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
                        move-result-object v2
                        check-cast v2, ${categoryField.definingClass}
                        iget v3, v2, $categoryField
                        if-ne v3, v4, :next_trigger
                        invoke-interface { v0, v2 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
                        goto :next_trigger
                        :filtered_triggers
                        return-object v0
                    """
                )
            }
            it.classDef.methods.add(filterTriggersMethod)

            it.method.addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $filterTriggersMethod
                    move-result-object p1
                """
            )
        }
    }
}
