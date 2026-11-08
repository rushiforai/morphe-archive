package app.template.patches.opera.startup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.patch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode

/**
 * When Opera hits an unrecoverable problem at startup it shows a modal
 * "Your app installation appears to be broken. Try to uninstall and reinstall
 * %1$s again." dialog (`string/welcome_init_failure`). Reverse engineering of
 * Opera Beta 104.0.5262.91143 (see `evidence/ANALYSIS.md`) shows the dialog is
 * NOT a signature or integrity check against modified APKs. It is reached from
 * exactly one builder method, `Lkfo;->d0(Landroid/app/Activity; I)V` in a
 * release build, which is invoked when:
 *
 *  1. **Crash recovery**: the previous run of the app crashed and Opera's
 *     crash handler recorded it (`PreviousCrashActivity`, shown instead of the
 *     usual "Restore pages?" screen, and its crash-counter callback
 *     `Lku3;->c(I)V`). Any startup crash - patched or not - eventually
 *     surfaces as this dialog. Opera support forums confirm it also appears
 *     on unmodified installs (e.g. rooted devices, Opera 65).
 *  2. **Virtual-app containers**: the process data directory or the
 *     originating installer package name contains one of Opera's known
 *     cloning-framework markers (`dualaid`, `dualspace`, `excelliance`,
 *     `gspace`, `parallel_*`, `virtualapp`, `waxmoon` -
 *     `OperaApplication.K[]`).
 *  3. **ABI mismatch**: an ARM build launched on x86 hardware
 *     (`string/welcome_init_emulated_arm`).
 *
 * None of these checks verify the APK signature, but (1) is easy to hit: a
 * single startup crash (even an unrelated one) is followed by the dialog on
 * every subsequent launch, and its only advice - reinstall - reproduces the
 * problem for a patched install.
 *
 * The patch closes both doors:
 *
 *  - the dialog builder `d0(Activity, I)` becomes a no-op, so no code path
 *    (crash recovery, virtual-app detection, Compose fragments) can show it;
 *  - `OperaApplication`'s `U()Z` "is installation broken" flag (reads the
 *    static reason field set during `Application.onCreate`) is forced to
 *    `false`, so activities skip their broken-install early return and start
 *    up normally even if the reason field was set.
 *
 * Both methods are identified structurally (resource literal names +
 * instruction shapes), so the fingerprints survive Opera's per-release
 * obfuscation (`Lkfo;` in Beta 104.0.5262.91143). The same structures were
 * verified present in Opera stable 103.x.
 */
private object BrokenInstallDialogFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "I"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "welcome_init_emulated_arm"),
        resourceLiteral(ResourceType.STRING, "welcome_init_failure"),
        string("com.android.vending"),
    ),
)

private object InstallationBrokenFlagFingerprint : Fingerprint(
    definingClass = "Lcom/opera/android/OperaApplication;",
    returnType = "Z",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Ljava/lang/Integer;",
        ),
    ),
)

/**
 * Hides Opera's "Your app installation appears to be broken" dialog.
 */
@Suppress("unused")
val operaHideBrokenInstallationDialogPatch = patch(
    name = "Hide broken installation dialog",
    description = "Prevents the \"Your app installation appears to be broken. " +
        "Try to uninstall and reinstall\" dialog from blocking startup. The " +
        "dialog is Opera's crash-recovery nag (it also appears on unmodified " +
        "installs after a crash or inside app-cloning tools), not a signature " +
        "check, and its reinstall advice cannot fix a patched build.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY)

    execute {
        // The dialog builder becomes a no-op: no caller can show the dialog.
        BrokenInstallDialogFingerprint.method.returnEarly()

        // The "installation broken" flag reads false, so activities that
        // early-return on it keep running their normal startup path.
        InstallationBrokenFlagFingerprint.method.returnEarly(false)

        println("Opera: hid the broken-installation dialog (2 methods patched).")
    }
}
