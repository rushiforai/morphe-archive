# Repository instructions

## Startup checkpoint: execution efficiency

Read this checkpoint at task start and after context compaction, before resuming implementation or validation. Apply it to all delegated work as well.

- Reuse the initialized emulator state; stop it between batches.
- Replay the now-known UI steps instead of rediscovering them.
- Finish connected code changes, build once, then run one focused acceptance session.
- Reuse passing evidence; repeat checks only when relevant code changes invalidate it or a separately identified mandatory gate requires a check.
- Inspect each prerequisite's actual terminal exit status before dependent work. A running exec handle is not success, and a child exit failure may be returned without a tool exception. Never continue UI/GPS from a failed readiness check.
- Report progress as fixed behaviour, failed behaviour or a concrete blocker, not test counts. Probes required to meet a goal may be added, modified and run without separate approval under the owner's latest global rule. Keep other validation tooling frozen: fixtures, runners, observers and validation frameworks require explicit approval for the named change.

During a live acceptance window, execute the prepared UI/GPS checklist and collect evidence only. Defer source/history/tool research and implementation until the owned runtime is stopped. Record the stop deadline before starting; do not consume that deadline on offline investigation.

When a drive capture shows an unexpected failure, stop the owned GPS replay as the next tool action and restore speed0 before analysis, commentary or more UI input. Apply this even when the cause or whether the behavior is intended is uncertain; classify it offline. A live replay must not continue while deciding how to investigate a failed frame.

Before each batch, identify the concrete behaviour to change, the existing evidence that remains valid and the bounded acceptance steps. After a failed acceptance session, preserve evidence and diagnose offline before the next connected implementation batch. Retain mandatory verification gates.

Preserve the documented reusable emulator baseline and known UI recipe while stopping owned runtimes and cleaning per-job scratch/output storage. Do not claim an initialized baseline exists until it has actually been saved and verified.

## Owner stop on emulator testing

- The earlier stop on broad emulator testing applied while the pill design was awaiting approval. Both Maps and the complete Vela layout are now approved. The current explicit goal authorizes focused Android Auto/DHU functional acceptance on owned emulation, including GPS-only driving, speech, lifecycle and multiple screen sizes. Preserve the approved design and batching rules; do not restart a design gallery or treat setup/static checks as functional acceptance.

## Owner HUD design gate

- Owner revision (2026-11-08): implement the supplied `DriveDeck-Warning-Mockup-Pack` numeric/icon-only car pills for both receivers; before average control show entry distance, inside show average speed with an independent section bar. This supersedes older prose/percent/remaining-caption styling and the old icon-byte freeze. Use the newly supplied256px icon pack, with its zero-byte emergency entry replaced by the repair already supplied in the mockup pack. Preserve full source speech/accessibility, native announcement authority and unknown-value handling. Broad runtime validation remains owner-deferred for quota; do not reopen the design gallery.

- Apply [Navigation indicator contract v1](docs/contracts/navigation-indicators-v1.md) to all FM/Waze producer and Maps/Vela consumer changes. Preserve native identity; announcement timing, wording and sounds follow the contract's 11 November 2026 uniform-alert revision; do not invent geometry, direction, zone progress or provider support from the existence of an icon.
- The owner approved the revised Maps camera pill on 2026-11-06: `.analysis/waze-native-warnings/provider-data-design80/camera-fresh.png` (receipt records exact SHA). Freeze its size, typography, icon scale, right-column progress and right-edge alignment. The rejected initial set remains rejected. Prioritize FM/Waze field correctness. The owner subsequently reduced the visual gate to one generic Vela frame; do not restore a19-type gallery requirement.
- The owner subsequently approved the complete Vela run92 layout with current100km/h, limit130km/h and camera300m together. Its exported frame and exact hash are recorded in the indicator contract. This closes the design gate; it does not prove natural-feed delivery or speech. Do not seek the same design approval again.
- Historical run85's overlapping Vela frame remains rejected. The placement defect was corrected before the approved complete run92 layout; do not substitute the rejected frame for that approval. Preserve the corrected UI/capture recipe in `scripts/navigation-alerts/dhu/README.md`.
- The owner replaced the full19-alert gallery gate with one actual rendered Vela image and approved the completed layout. Preserve a fixed outer pill size for every alert type. Do not require38 design captures or reopen that gallery gate.
- The owner authorizes an artificial FM event for this single design capture. Label the input artificial; never describe it as natural feed/delivery proof. Do not fabricate or compose the captured UI.
- The design-and-placement gate was a hard gate and is now closed by the approvals above. Keep the earlier rejected frames labeled historical/rejected. Current runtime work must prove functionality with the approved UI; build results never substitute for rendered or natural-feed evidence.
- Reuse existing capture/injection capabilities. This approval does not authorize unrelated probes, observers, runners or validation-framework expansion.

