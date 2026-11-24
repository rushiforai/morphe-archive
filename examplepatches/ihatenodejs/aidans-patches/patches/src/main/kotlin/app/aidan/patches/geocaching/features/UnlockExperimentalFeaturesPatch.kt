package app.aidan.patches.geocaching.features

import app.aidan.patches.geocaching.shared.COMPATIBILITY_GEOCACHING
import app.aidan.patches.geocaching.shared.patchAllPremiumChecksToValue
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val unlockExperimentalFeaturesPatch = bytecodePatch(
    name = "Unlock Experimental Features",
    description = "Unlocks beta and experimental features in Settings without Geocaching Premium.",
    default = false
) {
    category("Features")
    compatibleWith(COMPATIBILITY_GEOCACHING)

    val unlockAllBetaFeatures = booleanOption(
        key = "unlockAllBetaFeatures",
        title = "Unlock All Beta Projects",
        description = "Unlocks all 10% beta features (Activity Feed, Cache Log Translation, Autofill, Confetti, etc.).",
        default = true
    )

    val enableUnpersistedExperimentalFeatures = booleanOption(
        key = "enableUnpersistedExperimentalFeatures",
        title = "Enable Hidden Experimental Toggles",
        description = "Persists and enables the Collaborative Lists, Has Parking, and Trackables Only toggles in Experimental Features.",
        default = true
    )

    val bypassExperimentalServerSync = booleanOption(
        key = "bypassExperimentalServerSync",
        title = "Bypass Experimental Server Sync",
        description = "Keeps experimental feature toggles local without POSTing to or being overwritten by /mobile/v1/user/settings/mobileexperiments.",
        default = true
    )

    execute {
        patchExperimentalSettingsGate()
        removeExperimentalPremiumBadge()
        if (bypassExperimentalServerSync.value == true) {
            neutralizeExperimentalServerSync()
        }
        if (unlockAllBetaFeatures.value == true) {
            unlockBetaFeatureFlags()
        }
        if (enableUnpersistedExperimentalFeatures.value == true) {
            patchUnpersistedExperimentalFeatures()
        }
    }
}

/**
 * Neutralizes remote server synchronization for experimental features in ExperimentalRepo.
 * By default, saving a feature attempts to POST to /mobile/v1/user/settings/mobileexperiments,
 * which returns HTTP 403 Forbidden for non-beta/Basic accounts. Furthermore, whenever the app
 * resumes or navigates to the map, ExperimentalRepo.syncFeatures queries the backend and silently
 * overwrites all local experimental preferences back to false.
 *
 * Neutralizing both methods preserves user toggles strictly within local SharedPreferences.
 */
private fun BytecodePatchContext.neutralizeExperimentalServerSync() {
    val expRepoClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/experimentalfeatures/e;")
    val saveMethod = expRepoClass.methods.firstOrNull {
        it.name == "a" && it.returnType == "Ljava/lang/Object;" && it.implementation != null
    } ?: throw PatchException("ExperimentalRepo.a (saveFeatureToServer) not found")

    val syncMethod = expRepoClass.methods.firstOrNull {
        it.name == "b" && it.returnType == "Ljava/lang/Object;" && it.implementation != null
    } ?: throw PatchException("ExperimentalRepo.b (syncFeatures) not found")

    val smali = """
        sget-object v0, Lkec;->a:Lkec;
        return-object v0
    """.trimIndent()

    saveMethod.addInstructions(0, smali)
    syncMethod.addInstructions(0, smali)
}

/**
 * Bypasses the Premium upsell check in SettingsFragment.z when clicking Experimental Features,
 * opening toExperimentalFeaturesFrag directly.
 */
