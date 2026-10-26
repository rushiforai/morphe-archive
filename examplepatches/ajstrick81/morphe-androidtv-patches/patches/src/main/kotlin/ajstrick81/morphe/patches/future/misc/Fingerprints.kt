package ajstrick81.morphe.patches.future.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

// ─────────────────────────────────────────────────────────────────────────────
// Fawesome Movies & TV — com.future.moviesByFawesomeAndroidTV — update-prompt seam.
//
// SplashActivity.checkCurrentAppVersion() reads the Firebase remote-config key
// "versioncode_androidtv_googletv" (the server's "latest" version code) into a
// local int and compares it against a baked-in constant (0xbd = 189 on 19.7):
//
//     v1 = remoteConfig.getLong("versioncode_androidtv_googletv")   // latest code
//     ...
//     if (v1 <= 0)        -> callRootdata()                         // :cond_2 (normal)
//     else if (v1 <= 189) -> callRootdata()                         // :cond_1 (normal)
//     else                -> Utilities.updateAlert(msg, this, Update, Cancel)
//
// When the backend bumps that key above the installed build's baked-in constant,
// the "New version Available" AlertDialog (Utilities.updateAlert) is shown on EVERY
// cold start — exactly the nag reported in issue #257. Note all three branches
// ultimately call the private SplashActivity.callRootdata() (the Cancel button's
// own handler, access$200, just calls callRootdata() too): the dialog is a pure
// interstitial, not a hard gate. The class/method names are NOT R8-obfuscated in
// this build (com/future/* is preserved), so we anchor on the stable method name.
// ─────────────────────────────────────────────────────────────────────────────

// Lcom/future/moviesByFawesomeAndroidTV/SplashActivity;->checkCurrentAppVersion()V
object CheckCurrentAppVersionFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        method.name == "checkCurrentAppVersion" &&
            classDef.type.endsWith("/SplashActivity;")
    },
)

// ─────────────────────────────────────────────────────────────────────────────
// 20.1 re-anchor. In 20.1 the whole com/future package is R8-obfuscated and the
// SplashActivity was rewritten (Hilt/ViewModel + coroutine StateFlow), so the
// version check moved into a splash view-model:
//
//   com.future.moviesByFawesomeAndroidTV.ui.splash.<K>.e(int versionCode, String message)
//
//     if (versionCode > 0 && versionCode > 0xC1 /*193 = installed code*/)
//         emit updateState  = new ui.splash.<C>(true,  true,  true,  message)  // dialog
//     else
//         emit proceedState = new ui.splash.<C>(0xE)  // -> (a=1, b=0, c=0) no dialog
//
// The ui/splash/ package name survives obfuscation but the class/method letters do
// NOT, so we anchor structurally: an instance method (I, String)V inside ui/splash/
// whose body constructs a sibling ui/splash/ state object via <init>(ZZZLjava/lang/String;)V
// (the update-state build). That construction is unique to e() among (I,String)V methods.
// ─────────────────────────────────────────────────────────────────────────────
object SplashUpdateStateMethodFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;"),
    custom = { method, classDef ->
        classDef.type.contains("/ui/splash/") &&
            method.implementation?.instructions?.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference?.toString()
                ref != null &&
                    ref.contains("/ui/splash/") &&
                    ref.endsWith(";-><init>(ZZZLjava/lang/String;)V")
            } == true
    },
)
