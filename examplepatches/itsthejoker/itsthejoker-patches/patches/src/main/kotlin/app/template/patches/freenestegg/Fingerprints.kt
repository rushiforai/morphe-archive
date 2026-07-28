package app.template.patches.freenestegg

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Matches the `collectNestEgg` onClick lambda body inside the obfuscated class `Q8.a0`
 * (JADX: `Q8.C1113a0`, case 3 of its `invoke()` switch).
 *
 * The lambda is the click handler for the nest-egg / free-bird claim button that already
 * exists in the bird-collection screen (`C8/P.smali`). Its logic:
 *
 * 1. Read `LP7/j;->a:Z` (`alreadyClaimed`) — if true, bail out.
 * 2. Call `LP7/j;->a(J)J` with `currentTimeMillis()` to get milliseconds remaining on the
 *    cooldown timer.
 * 3. `cmp-long` the result against 0, then `if-lez` to `:cond_5` (the claim path) when
 *    cooldown ≤ 0, or fall through to the "show countdown" path when cooldown > 0.
 * 4. At `:cond_5`: `new-instance LP7/e;` → launch the claim coroutine (`P7.e`) which calls
 *    `B1.b()` → Firebase `checkLoginAirdropHTTP` → server grants a free bird.
 *
 * Fingerprint anchors (stable across obfuscation):
 *  - [0] `LP7/j;->a(J)J` — the cooldown-remaining method call; unique signature `(J)J` on
 *        the `P7.j` state class.
 *  - [1] `"collectNestEgg"` — the reflection string used when the lambda is constructed
 *        (in the surrounding Composable, `C8/P.smali`); confirms we are in the right class.
 *
 * `instructionMatches[0]` is the `invoke-virtual … LP7/j;->a(J)J` call.
 * The `if-lez` that gates the claim is the next branch instruction after the `cmp-long`
 * that follows `instructionMatches[0]`.
 */
object CollectNestEggCooldownFingerprint : Fingerprint(
    filters = listOf(
        // [0] Cooldown-remaining call: P7.j.a(currentTimeMillis): Long.
        //     The (J)J signature is unique within this lambda.
        methodCall(
            name = "a",
            parameters = listOf("J"),
            returnType = "J",
        ),
        // [1] Reflection string present in the same invoke() method body, confirming
        //     this is the collectNestEgg lambda and not an unrelated (J)J call.
        string("collectNestEgg"),
    ),
)
