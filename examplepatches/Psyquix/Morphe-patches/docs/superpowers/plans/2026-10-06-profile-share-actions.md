# Profile share actions Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the username-rewriting patch with two injected share-sheet buttons (Copy username + Open ghostddit) on Reddit profiles.

**Architecture:** Compose ActionItem 2-hook — append 2 rows on profile shares, intercept their clicks (rev A; clone-at-bind void per Phase 0)

**Tech Stack:** Kotlin (Morphe bytecodePatch + Fingerprint), Java extension (ClipboardManager, ACTION_VIEW), Android vector drawables, JUnit5, Gradle.

**Spec:** `docs/superpowers/specs/2026-10-06-profile-share-actions-design.md`

## Global Constraints

- Targets: `com.reddit.frontpage` `2026.40.0` (exp) + `2026.39.0` (exp), `minSdk 29`, `APKM` — `reddit-target.txt` stays `2026.40.0`.
- Copy value is bare username only (e.g. `rere`), no `u/` prefix, no URL, plus toast.
- Ghostddit URL is `https://ghostddit.aeddit.com/user/<Uri.encode(name)>/` with trailing slash, opened via external `ACTION_VIEW` + `FLAG_ACTIVITY_NEW_TASK`.
- Buttons appear only when `extractUsername != null`; `[Copy link]` / `[Share via]` / everything else stays stock.
- Icons are bundled vectors (bold U + ghost outline), white-tinted, size cloned from [Copy link] at runtime — no network fetch.
- Old `shortenProfileLink` / `wasShortened` injection is fully deleted.

## Review Focus

- Username with dots/dashes/unicode encoded correctly in ghostddit URL — expect `%`-encoding, not raw truncation.
- Share-sheet rebind (rotate, reopen) does not duplicate the 2 buttons — expect exactly 2 injected views.
- Post/subreddit/comment share shows zero new buttons — expect no injection when URL is not `/user/` or `/u/`.
- Device with no browser for ACTION_VIEW does not crash — expect toast fallback.
- 2026.39.0 sheet layout drift vs 2026.40.0 — expect both versions inject, or miss cleanly to stock with no crash.

---

### Task 1: Extension pure logic (extract + URL builder)

**Files:**
- Modify: `extensions/extension/src/main/java/app/morphe/extension/reddit/profile/ShareProfileUsername.java` (rename to `ProfileShareActions.java` in this task)
- Test: `extensions/extension/src/test/java/app/morphe/extension/reddit/profile/ShareProfileUsernameTest.java` (rename to `ProfileShareActionsTest.java`)

**Interfaces:**
- Consumes: nothing (standalone).
- Produces: `public static String extractUsername(String url)` (bare name or null); `public static String ghostdditUrl(String username)` (full URL with trailing slash).

- [ ] **Step 1: Write failing tests for `extractUsername` + `ghostdditUrl`**

```java
@Test void extractsBareUser() { assertEquals("rere", ProfileShareActions.extractUsername("https://www.reddit.com/user/rere")); }
@Test void extractsShortUPrefix() { assertEquals("rere", ProfileShareActions.extractUsername("https://www.reddit.com/u/rere")); }
@Test void extractsTokenLink() { assertEquals("LowMarket6464", ProfileShareActions.extractUsername("https://www.reddit.com/u/LowMarket6464/s/5sPZgIEqx8")); }
@Test void nonProfileReturnsNull() { assertNull(ProfileShareActions.extractUsername("https://www.reddit.com/r/funny/comments/1abc/")); }
@Test void nullReturnsNull() { assertNull(ProfileShareActions.extractUsername(null)); }
@Test void ghostdditTrailingSlash() { assertEquals("https://ghostddit.aeddit.com/user/rere/", ProfileShareActions.ghostdditUrl("rere")); }
@Test void ghostdditEncodes() { assertEquals("https://ghostddit.aeddit.com/user/a%20b/", ProfileShareActions.ghostdditUrl("a b")); }
```

- [ ] **Step 2: Run to verify they fail**

Run: `./gradlew :extensions:extension:testDebugUnitTest --tests "app.morphe.extension.reddit.profile.ProfileShareActionsTest"`
Expected: FAIL (class/methods not found).

- [ ] **Step 3: Implement `extractUsername` + `ghostdditUrl` in `ProfileShareActions.java`**

