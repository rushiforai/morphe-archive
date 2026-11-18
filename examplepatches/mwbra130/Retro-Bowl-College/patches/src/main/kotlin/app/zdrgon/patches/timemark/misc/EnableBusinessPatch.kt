package app.zdrgon.patches.timemark.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.zdrgon.patches.timemark.shared.Constants.COMPATIBILITY_TIMEMARK
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** 
Test
 * Forces the boolean this method stores into [fieldClass]->[fieldName]
 * to true. In the target methods the store is fed directly by a
 * move-result (the config-store read whose value is being cached),
 * so a const/4 1 is inserted between the move-result and the store,
 * overwriting the read value in its own register. Whatever the
 * persisted/server state says, the cache now holds true.
 */
private fun MutableMethod.forceStoredFieldTrue(fieldClass: String, fieldName: String, label: String) {
    val insns = instructions.toList()
    val sputIndex = insns.indexOfFirst {
        it.opcode == Opcode.SPUT_BOOLEAN &&
            it.getReference<FieldReference>()?.let { ref ->
                ref.definingClass == fieldClass && ref.name == fieldName && ref.type == "Z"
            } == true
    }
    if (sputIndex < 1) {
        throw PatchException("Enable Business: could not find the $label store to pin.")
    }
    val moveResult = insns[sputIndex - 1]
    if (moveResult.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Enable Business: the $label store is not fed by a move-result in this version.")
    }
    val register = (moveResult as OneRegisterInstruction).registerA
    addInstruction(sputIndex, "const/4 v$register, 0x1")
}

/**
 * Forces this method's single config-store boolean read
 * (Lcom/xhey/xcamera/util/i1;->a(I Z)Z) to true by overwriting
 * its move-result register with 1 immediately after the read.
 */
private fun MutableMethod.forceConfigReadTrue(label: String) {
    val insns = instructions.toList()
    val invokeIndices = insns.indices.filter { i ->
        insns[i].opcode == Opcode.INVOKE_STATIC &&
            insns[i].getReference<MethodReference>()?.let { ref ->
                ref.definingClass == "Lcom/xhey/xcamera/util/i1;" && ref.name == "a" && ref.returnType == "Z"
            } == true
    }
    if (invokeIndices.size != 1) {
        throw PatchException(
            "Enable Business: expected exactly one config read in $label, found ${invokeIndices.size}."
        )
    }
    val moveResultIndex = invokeIndices[0] + 1
    val moveResult = insns.getOrNull(moveResultIndex)
    if (moveResult?.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Enable Business: the config read in $label is not followed by a move-result.")
    }
    val register = (moveResult as OneRegisterInstruction).registerA
    addInstruction(moveResultIndex + 1, "const/4 v$register, 0x1")
}

