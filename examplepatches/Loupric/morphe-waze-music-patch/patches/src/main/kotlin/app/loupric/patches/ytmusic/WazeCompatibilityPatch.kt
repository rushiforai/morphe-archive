package app.loupric.patches.ytmusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private val COMPATIBILITY_YOUTUBE_MUSIC = Compatibility(
    name = "YouTube Music",
    packageName = "com.google.android.apps.youtube.music",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = null))
)

// The Waze package name as actually installed on this mod (post-rename). MusicWazeBroadcastReceiver
// below hardcodes the original "com.waze" and never finds it since this fork installs as
// "com.waze.morphe" instead - same rename convention GmsCoreSupportPatch.kt's MICROG_PACKAGE
// constant follows on the Waze side.
private const val WAZE_MORPHE_PACKAGE = "com.waze.morphe"

// Fingerprints below intentionally avoid matching on the obfuscated class letters
// (formerly "Lswe;"/"Lswa;"/"Lsws;"/"Lswm;") since those single/double-letter names are
// reassigned by R8 on every YouTube Music release — that's exactly what broke this patch
// on 9.26.51 (renamed to Ltnd;/Ltmz;/Ltnr;/Ltnl;). Matching on the stable literal strings
// and structural shape instead survives future obfuscation churn.

// Fingerprint for swe.c()V / equivalent — loads GoogleCertificatesImpl via Dynamite,
// crashes with MicroG. The literal class name "com.google.android.gms.common.
// GoogleCertificatesImpl" is a real Play Services class referenced for a Binder lookup,
// so it stays constant across YT Music versions even though the containing method changes.
private object SweCFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("com.google.android.gms.common.GoogleCertificatesImpl"),
)

// Fingerprint for swe.a(String, swa, Z, Z)swm / equivalent — verifies Google certificates.
// Identified by the two log strings it emits on RemoteException, which are stable across
// versions, plus its distinctive (String, Object, boolean, boolean) signature.
private object SweAFingerprint : Fingerprint(
    parameters = listOf("L", "L", "Z", "Z"),
    strings = listOf("Failed to get Google certificates from remote", "GoogleCertificates"),
)

// Fingerprint for sws.f(String)swm / equivalent — checks if caller package is authorized.
// No stable string lives inside this method, but its return type is always the same
// "authorized result" class as SweAFingerprint's method (Lswm;/Ltnl;/...). That type is only
// known once SweAFingerprint has matched (which requires the BytecodePatchContext available
// inside execute {}), so this fingerprint is built there instead of as a top-level object.
private fun swsFFingerprint(authorizedSingletonType: String) = Fingerprint(
    returnType = authorizedSingletonType,
    parameters = listOf("L"),
)

// MusicWazeBroadcastReceiver.onReceive(Context, Intent) - handles the com.waze.sdk.audio.ACTION_INIT
// broadcast Waze sends when the user picks this app as their audio source. It hardcodes the literal
// package "com.waze" both to send an offline-message Intent back and to look up Waze's PackageInfo
// (PackageManager.getPackageInfo("com.waze", 0)) to check the Audio SDK version. On this mod Waze is
// installed as "com.waze.morphe", so getPackageInfo throws NameNotFoundException, versionCode reads
// as 0, and onReceive throws IllegalStateException("Waze not installed.") - the class name itself is
// referenced by AndroidManifest.xml as a <receiver>, so R8 can't rename it; anchoring on the unique
// "Waze not installed." string instead of the class name is robust to any future obfuscation of the
// surrounding (already-renamed-once, swe/swa/sws-style) helper classes.
private object MusicWazeBroadcastReceiverFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "L"),
    strings = listOf("Waze not installed."),
)

// The constructor of YT Music's own Waze-SDK CLIENT (the counterpart binding INTO Waze, as
// opposed to MusicWazeBroadcastReceiver above which only handles Waze binding INTO YT Music).
// It builds `new ComponentName("com.waze", "com.waze.sdk.SdkService")` and calls bindService()
// on it to open the reverse channel Waze's Audio SDK uses to push playback state. Since Waze is
// installed here as "com.waze.morphe", this bind always fails ("not found"), the reverse
// channel never opens, and Waze's MediaBrowser session stalls waiting for it, retrying the
// whole connection every ~20-30s (the "Connexion impossible" symptom) instead of ever reaching
// onLoadChildren. Identified by the unique combination of these two adjacent literal strings.
private object WazeSdkServiceBindFingerprint : Fingerprint(
    strings = listOf("com.waze", "com.waze.sdk.SdkService"),
)

// AllowlistManager.g(Client, MediaSession)Z — the actual gate MusicBrowserService.onGetRoot()
// calls to decide whether the connecting package is a recognized partner. It runs BEFORE the
// swe/swa/sws GoogleCertificates checks above and rejects any caller not on Google's hardcoded
// partner list, logging "MBS: getRoot() failed. Client not allowlisted: %s" and returning a
// null root — which is what surfaces to Waze as onConnectFailed / "Connexion impossible".
// The containing class name is obfuscated per release (e.g. "kzw" on 9.26.51), so this
// fingerprint locates it by the Flogger tag string baked into every one of its log calls
// instead, which stays stable since it's derived from the original (unobfuscated) source path.
private const val ALLOWLIST_MANAGER_LOG_TAG =
    "com/google/android/apps/youtube/music/mediabrowser/AllowlistManager"

