package app.aidan.patches.geocaching.dev

import app.aidan.patches.geocaching.shared.COMPATIBILITY_GEOCACHING
import app.aidan.patches.geocaching.shared.patchAllPremiumChecksToValue
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val enableDeveloperToolsPatch = bytecodePatch(
    name = "Enable Developer Tools and Feature Flags",
    description = "Exposes the internal Debug Menu in Settings and provides selectors for LaunchDarkly feature flags, Remote Config controls, and remaining membership gates.",
    default = false
) {
    category("Developer")
    compatibleWith(COMPATIBILITY_GEOCACHING)

    // Internal Debug & Diagnostic Surfaces
    val exposeDebugMenuInSettings = booleanOption(
        key = "exposeDebugMenuInSettings",
        title = "Expose Debug Menu in Settings",
        description = "Restores the internal Debug Menu item in Settings (LaunchDarkly overrides, Remote Config overrides, AutoLogger, Style/Component/Tooltip previews, and DebugSharedPrefs toggles).",
        default = true
    )

    // Remaining Client Membership Gates
    val unlockTrailsMapTypeGate = booleanOption(
        key = "unlockTrailsMapTypeGate",
        title = "Unlock Trails Map Types",
        description = "Unlocks Trails and Wheelchair Trails in MapTypeSelectionFragment when OpenStreetMap Drop-in Replacement is not enabled.",
        default = true
    )

    val unlockNewsletterSettingsGate = booleanOption(
        key = "unlockNewsletterSettingsGate",
        title = "Unlock Newsletter Language Settings",
        description = "Unlocks newsletter language selection and hides the Basic-account upgrade banner in NewsletterSettingsFragment.",
        default = true
    )

    val unlockHideCachePremiumOption = booleanOption(
        key = "unlockHideCachePremiumOption",
        title = "Unlock Hide Cache Premium Controls",
        description = "Enables Premium-only controls in HideCacheViewModel and ConversationViewModel GC code validation.",
        default = true
    )

    // LaunchDarkly Feature Flag Selectors
    val enableShareablesInApp = booleanOption(
        key = "enableShareablesInApp",
        title = "Enable Shareables",
        description = "Enables in-app Shareables and the Shareables filter (show-shareables, mobile-shareables-filter).",
        default = false
    )

    val enableCollaborativeLists = booleanOption(
        key = "enableCollaborativeLists",
        title = "Enable Collaborative Lists",
        description = "Enables the collaborative lists feature in Listhub (collab-list-release).",
        default = false
    )

    val enableLodestones = booleanOption(
        key = "enableLodestones",
        title = "Enable Lodestones",
        description = "Enables Lodestone features across the app (show-lodestones-mobile, show-lodestone-mobile-finders).",
        default = false
    )

    val enableEditLogDate = booleanOption(
        key = "enableEditLogDate",
        title = "Enable Edit Log Date",
        description = "Enables editing geocache log dates and date selector (edit-geocache-log, show-log-date-selector).",
        default = false
    )

    // Remote Config Override Selectors
    val forceMapTrayEnabled = booleanOption(
        key = "forceMapTrayEnabled",
        title = "Force Map Tray Enabled",
        description = "Forces the map tray feature enabled (mapTray).",
        default = false
    )

    val forceHideLastLogCount = booleanOption(
        key = "forceHideLastLogCount",
        title = "Force Hide Last Log DNF",
        description = "Forces hiding the last log DNF count (hideLastLogDNF).",
        default = false
    )

    val forceShowDowntimeBanner = booleanOption(
        key = "forceShowDowntimeBanner",
        title = "Force Show Downtime Banner",
        description = "Forces the downtime maintenance banner visible (showMobileDowntimeBanner).",
        default = false
    )

    execute {
        if (exposeDebugMenuInSettings.value == true) {
            patchSettingsDebugMenu()
        }
        if (unlockTrailsMapTypeGate.value == true) {
            patchTrailsMapTypeGate()
        }
        if (unlockNewsletterSettingsGate.value == true) {
            patchNewsletterSettingsGate()
        }
        if (unlockHideCachePremiumOption.value == true) {
            patchHideCachePremiumOption()
        }

        val ldFlags = mutableListOf<String>()
        if (enableShareablesInApp.value == true) {
            ldFlags.add("show-shareables")
            ldFlags.add("mobile-shareables-filter")
            patchShareablesBillingGate()
        }
        if (enableCollaborativeLists.value == true) {
            ldFlags.add("collab-list-release")
        }
        if (enableLodestones.value == true) {
            ldFlags.add("show-lodestones-mobile")
            ldFlags.add("show-lodestone-mobile-finders")
        }
        if (enableEditLogDate.value == true) {
            ldFlags.add("edit-geocache-log")
            ldFlags.add("show-log-date-selector")
        }
        if (ldFlags.isNotEmpty()) {
            patchLaunchDarklyFlags(ldFlags)
        }

        val rcFlags = mutableListOf<String>()
        if (forceMapTrayEnabled.value == true) {
            rcFlags.add("mapTray")
        }
        if (forceHideLastLogCount.value == true) {
            rcFlags.add("hideLastLogDNF")
        }
        if (forceShowDowntimeBanner.value == true) {
            rcFlags.add("showMobileDowntimeBanner")
        }
        if (rcFlags.isNotEmpty()) {
            patchRemoteConfigFlags(rcFlags)
        }
    }
}

