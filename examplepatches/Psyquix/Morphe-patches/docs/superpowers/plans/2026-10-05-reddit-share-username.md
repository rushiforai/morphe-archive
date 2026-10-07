# Reddit Share-Profile-as-Username Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship `Morphe-patches` bundle with one Reddit patch that shares `/user/<name>` links as `<name>` only, test-gated builds plus 6h upstream retarget.

**Architecture:** Clone `MorpheApp/morphe-patches-template`, replace example with `shareusername` patch reusing upstream `ShareLinkFormatter` fingerprint shape, pure-Java URL shortener in extension `.mpe`, two GH Actions workflows (build + check-upstream).

**Tech Stack:** Kotlin (patches), Java (extension), Gradle `app.morphe.patches:1.3.4`, Morphe Patcher SDK, JUnit5, bash, GitHub Actions (Temurin 21), `gh` CLI.

**Spec:** `docs/superpowers/specs/2026-10-05-reddit-share-username-design.md`

## Global Constraints

- Package `com.reddit.frontpage`, APKM, MinSdk 29, target `2026.40.0` exp (fallback verify `2026.39.0` fingerprint).
- Patch name `Share profile as username` verbatim; description `Shares user profile links as username only.` verbatim.
- Extension regex `^https?://(www\.|old\.)?reddit\.com/user/([^/?#]+).*` -> group 2, else input; null/empty passthrough.
- Every build path runs `./gradlew test` before `:patches:buildAndroid`; red blocks `.mpp` upload.
- Checker cron `0 */6 * * *`; compares upstream `Constants.kt` vs local `reddit-target.txt` (seed `2026.40.0`); retarget via PR by default, never auto-merge on red.
- No full `morphe-patches` fork; no YouTube/Music patches in v1.

## Review Focus

- Uppercase URL `HTTPS://WWW.REDDIT.COM/user/RERE` — expect `RERE` (case-insensitive scheme/host, preserve username case); test in Task 2.
- Short form `u/rere`, `/u/rere`, `reddit.com/u/rere` — expect passthrough unchanged (profiles-only scope); test in Task 2.
- Weird usernames `user/a-b_c`, trailing `/`, `?utm=`, `#frag` — expect bare name stripped; test in Task 2.
- Empty name `https://www.reddit.com/user/` or `/user//` — expect return as-is, no crash; test in Task 2.
- Upstream `Constants.kt` format drift (no `COMPATIBILITY_REDDIT` block) — expect checker warns + exits 0, no false retarget; test in Task 5.

---

### Task 1: Scaffold repo from template + Reddit compat

**Files:**
- Copy from template (exclude `.git`): `settings.gradle.kts`, `build.gradle.kts`, `gradle.properties`, `gradle/`, `gradlew`, `patches/build.gradle.kts`, `extensions/extension/build.gradle.kts`, `patches/src/main/kotlin/util/`
- Create: `patches/src/main/kotlin/app/morphe/patches/reddit/shared/Constants.kt`
- Create: `reddit-target.txt` (content `2026.40.0`)
- Delete: `patches/src/main/kotlin/app/template/`, `extensions/extension/src/main/java/app/template/`
- Modify: `settings.gradle.kts` rootProject.name -> `morphe-patches`; `patches/build.gradle.kts` about block (name `Morphe Patches (Reddit Share Username)`, source `git@github.com:<owner>/Morphe-patches.git`)
- Test: none (build is the check)

**Interfaces:**
- Consumes: template tag main (plugin `app.morphe.patches:1.3.4`, Temurin 21).
- Produces: `Constants.COMPATIBILITY_REDDIT` (name `Reddit`, packageName `com.reddit.frontpage`, apkFileType APKM, appIconColor `0xFF4500`, targets `[AppTarget(version=2026.40.0, minSdk=29, isExperimental=true)]`); `reddit-target.txt` read by Task 5.

- [ ] **Step 1: Fetch template tarball and copy excluding git metadata**

