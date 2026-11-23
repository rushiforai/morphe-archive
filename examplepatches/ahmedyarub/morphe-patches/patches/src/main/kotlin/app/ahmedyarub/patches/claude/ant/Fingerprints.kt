package app.ahmedyarub.patches.claude.ant

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * String resources whose names R8 resource shrinking stripped (`APKTOOL_RENAMED_0x…`), so they can only be
 * matched by id. Ids change every release: update them each time the Claude version is bumped.
 */
private object Resources {
    /** "Untitled": the chat title fallback, read just before the chat menu's employee check (1.261120.19). */
    const val UNTITLED = 0x7f141158
}

/**
 * The chat screen's top bar (`bk.w8.invoke(Object, Object, Object, Object)` in 1.261120.19) builds the ⋯ menu's
 * actions. It reads the employee check once:
 *
 * ```
 * String title = ... ?: getString(R.string.untitled);
 * boolean isAnt = ((wz.a) (kr.a) inject(kr.a.class)).a();
 * ...
 * copyConversationId = isAnt ? new m20.d(..., new ol.g0(...)) : null;   // "Copy conversation ID"
 * topBar(..., outline, isAnt /* the outline's "(Ant only)" label */, copyConversationId, ...);
 * ```
 *
 * The anchor is the "Untitled" fallback followed by the check: the injected object cast to the interface and then
 * to the implementation (`check-cast`, `check-cast`), the no-argument `()Z` call and its `move-result`.
 */
internal val chatMenuEmployeeCheckFingerprint = Fingerprint(
    name = "invoke",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        literal(Resources.UNTITLED),
        opcode(Opcode.CHECK_CAST, MatchAfterWithin(12)),
        opcode(Opcode.CHECK_CAST, MatchAfterImmediately()),
        methodCall(parameters = listOf(), returnType = "Z", opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
    )
)

/**
 * Compose group keys: hashes of a composable's source position, so they only change when that code moves.
 * Check them each time the Claude version is bumped.
 */
private object GroupKeys {
    /** The Code session menu's "Copy session ID" entry (1.261120.19). */
    const val COPY_SESSION_ID = 0x243234cc
}

/**
 * The Code session menu's "Copy session ID (Ant only)" entry (`go.p7.b(q1.e0)` in 1.261120.19), one of the menu's
 * entry providers:
 *
 * ```
 * composer.startGroup(0x243234cc);
 * if (!((wz.a) this.account).a()) { composer.endGroup(); return null; }   // no entry
 * ... copy-session-ID entry (a40.r3 case 21, string 0x7f141bbb) ...
 * ```
 *
 * The anchor is the group key followed by the check: `check-cast` to the implementation, the no-argument `()Z`
 * call and its `move-result`.
 */
internal val copySessionIdEmployeeCheckFingerprint = Fingerprint(
    filters = listOf(
        literal(GroupKeys.COPY_SESSION_ID),
        opcode(Opcode.CHECK_CAST, MatchAfterWithin(3)),
        methodCall(parameters = listOf(), returnType = "Z", opcode = Opcode.INVOKE_VIRTUAL, location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
    )
)

/**
 * The provider of a Claude Code session's "Debug (Ant only)" menu entry (`ip.f0.g()` in 1.261120.19), which opens
 * a sheet of debug details (session ID, app version and build) with Share and Copy:
 *
 * ```
 * if (!sessionKind.isCode() || !((wz.a) account).a()) return null;
 * new io.h(ids, ip.r6.class, "id", "getId-UFAIyc8()Ljava/lang/String;", ...);
 * ```
 *
 * The anchor is the employee check — the `()Z` call, its `move-result` and the `if-nez` that leads to the entry —
 * followed by the reflection literal for the session ID getter. The session-kind check before it is a `()Z` call
 * too, but its `move-result` is followed by a `const`, not by the branch.
 */
internal val debugDetailsEmployeeCheckFingerprint = Fingerprint(
    filters = listOf(
        methodCall(parameters = listOf(), returnType = "Z", opcode = Opcode.INVOKE_VIRTUAL),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
        string("getId-UFAIyc8()Ljava/lang/String;", location = MatchAfterWithin(12))
    )
)
