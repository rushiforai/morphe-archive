# PushPress Members — Force CrossFit class

Custom Morphe patch source for the uploaded **PushPress Members 3.42.0 XAPK**.

## Target

- App: PushPress Members
- Package: `com.pushpress.memberportal`
- Version: `3.42.0`
- XAPK version code inspected: `1780597459`
- Architecture inspected: `arm64-v8a`
- Patch name in Morphe: **Workouts: force CrossFit class**

## What it does

PushPress obtains the Class type choices from its API, so this patch does not edit a fixed Android string list. It installs a small app-side selector that:

1. Activates only while the **Workouts** screen or its **Class type** control is present.
2. Records the Flutter semantics state when that dropdown is touched.
3. When the menu opens, finds the exact API-returned item **CrossFit class**.
4. Immediately taps that item.

Other dropdowns are ignored. The API response is not changed. Depending on rendering speed, the other choices may be visible very briefly before CrossFit class is selected.

## Build on Windows

Requirements: Git, Java 21, and a GitHub classic personal access token with `read:packages`.

```powershell
$env:GITHUB_ACTOR = "YOUR_GITHUB_USERNAME"
$env:GITHUB_TOKEN = "YOUR_GITHUB_PAT"
Set-ExecutionPolicy -Scope Process Bypass
.\SETUP-AND-BUILD.ps1
```

Output:

```text
dist\pushpress-crossfit-only-3.42.0.mpp
```

The script clones the current official Morphe patch template, overlays these source files, and runs the template's `buildAndroid` task.

## Build with GitHub Actions

Upload this folder to a private or public GitHub repository, then run **Actions → Build MPP → Run workflow**. The workflow artifact contains the `.mpp` bundle and uses GitHub's built-in package token.

## Apply

Use the resulting `.mpp` with Morphe CLI, or publish the repository as a custom Morphe patch source. Patch the provided XAPK rather than the standalone APK, because the Flutter AOT library is in the `arm64-v8a` split.

## Validation status

The package, version, split layout, MainActivity constructor, Flutter view class, Flutter engine field, and Flutter semantics methods were verified directly from the uploaded XAPK. The Java extension source was syntax-checked separately. A complete Morphe build and on-device interaction test could not be run in this offline environment, so the first installed build should be treated as a test release.
