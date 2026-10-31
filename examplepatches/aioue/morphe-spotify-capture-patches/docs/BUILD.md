# Building without Morphe CI

Gradle resolves `app.morphe.patches` and `app.morphe:morphe-patcher` from **GitHub Packages** (`MorpheApp/registry`).

## Authentication (required)

Create a PAT with **`read:packages`** scope:

https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe

Add to `~/.gradle/gradle.properties`:

```properties
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=ghp_...
```

Or use GitHub CLI (must include `read:packages`; the devcontainer `GH_TOKEN` often does not):

```bash
unset GH_TOKEN
gh auth login -s read:packages
```

Then:

```bash
./gradlew :patches:buildAndroid --no-daemon
```

## Verify

```bash
ls -la patches/build/libs/patches-*.mpp
```
