<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# The NAS's e2e runner

A GitHub Actions runner on the NAS the phone is plugged into, which plays the e2e scenarios
([tests/BaconReader.E2E](../../../tests/BaconReader.E2E/README.md)) next to the phone: each Appium command takes
milliseconds, instead of a round trip over the cloud sessions' slow link (~130 ms, ~1–4 Mbit/s). Measured from a cloud
session on 2026-11-07, the 32 LoggedIn scenarios took 52 minutes, three quarters of them round trips.

This folder is the same in both BaconReader repos: one image, one container, one runner for each repo.

## How a run goes

`.github/workflows/e2e-phone.yml` runs only when it is started: Actions → "E2E on the phone" → Run workflow, or a
session through the workflow dispatch API (`actions_run_trigger` with the `e2e-phone.yml` workflow, the branch, and the
inputs `scenarios`, `video` and `pr`).

1. **bundle**, on GitHub's machine, builds both bundles.
2. **phone**, here: `run.sh` connects to the phone over the phone stack's network (`connect.sh` with `E2E_PHONE_LAN`:
   adb at `android-phone:7555`, the waker at `android-phone:8080`, no tailnet), waits up to 45 minutes while another
   session holds the lease, takes it as `nas-<repo>-<run id>`, renews it every 10 minutes (`tools/e2e/lease.sh keep`),
   plays `record.sh --no-bundle <scenarios>` and releases the lease, whatever happened. The job summary lists each
   run's result; the "e2e-results" artifact holds `out/` (the `.trx` files, the raw recordings) and `run.log`.
3. **post**, on GitHub's machine, only with `video` and a `pr`: makes the GIFs and MP4s (`record.sh --gifs-only`) and
   posts them on the PR as `push-gifs.sh` and the "E2E videos" workflow do. The PR must be open, this repository's, and
   on the branch the run played.

A session reads the result with `actions_get` (the run and its jobs) and `get_job_logs` (the phone job's log: "Runs"
lists each run). The cloud sessions keep working as before: whoever holds the lease plays, the others wait.

## Set up

On the NAS, in a shell that can run Docker (Container Station's), with a clone of either repo:

1. **Settings:** `cp tools/e2e/nas/.env.example tools/e2e/nas/.env`, and check each value: the phone stack's folder
   (its `phone/cloud-key/E2E_ADB_KEY.b64` is the adb key the phone approved for the cloud sessions), the folder the device
   host serves as `/files/` (the clean APK and its `SHA256SUMS`), the phone stack's Docker network (`docker network ls`)
   and the memory limit.
2. **Image:** `cd tools/e2e/nas && docker compose build`.
3. **Runners, once for each repo:** on GitHub, the repo's Settings → Actions → Runners → New self-hosted runner shows a
   registration token (valid for an hour). Then:

   ```bash
   docker compose run --rm runner register JoanComasFdz/<repo> <token>
   ```

   The runner, `nas-<repo>`, keeps its registration in the `state` volume.
4. **Start:** `docker compose up -d`. Each repo's Settings → Actions → Runners shows `nas-<repo>` as Idle.
5. **Check:** run "E2E on the phone" with one class (`SpoofClientTests`) and no video.

**Update:** `git pull && docker compose build && docker compose up -d`. The runners keep their registration, and update
themselves.

## Security

- **Only started runs.** The repos are public, so any pull request can add a workflow. Each repo's Settings → Actions →
  General → "Require approval for all external contributors" must stay on, and a pull request from a fork must never be
  approved to run here: its workflow could ask for this runner's label. `e2e-phone.yml` itself runs only when started,
  by someone who can push.
- **Nothing exposed.** The runner only calls out, to GitHub and package registries. It reaches the phone stack's
  network, and nothing else of the NAS.
- **No secrets on GitHub.** The adb key stays on the NAS, mounted read-only; the job gets no write permission (the post
  is made on GitHub's machine).
- **A locked-down container:** jobs run as the user `runner`, with every capability dropped, `no-new-privileges` and a
  memory limit. It mounts the `state` volume (registrations and the patcher's cache) and the two read-only folders.
- **Persistent runner.** It stays registered between jobs, so no token is kept on the NAS; each job's checkout empties
  the workspace.

## Notes

- **The patcher** isn't in the image: each job puts the Reseam CLI of the repo's version, or Morphe Desktop's jar, in
  `~/state/cache` (Morphe keeps its signing key next to the jar, so each APK installs over the last).
- **The test signing key** (Reseam's `build/e2e/signing/`) is made again on each run, since the checkout empties
  `build/`: the first scenario uninstalls the app signed with the last run's key. Over USB that takes seconds.
- **Memory:** a run holds the .NET test process with the fake Reddit, Appium, adb and the patcher. Measure it with
  `docker stats` during a first LoggedIn run and set `E2E_RUNNER_MEMORY` from that.
- **The NAS's kernel and tar:** QNAP's 5.10 kernel answers the `fchmodat2` syscall with `EFAULT` instead of `ENOSYS`,
  so glibc 2.39 and later (Ubuntu 24.04) never fall back to `fchmodat`, and `tar` fails on every directory ("Cannot
  change mode … Bad address"). `seccomp.json` is Docker 27.1.2's default profile with one rule more, `fchmodat2`
  answering `ENOSYS`, so the container's `tar` (the runner's self-update) works. A build can't take a seccomp profile:
  the Dockerfile's two tarballs tolerate only those errors.
- **No emulator:** the NAS's containers have no `/dev/kvm`, and one emulator overloaded the NAS (2026-10-30).
