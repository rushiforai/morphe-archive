package app.aidan.patches.geocaching.features

import app.aidan.patches.geocaching.shared.COMPATIBILITY_GEOCACHING
import app.aidan.patches.geocaching.shared.patchAllPremiumChecksToValue
import app.aidan.patches.geocaching.shared.patchIncludeOwnedDisabledCachesToNull
import app.aidan.patches.shared.compositeFeaturePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

val localPremiumPatch = compositeFeaturePatch(
    name = "Local Premium",
    description = "Enables local Premium membership status across profile and account screens, removes upgrade promotions, banners, icons, and server-dependent profile statistics, and enriches public cache details (description, hints, owner) when server blocks basic accounts.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_GEOCACHING)
    extendWith("extensions/extension.mpe")

    val showLocalPremiumWarnings = booleanOption(
        key = "showLocalPremiumWarnings",
        title = "Show Local Premium Warnings",
        description = "Shows an informational notice when opening a Premium Member Only cache, indicating that complete cache data is restricted by the server for basic accounts.",
        default = true
    )

    bytecode {
        patchProfileMembershipLabel()
        patchMapUpgradeIcon()
        patchProfileUpgradeCard()
        patchProfileStatisticsItem()
        patchSettingsFragment()
        patchAccountFragment()
        patchPreventCacheDetailsError()
        patchPreventMapSearchError()
        patchPreventNavigationLoadError()
        if (showLocalPremiumWarnings.value != false) {
            patchPmoWarningNotice()
        }
    }
}

/**
 * Forces the UserSession premium predicate (Ldic;->e()Z) to return true.
 */
