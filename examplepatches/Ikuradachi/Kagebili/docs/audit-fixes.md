# Bstation audit fixes

Approved scope: the five recommendations in `analysis/bstation/notes/audit-fixes-design.md`. Existing consolidation and Android packaging repairs remain intact; version stays `1.1.0-dev.1`.

## Behavior repairs

1. `player/PlayerOutroPatch.kt` no longer injects an early return into the generic Chronos transport dispatcher. The three outro widgets and the specific GetCommandInfo callback hook remain. The unused dispatcher fingerprint was removed after a repository reference search.
2. `ui/PureDiscoverSearchBarPatch.kt` now prepends `Collections.emptyList()` to the incoming native trending renderer list instead of bypassing the renderer. Native list assignment, page reset, empty flag, container hiding and divider cleanup therefore execute. The native `onViewCreated` setup receives a final helper call using fragment `p0` (the incoming view `p1` has been overwritten by then). This helper checks the native binding, invokes native empty rendering, clears the refresh listener, disables refresh and hides it. Its binding/refresh references are dynamically discovered from the verified renderer and checked against native view initialization. No obfuscated fingerprint name or resource-ID guess was added.

Verified original targets: `classes7/cj/h.e(String,byte[],cj/f)V`; `classes10/com/bilibili/bangumi/ui/page/discover/HomeDiscoverFragment.p7(List)V` and `onViewCreated(View,Bundle)V`. The new lifecycle fingerprint uses the existing class event selector, public lifecycle signature and ordered RecyclerView.setAdapter/ImageView.setOnClickListener SDK calls, with exactly one match required. Original smali confirms the sole return follows listener/observer setup; the native renderer's unique TintImageView field identifies the refresh control and its binding owner identifies the fragment binding. All original control-flow checks and unrelated callbacks remain.

## Maintenance repairs

3. `scripts/home_smali.py` now contains the bounded evaluator directly. `check-home-search.py` imports it normally; it no longer loads code from ignored sibling analysis files. Run `PYTHONDONTWRITEBYTECODE=1 python3 scripts/check-home-search.py /absolute/path/to/emitted/HomeFragmentV2.smali`. The fixture must have both search hiding and single-page simplification enabled. A temporary standalone checkout containing only the two Python files and that explicit fixture passed without an analysis directory; log `build/audit-home-portability.log`.
4. README was regenerated through the existing command: `python3 .github/scripts/generate_patches_readme.py Ikuradachi/Kagebili dev patches-list.json README.md`. It reports six current patches; table content was not hand edited.
5. The unused nine-line `FavoriteGuidelineFingerprint` declaration was removed after confirming no consumers. Existing source comments were preserved.

## Checks and artifacts

`./gradlew :patches:generatePatchesList --offline` passed, including Android DEX packaging. Log: `build/audit-fixes-build.log`. `scripts/check-android-bundle.py` passed ZIP CRC, DEX magic, six current registrations and absence of obsolete getters. Current bundle SHA-256: `7406cbd3dec5b20d4fba42203749d79ca595685da9dbee5401f69de748811199`. Historical shipped bundle `4019d0...111e665` under the analysis build archive remains untouched.

Focused emitted-code regression command: `PYTHONDONTWRITEBYTECODE=1 python3 scripts/check-audit-fixes.py <emitted-smali-root> <original-smali-root> [all|chronos|discover]`. The Chronos check compares all native dispatcher instructions/control flow; the Discover check proves its full native renderer remains after the empty-list prefix, validates the lifecycle hook, and executes the injected init helper with binding/refresh mocks. Both checks fail on the prior defective emitted defaults. Local application and emitted-DEX validation are separate validator gates; no device runtime verification is claimed.

Files changed for this audit: `player/PlayerOutroPatch.kt`, `player/Fingerprints.kt`, `ui/PureDiscoverSearchBarPatch.kt`, `ui/Fingerprints.kt`, `scripts/check-home-search.py`, new `scripts/home_smali.py`, new `scripts/check-audit-fixes.py`, regenerated README and this document. Package paths are relative to `patches/src/main/kotlin/id/ikuradachi/patches/bstation/` where appropriate. No dependencies, APK targets, version or unrelated patch behaviors changed.