/**
 * Timemark — Enable Business.
 *
 * The Business plan's local distinction from Plus is one boolean
 * config flag, "key_team_space_is_business_plan_user", read
 * through the config store Lcom/xhey/xcamera/util/i1;->a(I Z)Z
 * (the same prefs store as "key_is_vip"), plus its cached mirror
 * Lb50/y0;->k Z. The paywall (PurchaseActivity, 7 sites), the
 * save-quota reader (Leb0/d;) and the ad service read k; the
 * dominant feature gate Ldb0/n;->e() and the state enum
 * Ldb0/n;->g() read the flag (both already pinned by the Plus
 * set, which this patch also applies — Business includes Plus).
 *
 * v1.79.10 pinned only the producer, Lb50/y0;->W(Z)V, and on
 * device the business state never appeared. Dex diagnosis
 * (2026-11-16, RECON.md): W is called ONLY from the team-space
 * subscription sync (Lb50/y0;->k0 / Lb50/k0;, fed by the
 * server's MemberSubscriptionInfo status) and from the
 * team-space LOGOUT coroutine (Lb50/p0;, with false). For an
 * account that never enters those flows W never runs, the flag
 * is never persisted, and the only other writers of k — the
 * refreshers Lb50/y0;->I()V and Lb50/y0;->H(...) — keep
 * re-reading the persisted false into the cache. The write/read
 * stores are the same store; the write simply never happened.
 *
 * This patch therefore pins the READ side, so business state
 * holds regardless of sync/server state:
 *
 *   1. Lb50/y0;-><clinit> seeds k = true at class load.
 *   2. Lb50/y0;->I()V and Lb50/y0;->H(...) have the move-result
 *      of their flag read forced to 1, so every cache refresh
 *      stores true into k.
 *   3. RenewalOfferHost.f — the remaining functional literal
 *      read site — has its flag read forced to 1, so the
 *      personal renewal offer stays suppressed, as it is for a
 *      real business user.
 *   4. The W(Z) argument pin is kept: when the subscription
 *      sync does run, it now also persists the flag true
 *      through the app's own writer (i1.g).
 *   5. Round 3 (v1.79.14): the string-keyed prefs funnel
 *      Lcom/xhey/xcamera/util/f;->p(Ljava/lang/String; Z)Z —
 *      the single storage read beneath i1.a — returns true
 *      whenever the key is the business key. i1.a itself has
 *      no spare register for a key-compare guard (2 registers,
 *      2 ins), and every config read of the flag, cached,
 *      direct or dynamic, passes through f.p; this closes the
 *      last unpinned read path, so the local business flag is
 *      now true at EVERY read in the app.
 *
 * Round-3 label verdict (dex-proven, RECON.md): the displayed
 * current-plan NAME is rendered only from the server
 * subscription model — MemberSubscriptionInfo type/status
 * inside the downloaded GroupInfo (Lb50/y0;->j / y0.p),
 * mapped by Lb50/y0;->v (0 Free / 1 Business / 2 Trial) —
 * on the team-space header, the team-space plan page, the
 * team chooser and the paywall's Business-tab "Current Plan"
 * block. No code maps the local business boolean to a plan
 * name, and VipInfo.vipType has zero UI readers.
 *
 * Round 4 takes the remaining step the round-3
 * verdict identified: pin the model funnels themselves — the
 * same technique as the shipped VipInfo pins — and rewrite
 * the one banner that is pure local presentation:
 *
 *   6. MemberSubscriptionInfo.getType() -> 1 (Business) and
 *      getStatus() -> 1 (active) at method entry. A full
 *      reader census (RECON.md round 4) confirms every reader
 *      is display, gating, analytics or a local derived-state
 *      cache; no purchase flow or sync writer consumes these
 *      getters into a request, an order or a persisted model
 *      (serialization reads the bean's fields, which stay
 *      untouched), and the one sync derivation (y0.k0) feeds
 *      only the already-pinned local flag writer W.
 *      TeamMemberSubscriptionInfo has no type/status getters
 *      of its own — it wraps a MemberSubscriptionInfo — so it
 *      is covered by the same pins.
 *   7. The paywall banner: PurchaseActivity.P() is the sole
 *      code site loading string 0x7f120f58
 *      ('「Timemark Plus」 purchased and activated') and sets
 *      it on the banner whenever e() is true. The string has
 *      no Business variant in the app's resources, so this
 *      patch overwrites the loaded string, in P() only, with
 *      '「Timemark Business」 purchased and activated'. This
 *      banner is the literal text shown as the current plan
 *      on the paywall's status page, and it is visible for
 *      every premium account — no team needed.
 *
 * Reach of the model pins, stated plainly: the GroupInfo
 * holders (y0.j / y0.p) are populated only from a locally
 * persisted JSON written by earlier server sync flows, or by
 * the sync coroutines themselves; nothing constructs a
 * GroupInfo locally. For an account that has never had a
 * team, those holders stay empty and the model-fed name
 * surfaces (team-space header and plan page, team chooser,
 * the paywall Business tab's "Current Plan" block) cannot
 * render — there is no subscription object for the pinned
 * getters to be called on. Where a GroupInfo does exist
 * (cached or downloaded), every one of those surfaces now
 * reads its subscription as Business/active. This patch
 * still does not fabricate a team: no invented group, name,
 * members or billing, and nothing is written to any sync
 * path.
 *
 * What this changes on screen: the paywall's plan state reads
 * business (its PAGE_STATUS logic branches on k), the
 * team-space cache and quota branch answer as business-plan,
 * the renewal-offer suppression applies, and e()/g()-gated
 * features stay unlocked. Honest scope: team DATA is server
 * state and cannot materialize from local pins — shared team
 * storage (300,000 photos), team projects (the team-space
 * model, Lb50/y0;->j GroupInfo, is downloaded; the y0 helpers
 * G/K/N/O/P/T read it, not the flag), centralized billing,
 * admin control, SharePoint and the Map & Spreadsheet team
 * views stay unavailable without a business account. This
 * patch does not fake server data.
 *
 * Self-contained: selecting Business alone applies the full
 * Plus pin set plus these pins; selecting both patches applies
 * the shared Plus pins twice — value-identical, harmless.
 */
