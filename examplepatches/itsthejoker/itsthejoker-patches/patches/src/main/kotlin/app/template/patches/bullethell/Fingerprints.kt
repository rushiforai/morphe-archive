package app.template.patches.bullethell

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Matches the Bullet Hell per-frame update lambda that spawns the player's bullets.
 *
 * In Roost 1.4.12 this is the obfuscated method `LB7/m;->a(Ljava/lang/Object;)`
 * (JADX: the `B7.m` / `K9.c` frame-tick lambda). Rather than key on the obfuscated
 * class/method name (which changes every build), we anchor on the player-bullet
 * construction site, which is stable across obfuscation:
 *
 * ```smali
 * new-instance v11, La9/q;
 * const/high16 v24, 0x40c00000    # 6.0f   sizePx   <- filter [0]
 * const/16 v25, 0x1               #        damage   <- filter [1]
 * move-object/from16 v23, v11
 * invoke-direct/range {v23 .. v29}, La9/q;-><init>(FIJJ)V   <- filter [2]
 * ...
 * const-string v2, "player_shoot"                          <- filter [3]
 * ```
 *
 * Filters match in source order, each after the previous instruction, so:
 *  - `instructionMatches[0]` is the `sizePx` literal (6.0f) — used by [bulletSizePatch].
 *  - `instructionMatches[1]` is the `damage` literal (1)    — used by [bulletDamagePatch].
 *
 * The constructor call (unique `(F, I, J, J)V` signature of `PlayerBullet` / `a9.q`)
 * and the `"player_shoot"` audio-event string make the match unambiguous even though
 * the `1` literal on its own is common.
 */
object PlayerBulletSpawnFingerprint : Fingerprint(
    filters = listOf(
        // [0] sizePx: 6.0f, encoded as const/high16 0x40c00000. Unique within the method.
        literal(6.0f),
        // [1] damage: 1. Matched as the first `1` literal after the sizePx literal,
        //     i.e. the const feeding the second constructor argument.
        literal(1),
        // [2] PlayerBullet constructor: (sizePx: F, damage: I, position: J, velocity: J).
        //     definingClass omitted because `a9.q` is obfuscated and changes between builds.
        methodCall(
            name = "<init>",
            parameters = listOf("F", "I", "J", "J"),
            returnType = "V",
        ),
        // [3] Audio event fired when the player shoots; pins the match to the firing method.
        string("player_shoot"),
    ),
)