Run: `curl -sL https://github.com/MorpheApp/morphe-patches-template/archive/refs/heads/main.tar.gz -o /tmp/opencode/mpl.tgz && tar xzf /tmp/opencode/mpl.tgz -C /tmp/opencode && cp -r /tmp/opencode/morphe-patches-template-main/{settings.gradle.kts,build.gradle.kts,gradle.properties,gradle,gradlew,gradlew.bat,patches,extensions,package.json} /home/kuromori/Projects/Morphe-patches/ && rm -rf /home/kuromori/Projects/Morphe-patches/patches/src/main/kotlin/app/template /home/kuromori/Projects/Morphe-patches/extensions/extension/src/main/java/app/template`
Expected: `ls patches/src/main/kotlin` shows only `util/`; no `app/template/`.

- [ ] **Step 2: Write `Constants.kt` with exact spec values**

Create `patches/src/main/kotlin/app/morphe/patches/reddit/shared/Constants.kt` with `COMPATIBILITY_REDDIT` (Reddit, com.reddit.frontpage, APKM, 0xFF4500, single AppTarget 2026.40.0/minSdk 29/exp true).

- [ ] **Step 3: Write `reddit-target.txt` + rename project/about**

Run: `echo -n "2026.40.0" > reddit-target.txt`; edit `settings.gradle.kts` name and `patches/build.gradle.kts` about block.
Expected: `cat reddit-target.txt` is `2026.40.0`.

- [ ] **Step 4: Verify scaffold compiles**

