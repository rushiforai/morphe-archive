# Veloce Patches

Standalone Morphe patch-bundle project for apps used with Veloce.

## Use in Morphe Manager

Add it from Morphe Manager's Patch sources screen or open:

```text
https://morphe.software/add-source?github=M4TH1EU/veloce-patches
```

## Build

Use JDK 21 or newer and an Android SDK. Morphe's Gradle plugin requires GitHub
Packages access even for public artifacts. Configure `gpr.user` and `gpr.key`
(a token with `read:packages`) in your **user** `~/.gradle/gradle.properties`, or
set `GITHUB_ACTOR` and `GITHUB_TOKEN` in your environment.

From this directory (for local builds):

```sh
./gradlew buildAndroid
```