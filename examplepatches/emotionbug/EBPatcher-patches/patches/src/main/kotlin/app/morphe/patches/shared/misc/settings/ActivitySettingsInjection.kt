/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.shared.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil

// EBPatcher: extracted unchanged from Morphe v1.48.0 for Music-only dependency closure.
private const val BASE_ACTIVITY_HOOK_CLASS = "Lapp/morphe/extension/shared/settings/BaseActivityHook;"

/**
 * Modifies the activity to show Morphe settings instead of its original purpose.
 */
context(patchContext: BytecodePatchContext)
internal fun modifyActivityForSettingsInjection(
    activityOnCreateFingerprint: Fingerprint,
    extensionClassType: String,
    isYouTubeMusic: Boolean
) {
    val activityOnCreateClass = activityOnCreateFingerprint.classDef
    val activityOnCreateMethod = activityOnCreateFingerprint.method

    // Modify Activity and remove all existing layout code.
    // Must modify an existing activity and cannot add a new activity to the manifest,
    // as that fails for root installations.
    activityOnCreateMethod.addInstructions(
        0,
        """
            invoke-super { p0, p1 }, ${activityOnCreateClass.superclass}->onCreate(Landroid/os/Bundle;)V
            invoke-static { p0 }, $extensionClassType->initialize(Landroid/app/Activity;)V
            return-void
        """
    )

    // Remove other methods as they will break as the onCreate method is modified above.
    activityOnCreateClass.apply {
        methods.removeIf { it != activityOnCreateMethod && !MethodUtil.isConstructor(it) }
    }

    // Override base context to allow using Morphe specific settings.
    ImmutableMethod(
        activityOnCreateClass.type,
        "attachBaseContext",
        listOf(ImmutableMethodParameter("Landroid/content/Context;", null, null)),
        "V",
        AccessFlags.PROTECTED.value,
        null,
        null,
        MutableMethodImplementation(3)
    ).toMutable().apply {
        addInstructions(
            0,
            """
                invoke-static { p1 }, $BASE_ACTIVITY_HOOK_CLASS->getAttachBaseContext(Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
                invoke-super { p0, p1 }, ${activityOnCreateClass.superclass}->attachBaseContext(Landroid/content/Context;)V
                return-void
            """
        )
    }.let(activityOnCreateClass.methods::add)

    // Override finish() to intercept back gesture.
    ImmutableMethod(
        activityOnCreateClass.type,
        if (isYouTubeMusic) "finish" else "onBackPressed",
        emptyList(),
        "V",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(3)
    ).toMutable().apply {
        // Slightly different hooks are needed, otherwise the back button can behave wrong.
        val extensionMethodName = if (isYouTubeMusic) "handleFinish" else "handleBackPress"
        val invokeFinishOpcode = if (isYouTubeMusic) "invoke-super" else "invoke-virtual"

        addInstructions(
            0,
            """
                invoke-static {}, $extensionClassType->$extensionMethodName()Z
                move-result v0
                if-nez v0, :search_handled
                $invokeFinishOpcode { p0 }, Landroid/app/Activity;->finish()V
                :search_handled
                return-void
            """
        )
    }.let(activityOnCreateClass.methods::add)
}