Run: `./gradlew :patches:compileKotlin --no-daemon -q` in `Morphe-patches/`
Expected: BUILD SUCCESSFUL (needs `GITHUB_TOKEN`/`gpr.*` for GitHub Packages; if 401, set `~/.gradle/gradle.properties` per template README and rerun).

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "feat: scaffold from morphe-patches-template with reddit 2026.40.0 compat"
```

### Task 2: Extension URL shortener + unit tests (TDD)

**Files:**
- Create: `extensions/extension/src/main/java/app/morphe/extension/reddit/profile/ShareProfileUsername.java`
- Create: `extensions/extension/src/test/java/app/morphe/extension/reddit/profile/ShareProfileUsernameTest.java` (JUnit5; add `testImplementation junit-jupiter` to `extensions/extension/build.gradle.kts` if missing)
- Test: above test class

**Interfaces:**
- Consumes: none.
- Produces: `public static String shortenProfileLink(String url)` in class `app.morphe.extension.reddit.profile.ShareProfileUsername` (EXTENSION_CLASS `Lapp/morphe/extension/reddit/profile/ShareProfileUsername;` used by Task 3).

- [ ] **Step 1: Write failing test with spec values + Review Focus cases**

```java
assertEquals("rere", shortenProfileLink("https://www.reddit.com/user/rere"));
assertEquals("rere", shortenProfileLink("https://www.reddit.com/user/rere/?utm_source=share"));
assertEquals("rere", shortenProfileLink("https://old.reddit.com/user/rere/"));
assertEquals("RERE", shortenProfileLink("HTTPS://WWW.REDDIT.COM/user/RERE"));
assertEquals("a-b_c", shortenProfileLink("https://www.reddit.com/user/a-b_c?utm=x#frag"));
assertEquals("https://www.reddit.com/r/funny/comments/1abc/", shortenProfileLink("https://www.reddit.com/r/funny/comments/1abc/"));
assertEquals("u/rere", shortenProfileLink("u/rere"));
assertEquals("https://www.reddit.com/user/", shortenProfileLink("https://www.reddit.com/user/"));
assertNull(shortenProfileLink(null));
assertEquals("", shortenProfileLink(""));
```

- [ ] **Step 2: Run test, verify FAIL (class not found)**

Run: `./gradlew :extensions:extension:test --tests "*ShareProfileUsernameTest*" --no-daemon`
Expected: FAIL, compilation error / no tests.

- [ ] **Step 3: Implement `shortenProfileLink(String url) -> String`**

Null/blank passthrough, trim, `Pattern.compile("^https?://(www\\.|old\\.)?reddit\\.com/user/([^/?#]+).*", CASE_INSENSITIVE).matcher(url)`, return group 2 else input. No Android imports (pure JVM).

- [ ] **Step 4: Run test, verify PASS**

Run: same as Step 2
Expected: 11 tests PASS, BUILD SUCCESSFUL.

- [ ] **Step 5: Commit**

```bash
git add extensions/
git commit -m "feat: add ShareProfileUsername.shortenProfileLink with tests"
```

### Task 3: Bytecode patch + fingerprint

**Files:**
- Create: `patches/src/main/kotlin/app/morphe/patches/reddit/profile/shareusername/Fingerprints.kt`
- Create: `patches/src/main/kotlin/app/morphe/patches/reddit/profile/shareusername/ShareProfileUsernamePatch.kt`
- Test: build output `.mpp` contains patch (no device needed)

**Interfaces:**
- Consumes: `ShareProfileUsername.shortenProfileLink` (Task 2), `COMPATIBILITY_REDDIT` (Task 1).
- Produces: `shareProfileUsernamePatch` bytecodePatch (name/description verbatim, `booleanOption("Share profile as username", default=true)`, `extendWith("extensions/extension.mpe")` per template convention).

- [ ] **Step 1: Write `Fingerprints.kt` (`ShareProfileLinkFingerprint`)**

`Fingerprint(accessFlags=[PUBLIC, STATIC, FINAL], returnType="Ljava/lang/String;", parameters=["Ljava/lang/String;", "Ljava/util/Map;"], filters=[methodCall(smali="Landroid/net/Uri\$Builder;->clearQuery()Landroid/net/Uri\$Builder;")])`. Mirrors upstream `ShareLinkFormatterFingerprint`.

- [ ] **Step 2: Write `ShareProfileUsernamePatch.kt`**

`bytecodePatch(name="Share profile as username", description="Shares user profile links as username only.") { compatibleWith(COMPATIBILITY_REDDIT); val enabled by booleanOption(...); extendWith("extensions/extension.mpe"); execute { ShareProfileLinkFingerprint.method.addInstructionsWithLabels(0, "invoke-static {p0}, Lapp/morphe/extension/reddit/profile/ShareProfileUsername;->shortenProfileLink(Ljava/lang/String;)Ljava/lang/String; ...") } }` — toggle OFF returns `p0` unchanged; ON returns shortened. Fingerprint miss fails fast via framework (no extra code; dependency aborts patch). Follow template `ExamplePatch.kt` smali injection style.

- [ ] **Step 3: Verify patch builds and is listed**

Run: `./gradlew :patches:buildAndroid --no-daemon && ls patches/build/libs/patches-*.mpp`
Expected: BUILD SUCCESSFUL, one `.mpp` exists.

- [ ] **Step 4: Commit**

```bash
git add patches/src/main/kotlin/app/morphe/
git commit -m "feat: add share-profile-as-username patch for reddit 2026.40.0"
```

### Task 4: Test-gated build workflow

**Files:**
- Create: `.github/workflows/build.yml`
- Test: `actionlint` or `yamllint` + gradle gate order check

**Interfaces:**
- Consumes: Gradle tasks `test` + `:patches:buildAndroid` (Tasks 1-3).
- Produces: CI job used by Task 5 via `workflow_call`.

- [ ] **Step 1: Write `build.yml`**

Triggers `push`, `pull_request`, `workflow_dispatch`, `workflow_call`. Jobs `build`: `ubuntu-latest`, Temurin 21, `GITHUB_TOKEN` for GPR, steps `checkout`, `setup-java`, `chmod +x gradlew`, `./gradlew test` (gate), `./gradlew :patches:buildAndroid`, upload `patches/build/libs/*.mpp` + test reports. No publish in v1.

- [ ] **Step 2: Lint workflow + verify gate order**

Run: `python3 -c "import yaml,sys; d=yaml.safe_load(open('.github/workflows/build.yml')); assert 'test' in open('.github/workflows/build.yml').read() and d['jobs']['build']['steps']" 2>/dev/null || cat .github/workflows/build.yml | grep -n "gradlew test" `
Expected: `gradlew test` line precedes `buildAndroid` line.

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/build.yml
git commit -m "ci: add test-gated build workflow"
```

### Task 5: 6h upstream checker + retarget (test-gated)

**Files:**
- Create: `scripts/check-upstream-reddit.sh` (executable)
- Create: `.github/workflows/check-upstream.yml`
- Modify: `reddit-target.txt` (runtime-updated, seed `2026.40.0`)
- Test: `bash` fixture tests (no network in test)

**Interfaces:**
- Consumes: `reddit-target.txt` (Task 1), `build.yml` (Task 4), upstream raw `https://raw.githubusercontent.com/MorpheApp/morphe-patches/main/patches/src/main/kotlin/app/morphe/patches/reddit/shared/Constants.kt`.
- Produces: PR (default) updating `reddit-target.txt` + `Constants.kt` AppTarget; triggers test-gated build.

- [ ] **Step 1: Write failing fixture test for checker script**

```bash
printf 'AppTarget(\n version = "2026.41.0",' > /tmp/opencode/upstream_new.kt
./scripts/check-upstream-reddit.sh --upstream-file /tmp/opencode/upstream_new.kt --target-file /tmp/opencode/t.txt --dry-run
# expect: stdout contains 2026.41.0, exit 10 (would-retarget)
printf 'version = "2026.40.0"' > /tmp/opencode/upstream_same.kt
./scripts/check-upstream-reddit.sh --upstream-file /tmp/opencode/upstream_same.kt ... # expect exit 0 no change
printf 'garbage' > /tmp/opencode/upstream_bad.kt
./scripts/check-upstream-reddit.sh --upstream-file /tmp/opencode/upstream_bad.kt ... # expect exit 0 + warning, no retarget (Review Focus)
```

- [ ] **Step 2: Run script, verify FAIL (not implemented)**

Run: `bash scripts/check-upstream-reddit.sh --help`
Expected: FAIL (file missing / no --help).

- [ ] **Step 3: Implement `check-upstream-reddit.sh`**

Parse first `AppTarget(version = "X")` under `COMPATIBILITY_REDDIT` via grep/sed (primary) else latest `version = "` fallback; warn+exit 0 on parse fail; compare to `reddit-target.txt`; on differ print new version exit 10 (`--apply` writes target file; CI mode creates branch + `gh pr create`, never merges). Keep <80 lines, `set -euo pipefail`.

- [ ] **Step 4: Write `check-upstream.yml`**

`on: schedule: [cron: "0 */6 * * *"], workflow_dispatch`; job runs script (live mode), on change pushes branch + opens PR with label `upstream-retarget`, then invokes test-gated build (reuses `build.yml` via `workflow_call` or explicit gradle test+build steps). No auto-merge.

