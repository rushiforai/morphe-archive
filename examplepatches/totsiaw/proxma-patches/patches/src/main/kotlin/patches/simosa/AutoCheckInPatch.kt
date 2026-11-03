package patches.simosa

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/*
 * Simosa daily rewards: claim today's check-in and today's Daily Rewards rung without a tap.
 *
 * The "Daily Rewards" screen carries two independent reward systems:
 *
 *  1. "Daily Check-In" — `Li4/v`, the check-in ViewModel. Tapping "Check in" (`onCheckInClicked`) starts `v.G2()`, which
 *     runs one suspend lambda (obfuscated `Li4/v$n`, the only `invokeSuspend` in the app that logs
 *     " _pendingCheckInAdShow "). That lambda reads the check-in state out of three flags and
 *     publishes a "pending check-in ad" event into the screen state flow. The UI shows the check-in
 *     ad, and only after it is dismissed calls the ViewModel's check-in (`X1()`, which logs
 *     "access_token missing, skip check-in"). Part 1 calls `X1()` at the publish site (no ad), and
 *     part 2 schedules the same call from the state renderer (no tap).
 *
 *  2. "Daily Rewards" — `Le4/N`, the MB ladder (25/50/100/120/150/175/200 MB). Its "Claim it Now!"
 *     button drives exactly one call:
 *         Le4/N;->L1(U.i(), data.currentStatus ?: "")      (U.i() is the selected rung)
 *     and `L1` itself only launches the claim while `a0` is false. `a0` is the app's "today is already
 *     claimed" flag: `l2` sets it to true for `claimed == "true"` and to false for `claimed == "false"`.
 *     Part 3 makes the button's call for the user.
 *
 * Why part 3 hooks the completion callback of `t2()` and not `t2()` itself:
 *
 *  - Every ladder response is stored with `o2(response)` and handed to `J1()` = `t2()`, on every route.
 *  - But `t2()` only *launches* `Le4/N$j`, which applies the response (`l2` recomputes `a0`, the ladder
 *    state flow is rebuilt). Code at the tail of `t2()` therefore sees the previous response's `a0`
 *    and ladder. `t2()` registers a completion callback on that job (`Le4/M`, via `z0.n(Function1)`);
 *    it runs after the response has been applied, so that is the anchor.
 *  - `Le4/M` is a different class from `Le4/N`, and `a0`/`b0` are private (reading them from `Le4/M`
 *    is the IllegalAccessError of issue #38). So `Le4/M` only calls a public method this patch adds to
 *    `Le4/N`, and every private read happens inside `Le4/N`.
 *
 * One attempt per account per day, for each of the two systems:
 *  - The hook schedules a 2-6 s jittered coroutine on the ViewModel's own `viewModelScope` (through
 *    the app's own launch and delay); a ViewModel cleared during the delay cancels it.
 *  - When it fires, every guard is re-checked against the ViewModel's current state: day latch,
 *    response/data present, `claimed != "true"`, `a0 == false`, a selected rung (ladder), or
 *    `can_checkin_today && !must_restore` (check-in).
 *  - The ladder only ever claims `currentStatus == "0"`, the free route. After a free claim the server
 *    moves to the next day with status "1", and a claim in that state is the paid route: it spends
 *    real balance. The app asks first in that state (`g2` shows a "Rs." dialog), and `L1` itself has
 *    no such check, so calling it here with status "1" would buy the reward without asking. Skipped
 *    without latching, so a later response with status "0" can still claim today.
 *  - The latch (`proxma_claim_<msisdn-hash>_<yyyyMMdd>` in SharedPreferences "proxma_simosa") is
 *    committed *before* the app's own claim call. `a0` is never forced (`n2(false)` is not called).
 *  - Each outcome is one `PROXMA_CLAIM` logcat line; nothing is shown to the user.
 *
 * The runtime half (latch, schedule, coroutine body, logging) is the smali in
 * `resources/simosa/autoclaim/`, assembled into the patch's extension dex at patch time. It names no
 * obfuscated class: it reaches the ViewModels through the `ClaimTarget` interface this patch adds.
 */