@Suppress("unused")
val enableBusinessPatch = bytecodePatch(
    name = "Enable Business",
    description = "Turns on the app's Business plan state locally (everything in Enable Plus, plus the business-plan flag the team-space and paywall gates read). Team storage, team billing, admin control and other server-side business features cannot be created by a local patch.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TIMEMARK)

    execute {
        // Business includes Plus: the full shared pin set first
        // (fingerprints are resolved here, in the patch context,
        // and handed to the shared helper).
        applyPlusPins(
            VipIsVipFingerprint.method,
            VipExpireTimeFingerprint.method,
            VipReaderDFingerprint.method,
            VipReaderEFingerprint.method,
            VipStateFingerprint.method,
            SaveQuotaFingerprint.method
        )

        // 1. Seed the cached business flag true at class load, so
        // it holds before (and independent of) any sync/refresh.
        BusinessStaticInitFingerprint.method.run {
            val insns = instructions.toList()
            val returnIndex = insns.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (returnIndex < 0) {
                throw PatchException("Enable Business: no return found in the Lb50/y0; static initializer.")
            }
            // All registers are dead at the return point; v0 is
            // free to reuse as the value register.
            addInstructions(
                returnIndex,
                """
                    const/4 v0, 0x1
                    sput-boolean v0, Lb50/y0;->k:Z
                """.trimIndent()
            )
        }

        // 2. The two cache refreshers: force the flag read that
        // feeds the y0.k store, so every refresh writes true.
        BusinessCacheRefreshFingerprint.method.forceStoredFieldTrue(
            "Lb50/y0;", "k", "team-space cache refresh (Lb50/y0;->I)"
        )
        BusinessStatusRefreshFingerprint.method.forceStoredFieldTrue(
            "Lb50/y0;", "k", "TeamSpaceStatusManager refresh (Lb50/y0;->H)"
        )

        // 3. The renewal-offer host's business read.
        RenewalOfferBusinessReadFingerprint.method.forceConfigReadTrue(
            "RenewalOfferHost.f"
        )

        // 4. The producer pin, kept: when the subscription sync
        // does call W, it persists the flag true through the
        // app's own writer as well. W is a 4-register static, so
        // its boolean argument is v3.
        BusinessSyncFingerprint.method.addInstructions(
            0,
            """
                const/4 v3, 0x1
            """.trimIndent()
        )

        // 5. Round 3: pin the prefs funnel beneath i1.a. f.p is
        // a 3-register static (v0 local, v1 = key, v2 = default)
        // whose body opens by loading the MMKV instance into v0,
        // so v0 is free scratch at entry: compare the key against
        // the business key (the literal is the receiver, so a
        // null key safely falls through) and return true on a
        // match; every other key continues into the original
        // body untouched. This covers all i1.a reads of the
        // business key — the funnel i1.a itself delegates to.
        PrefsBoolReadFingerprint.method.run {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "key_team_space_is_business_plan_user"
                    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original_body
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
                ExternalLabel("original_body", getInstruction(0))
            )
        }

        // 6. Round 4: pin the subscription model funnels. Any
        // MemberSubscriptionInfo the app actually holds (inside
        // a cached or downloaded GroupInfo) now reports plan
        // type 1 (Business) and status 1 (active) — the exact
        // pair Lb50/y0;->v maps to the "Business" plan name,
        // and the pair every plan-name surface and business
        // gate reads. Same shape as the VipInfo pins: a bare
        // entry return, the bean's fields untouched.
        MemberSubscriptionTypeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
        MemberSubscriptionStatusFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )

        // 7. Round 4: the paywall banner. PurchaseActivity.P()
        // loads string resource 0x7f120f58 ('「Timemark Plus」
        // purchased and activated') — the ONLY code site that
        // loads it — via Context.getString, then sets the
        // result on the banner TextView. Overwrite the loaded
        // string in its own register, right after the
        // move-result-object that receives it and before the
        // setText call consumes it, with the Business wording.
        // No Business variant of this string exists in the
        // app's resources; the literal mirrors the original
        // exactly, with the plan name swapped.
        PurchaseBannerFingerprint.method.run {
            val insns = instructions.toList()
            val constIndices = insns.indices.filter { i ->
                (insns[i] as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f120f58
            }
            if (constIndices.size != 1) {
                throw PatchException(
                    "Enable Business: expected exactly one load of the paywall banner string in PurchaseActivity.P, found ${constIndices.size}."
                )
            }
            val moveResultIndex = (constIndices[0] + 1 until minOf(constIndices[0] + 6, insns.size))
                .firstOrNull { insns[it].opcode == Opcode.MOVE_RESULT_OBJECT }
                ?: throw PatchException(
                    "Enable Business: the paywall banner getString result was not found in PurchaseActivity.P."
                )
            val register = (insns[moveResultIndex] as OneRegisterInstruction).registerA
            addInstruction(
                moveResultIndex + 1,
                "const-string v$register, \"「Timemark Business」 purchased and activated\""
            )
        }
    }
}
