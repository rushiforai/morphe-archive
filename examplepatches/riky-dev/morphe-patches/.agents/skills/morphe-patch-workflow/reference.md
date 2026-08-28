# Morphe patch workflow — reference

See [AGENTS.md](../../../AGENTS.md) for the canonical workflow. This file holds copy-paste commands only.

## Device profile (Phase 0, once per device)

```bash
adb devices -l
adb shell wm size
adb shell wm density
adb shell getprop ro.product.model
```

Save output to `scratch/<app_id>/device-profile.yaml`.

## UI navigation (text-first fallback chain)

1. **Live uiautomator dump** (preferred)

```bash
adb shell uiautomator dump /sdcard/ui.xml
adb pull /sdcard/ui.xml scratch/<app_id>/ui-dump.xml
rg -i "pattern" scratch/<app_id>/ui-dump.xml
# bounds="[x1,y1][x2,y2]" → tap center: X=((x1+x2)/2), Y=((y1+y2)/2)
adb shell input tap X Y
```

2. **Config hints** — `device.nav` in `config/apps/<app_id>.yaml` (match strings for rg)
3. **Cached coords** — `scratch/<app_id>/device-profile.yaml` under `apps.<package>.nav`
4. **Screenshot** — only when steps 1–3 fail; one shot per verification step
5. **Stop** — report "manual nav required"; do not blind tap → screenshot loops

## Local verify before device

```bash
scripts/build.sh
scripts/verify_patch.sh <app_id>
scripts/check_patched_apk.sh analysis/<app>/patched/*.apk <app_id>  # when smali assertions exist
```

## Device deploy (when acceptance criteria require it)

```bash
scripts/patch_local.sh <app_id>
scripts/device_deploy.sh <app_id>
scripts/device_smoke.sh <app_id>          # no --screenshot unless visual check needed
adb logcat -d --pid=$(adb shell pidof <package>) | rg -i "error|exception|fatal"
```

## Analysis note format

Each entry in `scratch/<app_id>/analysis-notes.md` must include source path, method signature, and line range. Re-read source if verify fails.