private fun BytecodePatchContext.patchL3cIsPremium() {
    val userClass = mutableClassDefByOrNull("Ldic;") ?: return
    val eMethod = userClass.methods.firstOrNull {
        it.name == "e" && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: return

    val firstInst = eMethod.implementation?.instructions?.firstOrNull()
    val isAlreadyPatched = firstInst?.opcode == Opcode.CONST_4 &&
        (firstInst as? OneRegisterInstruction)?.registerA == 0 &&
        (firstInst as? NarrowLiteralInstruction)?.narrowLiteral == 1
    if (!isAlreadyPatched) {
        eMethod.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

private fun BytecodePatchContext.patchProfileModelMembershipType() {
    val profileClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/network/api/profile/OwnProfileResponse\$Profile;") ?: return
    val iMethod = profileClass.methods.firstOrNull {
        it.name == "i" && it.returnType == "I" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: return

    val firstInst = iMethod.implementation?.instructions?.firstOrNull()
    val isAlreadyPatched = firstInst?.opcode == Opcode.CONST_4 &&
        (firstInst as? OneRegisterInstruction)?.registerA == 0 &&
        (firstInst as? NarrowLiteralInstruction)?.narrowLiteral == 3
    if (!isAlreadyPatched) {
        iMethod.addInstructions(0, "const/4 v0, 0x3\nreturn v0")
    }
}

/**
 * Forces the UserSession membership-tier setter (Ldic;->t(I)V) to store the Premium tier (3).
 */
private fun BytecodePatchContext.patchL3cMembershipType() {
    val userClass = mutableClassDefByOrNull("Ldic;") ?: return
    val tMethod = userClass.methods.firstOrNull {
        it.name == "t" && it.returnType == "V" && it.parameterTypes == listOf("I") && it.implementation != null
    } ?: return

    val impl = tMethod.implementation ?: return
    val p1Reg = impl.registerCount - 1
    val firstInst = impl.instructions.firstOrNull()
    val isAlreadyPatched = firstInst?.opcode == Opcode.CONST_4 &&
        (firstInst as? OneRegisterInstruction)?.registerA == p1Reg &&
        (firstInst as? NarrowLiteralInstruction)?.narrowLiteral == 3
    if (!isAlreadyPatched) {
        tMethod.addInstructions(0, "const/4 v$p1Reg, 0x3")
    }
}

/**
 * Changes the membership title in the Profile header from the server-provided Basic label to
 * "Premium member".
 */
private fun BytecodePatchContext.patchProfileMembershipLabel() {
    patchL3cIsPremium()
    patchL3cMembershipType()
    patchProfileModelMembershipType()
    val profileMapper = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/profile/o;") ?: return
    val mapProfileMethod = profileMapper.methods.firstOrNull {
        it.name == "a" &&
            it.parameterTypes.singleOrNull() == "Lcom/groundspeak/geocaching/intro/network/api/profile/OwnProfileResponse;" &&
            it.returnType == "Lyd9;" &&
            it.implementation != null
    } ?: return

    val instructions = mapProfileMethod.implementation!!.instructions.toList()

    // Force the membership-label resource id to R.string.member_type_premium (0x7f140717).
    // Llw5.l(memberTypeId, membershipTierId) is the 10.24.0 membership-title mapper.
    for (i in 0 until instructions.size - 1) {
        val curr = instructions[i]
        val next = instructions[i + 1]
        val isMembershipMapper = curr.opcode == Opcode.INVOKE_STATIC &&
            (curr as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.name == "l" && m.definingClass == "Llw5;" && m.returnType == "I"
                } == true
            } == true
        if (isMembershipMapper && next.opcode == Opcode.MOVE_RESULT) {
            val reg = (next as OneRegisterInstruction).registerA
            val after = instructions.getOrNull(i + 2)
            val alreadyPatched = after?.opcode == Opcode.CONST &&
                (after as? OneRegisterInstruction)?.registerA == reg &&
                (after as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f140717
            if (!alreadyPatched) {
                mapProfileMethod.addInstructions(i + 2, "const v$reg, 0x7f140717")
            }
        }
    }
}

/**
 * Removes the upgrade canister and pill button from the top left of the map screen
 * by ensuring SharedMapViewModel initializes and maintains r0 (upgrade button state)
 * as false, and forcing the map UI composable to bypass the upgrade button container.
 */
private fun BytecodePatchContext.patchMapUpgradeIcon() {
    val viewModelClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel;")
    val initMethod = viewModelClass.methods.firstOrNull {
        it.name == "<init>" && it.implementation != null
    } ?: throw PatchException("SharedMapViewModel.<init> not found")
    patchAllPremiumChecksToValue(initMethod, "SharedMapViewModel.<init>", true)

    val aMethod = viewModelClass.methods.firstOrNull {
        it.name == "H" && it.implementation != null && it.parameterTypes == listOf("Lcom/groundspeak/geocaching/intro/mainmap/map/MapMode;")
    } ?: throw PatchException("SharedMapViewModel.H(MapMode) not found")
    patchAllPremiumChecksToValue(aMethod, "SharedMapViewModel.H", true)
    val mapUiClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/mainmap/map/i;")
    val bMethod = mapUiClass.methods.firstOrNull {
        it.name == "b" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("com.groundspeak.geocaching.intro.mainmap.map.i.b not found")

    val impl = bMethod.implementation ?: throw PatchException("Missing implementation in map i.b")
    val instructions = impl.instructions.toList()

    var patched = false
    for (i in 0 until instructions.size - 1) {
        val curr = instructions[i]
        val next = instructions[i + 1]
        val isBooleanValue = curr.opcode == Opcode.INVOKE_VIRTUAL &&
            (curr as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.name == "booleanValue" && m.definingClass == "Ljava/lang/Boolean;" && m.returnType == "Z"
                } == true
            } == true

        if (isBooleanValue && next.opcode == Opcode.MOVE_RESULT) {
            val reg = (next as OneRegisterInstruction).registerA
            val after = instructions.getOrNull(i + 2)
            val alreadyPatched = after?.opcode == Opcode.CONST_4 &&
                (after as? OneRegisterInstruction)?.registerA == reg
            if (!alreadyPatched) {
                bMethod.addInstructions(i + 2, "const/4 v$reg, 0x0")
            }
            patched = true
            break
        }
    }
    if (!patched) {
        throw PatchException("Could not find Boolean.booleanValue() in map i.b")
    }
}

/**
 * Removes the "Upgrade to premium" promotional card section at the bottom of the Profile screen.
 *
 * The project profile composable is now `com.groundspeak.geocaching.intro.profile.l.c(...)`
 * (was `l.b`). Its premium flag is parameter p5; forcing it true makes `if-nez p5` skip the
 * `ui.compose.p.b` upgrade card.
 */
private fun BytecodePatchContext.patchProfileUpgradeCard() {
    val profileClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/profile/l;")
    val cMethod = profileClass.methods.firstOrNull {
        it.name == "c" && it.returnType == "V" && it.implementation != null && it.parameterTypes.size == 13
    } ?: throw PatchException("com.groundspeak.geocaching.intro.profile.l.c not found")

    val impl = cMethod.implementation ?: throw PatchException("Missing implementation in profile l.c")
    val p5Reg = impl.registerCount - cMethod.parameters.size + 5
    val instructions = impl.instructions.toList()

    val branchIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IF_NEZ &&
            (instruction as? OneRegisterInstruction)?.registerA == p5Reg
    }
    if (branchIndex >= 0) {
        val prev = instructions.getOrNull(branchIndex - 1)
        val alreadyPatched = prev?.opcode == Opcode.CONST_16 &&
            (prev as? OneRegisterInstruction)?.registerA == p5Reg
        if (!alreadyPatched) {
            cMethod.addInstructions(branchIndex, "const/16 v$p5Reg, 0x1")
        }
    }
}

/**
 * Removes the Statistics item row and its trailing spacer from the Profile screen.
 *
 * In `com.groundspeak.geocaching.intro.profile.l.c`, the Statistics row is rendered via
 * `je9.p(Lmjc;->f:Lgf9;, ...)`. When local Premium is active, the row appears but navigating into it
 * fails because the statistics data relies on server-side processing unavailable to basic accounts.
 *
 * Neutralizing the `mjc.f` field access, the `je9.p` composable invocation, and the trailing spacer
 * call (`f.v`) removes the row while preserving Compose slot-table alignment.
 */
private fun BytecodePatchContext.patchProfileStatisticsItem() {
    val profileClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/profile/l;")
    val cMethod = profileClass.methods.firstOrNull {
        it.name == "c" && it.returnType == "V" && it.implementation != null && it.parameterTypes.size == 13
    } ?: throw PatchException("com.groundspeak.geocaching.intro.profile.l.c not found")

    val impl = cMethod.implementation ?: throw PatchException("Missing implementation in profile l.c")
    val instructions = impl.instructions.toList()

    val statsIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_STATIC &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.definingClass == "Lje9;" &&
                        m.name == "p" &&
                        m.parameterTypes.firstOrNull() == "Lgf9;"
                }
            } == true
    }
    if (statsIndex < 0) {
        throw PatchException("Could not find je9.p(gf9, ...) invocation in profile l.c")
    }

    val igetIndex = statsIndex - 1
    val igetInst = instructions.getOrNull(igetIndex)
    val isIgetStats = igetInst?.opcode == Opcode.IGET_OBJECT &&
        (igetInst as? ReferenceInstruction)?.reference?.let { ref ->
            (ref as? FieldReference)?.let { f ->
                f.name == "f" && f.type == "Lgf9;" && f.definingClass == "Lmjc;"
            }
        } == true

    if (!isIgetStats) {
        throw PatchException("Instruction preceding je9.p is not Lmjc;->f:Lgf9; iget-object")
    }

    val spacerIndex = statsIndex + 1
    val spacerInst = instructions.getOrNull(spacerIndex)
    val isSpacer = spacerInst?.opcode == Opcode.INVOKE_STATIC &&
        (spacerInst as? ReferenceInstruction)?.reference?.let { ref ->
            (ref as? MethodReference)?.let { m ->
                m.definingClass == "Lcom/groundspeak/geocaching/intro/ui/compose/f;" && m.name == "v"
            }
        } == true

    if (!isSpacer) {
        throw PatchException("Instruction following je9.p is not f.v spacer invoke-static")
    }

    cMethod.replaceInstruction(spacerIndex, "nop")
    cMethod.replaceInstruction(statsIndex, "nop")
    cMethod.replaceInstruction(igetIndex, "nop")
}