## Global execution: batch implementation, then validate

These rules apply to every task and delegated task, ahead of skills that prescribe frequent implementation/validation switching.

- Complete substantial connected implementation changes across relevant files/modules before validation. Write or update tests alongside that batch.
- Group static checks, builds and unit tests at the batch checkpoint. Collect related findings, fix them together, then rerun affected checks together.
- Reserve emulator, device and browser UI testing for a planned acceptance session after the batch builds. Keep task-owned runtimes stopped between acceptance sessions.
- Preserve and reuse passing evidence. Repeat a check only for a relevant change, a failure or a remaining required acceptance gate; do not alternate tiny edits with repeated UI runs, screenshots or broad suites.
- Run an early diagnostic only for a specific unresolved fact blocking meaningful progress, or at the user's request. State the reason and run the smallest diagnostic that resolves it.
- Retain all required verification and mandatory gates. Batching changes their sequence and frequency, not whether the outcome must be verified.

## Hard stop: validation-tooling scope

- The owner's latest global exception permits goal-required probes without separate approval. For the pending single Vela design frame, a bounded read-only sample of native visible/stable rectangles and surface dimensions is in scope. Preserve method results and application policy. This exception does not authorize fixture, runner, observer or framework changes.
- Approved exception (2026-11-05): the owner requested rootAVD/avdroot evaluation and native ARM64 curl installation for the owned navigation AVD, including root/Frida readiness checks and a private image where required. This does not authorize other observer hooks, probes or runner changes. Keep certificate verification enabled for connectivity diagnosis.
- Approved exception (2026-11-05): the existing AA17 acceptance setup command may replace its legacy `recycler_view` scroll selector with a selector matching either `recycler_view` or native Material 3 `scroll_view`. No new hooks, grants, fixtures or framework changes are included.
- Approved exception (2026-11-05): the existing Frida observer may record caller stacks and API ownership/lease state at Waze `NativeManager.shutDown()` and `onNativeLayerShutDown(boolean)`. This named approval does not authorize other hooks or runner changes.
- Validation tooling is frozen and forbidden by default. Do not create, expand, refactor or otherwise change probes, fixtures, runners, observers, benchmark systems or debugging frameworks unless the user explicitly authorizes that named change. Continue product implementation and builds using existing tools; do not treat ongoing work, a failed check, a skill workflow or delegated work as permission to change validation tooling. Apply this prohibition to every agent and automatic continuation. An existing requirement to use Frida does not authorize further framework expansion.
- Begin each implementation batch with one concrete product change or delivery outcome and a finite list of required checks. Complete the connected implementation before its grouped checkpoint; preserve passing evidence.
- Use at most one planned, bounded runtime acceptance session per implementation batch. A relevant product change or a separately identified mandatory gate must justify any repeat; do not turn a failed run into an automatic tooling-edit/rerun loop.
- On an unexpected runtime failure, capture it with existing observation, stop further stimuli, restore and clean owned resources, then diagnose offline. A tooling failure is a validation blocker, not authorization to start a new infrastructure project.
- Before seeking approval for a tooling change, identify the concrete blocker, why existing tools are insufficient, the exact proposed files/scope and the bounded cost. Keep unrelated useful-looking additions out of that proposal.
- Report product changes or delivered artifacts separately from validation work. Test counts, setup work and harness changes alone do not mean a feature has been completed.
- Retain every mandatory verification and acceptance gate until authoritative evidence closes it. Never waive a gate, relabel an incomplete run as passing or narrow the objective to make delivery appear complete.

