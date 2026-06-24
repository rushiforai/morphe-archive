package ajstrick81.morphe.patches.vix.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ─────────────────────────────────────────────────────────────────────────────
// Fingerprints for ViX Android TV (com.univision.prendetv) v4.46.0_tv
//
// Ad stack: LuraPlayer SDK (VAST/VMAP + FreeWheel/IMA) + Innovid SSAI overlay
// All class names confirmed via Dalvik descriptor extraction from base.apk.
// ─────────────────────────────────────────────────────────────────────────────

// ─────────────────────────────────────────────────────────────────────────────
// Hook 1 — LuraFreewheelConfiguration (constructor)
// classes5.dex / com/akta/luraplayer/api/configs/ads/
//
// LuraFreewheelConfiguration holds an `enabled` boolean that gates whether
// the FreeWheel ad provider is active. Its constructor assigns this field
// from a parameter. Injecting return-void at index 0 prevents the field
// from ever being written, leaving `enabled` at its JVM default (false).
// The LuraPlayer ad scheduler reads this before fetching any ad URLs.
// ─────────────────────────────────────────────────────────────────────────────
object LuraFreewheelConfigFingerprint : Fingerprint(
    definingClass = "Lcom/akta/luraplayer/api/configs/ads/LuraFreewheelConfiguration;",
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR)
)

// ─────────────────────────────────────────────────────────────────────────────
// Hook 2 — InnovidHelper (primary public method)
// classes10.dex / com/univision/descarga/videoplayer/utilities/innovid/
//
// InnovidHelper is the entry point for the Innovid SSAI WebView overlay.
// Stubbing it prevents the overlay WebView from ever being mounted —
// no Innovid ad is fetched or rendered.
//
// Method name is R8-obfuscated; matched by return type + access flags on
// the single public non-constructor method in this class.
// ─────────────────────────────────────────────────────────────────────────────
object InnovidStartAdFingerprint : Fingerprint(
    definingClass = "Lcom/univision/descarga/videoplayer/utilities/innovid/InnovidHelper;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