/**
 * Removes the "Upgrade to Premium" item from the Settings screen.
 */
private fun BytecodePatchContext.patchSettingsFragment() {
    val settingsClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsFragment;")
    val vMethod = settingsClass.methods.firstOrNull {
        it.name == "w" && it.returnType == "V" && it.implementation != null && it.parameterTypes.size == 3
    } ?: throw PatchException("SettingsFragment.w not found")

    patchAllPremiumChecksToValue(vMethod, "SettingsFragment.w", true)
}

/**
 * Changes "Membership type: Basic" to "Membership type: Premium" on the Account screen
 * and removes the "Upgrade to Premium" button item.
 */
private fun BytecodePatchContext.patchAccountFragment() {
    val accountClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/AccountFragment;")
    val wMethod = accountClass.methods.firstOrNull {
        it.name == "w" && it.returnType == "V" && it.implementation != null && it.parameterTypes.size == 4
    } ?: throw PatchException("AccountFragment.w not found")

    // 1. Override "Membership type: Basic" text with "Membership type: Premium"
    val initialInstructions = wMethod.implementation?.instructions?.toList() ?: emptyList()
    val basicLabelIdx = initialInstructions.indexOfFirst {
        (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f140719
    }
    if (basicLabelIdx >= 0) {
        val labelCallIdx = (basicLabelIdx until initialInstructions.size).firstOrNull { i ->
            val inst = initialInstructions[i]
            inst.opcode == Opcode.INVOKE_STATIC &&
                (inst as? ReferenceInstruction)?.reference?.let { ref ->
                    (ref as? MethodReference)?.let { m ->
                        m.name == "L" && m.definingClass == "Lc26;" && m.returnType == "Ljava/lang/String;"
                    } == true
                } == true
        }
        val moveResultIdx = labelCallIdx?.plus(1)
        val moveResult = moveResultIdx?.let { initialInstructions.getOrNull(it) }
        if (moveResultIdx != null && moveResult?.opcode == Opcode.MOVE_RESULT_OBJECT) {
            val reg = (moveResult as OneRegisterInstruction).registerA
            val after = initialInstructions.getOrNull(moveResultIdx + 1)
            val alreadyReplaced = after?.opcode == Opcode.CONST_STRING &&
                (after as? ReferenceInstruction)?.reference?.let { ref ->
                    (ref as? StringReference)?.string == "Membership type: Premium"
                } == true
            if (!alreadyReplaced) {
                wMethod.addInstructions(moveResultIdx + 1, "const-string v$reg, \"Membership type: Premium\"")
            }
        }
    }

    // 2. Skip the Upgrade to Premium item (settings/f0) and its trailing spacer
    val instructions = wMethod.implementation?.instructions?.toList() ?: emptyList()
    val sgetIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.SGET_OBJECT &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? FieldReference)?.let { f ->
                    f.name == "g" &&
                        f.definingClass == "Lcom/groundspeak/geocaching/intro/fragments/settings/f0;"
                }
            } == true
    }
    if (sgetIndex >= 0) {
        val targetIndex = (sgetIndex until instructions.size).firstOrNull { i ->
            val inst = instructions[i]
            inst.opcode == Opcode.INVOKE_VIRTUAL &&
                (inst as? ReferenceInstruction)?.reference?.let { ref ->
                    (ref as? MethodReference)?.let { m ->
                        m.name == "t" && m.definingClass == "Lr94;"
                    } == true
                } == true
        } ?: throw PatchException("Could not find r94.t(Z) target after settings/f0.g in AccountFragment.w")

        val targetLabel = wMethod.implementation!!.newLabelForIndex(targetIndex)
        wMethod.implementation!!.replaceInstruction(
            sgetIndex,
            BuilderInstruction30t(Opcode.GOTO_32, targetLabel)
        )
    }
}

