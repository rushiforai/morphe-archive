package app.zdrgon.patches.callrecorder.premium

import app.morphe.patcher.Fingerprint

/**
 * The license state's single writer (3.6.9): App.e(state, sub)
 * stores the state into the static App.v field (and the sub-state
 * into App.x), then broadcasts the change. Its only caller is the
 * verdict handler Lo/hR;.handleMessage. Every "is licensed" test
 * reads App.v back — Lo/cg0;.b() accepts exactly {3, 4} — and the
 * only other write to App.v in the whole dex is the class
 * initializer setting it to 0 (check pending).
 */
object AppSetStateFingerprint : Fingerprint(
    definingClass = "Lorg/skvalex/cr/App;",
    name = "e",
    returnType = "V",
    parameters = listOf("I", "I"),
)
