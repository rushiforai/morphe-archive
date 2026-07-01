# Pakon Patches

Personal [Morphe](https://morphe.software) patches for Android.

> **Disclaimer**
>
> This is a **personal, experimental** project maintained for my own use. It is **not affiliated with Morphe** or any of the apps it patches. Patches modify other developers' apps and may break at any time when those apps update. **Use at your own risk** — I provide no guarantees, no warranty, and no promise of updates. If you use this and something goes sideways with your app, your account, or your device, that's on you.

## What this does

Strips the Android `FLAG_SECURE` window flag from **every app** it is applied to. Apps use `FLAG_SECURE` to block screenshots and screen recordings — this patch makes those work normally again.

This is a **universal** patch: it has no app-specific compatibility list, so Morphe Manager will let you apply it to any APK you load.

## Patches

| Patch | Description | Default |
|-------|-------------|---------|
| Remove screenshot restriction | Removes `FLAG_SECURE` from all windows | Yes |

## How to use

Add this repository as a patch source in [Morphe Manager](https://morphe.software):

```
https://github.com/Pa-kon/morphe-screenshot-patches
```

Or click: [Add to Morphe](https://morphe.software/add-source?github=Pa-kon/morphe-screenshot-patches)

Once added, load the APK of the app you want to patch and select "Remove screenshot restriction".

## Building from source

Requires a GitHub PAT with `read:packages` scope to resolve the Morphe patcher dependency.

Add to `~/.gradle/gradle.properties`:
```
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=YOUR_GITHUB_TOKEN
```

Then:
```bash
./gradlew :patches:buildAndroid :patches:generatePatchesList
```

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