/**
 * Prevents non-traditional cache details from being wiped out with a "Something went wrong"
 * error screen after the map loads the cache data.
 *
 * In LegacyGeocacheRepo.loadGeocache (d.e), after converting the database's LiteGeocache
 * to a LegacyGeocache and emitting it to the UI callback, preserves the LegacyGeocache reference
 * in p1 across the fetchLegacyCacheFromServer suspension point. When the server returns 403 Forbidden
 * (because basic accounts cannot fetch full non-traditional cache details from the server), the
 * repository's existing non-null cache check suppresses the error callback.
 */
private fun BytecodePatchContext.patchPreventCacheDetailsError() {
    patchLegacyGeocacheRepoLiteCache()
    patchFetchLegacyCacheFallback()
    patchSanitizeLoadedCache()
}

private fun BytecodePatchContext.patchLegacyGeocacheRepoLiteCache() {
    val dClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/model/d;") ?: return
    val eMethod = dClass.methods.firstOrNull {
        it.name == "e" &&
            it.parameterTypes.size == 3 &&
            it.parameterTypes[0] == "Ljava/lang/String;" &&
            it.parameterTypes[2].contains("Continuation") &&
            it.implementation != null
    } ?: return

    val impl = eMethod.implementation ?: return
    val instructions = impl.instructions.toList()

    val invokeLIndex = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.INVOKE_STATIC &&
            (inst as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.definingClass == "Lfj4;" &&
                        m.name == "n" &&
                        m.returnType == "Lcom/groundspeak/geocaching/intro/types/LegacyGeocache;"
                }
            } == true
    }
    if (invokeLIndex == -1) return

    val moveResultIdx = invokeLIndex + 1
    val moveResult = instructions.getOrNull(moveResultIdx) as? OneRegisterInstruction ?: return
    val reg = moveResult.registerA

    val isAlreadyPatched = instructions.any { inst ->
        (inst as? ReferenceInstruction)?.reference?.toString()?.contains("rememberLiteGeocache") == true
    }
    if (!isAlreadyPatched) {
        eMethod.addInstructions(
            moveResultIdx + 1,
            """
                move-object p1, v$reg
                invoke-static {v$reg}, Lapp/aidan/extension/geocaching/GeocacheEnrichmentBridge;->rememberLiteGeocache(Ljava/lang/Object;)V
            """.trimIndent()
        )
    }
}

