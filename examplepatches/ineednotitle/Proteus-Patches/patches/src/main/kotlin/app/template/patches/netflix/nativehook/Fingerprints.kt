package app.template.patches.netflix.nativehook

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ─────────────────────────────────────────────────────────────────────────────
// Application.onCreate — earliest reliable point to load frida-gadget so its
// bundled script (killads.js) is live before the nrdp runtime fetches/caches the
// appboot UI bundle and schedules any ad break.
//
// definingClass is taken from base.apk's AndroidManifest.xml
// (<application android:name=".NetflixApplication" …>) →
// Lcom/netflix/ninja/NetflixApplication;
//
// VERIFIED upstream against real bytecode (androguard, 2026-08-07) on Netflix
// 13.0.1-25028: the class extends Landroid/app/Application; and defines
// onCreate ()V with PUBLIC access. onCreate has .registers 11 (v10 = this) and
// its instr 0 is already `const-string v0`, so injecting
// `const-string v0, "gadget"` at index 0 is register-safe (v0 is a scratch local
// the original body immediately reuses; this/v10 untouched), and lands before
// invoke-super onCreate and Netflix's native init.
//
// Re-verify on every version bump: an onCreate fingerprint anchored to the wrong
// class silently won't resolve.
// ─────────────────────────────────────────────────────────────────────────────
object NetflixApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/netflix/ninja/NetflixApplication;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
)