## Android runtime observation

- Target Android Auto safety observers by enumerated process PID, never a package-level `-W com.google.android.projection.gearhead` alias. The alias can resolve to `:projection` and duplicate an explicit PID attachment. Keep exactly one unchanged safety-observer instance per verified PID; independent probes must observe different methods. Verify each hooks-ready PID/process name and uniqueness before further attachments or accepted stimuli. Treat setup as unaccepted until newly created required processes are covered.
- For the owner's real driving/visual acceptance scenario, only GPS movement may be fabricated. Use genuine provider camera/report/zone data and the receivers' actual rendered UI. Do not inject synthetic alerts, zones, averages, warning states or UI for this proof. Existing controlled-input captures remain historical implementation/test evidence, not the requested simulated-drive evidence. Capture genuine DHU frames and optional scrcpy recordings, distinguishing phone and head-unit surfaces.
- Approved exception (2026-11-07): the owner authorized normal DHU, screenshot and bounded logcat checks on the connected unrooted phone without Frida, preserving installed apps and data. Apply app updates through the phone's existing Morphe signing identity; do not uninstall, root or replace apps with differently signed test builds. Frida remains mandatory for emulator producer/receiver validation.
- Keep Frida attached to every exercised producer/receiver process during short reproductions and longer Android validation sessions. Static checks and JVM unit tests do not require a device attachment.
- Establish required hooks before generating test stimuli, verify attachment coverage throughout the session, and stop further stimuli after an unexpected detach, hook failure or missing coverage. Mark incomplete coverage explicitly; do not treat an untraced failure as a passing run.
- Retain bounded Frida messages, Java/native crash or detach evidence, relevant Android logs and process-exit observations. Capture available tombstones for the exercised processes when needed. Record exact APK, Frida and script identities; protect private data and keep raw diagnostics out of releases.
- Preserve original method results, exceptions and application policy in observation hooks. Label tracing overhead in timing results. Do not change warning eligibility, speaker readiness, grants or native callbacks to obtain a passing result.
- Keep repeated speech tests inaudible through an explicitly recorded test environment, preserve genuine Android voice/PCM/callback checks, and restore original device audio state. Do not change the Mac or physical phone's audio settings for an emulator test.
- The inspected Google DHU2.0-mac-arm64 playback path uses PortAudio. SDL audio environment variables alone do not establish muting or PCM capture for this binary. Require a verified inaudible host setup before further speech sessions; do not alter Android speaker readiness, grants or callback results to compensate. Operational evidence and the native capture boundary are in `scripts/navigation-alerts/dhu/README.md`.
- Scope sessions to explicitly owned/authorized devices and process identities. A connected phone alone does not authorize installing, granting permissions or attaching instrumentation to it.
- On every terminal run, unload/detach scripts, resume any task-paused spawns, stop owned tracing servers/forwards/helpers, and clean scratch storage after retaining compact evidence. Report incomplete cleanup as a failure.

## HARD REQUIREMENT: johninnl identity only

Git attribution remains `johninnl`; the live publisher is the GitLab account `johninnld`. The former GitHub account is retired. Do not require a GitHub login, GitHub token-owner check, `gh api user` or the legacy `verify_identity.cjs --local` path for local commits, pushes, CI or releases.