/**
 * In LegacyGeocacheRepo$fetchLegacyCacheFromServer$2.invokeSuspend, intercepts the error return point
 * when server requests return 403 Forbidden (which occurs for basic accounts on traditional caches
 * with D > 1.5 or T > 1.5, or on non-traditional caches).
 *
 * Calls GeocacheEnrichmentBridge.onFetchFailed to scrape the public webpage (where non-PMO cache
 * descriptions, hints, and owner details are public) and constructs an enriched LegacyGeocache
 * wrapped in Success (xk9), persisting it to the local cache and satisfying callers seamlessly.
 */
private fun BytecodePatchContext.patchFetchLegacyCacheFallback() {
    val lambdaClass = mutableClassDefByOrNull(
        "Lcom/groundspeak/geocaching/intro/model/LegacyGeocacheRepo\$fetchLegacyCacheFromServer\$2;"
    ) ?: return

    val invokeSuspendMethod = lambdaClass.methods.firstOrNull {
        it.name == "invokeSuspend" &&
            it.parameterTypes == listOf("Ljava/lang/Object;") &&
            it.implementation != null
    } ?: return

    val impl = invokeSuspendMethod.implementation ?: return
    val instructions = impl.instructions.toList()

    val logStringIndex = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.CONST_STRING &&
            ((inst as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            "fetchLegacyCacheFromServer: error encountered while loading cache"
    }
    if (logStringIndex == -1) return

    val returnOffset = instructions.subList(logStringIndex, instructions.size)
        .indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
    if (returnOffset == -1) return
    val returnIndex = logStringIndex + returnOffset
    val failureReg = (instructions[returnIndex] as OneRegisterInstruction).registerA

    // The instruction before logStringIndex is: const-string v0, "GeocacheRepo"
    val targetIndex = logStringIndex - 1
    val thisReg = impl.registerCount - 2

    invokeSuspendMethod.addInstructions(
        targetIndex,
        """
            move-object/16 v0, v$thisReg
            invoke-static {v0, v$failureReg}, Lapp/aidan/extension/geocaching/GeocacheEnrichmentBridge;->onFetchFailed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$failureReg
        """.trimIndent()
    )
}

private fun BytecodePatchContext.patchSanitizeLoadedCache() {
    // 10.24.0 loads the database lite row through GeocacheRepo.g(String, Continuation) and converts
    // it with fj4.n; sanitize the converted LegacyGeocache before it is returned.
    val repoClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/geocache/b;") ?: return
    val gMethod = repoClass.methods.firstOrNull {
        it.name == "g" &&
            it.parameterTypes.size == 2 &&
            it.parameterTypes[0] == "Ljava/lang/String;" &&
            it.implementation != null
    } ?: return

    val impl = gMethod.implementation ?: return
    val instructions = impl.instructions.toList()
    val convertIndex = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.INVOKE_STATIC &&
            (inst as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.definingClass == "Lfj4;" &&
                        m.name == "n" &&
                        m.returnType == "Lcom/groundspeak/geocaching/intro/types/LegacyGeocache;"
                }
            } == true
    }
    if (convertIndex == -1) return

    val moveResultIdx = convertIndex + 1
    val reg = (instructions.getOrNull(moveResultIdx) as? OneRegisterInstruction)?.registerA ?: return
    val returnIndex = (moveResultIdx until instructions.size).firstOrNull { i ->
        instructions[i].opcode == Opcode.RETURN_OBJECT &&
            (instructions[i] as? OneRegisterInstruction)?.registerA == reg
    } ?: return

    val alreadyPatched = instructions.any { inst ->
        (inst as? ReferenceInstruction)?.reference?.toString()?.contains("sanitizeLoadedCache") == true
    }
    if (alreadyPatched) return

    gMethod.addInstructions(
        returnIndex,
        """
            invoke-static {v$reg}, Lapp/aidan/extension/geocaching/GeocacheEnrichmentBridge;->sanitizeLoadedCache(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$reg
            check-cast v$reg, Lcom/groundspeak/geocaching/intro/types/LegacyGeocache;
        """.trimIndent()
    )
}

