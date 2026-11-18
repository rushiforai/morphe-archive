# Pizza 5.59.2 and the short update notice

The target is Good Pizza, Great Pizza 5.59.2 (2337), ARM64. Use the complete
publisher-signed APK, APKM or XAPK, including game assets, and keep the signing
key previously used for your patched installation.

The optional, default-selected **Non-blocking update notice** patch replaces
the game's local update screen with one Android short toast and resumes the
existing loading continuation. The server version status is preserved. This
does not make an incompatible backend protocol work with an older client.

The extended sponsor reward patch has been removed at the user's request.
Sponsor limits and gem quantities now come from the original game. **Skip rewarded ads**, **Google Play
Games via MicroG-RE** and **Hide paid offers** retain their roles. Real-money
checkout still cancels; no purchase success or verification is fabricated.

## Updating without a manual APK download

Follow [the saved APKMirror intake procedure](apkmirror-download.md). The helper
tries HTTP first; if APKMirror requires a browser, the agent follows the
documented normal browser flow and verifies the downloaded file itself. A
Google vignette can intercept the final link: close its actual ad control,
then prepare a download event before clicking **here**. Do not treat a timeout
or a landing page as a completed download or routinely send this step back to
the user.

## Profile changes

This input has no PairIP classes, protected VM callers or uninitialized string
holders. Its explicit `protectedInitialization=false` profile retains original
SDK/native initialization; it does not restore another version's code. Older
protected profiles keep their existing bootstrap resources. The original native
hash still identifies the reviewed input before any optional transforms.

The normal native version callback is hooked at its update-UI branch. For its
update statuses, it requests the Java toast and invokes the existing loading
continuation and cleanup. Other statuses follow the original path. The patch
does not alter account, authentication, wallet or purchase fields.

Native PZB2 variants compose the optional paid-offer and notice transforms
using exact input/output hashes. Unknown or already modified binaries fail with a
specific diagnosis rather than receiving a different version's delta.

## Verification record

The following records the original 1.39.0 implementation, including the sponsor
extension that has since been removed. Current releases do not include its
patch, payload, generator or metadata entry. Repatch the clean input with the
current bundle and keep the existing signing key to remove it from an installed
APK; refreshing the patch bundle alone cannot rewrite an already installed game.

Original complete APK SHA256:
`ea0fd7c38af20c4f8e8c083f2991db4ee18c3d5cd8c2ec8f347d1fcca029ae39`.
Publisher certificate SHA256:
`0eb1a98d45c137dc00fb01d89cf6d08cc228d56907a2b00700f7d55cda62d6f7`.
The archive contains 6736 asset files and 32 native libraries across both ABIs.
Only ARM64 is a supported patched runtime target.

The final source build and full clean-input patch pass. The packaged profile
registry selects all four supported versions and rejects mismatched identities.
Native tests cover four notice variants, 16 scenarios each repeated twice,
including failed Java lookup/helper exceptions and the existing null-callback
failure path. Both optional-transform orders give identical outputs. Actual
PNN instructions preserve the 999-to-PNN2 boundary, 10-gem payout and animation.
The old 5.59.0 PNN generator output remains byte-identical.

The emitted APK preserves all 6736 assets and 32 libraries except the exact
reviewed ARM64 native reconstruction. DEX verification preserves 70 bridge,
3360 authentication/SDK and 2137 executable billing methods, with 23 unchanged
availability/result/activity methods. DEX string-pool growth legitimately
changes const-string to const-string/jumbo; the parity verifier now compares
identical values and branch/exception targets independently of that encoding
width. A RED/GREEN fixture also rejects changed values and targets.

The first patch attempt rejected a Coffee-specific single-return assumption.
Pizza instead initializes the helper after its existing accepted-Activity
assignment, preserving the duplicate-window/root check. The successful rebuild
and clean patch include this correction; failed-attempt evidence is retained.

Private input, output, copied-account data backup and logs are under
`E:/Codex-Morphe-Pizza-20261029`. Game files, credentials, raw account logs and
signing keys are excluded from Git and release assets.

## Runtime scope and limits

The normal installed APK passes startup, the existing linked TapBlaze account
panel and actual day clock on the copied API35 Debug account, in 54.9 seconds
with 11 local OCR frames and zero saved images. This is a prepared-process pass
after separately cancelling Google/MicroG setup and dismissing the genuine
update gift and seasonal banner. Three initial setup-blocked reports are
retained; 54.9 seconds is not total cold-start/install time.

A separate memory-only probe bypasses the original 720-second version-check
cache and forces only the callback register to its update outcome. The actual
production toast appears/disappears in **2.558 seconds**, and that same process
reaches the game menu without an app fatal marker. Neither the installed APK
nor stored server-status/account fields are changed by the probe. The first
filename-mapping and cached-query probes do not count as passing toast evidence.

The retained disposable Debug signing key permits update-in-place without data
wiping. The original account AVD and its unavailable older signing key were not
replaced. No fresh Google login, cloud-save restore, physical ARM64/API36,
patched ARM32, real charge or loop of 1000 actual sponsor rewards is claimed.
The sponsor instruction tests establish the changed counter/payout; this task's
runtime checks stay limited to the requested smoke and new toast behavior.