- Use exactly `johninnl <349981574+johninnl@users.noreply.github.com>` for **every Git author and committer**, on every branch and tag history, including generated release commits, merges, cherry-picks, and amended commits. Never create or retain commits under another person, automation account, or bot identity.
- Do not add `Co-authored-by` trailers or commit-message attribution identifying another author. Do not introduce the previous personal identity into repository files, commit metadata, or release metadata.
- Before each commit or push, run `GITLAB_DESTINATION=gitlab node .gitlab/scripts/identity.cjs` to verify GitLab authentication as `johninnld`, effective Git identity and all reachable history. Verify `git var GIT_AUTHOR_IDENT` and `git var GIT_COMMITTER_IDENT`, including environment overrides. Local API authentication reads `~/.ci` (or an explicit private token-file override); never log credentials.
- GitLab.com is the release publisher under `johninnld/nl-morphe-patches`. Local Git pushes use the verified GitLab SSH identity named by private configuration; local releases use `~/.ci`, while the optional hosted fallback uses protected/masked `JOHNINNL_GITLAB_TOKEN` owned by `johninnld`. Retain the exact johninnl Git metadata above and the existing Morphe signing identity. Never substitute a bot token or deploy key.
- GitLab remains the source/version authority. The user's later request restores the Codeberg release mirror; GitGud is excluded from automated releases and must not be published by the local release flow. Publish the exact same signed MPP and canonical branch/tag commit to Codeberg with separate destination-owned credentials; never send GitLab credentials to another forge. Do not run independent version selection, rewrite per-forge source metadata or force conflicting refs. Hosted forge Actions remain opt-in.
- Codeberg retains only the latest five releases. Every Codeberg publication deletes older releases beyond that five-release window, normally one older release and its asset per new release, to stay within the Codeberg account storage quota. Prune only Codeberg; never delete GitLab releases or assets for this quota.
- Keep Dependabot version-update configuration disabled. Update dependencies under the required identity; security alerts may remain enabled.
- Treat these as mandatory requirements, not optional preferences. Preserve existing work when repairing identity history; do not silently bypass a failed identity check.

## Project workflow

- Publish releases only from `main`; the dev prerelease channel is retired. Promote unapproved app changes to `main` only after user confirmation. `.releaserc` and `.gitlab/gitlab-com.release.config.cjs` own release version selection and generated release files. Do not manually bump release versions.
- Source commits never change the release-owned files (`CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`, `patches-list.json`, `README.md`, the site index and catalogue pages): Morphe reads that metadata from `main`, and only the release commit may change it, which reaches `main` after its bundle is published. Regenerate them locally for checks if needed, but do not commit them.
- Preserve the source-based release-note and Morphe app-scope guards. Declare affected apps with `Release-Apps` when shared patch changes require it. Declare `Unchanged-Apps` only when a commit edits an app's files without changing what its patches produce, because every release bullet naming an app badges it for repatching in Morphe. A commit editing several apps' patch folders must declare each of them in one of the two trailers.
- Run `node --test tests/test_release_branding.cjs tests/test_preview_release.cjs tests/test_identity.cjs tests/test_codeberg.cjs tests/test_gitgud.cjs tests/test_gitlab.cjs tests/test_gitlab_publish.cjs` after release automation changes. Run `python3 -m unittest discover -s tests` for Python regression checks; use the release workflow's Gradle checks for Android changes.
- CI audits checked-out history; release automation also verifies the token owner and effective Git identities before publishing. These checks do not enforce local operations unless run, and cannot stop an already-authorized direct push before it reaches GitLab. Follow the identity requirements for every operation.

## GitHub fork release pipeline (byd-maps-patches)

- Pushing `main` to the **`github`** remote (`kennyric/byd-maps-patches`) triggers `Release` and
  `Release safety`. The `origin` remote is the upstream GitLab repository; do not push there.
- The release version is computed in `release.yml` from the highest `v*` tag and the commit
  subjects since it: `feat(...)` bumps minor, anything else bumps patch. A push with no releasable
  change still produces the next patch, so only push when a release is intended.
- Every commit touching `extensions/` or `patches/src/main/kotlin/patches/shared/` needs a
  `Release-Apps: <App>` trailer (for this work: `Release-Apps: Google Maps`), or `Release safety`
  fails with "Shared-only commit … needs its own Release-Apps trailer". `ci`, `docs`, `build`,
  `release` and `deps` scopes are rendered as **General**.
- The `Publish the discovery manifest` step must rebase with `git -c rebase.autoStash=true`:
  `gradle.properties` (version) and `dist/` are dirty after the build, and a plain `git rebase`
  stops with `cannot rebase: You have unstaged changes`, leaving the release published but the
  run red and `patches-bundle.json` stale. Do not hand-publish the manifest as a workaround; fix
  the step and let CI push it.
- Verify a release by checking all three: `gh run list` shows `Release` and `Release safety`
  green; `gh release view v<version>` lists `patches-<version>.mpp`, its `.sha256` and
  `patches-bundle.json`; and `git show github/main:patches-bundle.json` advertises that version.