/**
 * Prevents map searches from failing with HTTP 403 Forbidden when moving around the map.
 *
 * In FilterPreferences.h (dk3.h), `includeOwnedDisabledCaches` is hardcoded to Boolean.TRUE
 * for Premium accounts. Because basic accounts on Geocaching's server cannot search with
 * `includeOwnedDisabledCaches=true`, the server rejects the request with HTTP 403 Forbidden.
 *
 * Nulling out `includeOwnedDisabledCaches` ensures map search requests send only valid
 * parameters, preventing 403 errors while preserving all user-configured filters.
 */
private fun BytecodePatchContext.patchPreventMapSearchError() {
    val filterPrefsClass = mutableClassDefByOrNull("Lto3;") ?: return
    val hMethod = filterPrefsClass.methods.firstOrNull {
        it.name == "h" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Lso3;" &&
            it.implementation != null
    } ?: return
    patchIncludeOwnedDisabledCachesToNull(hMethod)
    sanitizeFilterPreferencesInPlace(hMethod)
}

/**
 * Injects `GeocacheFilterBridge.sanitizeFilterModel` before FilterPreferences.h() returns its
 * filter-preference value object (`Lso3;`), nulling inactive toggles that make basic-account map
 * searches fail with HTTP 403.
 */
private fun BytecodePatchContext.sanitizeFilterPreferencesInPlace(method: MutableMethod) {
    val impl = method.implementation ?: return
    val instructions = impl.instructions.toList()
    val alreadyPatched = instructions.any { inst ->
        (inst as? ReferenceInstruction)?.reference?.toString()?.contains("sanitizeFilterModel") == true
    }
    if (alreadyPatched) return

    val returnIdx = (0 until instructions.size).firstOrNull { i ->
        val inst = instructions[i]
        inst.opcode == Opcode.RETURN_OBJECT &&
            (
                instructions.getOrNull(i - 1)?.opcode == Opcode.INVOKE_DIRECT_RANGE ||
                    instructions.getOrNull(i - 1)?.opcode == Opcode.INVOKE_DIRECT
                )
    } ?: -1
    if (returnIdx == -1) return

    val reg = (instructions[returnIdx] as OneRegisterInstruction).registerA
    method.addInstructions(
        returnIdx,
        """
        invoke-static {v$reg}, Lapp/aidan/extension/geocaching/GeocacheFilterBridge;->sanitizeFilterModel(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v$reg
        check-cast v$reg, Lso3;
        """.trimIndent()
    )
}