/**
 * Restores the internal Debug Menu item in SettingsFragment.w by appending an fma.b row
 * section after the last settings section.
 */
private fun BytecodePatchContext.patchSettingsDebugMenu() {
    val debugRowClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/settings/m;")
    val initMethod = debugRowClass.methods.firstOrNull {
        it.name == "<init>"
    } ?: throw PatchException("settings/m.<init> not found")
    initMethod.accessFlags = (initMethod.accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value

    val settingsClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsFragment;")
    val wMethod = settingsClass.methods.firstOrNull {
        it.name == "w" &&
            it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) ==
            listOf("Lct8;", "Lgo1;", "I") &&
            it.implementation != null
    } ?: throw PatchException("SettingsFragment.w(Lct8;Lgo1;I)V not found")

    val impl = wMethod.implementation ?: throw PatchException("Missing implementation in SettingsFragment.w")
    val instructions = impl.instructions.toList()

    val sectionIndices = instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_STATIC &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.name == "b" && m.definingClass == "Lfma;"
                } == true
            } == true
    }.map { it.index }
    if (sectionIndices.isEmpty()) {
        throw PatchException("No Lfma;->b sections found in SettingsFragment.w")
    }
    val insertIdx = sectionIndices.last() + 1

    // v0 is the fragment and v7 the composer at this point. v3, v4, v5 and v8 are dead:
    // the original code immediately overwrites them (const-string v3 "10.24.0", v4/v5/v8).
    val smali = """
        new-instance v3, Lcom/groundspeak/geocaching/intro/fragments/settings/m;
        invoke-direct {v3}, Lcom/groundspeak/geocaching/intro/fragments/settings/m;-><init>()V
        invoke-static {v3}, Lba1;->c(Ljava/lang/Object;)Ljava/util/List;
        move-result-object v3
        invoke-virtual {v0}, Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsFragment;->x()Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsViewModel;
        move-result-object v5
        new-instance v8, Lzla;
        const/4 v4, 0x0
        invoke-direct {v8, v0, v4}, Lzla;-><init>(Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsFragment;B)V
        check-cast v8, Lx74;
        const/4 v4, 0x0
        invoke-static {v3, v5, v8, v7, v4}, Lfma;->b(Ljava/util/List;Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsViewModel;Lx74;Lgo1;I)V
    """.trimIndent()

    wMethod.addInstructions(insertIdx, smali)
}

/**
 * Unlocks Trails and Wheelchair Trails map types in MapTypeSelectionFragment.
 */
private fun BytecodePatchContext.patchTrailsMapTypeGate() {
    val nb7Class = mutableClassDefBy("Lnb7;")
    val invokeMethod = nb7Class.methods.firstOrNull {
        it.name == "invoke" && it.returnType == "Ljava/lang/Object;" && it.implementation != null
    } ?: throw PatchException("nb7.invoke not found")

    val impl = invokeMethod.implementation ?: throw PatchException("Missing implementation in nb7.invoke")
    val instructions = impl.instructions.toList()
    val strIdx = instructions.indexOfFirst {
        it.opcode == Opcode.CONST_STRING &&
            (it as? ReferenceInstruction)?.reference?.toString() == "userIsPremium"
    }
    if (strIdx < 0) {
        throw PatchException("Could not find userIsPremium in nb7.invoke")
    }
    val moveResultIdx = instructions.subList(strIdx, instructions.size).indexOfFirst {
        it.opcode == Opcode.MOVE_RESULT
    }
    if (moveResultIdx < 0) {
        throw PatchException("Could not find move-result after userIsPremium in nb7.invoke")
    }
    val actualIdx = strIdx + moveResultIdx
    val reg = (instructions[actualIdx] as OneRegisterInstruction).registerA
    invokeMethod.addInstructions(actualIdx + 1, "const/4 v$reg, 0x1")
}

/**
 * Unlocks newsletter language settings in NewsletterSettingsFragment.
 */
