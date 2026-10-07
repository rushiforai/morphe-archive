# Reddit Share-Profile-as-Username — Design Spec
Date: 2026-10-05
Status: draft for review
Approach: 1 — minimal single-patch module from morphe-patches-template

## 1. Intent

What you said:
- New dir `Morphe-patches` under `/home/kuromori/Projects`.
- Custom Morphe patch for Reddit (`com.reddit.frontpage`).
- Sharing a user profile page link (e.g. `https://www.reddit.com/user/rere`) should share as `rere` only.
- Scope confirmed: profiles only + toggle in settings.
- Target latest exp Reddit that official Morphe patches support — you state `2026.40.0`.
- Confirmed: use GitHub remote repo, GH Actions build, auto-check every 6h for upstream Reddit patch/app-version changes, retarget + rebuild on change, all builds test-gated.

Assumptions (correct if wrong):
- Standalone patch source usable alongside `MorpheApp/morphe-patches` via `Morphed` builder multi `patches-source` (`"'MorpheApp/morphe-patches' 'your/repo'"` with `|` split).
- Public GitHub repo named `Morphe-patches` (visibility TBD — default public).
- Kotlin + Morphe patcher SDK, template `MorpheApp/morphe-patches-template`.
- MinSdk 29, APKM, signature check same as upstream Reddit.

Success criteria:
- Share from `u/<name>` profile with toggle ON yields `<name>` in share sheet/clipboard.
- Toggle OFF yields stock behavior.
- Post/subreddit/comment links unchanged in both modes.
- `./gradlew test` + `./gradlew buildAndroid` pass; `.mpp` artifact produced by Actions.
- 6h checker opens retarget (PR or commit) only when upstream Reddit target changes, and triggered build is test-gated.

## 2. Architecture (Section 1/6 — approved)

```
Morphe-patches/
  patches/src/main/kotlin/app/morphe/patches/reddit/profile/shareusername/
    ShareProfileUsernamePatch.kt
    Fingerprints.kt
  extensions/reddit-shareusername/
    ShareProfileUsername.java -> share-username.mpe (extendWith)
  docs/superpowers/specs/<this file>
  .github/workflows/build.yml
  .github/workflows/check-upstream.yml
  scripts/check-upstream-reddit.sh + reddit-target.txt
```

Self-contained bundle: own `booleanOption` toggle, no dependency on upstream `settingsPatch` initially. Reuses upstream `ShareLinkFormatterFingerprint` shape.

Upstream reference (fetched 2026-10-05): `COMPATIBILITY_REDDIT` lists exp `2026.39.0 / 38.0 / 37.0`, stable `2026.24.0 / 14.0 / 10.0`. User states latest exp is `2026.40.0` — spec targets `2026.40.0`, implementation verifies fingerprint on `40.0` first and falls back to `39.0` pattern if moved.

## 3. Components (Section 2/6)

- `Fingerprints.kt`: `ShareProfileLinkFingerprint` — `public static final String (String, Map)` + `Uri$Builder;->clearQuery()` filter (same as upstream `ShareLinkFormatterFingerprint`). If `40.0` moved it, re-fingerprint by return-type + params + `clearQuery` call, not by obfuscated name.
- `ShareProfileUsernamePatch.kt`: `bytecodePatch(name = "Share profile as username", description = "Shares user profile links as username only.")`, `compatibleWith(Reddit 2026.40.0 exp)`, `extendWith("share-username.mpe")`, inject at method entry: toggle off -> return original; else `shortenProfileLink(p0)`.
- Extension `ShareProfileUsername.java`: `public static String shortenProfileLink(String url)` — regex `^https?://(www\.|old\.)?reddit\.com/user/([^/?#]+).*` -> group 2, else input. Null-safe, trims whitespace.

## 4. Data flow (Section 3/6)

Share sheet -> `ShareLinkFormatter.format(url, params)` -> patched prologue calls `shortenProfileLink(p0)` -> profile URL returns `rere`, non-profile returns original -> share intent/clipboard. Non-profile links pass through untouched; query-param sanitizing left to upstream patch.

## 5. Error handling + compatibility (Section 4/6)

- Null/empty/whitespace URL -> return as-is.
- No regex match / already short -> return as-is.
- Toggle off -> zero behavior change.
- Fingerprint miss on `40.0` -> throw `PatchException`, fail fast, no partial APK.
- Target only `2026.40.0` exp initially (MinSdk 29, APKM `com.reddit.frontpage`).

## 6. Testing (Section 5/6)

- Unit tests on extension regex: `https://www.reddit.com/user/rere` -> `rere`; `.../user/rere/?utm_source=share` -> `rere`; `https://old.reddit.com/user/rere/` -> `rere`; post URL unchanged; null/empty safe.
- Patch validation: `./gradlew buildAndroid`, patch stock `2026.40.0` APKM with `morphe-desktop`, share from profile -> `rere`; share from post/subreddit -> full URL.
- Regression: toggle OFF restores stock URLs.

## 7. GitHub + CI (Section 6/6 — new scope)

- Remote: `github.com/<owner>/Morphe-patches` (owner + visibility TBD at plan stage; default public). Local `git init` on spec commit; `gh repo create` deferred to implementation after plan approval.
- `build.yml` (test-gated): on `push`, `pull_request`, `workflow_dispatch`, and `workflow_call` from checker. Steps: checkout, setup JDK (match template, TBD 17/21), `chmod +x gradlew`, `./gradlew test` (gate — fail blocks artifact), `./gradlew buildAndroid`, upload `.mpp` + test reports. No release publish in v1.
- `check-upstream.yml`: `cron: 0 */6 * * *` + `workflow_dispatch`. Script `scripts/check-upstream-reddit.sh` fetches upstream Reddit target (primary: `Constants.kt` `COMPATIBILITY_REDDIT` on main; fallback: latest `morphe-patches` release notes / `patches-list.json`), compares with local `reddit-target.txt` (seed `2026.40.0`). If changed: update `reddit-target.txt` + `Fingerprints.kt` compat + open PR (default) or direct commit (TBD), then call `build.yml` logic — which re-runs tests as gate. No change -> exit 0, no build.
- Test-gating rule: every build path (push/PR/scheduled-retarget/manual) must pass `./gradlew test` before `.mpp` is produced/uploaded. Checker never auto-merges on red.

Open questions for plan stage:
1. GitHub owner/org + public vs private?
2. Retarget delivery: PR (recommended) vs direct push to main?
3. Notify where on retarget (issue, commit message, Telegram — like Morphed)?
4. Also track upstream template/patcher version bumps, or Reddit version only?

## 8. Non-goals (v1)

- No fork of full `morphe-patches`; no YouTube/Music/TikTok patches.
- No Obtainium/website catalog integration (Morphed builder wiring is follow-up).
- No additional share modes (e.g. `u/rere`, `reddit.com/u/...`) unless requested.