/**
 * In NavigationViewModel.l (loadCache), forces the second boolean parameter
 * (startWithFullCacheData) to false so that NavigationViewModel always queries
 * LegacyGeocacheRepo.b (loadCacheEnsuringWaypoints / local database) instead of
 * LegacyGeocacheRepo.f (loadGeocacheLocallyWithServerFallback).
 *
 * Basic accounts get 403 Forbidden when requesting full server details for
 * traditional and non-traditional caches alike on the navigation screen, which
 * causes NavigationViewModel to emit "Unable to load geocache" and leaves the
 * navigation destination at (0.0, 0.0). Using local cache data loads the coordinates
 * that the map already holds, preventing the error and pointing navigation directly to the cache.
 */
private fun BytecodePatchContext.patchPreventNavigationLoadError() {
    val navVmClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/navigationmap/NavigationViewModel;")
        ?: return

    val lMethod = navVmClass.methods.firstOrNull {
        it.name == "l" &&
            it.parameterTypes.size == 4 &&
            it.parameterTypes[1] == "Z" &&
            it.implementation != null
    } ?: return

    lMethod.addInstructions(
        0,
        """
            const/4 p2, 0x0
        """.trimIndent()
    )
}

/**
 * In GeocacheDetailsActivity.C(LegacyGeocache), shows a one-shot notice when the opened cache is
 * Premium Member Only. 10.24.0 renders cache details in Compose and no longer ships the
 * cd_item_summary.xml view holder, so the previous in-layout banner has no anchor; the notice is a
 * Toast keyed per cache code so recompositions cannot spam it.
 */
private fun BytecodePatchContext.patchPmoWarningNotice() {
    val activityClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/geocachedetails/GeocacheDetailsActivity;")
    val renderMethod = activityClass.methods.firstOrNull {
        it.name == "C" &&
            it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) ==
            listOf("Lcom/groundspeak/geocaching/intro/types/LegacyGeocache;") &&
            it.implementation != null
    } ?: throw PatchException("GeocacheDetailsActivity.C(LegacyGeocache;)V not found")

    val impl = renderMethod.implementation ?: throw PatchException("Missing implementation in GeocacheDetailsActivity.C")
    val alreadyPatched = impl.instructions.any { inst ->
        (inst as? ReferenceInstruction)?.reference?.toString()?.contains("notifyPmoRestricted") == true
    }
    if (alreadyPatched) return

    renderMethod.addInstructions(
        0,
        """
        invoke-static {p0, p1}, Lapp/aidan/extension/geocaching/GeocacheEnrichmentBridge;->notifyPmoRestricted(Landroid/content/Context;Ljava/lang/Object;)V
        """.trimIndent()
    )
}