/** The check-in ViewModel. */
private const val SIMOSA_CHECK_IN_VIEW_MODEL = "Li4/v;"

/** Field holding the fetched check-in state in that ViewModel (`StateFlow<DailyRewardCheckInStateResponse>`). */
private const val SIMOSA_CHECK_IN_STATE_FLOW = "j0"

/** The (unobfuscated) model the check-in state response is deserialized into. */
private const val SIMOSA_CHECK_IN_STATE =
    "Lcom/jazz/jazzworld/data/appmodels/dailyreward/response/DailyRewardCheckInStateResponse;"

/** `Li4/c` — the check-in event type enum; its `a` constant is the "daily check-in" event. */
private const val CHECK_IN_EVENT_ENUM = "Li4/c;"

/** The (unobfuscated) result wrapper the check-in collector receives (Loading / Success / Failure). */
private const val SIMOSA_API_RESOURCES =
    "Lcom/jazz/jazzworld/data/network/genericapis/helper/ApiResources;"

// ---------------------------------------------------------------------------------------------
// Daily Rewards tab (the MB ladder, not the check-in).
// ---------------------------------------------------------------------------------------------

/** `Le4/N` — the Daily Rewards tab's ViewModel (`DailyRewardViewModel` in its metadata). */
private const val SIMOSA_REWARD_LADDER_VIEW_MODEL = "Le4/N;"

/** `Le4/U` — the ladder state; `i()` is the selected rung the "Claim it Now!" button claims. */
private const val SIMOSA_REWARD_LADDER_STATE = "Le4/U;"

/** The (unobfuscated) DTO for one rung of the ladder. */
private const val SIMOSA_REWARD_DAY_ITEM =
    "Lcom/jazz/jazzworld/data/appmodels/dailyreward/response/DaysListItem;"

/** The ladder's `data` payload — `currentDay`, `currentStatus` and the per-day `claimed` flag. */
private const val SIMOSA_REWARD_RESPONSE =
    "Lcom/jazz/jazzworld/data/appmodels/dailyreward/response/DailyRewardResponse;"
private const val SIMOSA_REWARD_DATA =
    "Lcom/jazz/jazzworld/data/appmodels/dailyreward/response/Data;"

/** The (unobfuscated) callback interface the ladder claim (`L1`) reports its result through. */
private const val SIMOSA_REWARD_CLAIM_LISTENER =
    "Lcom/jazz/jazzworld/data/network/genericapis/dailyreward/OnDailyRewardSubscriptionListeners;"

// ---------------------------------------------------------------------------------------------
// The patch's own runtime classes (resources/simosa/autoclaim/*.smali).
// ---------------------------------------------------------------------------------------------

private const val AUTO_CLAIM = "Lapp/proxma/simosa/AutoClaim;"
private const val CLAIM_TARGET = "Lapp/proxma/simosa/ClaimTarget;"
private const val CONTEXT = "Landroid/content/Context;"

internal val dailyCheckInPublishFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(string(" _pendingCheckInAdShow ")),
    custom = { m, _ -> m.name == "invokeSuspend" },
)

/**
 * `e2()` — the check-in ViewModel's "state -> screen" renderer. It reads the check-in state out of
 * the `j0` flow and hands it to the model factory. Its only caller is the synthetic `x1(v)`, which
 * all three daily-reward state handlers (load / restore / claim response) call right after they
 * write the fetched response into `j0`. So it runs exactly once per state response — never per
 * recompose — and one of those responses is the one the app fetches when the screen is opened.
 */
internal val dailyRewardStateRenderFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = emptyList(),
    custom = { m, c ->
        c.type == SIMOSA_CHECK_IN_VIEW_MODEL && m.name == "e2" && m.implementation?.instructions?.any { insn ->
            val reference = (insn as? ReferenceInstruction)?.reference
            reference is MethodReference && reference.definingClass == "Li4/x;" && reference.name == "j"
        } == true
    },
)

