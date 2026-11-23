package org.ungoogled.patches.maps.search.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.ungoogled.patches.maps.ui.SHAPES
import org.ungoogled.patches.maps.ui.activityContextHookPatch
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.ungoogled.patches.shared.addInstructionsAtLabel

/** Sponsored-pin request builder: string-anchored, same style as the other single-string fingerprints. */
private object PromotedPinAdsRequestFingerprint : Fingerprint(
    name = "b",
    returnType = "V",
    parameters = listOf("Lcdix;", "Lcjdf;", "Z"),
)

/** 26.44 keeps the builder under new protobuf and request option names. */
private object PromotedPinAdsRequestFingerprint2644 : Fingerprint(
    name = "b",
    returnType = "V",
    parameters = listOf("Lcdrl;", "Lcjlw;", "Z"),
)

/** 26.47 inlined the promoted-pin request into `avbe.e(F)`, which ends by handing
 *  the options builder to `avbt.c(Lcecc;Lcnnv;)V`. */
private object PromotedPinAdsRequestFingerprint2647 : Fingerprint(
    name = "e",
    returnType = "V",
    parameters = listOf("F"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lbjva;", name = "t", type = "Lcjwt;"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, definingClass = "Lcnod;", name = "createBuilder"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, definingClass = "Lavbt;", name = "c"),
    ),
    custom = { method, _ -> method.definingClass == "Lavbe;" },
)

/**
 * Navigation's promoted-pin label controller: draws the promoted pins Maps gets with the route while
 * navigating. The class is the only one with this trace label.
 */
private object NavigationAdsLabelControllerFingerprint : Fingerprint(
    filters = listOf(string("NavigationAdsLabelController.onNavigationUiStateChanged")),
)

