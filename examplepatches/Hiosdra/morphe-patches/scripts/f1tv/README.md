# F1 TV APK update workflow

The helper watches APKMirror's F1 TV listing and archives APKs after they are downloaded. It does not download or install APKs automatically. The APKMirror page and any downloaded APK are checked against the expected app package; the APK's version, SHA-256, and signing certificate are recorded in the ignored `.local/f1tv/archive/` directory.

Run a one-time check:

```sh
python3 scripts/f1tv/f1tv_apk_watch.py check
```

Keep a local watcher running. It checks APKMirror once per day by default, alerts once per new version, and archives matching F1 TV APKs found in `~/Downloads`:

```sh
python3 scripts/f1tv/f1tv_apk_watch.py watch
```

The `.github/workflows/f1tv-apk-watch.yml` workflow checks the listing once per day on GitHub's hosted runner and adds a report to the Actions run summary. It uses only the Python standard library and needs no local Android SDK. A newer listing makes the run fail intentionally, so GitHub's “only notify for failed workflows” email setting can alert on updates without sending a message every day. A failed page check will also send an alert. The workflow does not download APKs, update the patch target, or start patch builds. GitHub runs scheduled workflows from the repository's default branch, so the workflow must be present there before the daily check becomes active; `workflow_dispatch` allows manual runs.

To archive an APK manually:

```sh
python3 scripts/f1tv/f1tv_apk_watch.py ingest /path/to/f1tv.apk --state known-good
```

After downloading a newer APK, stage it locally so Morphe can apply the patches to that target:

```sh
python3 scripts/f1tv/f1tv_apk_watch.py stage /path/to/f1tv.apk
```

Staging updates the local `F1TvConstants.kt` target and records the candidate in the ignored archive index. If patch application or device playback fails, restore a previously archived target by version code:

```sh
python3 scripts/f1tv/f1tv_apk_watch.py restore 30494002
```

After all enabled patches apply and the app has been checked on a device, record that APK as a known-good rollback point:

```sh
python3 scripts/f1tv/f1tv_apk_watch.py mark-good /path/to/f1tv.apk --patches-applied --device-checked
```

APKMirror may change its page markup or block automated requests. In that case the watcher reports the failure; use the APKMirror listing in a browser and ingest the downloaded APK. It only reports version availability, archives files, and stages the patch target. Build, patcher, and real-device playback checks remain the gates for accepting a new target.