/**
 * `Le4/N;->t2()` — the ladder ViewModel's "a response arrived" entry point. Every response handler
 * stores the response with `o2(...)` and then calls the synthetic `J1()`, which is this method; it
 * launches the coroutine that applies the response to the state flows and registers a completion
 * callback on it. The patch hooks that callback, not this method (see the header).
 *
 * Pinned on the structure rather than only the name: the body launches a coroutine through the
 * app's `kotlinx.coroutines` facade — `<pkg>/i;->d(...)` with 6 arguments, the 4th of which is a
 * `Function2` and the last an `Object`. That is what distinguishes it from the ViewModel's other
 * zero-argument helpers.
 *
 * The package of that facade is *not* stable across releases: it is `Lnb/i;` on 3.3.4.2 and
 * `Lub/i;` on 3.3.5, because the whole coroutines shim gets repackaged by the app's shrinker. So
 * the check matches the shape (name, arity, parameter kinds, `/i;` facade, `/z0;` return) and not
 * a literal class name — otherwise the patch silently stops matching on the next rebuild.
 */
internal val dailyRewardResponseAppliedFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = emptyList(),
    custom = { m, c ->
        c.type == SIMOSA_REWARD_LADDER_VIEW_MODEL && m.name == "t2" &&
            m.implementation?.instructions?.any { insn -> isCoroutineLaunch((insn as? ReferenceInstruction)?.reference) } == true
    },
)

/** `<pkg>/i;->d(scope, context, start, Function2, int, Object)<pkg>/z0;` — kotlinx `launch$default`. */
private fun isCoroutineLaunch(reference: Any?) =
    reference is MethodReference && reference.name == "d" &&
        reference.parameterTypes.size == 6 &&
        reference.parameterTypes[3] == "Lkotlin/jvm/functions/Function2;" &&
        reference.parameterTypes[4] == "I" &&
        reference.parameterTypes[5] == "Ljava/lang/Object;" &&
        reference.definingClass.endsWith("/i;") &&
        reference.returnType.endsWith("/z0;")


/** Adds a public final method with an empty body and fills it from [smali]. */
internal fun MutableClass.addProxmaMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    smali: String,
) {
    val method = ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null,
        null,
        MutableMethodImplementation(registers),
    ).toMutable()
    method.addInstructionsWithLabels(0, smali.trimIndent())
    methods.add(method)
}

/**
 * Makes [viewModel] a `ClaimTarget`: context accessor, the [fire] body, and `proxmaOnApplied()`
 * (the hook entry point that schedules [kind]).
 */
internal fun MutableClass.addClaimTarget(
    kind: String,
    fireRegisters: Int,
    fire: String,
) {
    interfaces.add(CLAIM_TARGET)

    val contextField = fields.single { it.type == CONTEXT && !AccessFlags.STATIC.isSet(it.accessFlags) }
    addProxmaMethod(
        "proxmaContext", emptyList(), CONTEXT, 2,
        """
            iget-object v0, p0, $type->${contextField.name}:$CONTEXT
            return-object v0
        """,
    )
    addProxmaMethod("proxmaFire", emptyList(), "V", fireRegisters, fire)
    addProxmaMethod(
        "proxmaOnApplied", emptyList(), "V", 2,
        """
            const-string v0, "$kind"
            invoke-static {p0, v0}, $AUTO_CLAIM->schedule($CLAIM_TARGET Ljava/lang/String;)V
            return-void
        """,
    )
}

