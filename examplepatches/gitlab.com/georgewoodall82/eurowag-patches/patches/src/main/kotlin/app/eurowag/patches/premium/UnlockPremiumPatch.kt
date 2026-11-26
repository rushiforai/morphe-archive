package app.eurowag.patches.premium

import app.eurowag.patches.shared.Constants.COMPATIBILITY_EUROWAG
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Replaces `sget-object vX, <old>` with `sget-object vX, <new>`.
 *
 * The registers are read from the original instruction, so the patch does not
 * depend on the exact register allocation chosen by R8.
 */
private fun MutableMethod.replaceStaticField(old: String, new: String, expected: Int = 1) {    val matches = instructions.withIndex()
        .filter { (_, instruction) ->
            instruction.opcode == Opcode.SGET_OBJECT &&
                (instruction as? ReferenceInstruction)?.reference?.toString() == old
        }
        .map { it.index }

    require(matches.size == expected) {
        "Expected $expected reference(s) to $old in $name, found ${matches.size}"
    }

    matches.forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        replaceInstruction(index, "sget-object v$register, $new")
    }
}

/**
 * Replaces `new-instance vX, <type>` plus its constructor call with
 * `sget-object vX, <singleton>` and a `nop`.
 *
 * Eurowag models "disabled because a feature is locked" and "enabled" as two
 * different classes (for example `tcd` vs `ucd`). Swapping the allocation is
 * enough to make every consumer treat the feature as enabled.
 */
private fun MutableMethod.replaceSingleton(type: String, singleton: String, expected: Int = 1) {
    var remaining = expected
    var index = 0

    while (index < instructions.size) {
        val instruction = instructions[index]
        if (instruction.opcode == Opcode.NEW_INSTANCE &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == type
        ) {
            val register = (instruction as OneRegisterInstruction).registerA

            // The constructor call is within the next few instructions. It is
            // adjacent for most models, but `vdm` loads a second enum value
            // before calling its constructor.
            var invokeIndex = index + 1
            while (invokeIndex < instructions.size && invokeIndex <= index + 4) {
                val candidate = instructions[invokeIndex]
                if (candidate.opcode == Opcode.INVOKE_DIRECT) {
                    val reference = (candidate as ReferenceInstruction).reference as? MethodReference
                    if (reference != null && reference.definingClass == type && reference.name == "<init>") {
                        break
                    }
                }
                invokeIndex++
            }

            require(invokeIndex < instructions.size && invokeIndex <= index + 4) {
                "No constructor call for $type near instruction $index in $name"
            }

            replaceInstruction(index, "sget-object v$register, $singleton")
            replaceInstruction(invokeIndex, "nop")

            remaining--
            index = invokeIndex + 1
        } else {
            index++
        }
    }

    require(remaining == 0) {
        "Expected $expected instance(s) of $type in $name, missing $remaining"
    }
}

/**
 * Turns `wkb(online = true, offline = false, …)` into
 * `wkb(online = true, offline = true, …)`.
 *
 * `arn.v` uses the same register for the offline flag, the vehicle
 * "isPurchasable" flag and the company-vehicle "pro" flag. The offline flag is
 * set before the map model is built; the register is reset to false right
 * before the vehicle models so those keep their original values.
 */
private fun MutableMethod.enableOfflineMaps() {
    val mapIndex = instructions.indexOfFirst {
        it.opcode == Opcode.NEW_INSTANCE &&
            (it as? ReferenceInstruction)?.reference?.toString() == "Lwkb;"
    }
    require(mapIndex >= 0) { "No wkb construction in $name" }

    var flagIndex = -1
    for (index in mapIndex + 1 until minOf(mapIndex + 8, instructions.size)) {
        val instruction = instructions[index]
        if (instruction.opcode == Opcode.CONST_4 &&
            (instruction as NarrowLiteralInstruction).narrowLiteral == 0
        ) {
            flagIndex = index
            break
        }
    }
    require(flagIndex >= 0) { "No offline flag in $name" }

    val register = (instructions[flagIndex] as OneRegisterInstruction).registerA
    replaceInstruction(flagIndex, "const/4 v$register, 0x1")

    val vehicleIndex = instructions.indexOfFirst {
        it.opcode == Opcode.NEW_INSTANCE &&
            (it as? ReferenceInstruction)?.reference?.toString() == "Lq3m;"
    }
    require(vehicleIndex >= 0) { "No q3m construction in $name" }
    addInstructions(vehicleIndex, "const/4 v$register, 0x0")
}