private fun BytecodePatchContext.patchExperimentalSettingsGate() {
    val settingsClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsFragment;")
    val zMethod = settingsClass.methods.firstOrNull {
        it.name == "z" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: throw PatchException("SettingsFragment.z not found")

    patchAllPremiumChecksToValue(zMethod, "SettingsFragment.z", true)
}

/**
 * Removes the "Premium" badge next to "Experimental features" in Settings by setting
 * the isPremium boolean in q.<init> to false. The badge flag is already absent on
 * some builds, in which case this is a no-op.
 */
private fun BytecodePatchContext.removeExperimentalPremiumBadge() {
    val rowClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/settings/q;")
    val initMethod = rowClass.methods.firstOrNull {
        it.name == "<init>" && it.implementation != null
    } ?: throw PatchException("q.<init> not found")

    val impl = initMethod.implementation ?: throw PatchException("Missing implementation in q.<init>")
    val instructions = impl.instructions.toList()

    val invokeIdx = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.INVOKE_DIRECT_RANGE &&
            (inst as? ReferenceInstruction)?.reference?.let { ref ->
                ref is MethodReference &&
                    ref.definingClass == "Lujc;" &&
                    ref.name == "<init>" &&
                    ref.parameterTypes.joinToString("") == "IILjava/lang/Integer;IZI"
            } == true
    }
    if (invokeIdx < 0) {
        throw PatchException("ujc.<init>(IILjava/lang/Integer;IZI)V call not found in q.<init>")
    }

    val range = instructions[invokeIdx] as? RegisterRangeInstruction
        ?: throw PatchException("ujc.<init> call in q.<init> is not a range invoke")
    val premiumReg = range.startRegister + 5

    val constIdx = (invokeIdx - 1 downTo 0).firstOrNull { i ->
        val inst = instructions[i]
        inst.opcode == Opcode.CONST_4 && (inst as? OneRegisterInstruction)?.registerA == premiumReg
    } ?: throw PatchException("Could not find isPremium literal v$premiumReg in q.<init>")

    when ((instructions[constIdx] as NarrowLiteralInstruction).narrowLiteral) {
        0 -> return
        1 -> initMethod.replaceInstruction(constIdx, "const/4 v$premiumReg, 0x0")
        else -> throw PatchException("Unexpected isPremium literal in q.<init>")
    }
}

/**
 * Enables LaunchDarkly feature flags (10% projects menu I, recent log icons O, and dark web descriptions X)
 * in the LaunchDarkly evaluation wrapper u36.z, making all experimental feature projects accessible and savable.
 */
private fun BytecodePatchContext.unlockBetaFeatureFlags() {
    val ldClass = mutableClassDefBy("Lu36;")
    val zMethod = ldClass.methods.firstOrNull {
        it.name == "z" &&
            it.returnType == "Z" &&
            it.parameterTypes.joinToString("") == "Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;" &&
            it.implementation != null
    } ?: throw PatchException("LaunchDarkly u36.z not found")

    val smali = """
        sget-object v0, Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;->I:Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;
        if-eq p0, v0, :cond_is_true
        sget-object v0, Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;->O:Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;
        if-eq p0, v0, :cond_is_true
        sget-object v0, Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;->X:Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;
        if-eq p0, v0, :cond_is_true
        goto :cond_not_beta
        :cond_is_true
        const/4 v0, 0x1
        return v0
        :cond_not_beta
    """.trimIndent()

    zMethod.addInstructions(0, smali)
}

/**
 * Injects the hidden experimental features (Collaborative Lists, Has Parking, Trackables Only)
 * into the ExperimentalFragment menu, overrides qh3.a to read their values from SharedPreferences,
 * and adds persistent storage in ExpFeaturesViewModel.saveFeaturePreference.
 */
