/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 */

package app.prathxm.chess.patches.lichesspuzzle

import app.morphe.patcher.Fingerprint

object NewDailyPuzzleGetFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/chess/features/puzzles/daily/net/NewDailyPuzzleServiceImpl;" &&
            // b(String, Continuation)
            method.name == "b" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0] == "Ljava/lang/String;" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

object NewDailyPuzzleSubmitFingerprint : Fingerprint(
    // a(long id, v2.DailyPuzzleAction, v2.DailyPuzzleHintState, Integer, Integer, Continuation)
    custom = { method, classDef ->
        classDef.type == "Lcom/chess/features/puzzles/daily/net/NewDailyPuzzleServiceImpl;" &&
            method.name == "a" &&
            method.parameterTypes.size == 6 &&
            method.parameterTypes[0] == "J" &&
            method.parameterTypes[1] == "Lchesscom/puzzles/v2/DailyPuzzleAction;" &&
            method.parameterTypes[2] == "Lchesscom/puzzles/v2/DailyPuzzleHintState;" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

object PuzzlePaywallGateModeFingerprint : Fingerprint(
    definingClass = "Lcom/chess/home/play/PuzzlePaywallGate;",
    name = "b",
    parameters = listOf("Lcom/chess/navigationinterface/PathPuzzlesMode;"),
    returnType = "Z"
)

object PuzzlePaywallGateErrorFingerprint : Fingerprint(
    definingClass = "Lcom/chess/home/play/PuzzlePaywallGate;",
    name = "c",
    parameters = listOf("Ljava/lang/Throwable;"),
    returnType = "Z"
)

object PuzzlePaywallGateCheckFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/chess/home/play/PuzzlePaywallGate;" &&
            method.name == "d" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0] == "Lcom/chess/navigationinterface/PathPuzzlesMode;" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

object PuzzleOfflineLimitSetFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/chess/internal/puzzles/PuzzleOfflineLimit;" &&
            method.name == "f" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0] == "I" &&
            method.returnType == "Ljava/lang/Object;"
    }
)

// SessionStore.w() = isAtLeastGold (PremiumStatusKt.isAtLeastGold(K())), the premium check
// PuzzlePaywallGate and the puzzle screens use. Matched by body, not by the obfuscated name.
//
// The old fingerprints hooked i() and u() by name. In 4.10.17 those are NOT premium checks:
// i() is "is guest" (!a(), a() = session is a RegisteredUser) and u() is has_lc_priority
// (live-chess server routing). Forcing i() to true made every user a guest whenever Ad-Free
// was disabled (Ad-Free overrides SharedPreferencesSessionStore.i()).
object SessionStoreIsAtLeastGoldFingerprint : Fingerprint(
    definingClass = "Lcom/chess/net/v1/users/SessionStore;",
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
            ref is com.android.tools.smali.dexlib2.iface.reference.MethodReference &&
                ref.name == "isAtLeastGold" && ref.definingClass == "Lcom/chess/entities/PremiumStatusKt;"
        } == true
    }
)