private fun isAllowlistManagerClass(classDef: ClassDef): Boolean =
    classDef.methods.any { method ->
        method.implementation?.instructions?.any { instruction ->
            val reference = when (instruction.opcode) {
                Opcode.CONST_STRING -> (instruction as Instruction21c).reference as? StringReference
                Opcode.CONST_STRING_JUMBO -> (instruction as Instruction31c).reference as? StringReference
                else -> null
            }
            reference?.string == ALLOWLIST_MANAGER_LOG_TAG
        } == true
    }

private object AllowlistCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L", "L"),
    custom = { _, classDef -> isAllowlistManagerClass(classDef) },
)

// AllowlistManager.h(Lawea;)Z — a SEPARATE gate MusicBrowserService.onLoadChildren()/onSearch()
// call after onGetRoot() already succeeded, logging "Client not allowlisted for browsing: %s"
// on failure. Same class as AllowlistCheckFingerprint above but a different method, so it needs
// its own fingerprint. h/i/j/k in this class all share the (PUBLIC, FINAL, Z, listOf("L"))
// shape, so the class-tag filter alone is ambiguous; h is the only one of the four that calls
// a method literally named "c" on its argument (Lawea;->c()Lawfq;), which narrows it down.
private object AllowlistBrowsingCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L"),
    custom = { method, classDef ->
        isAllowlistManagerClass(classDef) &&
            method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.name == "c"
            } == true
    },
)

@Suppress("unused")
val wazeCompatibilityPatch = bytecodePatch(
    name = "Waze compatibility (MicroG)",
    description = "Fixes crash when Waze tries to connect via MediaBrowserService on MicroG devices.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        // Patch 0: AllowlistManager.g() → always allowlisted (bypass the pre-certificate
        // partner check that fails before swe/swa/sws are ever reached)
        AllowlistCheckFingerprint.method.apply {
            addInstruction(0, "const/4 v0, 0x1")
            addInstruction(1, "return v0")
        }

        // Patch 0b: AllowlistManager.h() → always allowlisted for browsing (bypass the
        // separate onLoadChildren()/onSearch() gate that runs after onGetRoot() succeeds)
        AllowlistBrowsingCheckFingerprint.method.apply {
            addInstruction(0, "const/4 v0, 0x1")
            addInstruction(1, "return v0")
        }

        // Patch 1: swe.c() → return-void immediately
        // Prevents loading GoogleCertificatesImpl via Dynamite (not supported by MicroG)
        SweCFingerprint.method.addInstruction(0, "return-void")

        // The "authorized" singleton (formerly Lswm;->a:Lswm;, now Ltnl;->a:Ltnl; on 9.26.51)
        // lives on the same class SweAFingerprint's method returns. Resolve it from there
        // instead of hardcoding the obfuscated class name.
        val authorizedSingletonType = SweAFingerprint.method.returnType
        val returnAuthorizedSingleton = """
            sget-object v0, $authorizedSingletonType->a:$authorizedSingletonType
            return-object v0
            """

        // Patch 2: swe.a() → always return the authorized singleton
        // (new swm/tnl(true)) — bypasses GMS certificate check
        SweAFingerprint.method.addInstructions(0, returnAuthorizedSingleton)

        // Patch 3: sws.f() → always return the authorized singleton (bypass signature verification)
        swsFFingerprint(authorizedSingletonType).method.addInstructions(0, returnAuthorizedSingleton)

        // Patch 4: MusicWazeBroadcastReceiver.onReceive() → rewrite the two hardcoded "com.waze"
        // string constants (Intent.setPackage + PackageManager.getPackageInfo) to this mod's actual
        // installed Waze package, so the version check finds it instead of throwing
        // "Waze not installed." (same string-rewrite technique as Waze's own GmsCoreSupportPatch).
        for ((method, from, to) in listOf(
            Triple(MusicWazeBroadcastReceiverFingerprint.method, "com.waze", WAZE_MORPHE_PACKAGE),
            // Patch 5: the Waze-SDK client's bindService() target package → rewrite "com.waze" to
            // this mod's actual installed Waze package (leaving the "com.waze.sdk.SdkService"
            // class name string untouched — the class isn't renamed, only the installed package is).
            Triple(WazeSdkServiceBindFingerprint.method, "com.waze", WAZE_MORPHE_PACKAGE),
        )) {
            val instructions = method.implementation!!.instructions
            instructions.withIndex().forEach { (index, instruction) ->
                when (instruction.opcode) {
                    Opcode.CONST_STRING -> {
                        val reference = (instruction as Instruction21c).reference as? StringReference
                        if (reference?.string == from) {
                            method.replaceInstruction(
                                index,
                                BuilderInstruction21c(Opcode.CONST_STRING, instruction.registerA, ImmutableStringReference(to)),
                            )
                        }
                    }

                    Opcode.CONST_STRING_JUMBO -> {
                        val reference = (instruction as Instruction31c).reference as? StringReference
                        if (reference?.string == from) {
                            method.replaceInstruction(
                                index,
                                BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, instruction.registerA, ImmutableStringReference(to)),
                            )
                        }
                    }

                    else -> {}
                }
            }
        }
    }
}