private fun BytecodePatchContext.patchUnpersistedExperimentalFeatures() {
    // 1. Add g$g, g$j, g$y to ExperimentalFragment.onResume()V
    val fragmentClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/experimentalfeatures/ExperimentalFragment;")
    val onResumeMethod = fragmentClass.methods.firstOrNull {
        it.name == "onResume" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("ExperimentalFragment.onResume not found")

    val onResumeImpl = onResumeMethod.implementation ?: throw PatchException("Missing implementation in onResume")
    val onResumeInstructions = onResumeImpl.instructions.toList()

    val targetIdx = onResumeInstructions.indexOfFirst {
        it.opcode == Opcode.SGET_OBJECT &&
            (it as? ReferenceInstruction)?.reference?.toString() ==
            "Lcom/groundspeak/geocaching/intro/experimentalfeatures/g\$t;->a:Lcom/groundspeak/geocaching/intro/experimentalfeatures/g\$t;"
    }
    if (targetIdx < 0) {
        throw PatchException("Could not find g\$t reference in ExperimentalFragment.onResume")
    }

    val addIdx = onResumeInstructions.subList(targetIdx, onResumeInstructions.size).indexOfFirst {
        it.opcode == Opcode.INVOKE_VIRTUAL &&
            (it as? ReferenceInstruction)?.reference?.toString() ==
            "Lkotlin/collections/builders/ListBuilder;->add(Ljava/lang/Object;)Z"
    }
    if (addIdx < 0) {
        throw PatchException("Could not find ListBuilder.add after g\$t in ExperimentalFragment.onResume")
    }
    val insertIdx = targetIdx + addIdx + 1

    val addFeaturesSmali = """
        sget-object v3, Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}g;->a:Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}g;
        invoke-virtual {v2, v3}, Lkotlin/collections/builders/ListBuilder;->add(Ljava/lang/Object;)Z
        sget-object v3, Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}j;->a:Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}j;
        invoke-virtual {v2, v3}, Lkotlin/collections/builders/ListBuilder;->add(Ljava/lang/Object;)Z
        sget-object v3, Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}y;->a:Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}y;
        invoke-virtual {v2, v3}, Lkotlin/collections/builders/ListBuilder;->add(Ljava/lang/Object;)Z
    """.trimIndent()
    onResumeMethod.addInstructions(insertIdx, addFeaturesSmali)

    // 2. Prepend preference checks in qh3;->a(Lcom/groundspeak/geocaching/intro/experimentalfeatures/g;)Z
    val prefsClass = mutableClassDefBy("Lqh3;")
    val aMethod = prefsClass.methods.firstOrNull {
        it.name == "a" &&
            it.returnType == "Z" &&
            it.parameterTypes.joinToString("") == "Lcom/groundspeak/geocaching/intro/experimentalfeatures/g;" &&
            it.implementation != null
    } ?: throw PatchException("qh3.a not found")

    val prefsSmali = """
        sget-object v0, Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}j;->a:Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}j;
        invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :cond_exp_check_g
        iget-object v0, p0, Lqh3;->a:Landroid/content/SharedPreferences;
        const-string v1, "ExperimentalSharedPrefs.HAS_PARKING"
        const/4 v2, 0x0
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        return v0
        :cond_exp_check_g
        sget-object v0, Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}g;->a:Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}g;
        invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :cond_exp_check_y
        iget-object v0, p0, Lqh3;->a:Landroid/content/SharedPreferences;
        const-string v1, "ExperimentalSharedPrefs.COLLABORATIVE_LISTS"
        const/4 v2, 0x0
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        return v0
        :cond_exp_check_y
        sget-object v0, Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}y;->a:Lcom/groundspeak/geocaching/intro/experimentalfeatures/g${'$'}y;
        invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :cond_exp_orig
        iget-object v0, p0, Lqh3;->a:Landroid/content/SharedPreferences;
        const-string v1, "ExperimentalSharedPrefs.SHOW_TRACKABLES_ONLY"
        const/4 v2, 0x0
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        return v0
        :cond_exp_orig
    """.trimIndent()
    aMethod.addInstructions(0, prefsSmali)

    // 3. Save preferences in ExpFeaturesViewModel$saveFeaturePreference$1.invokeSuspend
    val vmSaveClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/experimentalfeatures/ExpFeaturesViewModel\$saveFeaturePreference\$1;")
    val invokeSuspendMethod = vmSaveClass.methods.firstOrNull {
        it.name == "invokeSuspend" && it.implementation != null
    } ?: throw PatchException("ExpFeaturesViewModel\$saveFeaturePreference\$1.invokeSuspend not found")

    val saveImpl = invokeSuspendMethod.implementation ?: throw PatchException("Missing implementation in invokeSuspend")
    val saveInstructions = saveImpl.instructions.toList()

    val targets = listOf(
        Pair("Lcom/groundspeak/geocaching/intro/experimentalfeatures/g\$y;", "ExperimentalSharedPrefs.SHOW_TRACKABLES_ONLY"),
        Pair("Lcom/groundspeak/geocaching/intro/experimentalfeatures/g\$j;", "ExperimentalSharedPrefs.HAS_PARKING"),
        Pair("Lcom/groundspeak/geocaching/intro/experimentalfeatures/g\$g;", "ExperimentalSharedPrefs.COLLABORATIVE_LISTS")
    )

    val insertions = targets.map { (typeDesc, prefKey) ->
        val idx = saveInstructions.indexOfFirst {
            it.opcode == Opcode.INSTANCE_OF &&
                (it as? ReferenceInstruction)?.reference?.toString() == typeDesc
        }
        if (idx < 0) {
            throw PatchException("Could not find instance-of for $typeDesc in invokeSuspend")
        }
        Triple(idx, typeDesc, prefKey)
    }.sortedByDescending { it.first }

    for ((idx, _, prefKey) in insertions) {
        val label = prefKey.substringAfterLast(".")
        val saveSmali = """
            if-eqz v8, :cond_skip_save_$label
            invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object p1
            const-string v8, "$prefKey"
            invoke-interface {p1, v8, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object p1
            invoke-interface {p1}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            const/4 v8, 0x1
            :cond_skip_save_$label
        """.trimIndent()
        invokeSuspendMethod.addInstructions(idx + 1, saveSmali)
    }
}
