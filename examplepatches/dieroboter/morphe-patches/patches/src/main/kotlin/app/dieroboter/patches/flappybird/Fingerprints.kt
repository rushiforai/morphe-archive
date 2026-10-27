package app.dieroboter.patches.flappybird

import app.morphe.patcher.Fingerprint

internal const val GAME_ACTIVITY = "Lcom/dotgears/GameActivity;"
internal const val AD_RUNNABLE = "Lcom/dotgears/b;"
internal const val BIRD_CLASS = "Lcom/dotgears/flappy/a;"
internal const val SCENE_CLASS = "Lcom/dotgears/flappy/c;"
internal const val E_CLASS = "Lcom/dotgears/flappy/e;"
internal const val F_CLASS = "Lcom/dotgears/flappy/f;"
internal const val P_CLASS = "Lcom/dotgears/p;"

// GameActivity: builds the AndEngine engine options (camera + resolution policy);
// the adaptive display patch prepends its height computation here.
internal object EngineConfigFingerprint : Fingerprint(
    definingClass = GAME_ACTIVITY,
    name = "a",
    returnType = "Lorg/andengine/b/c/b;",
    parameters = listOf(),
)

// GameActivity: builds the view hierarchy, creates the AdView and loads an ad.
internal object GameActivityLayoutFingerprint : Fingerprint(
    definingClass = GAME_ACTIVITY,
    name = "b",
    returnType = "V",
    parameters = listOf(),
)

// GameActivity.onCreate: the port inserts its display-cutout window handling
// right after the super call here (Android 17 crashes if the insets call
// runs before the DecorView exists).
internal object GameActivityOnCreateFingerprint : Fingerprint(
    definingClass = GAME_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// GameActivity.onStart: hooks the activity into Google Play Games (basegameutils).
internal object GameActivityOnStartFingerprint : Fingerprint(
    definingClass = GAME_ACTIVITY,
    name = "onStart",
    returnType = "V",
    parameters = listOf(),
)

// com.dotgears.b: Runnable that makes the AdView visible.
internal object AdVisibilityRunnableFingerprint : Fingerprint(
    definingClass = AD_RUNNABLE,
    name = "run",
    returnType = "V",
    parameters = listOf(),
)

// flappy/a: scene element init (holds a 0xf6 position constant).
internal object BirdInitFingerprint : Fingerprint(
    definingClass = BIRD_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf(),
)

// flappy/a: per-frame update (two rsub-int against 0x190).
internal object BirdUpdateFingerprint : Fingerprint(
    definingClass = BIRD_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf("F"),
)

// flappy/c: tap-zone handler the port guts to a bare return.
internal object SceneTapZoneFingerprint : Fingerprint(
    definingClass = SCENE_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf("I", "I", "I", "I"),
)

// flappy/c: state dispatcher; the port removes its c(11, ...) trigger call.
internal object SceneDispatchFingerprint : Fingerprint(
    definingClass = SCENE_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf("I", "Lcom/dotgears/m;"),
)

// flappy/c: the main per-frame scene update/render method.
internal object SceneUpdateFingerprint : Fingerprint(
    definingClass = SCENE_CLASS,
    name = "b",
    returnType = "V",
    parameters = listOf("F"),
)

// flappy/c: scene (re)layout method.
internal object SceneLayoutFingerprint : Fingerprint(
    definingClass = SCENE_CLASS,
    name = "e",
    returnType = "V",
    parameters = listOf(),
)

// flappy/e: init; the port sets f=1 and runs the one-time texture setup here.
internal object EInitFingerprint : Fingerprint(
    definingClass = E_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf(),
)

// flappy/e: per-frame update; the port removes the per-frame texture setup block.
internal object EUpdateFingerprint : Fingerprint(
    definingClass = E_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf("F"),
)

// flappy/e: draw/position helper (add-int/lit16 0x82 offset).
internal object EDrawFingerprint : Fingerprint(
    definingClass = E_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf("Lcom/dotgears/g;"),
)

// flappy/f: draw/position helper (0x92 / 0xdc position constants).
internal object FDrawFingerprint : Fingerprint(
    definingClass = F_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf("Lcom/dotgears/g;"),
)

// com.dotgears.p: texture helper constructor (rsub-int against 0x200).
internal object PConstructorFingerprint : Fingerprint(
    definingClass = P_CLASS,
    name = "<init>",
    returnType = "V",
    parameters = listOf(),
)

// com.dotgears.p: texture region setter (0x1f8 width constant).
internal object PRegionFingerprint : Fingerprint(
    definingClass = P_CLASS,
    name = "a",
    returnType = "V",
    parameters = listOf("I", "I", "I", "I", "I", "I"),
)