internal val hideAdsPatch = bytecodePatch(
    description = "Hides promoted map pins -- on the map, in search results and along a route, in directions and navigation -- " +
        "and \"Sponsored\" search result rows.",
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // Every edit below reads Shapes.HIDE_ADS, so the Customization screen's
    // "Hide sponsored content" switch can turn all of them off again; the
    // extension has to be merged in for that field to exist at all.
    dependsOn(sharedExtensionPatch, activityContextHookPatch)

    execute {
        markPatched("hideAdsPatched")

        /**
         * At method entry v0 is a free local, but only when the method has a local at all: a method
         * whose registers are just its parameters has `this` in v0, and overwriting it turns an
         * object register into a boolean (the verifier then rejects the class on first use).
         */
        fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.leaveEarlyWhenHidingAds(leave: String) {
            val parameterRegisters = parameterTypes.size +
                if (com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
            if (implementation!!.registerCount - parameterRegisters < 1) {
                throw PatchException("$definingClass->$name has no local register for the hide-ads guard")
            }
            addInstructionsWithLabels(
                0,
                """
                    sget-boolean v0, $SHAPES->HIDE_ADS:Z
                    if-eqz v0, :ads_on
                    $leave
                """,
                ExternalLabel("ads_on", implementation!!.instructions.first()),
            )
        }

        // Promoted map pins: never request them. Their impression beacons
        // (www.google.com/adview) are fired by the native engine when a pin is
        // drawn, so not requesting the pins also stops those.
        val is2644 = packageMetadata.versionName == "26.44.06.1006895251"
        val is2647 = packageMetadata.versionName == "26.47.00.1022347503"
        // 26.47 keeps 26.44's refactored ad paths; only the promoted-pin request
        // moved (it is inlined into the search-request method now).
        val refactoredAds = is2644 || is2647
        val promotedPinRequest = when {
            is2644 -> PromotedPinAdsRequestFingerprint2644
            is2647 -> PromotedPinAdsRequestFingerprint2647
            else -> PromotedPinAdsRequestFingerprint
        }
        if (is2647) {
            // `avbe.e(F)` ends with the promoted-pin options hand-off, so return
            // right before it instead of skipping the whole request method.
            // The hand-off is a virtual call, so its receiver and its arguments are live at that
            // point: v0 is the receiver. Use a local that the call and everything after it do not
            // touch, otherwise clobbering it turns a reference into a boolean and the verifier
            // rejects the whole class on the first draw.
            fun readRegisters(insn: com.android.tools.smali.dexlib2.iface.instruction.Instruction): List<Int> = buildList {
                (insn as? OneRegisterInstruction)?.let { add(it.registerA) }
                (insn as? TwoRegisterInstruction)?.let { add(it.registerB) }
                (insn as? ThreeRegisterInstruction)?.let { add(it.registerC) }
                (insn as? FiveRegisterInstruction)?.let {
                    add(it.registerC); add(it.registerD); add(it.registerE); add(it.registerF); add(it.registerG)
                }
                (insn as? RegisterRangeInstruction)?.let {
                    for (register in it.startRegister until it.startRegister + it.registerCount) add(register)
                }
            }
            val method = promotedPinRequest.method
            val code = method.implementation!!.instructions.toList()
            val callIndex = promotedPinRequest.instructionMatches.last().index
            val call = code[callIndex]
            val busy = buildSet {
                addAll(readRegisters(call))
                for (after in callIndex + 1 until code.size) addAll(readRegisters(code[after]))
            }
            val locals = method.implementation!!.registerCount - method.parameterTypes.size - 1
            val scratch = (0 until locals).firstOrNull { it !in busy }
                ?: throw PatchException("no free local register before ${method.name}'s ad hand-off")
            method.addInstructionsWithLabels(
                callIndex,
                """
                    sget-boolean v$scratch, $SHAPES->HIDE_ADS:Z
                    if-eqz v$scratch, :ads_on
                    return-void
                """,
                ExternalLabel("ads_on", call),
            )
        } else {
            promotedPinRequest.method.leaveEarlyWhenHidingAds("return-void")
        }

        // Promoted pins along a route (issue #64). Every directions request asks for them (its
        // promotedPinAdsRequestOptions), and the answer's promoted-pin list goes, apart from the map's own
        // request above, to two label drawers: the directions screen's and navigation's. Each takes that
        // list alone and hands it to the same label factory (which builds the promoted labels from it);
        // they return at once when hiding ads, as each already does for an empty list. The factory is
        // read off navigation's drawer, the one with a trace label; the directions one is the other
        // method of the same shape that calls it.
        run {
            val navigation = mutableClassDefBy(NavigationAdsLabelControllerFingerprint.method.definingClass)
            fun factoryCall(m: Method) = m.implementation?.instructions
                ?.filter { it.opcode == Opcode.INVOKE_STATIC }
                ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                ?.firstOrNull { r ->
                    m.parameterTypes.size == 1 && r.parameterTypes.size == 5 &&
                        r.parameterTypes[0].toString() == m.parameterTypes[0].toString() &&
                        r.parameterTypes[1].toString() == "I" && r.parameterTypes[2].toString() == "Z"
                }
            val navDrawer = navigation.methods.singleOrNull { it.returnType == "V" && factoryCall(it) != null }
                ?: throw PatchException("navigation's promoted-pin drawer not found")
            val factory = factoryCall(navDrawer)!!
            val listType = navDrawer.parameterTypes[0].toString()
            val drawers = mutableListOf<Pair<String, String>>()
            classDefForEach { c ->
                for (m in c.methods) {
                    if (m.returnType != "V" || m.parameterTypes.map { it.toString() } != listOf(listType)) continue
                    val call = factoryCall(m) ?: continue
                    if (call.definingClass == factory.definingClass && call.name == factory.name) drawers += c.type to m.name
                }
            }
            if (drawers.size != 2) throw PatchException("expected the directions and navigation promoted-pin drawers, found $drawers")
            for ((owner, name) in drawers) {
                val drawer = mutableClassDefBy(owner).methods.single {
                    it.name == name && it.returnType == "V" && it.parameterTypes.map { t -> t.toString() } == listOf(listType)
                }
                if (drawer.implementation!!.registerCount - 2 < 1) throw PatchException("$owner.$name has no free register")
                drawer.leaveEarlyWhenHidingAds("return-void")
            }
        }

        // Promoted pins in search results (issue #71): the search list and the place sheet hand the search
        // response's ad pins, with their prepared labels, to one drawer -- the square pins carrying the ad's
        // tagline. It returns at once when hiding ads, as it already does for an empty list; the callout that
        // points at an off-screen ad pin answers "none", as it does for an empty list too.
        val pinsDrawer = if (is2647) SearchAdPinsDrawerFingerprint2647 else SearchAdPinsDrawerFingerprint
        pinsDrawer.method.leaveEarlyWhenHidingAds("return-void")
        val callout = if (is2647) AdPinCalloutFingerprint2647 else AdPinCalloutFingerprint
        val nonePin = if (is2647) "Lbwob;" else "Lbweh;"
        callout.method.leaveEarlyWhenHidingAds("sget-object v0, $nonePin->a:$nonePin\nreturn-object v0")

        // Sponsored-pin placemark objects: the factory returns null instead of
        // building one. Both existing callers already skip a null result.
        val placemarkFactory = if (is2647) AdPlacemarkFactoryFingerprint2647 else AdPlacemarkFactoryFingerprint
        placemarkFactory.method.leaveEarlyWhenHidingAds("const/4 v0, 0x0\nreturn-object v0")

        // Sponsored placemarks list, built from a search response: never build it.
        if (refactoredAds) {
            val builderA = if (is2647) AdsListBuilderFingerprint2647A else AdsListBuilderFingerprint2644A
            val builderB = if (is2647) AdsListBuilderFingerprint2647B else AdsListBuilderFingerprint2644B
            builderA.method.leaveEarlyWhenHidingAds("return-void")
            builderB.method.leaveEarlyWhenHidingAds("return-void")
        } else {
        AdsListBuilderFingerprint.method.leaveEarlyWhenHidingAds(
            "sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;\nreturn-object v0",
        )

        // Whether to ALSO merge the response's sponsored placemarks in: force
        // the "don't" path regardless of the caller's own opt-in flag, by
        // jumping to the same branch that flag already selects when off.
        SponsoredPlacemarksGateFingerprint.let { fp ->
            val ifEqzIndex = fp.instructionMatches.last().index
            // .instructionMatches can hand back an instruction still backed by
            // the original dex bytes rather than the mutable builder form a
            // branch target needs; re-fetch through the method itself, which
            // is guaranteed to be the live, mutable copy.
            val skipTo = (fp.method.getInstruction(ifEqzIndex) as BuilderInstruction21t).target
            val skipInstruction = skipTo.location.instruction
                ?: throw PatchException("aj()'s awcl-null branch target has no instruction")
            fp.method.addInstructionsWithLabels(
                ifEqzIndex,
                """
                    sget-boolean v10, $SHAPES->HIDE_ADS:Z
                    if-nez v10, :ua_skip
                """,
                ExternalLabel("ua_skip", skipInstruction),
            )
        }
        }

        // 26.44 refactored the unified row builder into larger fragment methods
        // and replaced the row proto; the factory above still suppresses every
        // sponsored placemark object. Skip these two 26.43-shaped gates.
        if (!refactoredAds) {
        // Unified results list: two independent signals mark an entry as an ad
        // (the chaq oneof case, and a placemark's own is-ad query), both gated
        // here. Capture everything needed from the PRISTINE method first, then
        // apply the later-positioned edit before the earlier one, so neither
        // edit's captured indices are invalidated by the other shifting them.
        //
        // Each gate's "carry on" target is an ExternalLabel on the instruction
        // that follows it, never a label written at the end of the snippet:
        // addInstructionsWithLabels appends the external labels to the snippet
        // as `:name nop`, so a trailing internal label attaches to the first of
        // those nops and resolves to EXTERNAL label 0 -- here the loop head or
        // the skip target. An earlier version did that, and every normal row
        // was skipped: the results list came up empty (shown as a retry icon).
        val loopHead = UnifiedListLoopHeadFingerprint.instructionMatches
        // The live instruction from the method itself: an ExternalLabel needs the
        // mutable copy, which a fingerprint match does not always hand back.
        val loopHeadInstruction = UnifiedListLoopHeadFingerprint.method.implementation!!.instructions[loopHead.first().index]
        val gate1InsertAt = loopHead.last().index + 1
        val gate1Continue = UnifiedListLoopHeadFingerprint.method.implementation!!.instructions[gate1InsertAt]

        val next = UnifiedListLoopHeadFingerprint.method.implementation!!.instructions[gate1InsertAt]
        if (next.opcode != Opcode.CONST_4) throw PatchException("loop head no longer overwrites its scratch")
        val loopScratch = (next as OneRegisterInstruction).registerA
        val entryRegister = (UnifiedListLoopHeadFingerprint.method.implementation!!.instructions[loopHead.last().index] as OneRegisterInstruction).registerA
        val fallback = FallbackPlacemarkFingerprint.instructionMatches
        val gate2InsertAt = fallback.last().index + 1
        val gate2Continue = FallbackPlacemarkFingerprint.method.implementation!!.instructions[gate2InsertAt]

        val placeRegister = (FallbackPlacemarkFingerprint.method.implementation!!.instructions[fallback.last().index] as OneRegisterInstruction).registerA
        val fallbackScratch = (FallbackPlacemarkFingerprint.method.implementation!!.instructions[fallback[fallback.size - 2].index] as Instruction35c).registerC
        FallbackPlacemarkFingerprint.method.addInstructionsWithLabels(
            gate2InsertAt,
            """
                sget-boolean v$fallbackScratch, $SHAPES->HIDE_ADS:Z
                if-eqz v$fallbackScratch, :carry_on
                invoke-virtual {v$placeRegister}, Lolg;->cw()Z
                move-result v$fallbackScratch
                if-nez v$fallbackScratch, :ua_loop_head
            """,
            ExternalLabel("ua_loop_head", loopHeadInstruction),
            ExternalLabel("carry_on", gate2Continue),
        )
        UnifiedListLoopHeadFingerprint.method.addInstructionsWithLabels(
            gate1InsertAt,
            """
                sget-boolean v$loopScratch, $SHAPES->HIDE_ADS:Z
                if-eqz v$loopScratch, :carry_on
                iget v$loopScratch, v$entryRegister, Lcgrr;->c:I
                add-int/lit8 v$loopScratch, v$loopScratch, -0x${AD_CASE.toString(16)}
                if-eqz v$loopScratch, :ua_loop_head
            """,
            ExternalLabel("ua_loop_head", loopHeadInstruction),
            ExternalLabel("carry_on", gate1Continue),
        )
        }

        // Filter the unified row list at its typed getter. New Maps inlines the old row builder
        // into a much larger fragment method; filtering here preserves the independent case-5 gate
        // without borrowing registers from that fragment's unrelated view-model construction.
        SearchRowsFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
            if (returns.isEmpty()) throw PatchException("search row list has no return")
            for (index in returns.asReversed()) {
                val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
                addInstructionsAtLabel(index, """
                    invoke-static/range { v$register .. v$register }, Lorg/ungoogled/ui/SearchAds;->filter(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """)
            }
        }
    }
}