Reuse existing `PROFILE_LINK` regex (`^https?://(www\.|old\.)?reddit\.com/(?:user|u)/([^/?#]+).*`, CASE_INSENSITIVE); return `group(2)` or null. `ghostdditUrl` returns `"https://ghostddit.aeddit.com/user/" + Uri.encode(username) + "/"` (use `android.net.Uri.encode`; null/empty returns null).

- [ ] **Step 4: Port remaining old URL variants as `extractUsername` tests and run**

Port: query/fragment, old.reddit, uppercase scheme, dash/underscore, `u/` trailing slash, empty segments → null, empty string → null. Run same Gradle command.
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add extensions/extension/src/main/java/app/morphe/extension/reddit/profile/ProfileShareActions.java extensions/extension/src/test/java/app/morphe/extension/reddit/profile/ProfileShareActionsTest.java
git commit -m "feat: extractUsername and ghostdditUrl with tests"
```

### Task 2: Extension Android actions + icons

**Files:**
- Modify: `extensions/extension/src/main/java/app/morphe/extension/reddit/profile/ProfileShareActions.java`
- Create: `extensions/extension/src/main/res/drawable/ic_copy_u.xml`
- Create: `extensions/extension/src/main/res/drawable/ic_ghost.xml`

**Interfaces:**
- Consumes: `extractUsername`, `ghostdditUrl` from Task 1.
- Produces: `public static void copyUsername(android.content.Context ctx, String username)`; `public static void openGhostddit(android.content.Context ctx, String username)`; drawable IDs `R.drawable.ic_copy_u`, `R.drawable.ic_ghost`.

- [ ] **Step 1: Add vector drawables**

`ic_copy_u.xml`: 24dp viewport, white bold `U` centered (path or `<text>`-free vector stroke). `ic_ghost.xml`: ghost outline from approved mock (white stroke 1.8, fill none). Both `android:tint="?attr/colorControlNormal"`-compatible (use `@android:color/white` fill/stroke so sheet tint applies).

- [ ] **Step 2: Implement `copyUsername` + `openGhostddit`**

`copyUsername`: `ClipboardManager.setPrimaryClip(ClipData.newPlainText("username", username))` + `Toast.makeText(ctx, "Username copied", LENGTH_SHORT).show()`; null-guard. `openGhostddit`: `ctx.startActivity(new Intent(ACTION_VIEW, Uri.parse(ghostdditUrl(username))).addFlags(FLAG_ACTIVITY_NEW_TASK))`, catch `ActivityNotFoundException` → toast.

- [ ] **Step 3: Verify build + unit tests still pass**

Run: `./gradlew :extensions:extension:testDebugUnitTest :extensions:extension:assembleDebug`
Expected: PASS + `extension.mpe` produced.

- [ ] **Step 4: Commit**

```bash
git add extensions/extension/src/main/java/app/morphe/extension/reddit/profile/ProfileShareActions.java extensions/extension/src/main/res/drawable/
git commit -m "feat: copy/open actions and button icons"
```

### Task 3: Patch hook — Compose ActionItem 2-hook injection (second attempt; supersedes clone-at-bind per Ruling R1)

**Files:**
- Modify: `patches/src/main/kotlin/app/morphe/patches/reddit/profile/shareusername/Fingerprints.kt` (already stubbed in d1e40f7 — verify/replace)
- Modify: `patches/src/main/kotlin/app/morphe/patches/reddit/profile/shareusername/ShareProfileUsernamePatch.kt` (already renamed to `Profile share actions`, `execute` empty — fill in)
- Delete: old `shortenProfileLink`/`wasShortened` call path (done in d1e40f7 — verify absent)

**Interfaces:**
- Consumes: `ProfileShareActions.extractUsername/copyUsername/openGhostddit` from Tasks 1–2; Phase-0 evidence in `.superpowers/sdd/2026-10-06-profile-share-actions/task-3-report.md` §1 (decompiled trees at `/tmp/opencode/task3-apk/reddit{40,39}-decompiled/`, may be gone — re-download per report §1 if so).
- Produces: bytecode patch `profileShareActionsPatch` compatible with 2026.40.0 + 2026.39.0, appending 2 `ActionItem`s on profile shares and intercepting their clicks. Icon enum choice (single constant, swappable): `IconEnum.Clipboard` for Copy username, `IconEnum.External` for Open ghostddit. Labels hardcoded English v1: `"Copy username"`, `"Open ghostddit"`.

- [ ] **Step 1: Confirm Phase-0 targets still on disk (re-acquire if missing)**

Check `/tmp/opencode/task3-apk/reddit40-decompiled/` and `reddit39-decompiled/` exist; if not, re-download per report §1 (APKMirror ids in report) and re-decompile with apktool. Confirm: `ActionItem` synthetic ctor `(IILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lcom/reddit/ui/compose/icons/IconEnum;ZZLjava/util/List;ILandroid/os/Bundle;ZLjava/lang/String;I)V` identical on both; `handler/a.c(List)List` leaves Copy-link insertion for posts/subs; `handler/a.g(db0, Continuation)` click dispatch with `hashCode()` id compare and `sheet.e1.n1(id)` dismiss fallthrough.

- [ ] **Step 2: Finalize `Fingerprints.kt` for the two hooks**

Hook 1 (list append): fingerprint the profile-side `ArrayList<ActionItem>` build or the `b.a(...)` factory path gated to `ShareableProfileData`/`ShareEntryPoint.Profile` — prefer `IconEnum` + structural filters over literal res ids (ids drift: `label_copy_link_v2 0x7f1311f2`→`0x7f1311f4`) and over obfuscated leaf names (drift: `kpi→w1f`). One fingerprint per version if needed. Hook 2 (click): fingerprint `handler/a.g` by its `ActionItem`-param + `Continuation` + `hashCode()`-compare shape. Keep the UNVERIFIED marking convention only until a fingerprint is actually exercised; delete any fingerprint left unused.

- [ ] **Step 3: Implement the 2-hook injection in `ShareProfileUsernamePatch.kt`**

Hook 1: after the profile list is built, call `ProfileShareActions.extractUsername(shareUrl)` — null means append nothing; else append 2 `ActionItem`s with fresh ids outside the action-type `hashCode()` range (verify against the singletons in smali), labels `"Copy username"` / `"Open ghostddit"`, icons `Clipboard` / `External`, guarded so a rebind appends once. Hook 2: prologue on the click dispatch matching the 2 ids → `copyUsername` / `openGhostddit` with a Context resolved from handler fields; every other id falls through untouched. Do not touch the Copy-link/Share-via insertion path.

- [ ] **Step 4: Verify patch compiles and unit tests pass**

Run: `./gradlew :patches:buildAndroid`
Expected: PASS.
Run: `./gradlew :extensions:extension:testDebugUnitTest`
Expected: PASS (19/19). State plainly in the report that fingerprint resolution is NOT verified here (resolves only inside the patcher with the APK) and device apply-test on 40.0 + 39.0 remains owner-side (Task 4 manual).

- [ ] **Step 5: Commit**

```bash
git add patches/src/main/kotlin/app/morphe/patches/reddit/profile/shareusername/
git commit -m "feat: Compose ActionItem share hooks for 40 and 39"
```

### Task 4: Compatibility, cleanup, docs

**Files:**
- Modify: `patches/src/main/kotlin/app/morphe/patches/reddit/shared/Constants.kt`
- Modify: `README.md`
- Delete: `extensions/extension/src/main/java/app/morphe/extension/reddit/profile/ShareProfileUsername.java` (leftover), `extensions/extension/src/test/java/app/morphe/extension/reddit/profile/ShareProfileUsernameTest.java` (leftover)

**Interfaces:**
- Consumes: all prior tasks.
- Produces: shippable bundle for 40 + 39 with updated docs.

- [ ] **Step 1: Narrow `COMPATIBILITY_REDDIT` to 2026.40.0 + 2026.39.0**

Keep two `AppTarget`s (`2026.40.0` exp, `2026.39.0` exp, `minSdk 29`); delete the `2026.24.0` block. Leave `reddit-target.txt` at `2026.40.0`.

- [ ] **Step 2: Update README patch table**

Replace `Share profile as username` row with `Profile share actions` — copies bare username via [Copy username], opens ghostddit via [Open ghostddit], [Copy link] stock, profile-only. Keep `REDDIT-VERSION` markers intact.

- [ ] **Step 3: Full gate + manual checklist**

Run: `./gradlew test`
Expected: PASS. Manual (on patched 40.0 + 39.0): profile share shows exactly 2 working buttons with no duplicates after reopen/rotate; post/sub share shows none; [Copy link] output is stock full URL.

- [ ] **Step 4: Commit**

```bash
git add patches/src/main/kotlin/app/morphe/patches/reddit/shared/Constants.kt README.md
git commit -m "chore: target 40 and 39 exp, update docs for share actions"
```