@Suppress("unused")
val autoCheckInPatch = bytecodePatch(
    name = "Auto check-in & claim daily reward",
    description = "Claims today's daily check-in and today's Daily Rewards rung on their own, once a " +
        "day, a few seconds after the app has loaded them — no ad and nothing to tap. The missed-days " +
        "restore and the day-10/20/30 milestone claim are untouched.",
) {
    compatibleWith(COMPATIBILITY_SIMOSA)
    extendWith("extensions/extension.mpe")

    execute {
        // ---- The completion callback of the response job, taken from t2() ----
        val applied = dailyRewardResponseAppliedFingerprint.method
        val appliedInstructions = applied.instructions.toList()
        val appliedReferences = appliedInstructions.map { (it as? ReferenceInstruction)?.reference }

        // The job's completion callback: `new-instance vX, <callback>` ... `invoke-interface {job, vX}, z0->n(Function1)`.
        val callbackRegistration = appliedReferences.indexOfFirst { reference ->
            reference is MethodReference && reference.name == "n" &&
                reference.definingClass.endsWith("/z0;") &&
                reference.parameterTypes == listOf("Lkotlin/jvm/functions/Function1;")
        }
        check(callbackRegistration > 0) { "t2() registers no completion callback" }
        val callbackType = (appliedInstructions.subList(0, callbackRegistration)
            .last { it.opcode == Opcode.NEW_INSTANCE } as ReferenceInstruction).reference as TypeReference

        // ---- Part 1: check in without the ad gate (the user's own tap) ----
        val method = dailyCheckInPublishFingerprint.method
        val instructions = method.instructions.toList()

        // The day's check-in event is published exactly once: `sget-object <reg>, Li4/c;->a:Li4/c;`.
        val publishIndex = instructions.indexOfFirst { insn ->
            if (insn.opcode != Opcode.SGET_OBJECT) return@indexOfFirst false
            val reference = (insn as? ReferenceInstruction)?.reference as? FieldReference ?: return@indexOfFirst false
            reference.definingClass == CHECK_IN_EVENT_ENUM && reference.name == "a"
        }
        check(publishIndex >= 0) { "daily check-in publish site not found" }

        // The publish block ends with its own `goto` to the end of the state evaluation; reuse it as
        // the jump target so no new control flow is invented.
        val skipTo = instructions.withIndex()
            .first { (index, insn) -> index > publishIndex && insn.opcode == Opcode.GOTO }
            .value

        // At this point p0 is the lambda, whose field `e` is the ViewModel; p1 already holds the
        // state flow (not the ViewModel) and v1 is a dead boolean, so load the ViewModel into v1.
        // `proxmaManual()` latches today and logs the tap, so part 2 does not repeat it.
        method.addInstructionsWithLabels(
            publishIndex,
            """
                iget-object v1, p0, Li4/v${'$'}n;->e:Li4/v;
                invoke-virtual {v1}, $SIMOSA_CHECK_IN_VIEW_MODEL->proxmaManual()V
                invoke-virtual {v1}, Li4/v;->X1()V
                goto :proxma_auto_check_in
            """.trimIndent(),
            ExternalLabel("proxma_auto_check_in", skipTo),
        )

        // ---- Part 2: check in by itself once the app knows today's check-in state ----
        // The publish site above only runs once the user taps "Check in", so the check-in is also
        // scheduled from the renderer every check-in state response goes through.
        val render = dailyRewardStateRenderFingerprint.method
        val renderInstructions = render.instructions.toList()
        val stateReads = renderInstructions.mapNotNull { insn ->
            val reference = (insn as? ReferenceInstruction)?.reference as? FieldReference
            reference?.takeIf {
                it.definingClass == SIMOSA_CHECK_IN_VIEW_MODEL && it.name == SIMOSA_CHECK_IN_STATE_FLOW
            }
        }
        check(stateReads.isNotEmpty()) { "daily-reward state is not read where expected" }

        // The flow's interface type is app-internal and drifts between releases (`Lqb/B;` on
        // 3.3.4.2, `Lxb/B;` on 3.3.5), so take it from the instruction that reads the field rather
        // than pinning it.
        val flowType = stateReads.first().type
        val renderRegisters = render.implementation?.registerCount ?: 0

        // `e2()` is an instance method with no parameters, so its receiver sits in the last register and
        // the three registers injected code uses (v0-v2) are its dead locals.
        check(renderRegisters >= 4) { "unexpected register layout in the daily-reward renderer" }

        val checkInGuards = """
            invoke-virtual {v1}, ${SIMOSA_CHECK_IN_STATE}->getCan_checkin_today()Ljava/lang/Boolean;
            move-result-object v2
            sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :proxma_claimed
            invoke-virtual {v1}, ${SIMOSA_CHECK_IN_STATE}->getMust_restore()Ljava/lang/Boolean;
            move-result-object v2
            sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :proxma_restore
        """

        mutableClassDefBy(SIMOSA_CHECK_IN_VIEW_MODEL).apply {
            addClaimTarget(
                kind = "checkin",
                fireRegisters = 6,
                fire = """
                    const-string v4, "checkin"
                    invoke-virtual {p0}, $SIMOSA_CHECK_IN_VIEW_MODEL->proxmaContext()$CONTEXT
                    move-result-object v0
                    invoke-static {v0, v4}, $AUTO_CLAIM->check($CONTEXT Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v1
                    if-nez v1, :proxma_skip
                    iget-object v1, p0, $SIMOSA_CHECK_IN_VIEW_MODEL->${SIMOSA_CHECK_IN_STATE_FLOW}:$flowType
                    invoke-interface {v1}, $flowType->getValue()Ljava/lang/Object;
                    move-result-object v1
                    if-eqz v1, :proxma_no_state
                    check-cast v1, $SIMOSA_CHECK_IN_STATE
                    $checkInGuards
                    invoke-static {v0, v4}, $AUTO_CLAIM->latch($CONTEXT Ljava/lang/String;)V
                    const-string v1, "today"
                    const-string v2, "-"
                    invoke-static {v4, v1, v2}, $AUTO_CLAIM->fired(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                    invoke-virtual {p0}, $SIMOSA_CHECK_IN_VIEW_MODEL->X1()V
                    return-void
                    :proxma_no_state
                    const-string v1, "skip no-state"
                    goto :proxma_skip
                    :proxma_claimed
                    const-string v1, "skip claimed"
                    goto :proxma_skip
                    :proxma_restore
                    const-string v1, "skip must-restore"
                    :proxma_skip
                    invoke-static {v4, v1}, $AUTO_CLAIM->log(Ljava/lang/String;Ljava/lang/String;)V
                    return-void
                """,
            )
            addProxmaMethod(
                "proxmaManual", emptyList(), "V", 3,
                """
                    invoke-virtual {p0}, $SIMOSA_CHECK_IN_VIEW_MODEL->proxmaContext()$CONTEXT
                    move-result-object v0
                    const-string v1, "checkin"
                    invoke-static {v0, v1}, $AUTO_CLAIM->manual($CONTEXT Ljava/lang/String;)V
                    return-void
                """,
            )
        }

        // Same guards as before, but the renderer only schedules; the claim itself re-checks them.
        render.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $SIMOSA_CHECK_IN_VIEW_MODEL->${SIMOSA_CHECK_IN_STATE_FLOW}:$flowType
                invoke-interface {v0}, $flowType->getValue()Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :proxma_auto_check_in_done
                check-cast v0, $SIMOSA_CHECK_IN_STATE
                invoke-virtual {v0}, ${SIMOSA_CHECK_IN_STATE}->getCan_checkin_today()Ljava/lang/Boolean;
                move-result-object v1
                sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :proxma_auto_check_in_done
                invoke-virtual {v0}, ${SIMOSA_CHECK_IN_STATE}->getMust_restore()Ljava/lang/Boolean;
                move-result-object v1
                sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v1
                if-nez v1, :proxma_auto_check_in_done
                invoke-virtual {p0}, $SIMOSA_CHECK_IN_VIEW_MODEL->proxmaOnApplied()V
            """.trimIndent(),
            ExternalLabel("proxma_auto_check_in_done", renderInstructions.first()),
        )

        // ---- Part 3: claim today's Daily Rewards rung, after the response has been applied ----
        val ladder = mutableClassDefBy(SIMOSA_REWARD_LADDER_VIEW_MODEL)

        // `L1(day, status)` returns at once unless its "already claimed" flag is false: the boolean
        // field it reads right before its first `if-nez` is `a0`.
        val claim = ladder.methods.single {
            it.name == "L1" && it.parameterTypes == listOf(SIMOSA_REWARD_DAY_ITEM, "Ljava/lang/String;")
        }
        val claimBody = claim.instructions.toList()
        val claimGate = claimBody.indexOfFirst { it.opcode == Opcode.IF_NEZ }
        check(claimGate > 0) { "L1() has no claimed-flag gate" }
        val claimedFlag = ((claimBody.subList(0, claimGate).last { it.opcode == Opcode.IGET_BOOLEAN }
            as ReferenceInstruction).reference as FieldReference)
        check(claimedFlag.definingClass == SIMOSA_REWARD_LADDER_VIEW_MODEL) { "L1() gates on a foreign flag" }

        val responseField = ladder.fields.single { it.type == SIMOSA_REWARD_RESPONSE }

        // The ladder state flow: the field whose value is read and cast to `Le4/U` across the ViewModel.
        val ladderStateReads = ladder.methods.flatMap { m ->
            val body = m.implementation?.instructions?.toList() ?: return@flatMap emptyList()
            body.withIndex().mapNotNull { (index, insn) ->
                if (insn.opcode != Opcode.IGET_OBJECT) return@mapNotNull null
                val field = (insn as ReferenceInstruction).reference as FieldReference
                if (field.definingClass != SIMOSA_REWARD_LADDER_VIEW_MODEL) return@mapNotNull null
                val window = body.subList(index + 1, minOf(body.size, index + 8))
                val readsValue = window.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getValue" }
                val castsToState = window.any {
                    it.opcode == Opcode.CHECK_CAST &&
                        ((it as ReferenceInstruction).reference as TypeReference).type == SIMOSA_REWARD_LADDER_STATE
                }
                field.takeIf { readsValue && castsToState }
            }
        }.groupingBy { it.name to it.type }.eachCount()
        check(ladderStateReads.isNotEmpty()) { "ladder state flow not found" }
        val (ladderStateName, ladderStateType) = ladderStateReads.maxBy { it.value }.key

        ladder.addClaimTarget(
            kind = "ladder",
            fireRegisters = 8,
            fire = """
                const-string v6, "ladder"
                invoke-virtual {p0}, $SIMOSA_REWARD_LADDER_VIEW_MODEL->proxmaContext()$CONTEXT
                move-result-object v0
                invoke-static {v0, v6}, $AUTO_CLAIM->check($CONTEXT Ljava/lang/String;)Ljava/lang/String;
                move-result-object v1
                if-nez v1, :proxma_skip
                iget-object v1, p0, $SIMOSA_REWARD_LADDER_VIEW_MODEL->${responseField.name}:$SIMOSA_REWARD_RESPONSE
                if-eqz v1, :proxma_no_response
                invoke-virtual {v1}, $SIMOSA_REWARD_RESPONSE->getData()$SIMOSA_REWARD_DATA
                move-result-object v1
                if-eqz v1, :proxma_no_response
                invoke-virtual {v1}, $SIMOSA_REWARD_DATA->getClaimed()Ljava/lang/String;
                move-result-object v2
                const-string v3, "true"
                invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v2
                if-nez v2, :proxma_claimed
                iget-boolean v2, p0, $SIMOSA_REWARD_LADDER_VIEW_MODEL->${claimedFlag.name}:Z
                if-nez v2, :proxma_flag
                iget-object v2, p0, $SIMOSA_REWARD_LADDER_VIEW_MODEL->$ladderStateName:$ladderStateType
                invoke-interface {v2}, $ladderStateType->getValue()Ljava/lang/Object;
                move-result-object v2
                if-eqz v2, :proxma_no_rung
                check-cast v2, $SIMOSA_REWARD_LADDER_STATE
                invoke-virtual {v2}, $SIMOSA_REWARD_LADDER_STATE->i()$SIMOSA_REWARD_DAY_ITEM
                move-result-object v2
                if-eqz v2, :proxma_no_rung
                invoke-virtual {v1}, $SIMOSA_REWARD_DATA->getCurrentStatus()Ljava/lang/String;
                move-result-object v3
                const-string v4, "0"
                invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v4
                if-eqz v4, :proxma_not_free
                invoke-static {v0, v6}, $AUTO_CLAIM->latch($CONTEXT Ljava/lang/String;)V
                invoke-virtual {v2}, $SIMOSA_REWARD_DAY_ITEM->getDay()Ljava/lang/String;
                move-result-object v4
                invoke-static {v6, v4, v3}, $AUTO_CLAIM->fired(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                invoke-virtual {p0, v2, v3}, $SIMOSA_REWARD_LADDER_VIEW_MODEL->L1(${SIMOSA_REWARD_DAY_ITEM}Ljava/lang/String;)V
                return-void
                :proxma_not_free
                invoke-static {v6, v3}, $AUTO_CLAIM->notFree(Ljava/lang/String;Ljava/lang/String;)V
                return-void
                :proxma_no_response
                const-string v1, "skip no-response"
                goto :proxma_skip
                :proxma_claimed
                const-string v1, "skip claimed"
                goto :proxma_skip
                :proxma_flag
                const-string v1, "skip a0"
                goto :proxma_skip
                :proxma_no_rung
                const-string v1, "skip no-rung"
                goto :proxma_skip
                :proxma_skip
                invoke-static {v6, v1}, $AUTO_CLAIM->log(Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """,
        )

        // The completion callback `invoke(Throwable?)`: on a normal completion (null), hand over to the
        // ViewModel. It only calls the public method added above — no private field is touched here.
        val callback = mutableClassDefBy(callbackType.type)
        val callbackInvoke = callback.methods.single {
            it.name == "invoke" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val callbackOwner = callback.fields.single { it.type == SIMOSA_REWARD_LADDER_VIEW_MODEL }
        check((callbackInvoke.implementation?.registerCount ?: 0) >= 3) { "unexpected completion callback layout" }
        callbackInvoke.addInstructionsWithLabels(
            0,
            """
                if-nez p1, :proxma_applied_skip
                iget-object v0, p0, ${callback.type}->${callbackOwner.name}:$SIMOSA_REWARD_LADDER_VIEW_MODEL
                invoke-virtual {v0}, $SIMOSA_REWARD_LADDER_VIEW_MODEL->proxmaOnApplied()V
            """.trimIndent(),
            ExternalLabel("proxma_applied_skip", callbackInvoke.instructions.first()),
        )

        // ---- Result logging (PROXMA_CLAIM success / error), for attempts this patch fired ----
        val claimListeners = mutableListOf<String>()
        val checkInCollectors = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Le4/") && SIMOSA_REWARD_CLAIM_LISTENER in classDef.interfaces) {
                claimListeners += classDef.type
            }
            if (classDef.type.startsWith("Li4/") && classDef.methods.any { m ->
                    m.name == "a" && m.parameterTypes == listOf(SIMOSA_API_RESOURCES, "Lkotlin/coroutines/Continuation;") &&
                        m.implementation?.instructions?.any {
                            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "checkin: "
                        } == true
                }
            ) {
                checkInCollectors += classDef.type
            }
        }
        check(claimListeners.size == 1) { "expected one ladder claim listener, found $claimListeners" }
        check(checkInCollectors.size == 1) { "expected one check-in result collector, found $checkInCollectors" }

        mutableClassDefBy(claimListeners.single()).methods.forEach { m ->
            when (m.name) {
                "onDailyRewardSubscriptionSuccess" -> m.addInstructions(
                    0,
                    "invoke-static/range {p1 .. p1}, $AUTO_CLAIM->ladderSuccess(Ljava/lang/Object;)V",
                )
                "onDailyRewardSubscriptionFailed" -> m.addInstructions(
                    0,
                    "invoke-static/range {p1 .. p2}, $AUTO_CLAIM->ladderFailed(Ljava/lang/String;Ljava/lang/String;)V",
                )
            }
        }
        mutableClassDefBy(checkInCollectors.single()).methods
            .single { it.name == "a" && it.parameterTypes.firstOrNull() == SIMOSA_API_RESOURCES }
            .addInstructions(0, "invoke-static/range {p1 .. p1}, $AUTO_CLAIM->checkinResult(Ljava/lang/Object;)V")
    }
}