private fun BytecodePatchContext.patchNewsletterSettingsGate() {
    val q97Class = mutableClassDefBy("Lq97;")
    val invokeMethod = q97Class.methods.firstOrNull {
        it.name == "invoke" && it.returnType == "Ljava/lang/Object;" && it.implementation != null
    } ?: throw PatchException("q97.invoke not found")
    patchAllPremiumChecksToValue(invokeMethod, "NewsletterSettingsFragment isUserPremium (q97.invoke)", true)
}

/**
 * Unlocks Hide Cache controls and ConversationViewModel GC code validation.
 */
private fun BytecodePatchContext.patchHideCachePremiumOption() {
    val hideCacheClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/profile/hidesandfinds/hidecache/t;")
    val premiumMethod = hideCacheClass.methods.firstOrNull {
        it.name == "i" && it.returnType == "Z" && it.implementation != null
    } ?: throw PatchException("hidecache/t.i()Z not found")
    patchAllPremiumChecksToValue(premiumMethod, "hidecache/t.i", true)

    val convoClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/messagecenter/ConversationViewModel\$validateGcCode\$2;")
    val convoMethod = convoClass.methods.firstOrNull {
        it.name == "invokeSuspend" && it.implementation != null
    } ?: throw PatchException("ConversationViewModel\$validateGcCode\$2.invokeSuspend not found")
    patchAllPremiumChecksToValue(convoMethod, "ConversationViewModel\$validateGcCode\$2", true)
}

/**
 * Unlocks billing gate in ShareablesViewModel init.
 */
private fun BytecodePatchContext.patchShareablesBillingGate() {
    val shareablesClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/shareables/o;")
    val shareablesInit = shareablesClass.methods.firstOrNull {
        it.name == "<init>" && it.implementation != null
    } ?: throw PatchException("shareables.o.<init> not found")
    patchAllPremiumChecksToValue(shareablesInit, "shareables.o.<init>", true)
}

/**
 * Evaluates LaunchDarkly feature flags to true before falling back to SharedPreferences,
 * while preserving manual in-app overrides from LaunchDarklyOverrideFragment.
 */
private fun BytecodePatchContext.patchLaunchDarklyFlags(flags: List<String>) {
    val ldClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/b;")
    val iMethod = ldClass.methods.firstOrNull {
        it.name == "i" && it.returnType == "Z" && it.implementation != null
    } ?: throw PatchException("LaunchDarkly b.i not found")

    val sb = StringBuilder()
    sb.appendLine(
        """
        invoke-static {}, Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/b;->e()Landroid/content/SharedPreferences;
        move-result-object v0
        iget-object v1, p0, Lcom/groundspeak/geocaching/intro/analytics/launchdarkly/LaunchDarklyFlag;->A:Ljava/lang/String;
        invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :cond_ld_fallthrough
        """.trimIndent()
    )

    flags.forEachIndexed { index, flagKey ->
        sb.appendLine(
            """
            const-string v0, "$flagKey"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :cond_ld_next_$index
            const/4 v0, 0x1
            return v0
            :cond_ld_next_$index
            """.trimIndent()
        )
    }

    sb.appendLine(":cond_ld_fallthrough")

    iMethod.addInstructions(0, sb.toString().trimIndent())
}

/**
 * Evaluates Remote Config feature flags to true in ku9.a, while preserving manual
 * in-app overrides from RemoteConfigDebugFragment.
 */
private fun BytecodePatchContext.patchRemoteConfigFlags(flags: List<String>) {
    val rcClass = mutableClassDefBy("Lku9;")
    val aMethod = rcClass.methods.firstOrNull {
        it.name == "a" && it.parameterTypes.size == 3 && it.returnType == "Z" && it.implementation != null
    } ?: throw PatchException("ku9.a(ku9, String, boolean) not found")

    val sb = StringBuilder()
    sb.appendLine(
        """
        iget-object v0, p0, Lku9;->a:Landroid/content/Context;
        const-string v1, "RemoteConfig.REMOTE_CONFIG_DEBUG_PREFS"
        const/4 p0, 0x0
        invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
        move-result-object v0
        invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :cond_check_rc_patch
        invoke-interface {v0, p1, p0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result p0
        return p0
        :cond_check_rc_patch
        """.trimIndent()
    )

    flags.forEachIndexed { index, rcKey ->
        sb.appendLine(
            """
            const-string v0, "$rcKey"
            invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :cond_next_rc_$index
            const/4 p0, 0x1
            return p0
            :cond_next_rc_$index
            """.trimIndent()
        )
    }

    sb.appendLine("return p2")

    aMethod.addInstructions(0, sb.toString().trimIndent())
}