/**
 * Unlocks Eurowag Navi Premium locally.
 *
 * ## How premium works in 4.18.1
 *
 * Eurowag is a Sygic white-label. The navigation SDK is licensed separately
 * (the app ships a valid SDK license JWT), and the commercial "Premium"
 * subscription is a separate layer owned by Eurowag's backend:
 *
 *   GET /v3/features  ->  a signed feature JWT
 *   `fra.resolve`     ->  decodes v1/v2/v3 and returns a `fd7` feature set
 *   `fd7.u`           ->  the monetization object
 *   `am9.i`           ->  maps it to Premium / Trial / Paywall / Freemium
 *
 * The decoded feature set contains one model per capability: traffic tier,
 * speed cameras, voice instructions, lane guidance, favourites limits, vehicle
 * profiles and their editable parameters, driving restrictions, etc. Locked
 * capabilities are represented by a different class ("Disabled(lockType=…)")
 * rather than by a boolean, so setting a flag is not enough.
 *
 * ## What this patch changes
 *
 * 1. `fra.resolve` -> return `arn.v()`. Signed-in accounts always get the
 *    complete feature set, even if the backend JWT says free/trial/expired.
 * 2. `xhn.x` -> return `arn.v()`. Guests get the same set instead of the
 *    minimal "not signed in" fixture.
 * 3. `arn.v` is upgraded in place:
 *      - maps: no lock
 *      - traffic: Full + no lock
 *      - voice instructions: Enabled
 *      - lane guidance: Enabled
 *      - driving restrictions: Enabled
 *      - other/driving notifications: Enabled
 *      - favourites: 750 places / 500 routes / 500 recent
 *      - vehicle profiles: 2 vehicles, all parameters editable (weight,
 *        dimensions, ADR, ...)
 *      - incidents: Enabled
 * 4. `am9.i` -> always return the Premium subscription status. The
 *    subscription screen dismisses itself, the profile shows Premium and no
 *    trial/paywall state reaches the UI.
 *
 * ## What this patch does NOT do
 *
 * Eurowag/Sygic services that are validated on their servers can still refuse
 * data for an account without a real entitlement: live traffic, speed-camera
 * feeds, map downloads/updates, Eurowag Pay and fleet/company-vehicle data.
 * Offline navigation, the truck profile, the unlockable local UI features and
 * the premium state itself are unlocked on-device.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces Eurowag Navi's subscription state to Premium and enables the complete feature set: truck " +
        "vehicle profiles with all parameters, traffic, speed cameras, voice instructions, lane guidance, " +
        "favourites/search history, incidents and driving notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_EUROWAG)

    execute {
        // Every JWT version (v1/v2/v3) goes through this dispatcher. Return the
        // complete feature set without decoding the backend's free/trial data.
        FeatureResolverFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Larn;->v()Lfd7;
                move-result-object v0
                return-object v0
            """,
        )

        // No signed-in user: the app uses this minimal fixture. Reuse the
        // upgraded set above.
        AnonymousFeatureSetFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Larn;->v()Lfd7;
                move-result-object v0
                return-object v0
            """,
        )

        // Upgrade the fallback feature set in place. These are the exact
        // constants of `arn.v()` in 4.18.1; the registers are read from the
        // matched instructions, so R8 register allocation does not matter.
        FallbackFeatureSetFingerprint.method.apply {
            // Maps: no lock.
            replaceStaticField("Lpva;->a:Lpva;", "Lrva;->a:Lrva;")

            // Traffic: Full instead of Limited, and no lock.
            replaceStaticField("Leqk;->a:Leqk;", "Ldqk;->a:Ldqk;")
            replaceStaticField("Lhqk;->a:Lhqk;", "Lkqk;->a:Lkqk;")

            // Voice instructions: Enabled instead of Disabled(lockType).
            replaceSingleton("Lvdm;", "Lwdm;->a:Lwdm;")

            // Lane guidance and driving restrictions: Enabled.
            replaceSingleton("Ltcd;", "Lucd;->a:Lucd;", expected = 2)

            // Vehicle profile: all parameters editable (weight, dimensions,
            // ADR, ...) instead of dimensions only.
            replaceStaticField("Ltsl;->a:Ltsl;", "Lrsl;->a:Lrsl;")

            // Offline maps: the fallback set has online maps only.
            enableOfflineMaps()
        }

        // Subscription status -> Premium. If the original monetization object
        // carries a product id, keep it; otherwise use a stable placeholder.
        // Returning Premium dismisses the paywall/trial screen and makes every
        // `isPremium` flow true (profile header, settings, feature gates).
        MonetizationStatusFingerprint.method.addInstructions(
            0,
            """
                instance-of v0, p1, Lchc;
                if-eqz v0, :not_chc
                check-cast p1, Lchc;
                invoke-virtual {p1}, Lchc;->c()Ljava/lang/String;
                move-result-object v0
                new-instance v1, Lzgc;
                invoke-direct {v1, v0}, Lzgc;-><init>(Ljava/lang/String;)V
                return-object v1
                :not_chc
                const-string v0, "eurowag_premium"
                new-instance v1, Lzgc;
                invoke-direct {v1, v0}, Lzgc;-><init>(Ljava/lang/String;)V
                return-object v1
            """,
        )
    }
}