- [ ] **Step 5: Run fixture tests, verify PASS**

Run: the three fixture invocations from Step 1
Expected: exits 10 / 0 / 0+warning respectively.

- [ ] **Step 6: Commit**

```bash
git add scripts/check-upstream-reddit.sh .github/workflows/check-upstream.yml reddit-target.txt
git commit -m "ci: add 6h upstream reddit retarget checker"
```

### Task 6: Remote repo + README + Morphed wiring

**Files:**
- Create: `README.md` (patch table, target `2026.40.0`, build badge, Morphed multi-source snippet)
- Modify: none (uses all prior tasks)
- Test: `gh` dry-run + README snippet presence

**Interfaces:**
- Consumes: `.mpp` artifact path `patches/build/libs/patches-*.mpp` (Task 3/4).
- Produces: public remote `github.com/<owner>/Morphe-patches` (owner confirmed at execution), Morphed snippet `patches-source = "'MorpheApp/morphe-patches' '<owner>/Morphe-patches'"`.

- [ ] **Step 1: Write README with exact spec values**

Include: patch name/description verbatim, compat `com.reddit.frontpage 2026.40.0 exp`, toggle behavior, `reddit-target.txt` + 6h checker note, Morphed snippet with `|` split for `excluded/included-patches`.

- [ ] **Step 2: Verify README + remote preconditions**

Run: `grep -q "Share profile as username" README.md && grep -q "2026.40.0" README.md && gh auth status`
Expected: greps PASS; `gh` authenticated (owner recorded from `gh api user -q .login`).

- [ ] **Step 3: Create remote (execution-time, needs owner + visibility confirm)**

Run: `gh repo create <owner>/Morphe-patches --public --source=. --remote=origin --push`
Expected: remote `origin` set; `git ls-remote origin` succeeds. Do NOT run until plan approved and owner/visibility confirmed.

- [ ] **Step 4: Commit docs**

```bash
git add README.md
git commit -m "docs: add readme with morphed wiring"
```