## Local CI and publishing rules

Operational details, private-file inventory and both channel procedures are in [PUBLISHING.md](PUBLISHING.md). Keep rules here and implementation/setup details there.

If an older dirty checkout lacks the current pipeline scripts, preserve its work and use the installed local driver or an up-to-date isolated GitLab checkout as described there. Do not restore the obsolete GitHub identity workflow.

- Prefer local build/test/release automation. Hosted jobs must not run on ordinary branch, merge-request, main or mirror pushes; the GitLab fallback requires explicit web opt-in through the `run_cloud_ci=true` pipeline input. Keep arbitrary pipeline-variable overrides disabled. Legacy forge workflows remain manual.
- Give local engineering MPPs an immutable, commit-derived review identity as described in PUBLISHING.md. Never reuse a review version for changed bytes or publish it as a canonical release. Verify the installed APK contains the intended change before claiming phone delivery; a successful Manager install and a matching version label are insufficient.
- Use `scripts/local-release/verify.cjs` as the single complete verification command set. Do not replace required release/history, Python, Android, Medium or bilingual documentation checks with a smaller passing subset.
- Maintain `scripts/local-release/templates.json`, `.releaserc` and `PUBLISHING.md` together for the main-only channel. Existing version/note/catalogue generation remains authoritative.
- Publish only approved main heads. The local watcher baselines the existing head on first startup, then processes later approved updates automatically. Obtain user approval before promoting unapproved app changes to main; feature branches never publish.
- Verify publisher identity, all required secrets and the unchanged Morphe signing key before publication. API keys come from the private `~/.ci` store; SSH identities and the other existing signing/application secrets are referenced by private configuration. Never commit or log their values.
- Find the community Maps API key through private release configuration `secretFiles.SHARED_MAPS_API_KEY`; the installed store is `~/Library/Application Support/nl-morphe-local-release/secrets/maps-api-key`. The canonical checkout's ignored `.community-maps-api-key` is the existing setup source. Resolve that primary-checkout path when working in an isolated worktree. Use the real key for releases; keep test placeholders confined to verification fixtures. This application key is separate from APK keystores and the Morphe bundle signing seed. See [PUBLISHING.md](PUBLISHING.md) for loading details; never commit or print the key.
- Credential tests must use a fixture-only HOME/environment and temporary credential files. Never read the operator's real store in a test, and never use value-dumping assertions for credential comparisons; use fixed-message boolean checks.
- Build/sign once under GitLab source/version authority. Publish the exact canonical signed bytes to Codeberg with separate credentials, immutable refs and per-forge verification. GitGud is excluded from automated releases. Never select independent versions, rewrite per-forge manifests or force conflicting history/tags.
- Every terminal build/run/worktree job, successful or failed, must execute local storage cleanup. Archive compact diagnostic receipts/logs first, prove owned processes are stopped, then remove only that job's owned workspace, build outputs, scratch files and per-run repository. Never clean an active job or the primary checkout.
- Incomplete or unprovable cleanup is a failure with `cleanupRequired`; do not claim the job finished cleanly. Retain compact retry state and evidence, not a completed failed build directory. Bound retained logs/archives; preserve only documented reusable caches and input artifacts.
- Remove release build storage only after all required publication/discovery checks have completed, or after archiving a terminal failure. Keep per-forge partial outcomes for idempotent recovery.
- After a failed release run, diagnose it from the private run log before acting. Retry an unchanged head at most once with `--retry-failed`, after pending cleanup is resolved and the cause outside the commit is gone; never loop retries or retry a test/product failure. The sequence is in [PUBLISHING.md](PUBLISHING.md).
- The owner's 2026-11-12 decision exempts mirror-only failures of an already published release: the watcher retries the Codeberg mirror automatically, with backoff and no attempt limit, until it succeeds or a newer release supersedes it. This does not relax the single `--retry-failed` rule for full release runs.
- Record the exact source SHA, channel, complete verification outcome, publication/discovery and cleanup results. A canceled/skipped cloud pipeline is not a passing check.
