# Welcome-init-failure dialog analysis (2026-11-08 session)

Investigation of the dialog the user saw on the diagnostics-only build:
"Your app installation appears to be broken. Try to uninstall and reinstall
%1$s again." with Exit / Play Store buttons, over the purple ToS splash.

## String/resource identification

- Stable 103.3.5234: `welcome_init_failure` = resource `0x7f1415a1`;
  referenced ONLY in `ah3.P(Landroid/app/Activity;I)V` (smali in
  classes.dex, verified by scanning all 7 dexes of the base split).
- Beta 104.0.5262: `welcome_init_failure` = `0x7f1415a5`; referenced only in
  `kfo.d0(Landroid/app/Activity;I)V` (classes.dex).
- Related strings in the same method: `welcome_init_emulated_arm` (error
  type 2 = ARM-on-x86 mismatch), `app_validation_failed_message` (error
  type 1 = "Please download and install Opera from a trusted source such as
  Google Play or opera.com" — THIS is the signature/repack validation
  message; the user never saw it), `menu_exit` (negative button),
  `welcome_play_store` (positive button, only shown when the installer
  package is `com.android.vending`).

## Dialog method behavior (ah3.P / kfo.d0)

`AlertDialog.Builder`, non-cancelable, built from an int error code:
- 1 → app_validation_failed (trusted-source message)
- 2 → emulated-ARM message
- 0, 3, 4, 5, default → welcome_init_failure ("installation appears broken")
Positive button = Play Store (if installed via Play) else App settings;
negative = Exit. The method itself is benign; the problem is what calls it.

## Call-site analysis (the important part)

`grep` across every smali class in stable and beta base dexes finds **zero
Java callers** of `ah3;->P(...)` / `kfo;->d0(...)`. No reflective lookup
(`"d0"`, `"Lkfo;"`) exists either (the only `"d0"` string hit is an
unrelated ad-SDK field map). Conclusion: the dialog is invoked from
**native code via JNI** (most likely `libopera.so`, the Chromium wrapper
that performs the actual engine boot), or through a dispatcher whose
targets are resolved at runtime.

However the *failure announcement* path — MainLibraryBoot coordinator →
welcome flow — DOES pass through Java: the coordinator class holds a
subscriber interface with `onSuccess()V` and `onFailure(I)V`-style methods
(target `L??;` short obfuscated class), and the "Ignore browser boot
failures" patch rewrites the two `onFailure(I)` announce calls into
`onSuccess()V` so the welcome flow never learns about the boot failure.
Combined with "Hide broken installation dialog" (return-early on the
dialog method + the installation-broken flag getter), the gate is fully
covered: the engine-boot failure is converted to "success" and even if
something else invokes the dialog, it returns immediately.

## Why this matters for the crash investigation

The diagnostics-only build reaching the welcome screen proves: extension
dex merging works, the app process starts, Application.onCreate completes.
The missing Next button was the engine-boot-failure gate, not a crash and
not a signature problem. The still-unexplained instant crash of FULL
patched builds therefore comes from one of the remaining patches (prime
suspect: Spoof app signature v1.2.3 call-site redirects; secondary: one of
the bytecode patches). The DIAG bisection pack (DIAG00/1/2) and the
vogelkop-diag.log from a full+diagnostics build will discriminate.

## Reproduction pointers for future sessions

- Decode a single dex without resources:
  `python3 -c "import zipfile; zipfile.ZipFile('base.apk').extract('classes.dex')"`
  then wrap the bare dex into a 22-byte-EOCD zip and
  `java -jar apktool.jar d --no-res` (apktool refuses bare .dex files).
- Resource-id → name: `res/values/public.xml` from an apktool decode of the
  base split (IDs differ between stable and beta!).
- `scripts/beta_welcome_callers.py` + `scripts/beta_d0_callers.py` in this
  repo automate the dex scans (androguard 3.3.5 via pip).
