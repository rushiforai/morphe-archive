# Waze 5.27 admission and phone update checkpoint

## Native adapter admission

The supplied original Waze 5.27.0.1 (1030748) base APK has SHA-256
`0a66289f3db3ad575ef76ea2bac88724ed49ec8afa6f2147955d93e992750397`.
The existing production `validateWazeWarningClassAbi` and
`validateWazeWarningMethods` validators accepted its complete required class,
method-body and selector contracts without changing any fingerprints or
skipping a guard. The temporary read-only original-artifact probe was removed
after retaining its result locally.

The runtime admission now accepts this exact version/code pair alongside
5.26.90.901 (1030746). Unknown or mismatched pairs remain rejected. Admission
still requires `bound()`: an unpatched extension cannot advertise installed
native hooks. Android compilation and unit checks passed in batch100, including
the exact-pair admission test. Python regression checks also passed; their
existing 45 skips do not establish Android runtime behavior.

## Complete original-package patch checks

Batch102 applied the signed engineering bundle built from `2bb8f3f` to the
supplied original packages using Morphe desktop 1.19.1, full DEX emission and
fingerprint validation. Waze 5.27.0.1 accepted all 41 catalogue patches together,
including the renamed branding patch, native alert sharing and system voice.
The exact requested/applied sets match; no patches or reported steps failed.
The existing Waze recents/JNI and display-register verifier also passed.

Maps 26.44.06.1006895251 accepted its complete 28-patch default selection,
including native Android Auto navigation and the external warning consumer.
The original APKM's base alone lacks density-specific product-logo PNGs and
correctly fails the Blue pin patch. Morphe's bundled merger supplies those
resources from the original splits; every original base DEX remains unchanged.
Both original base signatures verify. The merged input is a derived archive,
not an originally signed standalone APK; no test signer or signer bypass was
used to prepare it.

The emitted Maps APK contains all 19 byte-identical owner icons and the shared
health-label code. Its native entry hooks bind original `Larvf.v(F)V` and
`Larvf.w(ILcizm;)V` to `onNativeSpeedInput` and `onNativeLimitInput`, before
display-change gates. A bounded read-only probe checks these against the
original DEX and retains the existing direct-reference/access checks: no missing
or inaccessible references were found. The older standalone reference verifier
still pins `azqb.G/H`; its failed run is retained and is not relabeled passing.
No existing verifier or runtime observation framework was changed.

These outputs are unsigned desktop patch checks. They were not installed on
the phone and do not close the runtime, speech, GPS or car-UI gates.

## Installed De-Waze failure isolated

The owner subsequently enabled all three De-Waze location grants. Vela then
reported healthy engine and data states while warning support remained
unavailable. Read-only inspection of the installed 5.27.0.1 APK confirmed native
hooks were bound, but `supportsEventProtocol` still accepted only
5.26.90.901/1030746. This is the installed older adapter, not a failure of the
newly built 5.27 admission. Apply the corrected bundle through Morphe before
rechecking the warning connection; do not repeat the already working engine
and data checks as if they were still failing.

The owner also requested a location-settings shortcut in both receivers.
It belongs directly under provider health and must target the currently
selected De-Waze or FM package, never the receiver. Use Android's public app
details settings action and explain “Permissions → Location → Allow all the
time.” Android's direct permission editor is protected by
`GRANT_RUNTIME_PERMISSIONS`; do not request that system permission or silently
grant background access. The user makes the choice in Android settings.

## Verified receiver delivery

The feature branch was subsequently rebased onto fetched main `1b3ee2a`.
All recorded navigation source-tree hashes were unchanged by that rebase.
The signed, unpublished review build is `1.53.3+review.e78952feae88`, with SHA-256
`724f410c86bc42d3ee00915aaabc8fbddbfefa650b65aebebb3404a4630bfee9`.
Canonical release files retain their authoritative version; the review identity
was passed only to the Gradle invocation. Full Android and Python checkpoints
passed. No review bundle was published.

Installed-APK inspection initially caught an older extension after a
same-version Manager update. The review source now has the explicit local
display name `Dutch App Patches Navigation Review`; final patch results and
installed code were checked before delivery claims. Vela and the existing
`org.ungoogled.android.apps.maps.microg` installation now contain the settings
helper. Maps retained its 26-patch selection and exact 19-icon asset set. Stock
Google Maps was not replaced.

Actual phone taps verified both call sites: Android recorded
`app.vela` and `org.ungoogled.android.apps.maps.microg` launching
`android.settings.APPLICATION_DETAILS_SETTINGS` with `package:com.waze`.
No permission was changed during those checks. Maps' temporary De-Waze choice
was restored to its original FM choice. Real screenshots in
`~/Downloads/Android-Auto-Functional-Review/` show both receiver settings pages
and Maps opening Waze's Android app-info page.

The phone exception remains explicit: these were normal, uninstrumented
Manager/settings/logcat checks on the owner's unrooted phone. They prove the
settings action and connection state, not warning speech or a simulated drive.
Maps' settings frame reports warning audio unavailable outside the exercised
navigation context; navigation/audio acceptance remains open.

## Physical phone update

The owner authorized in-place navigation app updates through the phone's
existing Morphe Manager and normal DHU/screenshots/logcat without Frida on
this unrooted phone. Emulator observation requirements remain unchanged.

Morphe installed Vela 0.5.2621 and Flitsmeister 15.0 using the signed local
engineering source 1.53.2. Both installed APK signing certificates match the
previous installations. Vela's 19 icon assets match the tracked assets, and the
installed FM DEX contains the current early-request and native maximum-speed
bindings. App data was not cleared and neither app was uninstalled.

Waze and Maps updates and the phone DHU acceptance remain open. Another
workflow changed the focused Morphe search to an unrelated GitHub patch screen;
navigation input stopped to avoid operating on that app. No Spotify or GitHub
patch/install was initiated by this navigation workflow.

The accepted Maps and Vela designs remain frozen. Compilation, bytecode guards
and successful installation do not establish driving alerts, speech, a full
average-speed section, or head-unit behavior. The remaining acceptance must use
genuine provider events with only GPS movement simulated.

## Local evidence

Compact receipts are retained under `.analysis/waze-527-guard-probe-99` and
`.analysis/phone-current-batch-100`. The completed batch's build outputs were
removed after archiving test reports and verifying that its process group had
stopped and no build files were open. Reusable input APKs and the signed review
bundle remain available for the pending Manager updates.
