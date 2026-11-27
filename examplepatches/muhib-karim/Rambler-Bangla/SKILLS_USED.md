# Skills used

Which coding-agent skill drove which change, per release. Skills are reusable instruction packs for the agent;
none of them ships code into this repository.

## v30.0.0

Unified Morphe Patch Suite for Gboard 18.5.4 (branch `feat/morphe-unified-v30`): merged all 46 patches from `jasonwu1994/Gboard-patches` (v4.5.0), all 7 patches from `abotmaker/gboard-rambler-enhancements` (v1.3.4), and upgraded Rambler Bangla's own Lite Script Policy + full V29.3+/V29.5 phonetic/multilingual/loanword runtime into two first-class Morphe patches (55 total patches in one `.mpp` bundle).

| Skill or practice | Application |
| --- | --- |
| `ponytail` (full mode) | Read and traced Gboard 18.5.4 smali (`fja.d` / `ezn.b`) and both upstream Morphe repos end-to-end before writing code. Reused `RamblerTextPipeline`'s existing commit hook and `RamblerEnhancementsActivity`'s settings hub instead of inventing a fourth Gradle extension or parallel settings activity; kept `GboardPublishedPatchCatalog` and `PatchCatalog` cleanly composed in `PatchListGenerator.kt` with zero unnecessary abstraction. |
| `colab-operator` | Provisioned an x86_64 Colab build runtime to run Temurin/OpenJDK 21 + Android SDK 35/36 Gradle builds, extension Robolectric/JUnit unit tests, Android Lint (`NewApi`), Morphe `.mpp` packaging, `morphe-cli` patching against stock Gboard 18.5.4, and APK signature/alignment/DEX hook verification, then cleanly released the session when finished. |
| Root-cause verification | Diagnosed Gboard 18.5.4's reversed `{HINGLISH_OVERRIDE_RULE}` / `{ENABLED_LANGUAGES}` instruction ordering before writing `RamblerBanglaPatches.kt` (supporting both 18.5.4 and 18.3.1 orderings fail-closed with SHA-256 verification), fixed Colab's OpenJDK cgroup warning breaking AGP `jmod`, and verified every patch, DEX hook, APK signature, and emulator smoke test end-to-end. |

No skill wrote code into the repository. No Google binary, APK, dex, or signing key was committed to git.

## V29.5

Clipboard Recent | History (branch `feature/clipboard-history`). A stopped earlier attempt left two local draft
commits; this session reviewed them against the rc4 disassembly, fixed them and squashed them.

| Skill or practice | Application |
| --- | --- |
| Plan mode (Claude Code) | Read the task and addendum, traced the stock clipboard path and layouts in the disassembly, and wrote the plan before any edit. The task authorised execution after planning. |
| Test-driven development (practice, skill not loaded) | Red then green for the store/pin/policy harness (compile red on the new API) and for the hook-target guard (missing method, plus the stale `beginCapture` hook caught by the profile test). |
| `verification-before-completion` (loaded) | Every claim in HANDOFF and the PR comes from a command run in this session: unit suite, real build, independent baksmali diff of the output, dex ref counts, zipalign, badging diff, throwaway-key `apksigner verify`, gitleaks and CI. |
| Fresh-context code review (subagent) | A read-only reviewer with no prior context checked crash safety, privacy, lifecycle and build guards on the full diff. Findings and fixes are in the PR description. |
| `git-workflow-and-versioning` (practice) | Dedicated feature branch, never pushed before the squash, small logical commits, secret scan, PR only. No merge or release. |

No skill wrote code into the repository. No Google code, APK, dex or key was committed.

## v29.4.1

Docs-only README and homepage refresh (branch `docs/readme-refresh`).

| Skill | What it drove |
| --- | --- |
| superpowers `brainstorming` | Scoping. The frozen task file was a complete spec with a no-questions rule, so the skill's opt-out path applied: one stated build choice (keep Markdown README plus a single static HTML page, no framework, no scripts), then straight to the plan. |
| `writing-plans` (applied, not loaded) | The step-by-step plan with one commit per step lives in `TASKS.md` instead of a separate plan file, to keep the public repo lean. |
| superpowers `test-driven-development` | `tests/python/test_docs_homepage.py` was written first and watched fail (8 of 14 red for missing sections, mermaid stages, release, legal note, contrast tokens, landmarks), then the README and site were written until all 40 unit tests passed. |
| `ui-ux-pro-max` | `--design-system` search for a developer-tool landing page: flat style, hero then value then features then CTA, a visible install/build command, 4.5:1 contrast, visible focus, reduced motion, 44px targets. Its generic slate palette and Google Fonts pairing were rejected in favour of the existing brand colours and system fonts (no external requests). |
| `impeccable` | Context load (scoped restyle of existing code, brand kept), craft floor (no eyebrow labels, no thick coloured side borders, no card grid as page structure, themed selection, focus, caret and scrollbars, tabular numerals, one authored motion moment from a visible default), headless renders at 390px and 1280px, and `impeccable detect`. The detector's only findings were `cramped-padding` false positives (sections have 40 to 72px clamp padding; table cells carry their own padding). The renders caught two real issues that were fixed: the hero reveal started fully clipped, and the desktop headline broke into three lines. |
| `archify` (evidence pass only) | The README mermaid was traced against source instead of rendered to HTML: fingerprint sweep `dex_patch.py` `patch()` step 1, prompt-owner check step 3, dataflow and hook insertion in `find_enabled_languages_site` / `patch_method`, repack with `--extension-dex` step 6, then `scripts/verify_apk.sh single|compare`. No archify HTML is committed. |
| `requesting-code-review` | A fresh reviewer read the full branch diff before push; findings and fixes are in `HANDOFF.md`. |
| `verification-before-completion` | Claims in `HANDOFF.md` are backed by commands run in this session: the unit suite output, CI run ids on the pushed head, and the Pages HTTP status. |
| `understand` / `graphify` | Not used. The architecture section needed one accurate pipeline diagram, which the archify evidence pass covered; a full knowledge graph would have added nothing to a docs-only change. |
