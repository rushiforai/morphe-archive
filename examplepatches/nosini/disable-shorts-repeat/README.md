# Disable Shorts Repeat (standalone Morphe patch bundle)

A minimal, standalone Morphe patch bundle containing exactly one patch:

**Disable Shorts repeat** — stops YouTube Shorts from auto-repeating by rewriting the
`REEL_LOOP_BEHAVIOR_REPEAT` loop behavior to `REEL_LOOP_BEHAVIOR_END_SCREEN` (play once, then stop
at the end screen). Any other loop behavior is left unchanged. There is no settings toggle: applying
the patch is the switch.

Requires YouTube 21.17 or greater. It can be combined with the official "Shorts autoplay" patch;
for the REPEAT case the winning behavior depends on the injection order of the two patches.

This is a third-party bundle (group `dev.nosini`); it is a port of the in-tree Morphe patch and is
GPLv3-licensed like the upstream project.

## Build

```sh
./gradlew :patches:buildAndroid
```

(`buildAndroid` is the task that produces the manager-loadable `.mpp`; the same task upstream
CI uses. A GitHub Actions workflow in `.github/workflows/build.yml` builds on every push and
uploads the `.mpp` as an artifact.)

The compiled bundle lands at:

```
patches/build/libs/patches-<version>.mpp
```

### GitHub Packages credentials required

The build depends on `app.morphe:morphe-patches-library`, hosted on GitHub Packages, so Gradle needs
credentials to resolve it. Add them to `~/.gradle/gradle.properties`:

```properties
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=YOUR_GITHUB_PAT
```

The PAT (personal access token) only needs the `read:packages` scope. Alternatively, set the
`GITHUB_ACTOR` and `GITHUB_TOKEN` environment variables. Without valid credentials, the
`app.morphe.patches` settings plugin and the library dependency will fail to resolve.

## Loading in Morphe Manager

1. Enable **expert mode** in Morphe Manager.
2. Add this bundle as an extra patch source alongside the official patches — either as a local
   `.mpp` file, or served from GitHub (below).
3. The "Disable Shorts repeat" patch will appear in the patch list for compatible YouTube versions
   (21.17+ — on 20.09–21.16 YouTube lacks the end-screen handling code, and the patch aborts with
   an explanatory error).

## Serving from GitHub

Pushing a version tag creates a GitHub release with the built `.mpp` and updates
`patches-bundle.json` on `main` (the same descriptor format the official Morphe patches use,
so the manager can check for updates):

```sh
git tag v1.0.0 && git push origin v1.0.0
```

Point the manager at the remote source using either:

- the bundle descriptor: `https://raw.githubusercontent.com/<owner>/<repo>/main/patches-bundle.json`
- or the stable direct link to the newest bundle:
  `https://github.com/<owner>/<repo>/releases/latest/download/patches.mpp`

(whichever form your manager version expects for custom sources).
