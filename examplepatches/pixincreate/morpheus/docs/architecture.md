# Architecture

This page describes the repository layout, the patch and extension model, and how a patch becomes an installable app.

## Repository layout

```text
patches/                        the Morphe patch set (Kotlin), one directory per app and feature area
extensions/ather/               the Java extension for Ather
extensions/ather/stub/          compile-only stubs of app classes, never shipped
extensions/nothingx/            the Java extension for Nothing X
extensions/proguard-rules.pro   shared keep rules
base/                           the untouched APKs (local only)
keystore/                       the signing key (local only)
out/signed/                     the signed, installable split set (local only)
scripts/build.sh                build the bundle, apply it to base/, sign the result
scripts/sign-all.sh             zipalign and apksigner for the base and the splits
build/                          scratch tree and intermediates (regenerable, not tracked)
```

## The patch model

A patch is a Kotlin function declared with `bytecodePatch` or `resourcePatch`.
Each patch declares the package it supports with `compatibleWith`.
The Morphe CLI applies every patch whose package matches the APK, so one bundle serves both apps.

A bytecode patch finds its target with a `Fingerprint`.
The fingerprint pins the defining class, the method name, the access flags, the return type and the parameter list.
The patch then inserts, replaces or removes smali instructions at a known point in the method.
When a fingerprint does not match, the patch fails and the CLI reports the error instead of writing a broken APK.

A resource patch edits `AndroidManifest.xml` or other resources through the document API.
The `Morphe screens` patch uses one to register the extension's components in the app manifest.

## The extension model

An extension is an Android library written in Java that ships inside the patch bundle.
It holds the runtime code the patches call: the Morphe settings screen, the ride log, the K1 dialog and the rest.
The patches stay small, and the code that needs real Android APIs lives in the extension.

A patch mounts its extension with `extendWith("extensions/<name>.mpe")`.
The Gradle build compiles each extension into a `.mpe` file and embeds both `.mpe` files in the `.mpp` bundle.
When a patch with an extension applies, the CLI adds the extension dex to the patched app, so the injected calls resolve.
A patch that injects a call to an extension class without `extendWith` produces an app that crashes with `NoClassDefFoundError`, which is why the `patch-set` CI job checks every patch.

The Ather extension compiles against `extensions/ather/stub`, a compile-only copy of `com.ather.maps.a0`.
The stub lets the extension compile without the vendor APK.
It is never shipped and never included in the extension dex.

The Morphe Gradle plugin discovers the extension projects under `extensions/`.
Each project declares its output name in an `extension` block, for example `extensions/ather.mpe`.
`settings.gradle.kts` sets the default namespace and the shared ProGuard rules.

## The build pipeline

`bash scripts/build.sh` runs four steps:

1. Download the Morphe CLI 1.16.0 into `build/tools/` and verify its SHA-256.
2. Gradle builds `patches/build/libs/patches-<version>.mpp`, which embeds `extensions/ather.mpe` and `extensions/nothingx.mpe`.
3. The CLI applies every package-matching patch to `base/com.athermobileapp.apk` and writes an unsigned APK to `build/base-unsigned.apk`.
4. `scripts/sign-all.sh` aligns and signs that APK plus the three original config splits into `out/signed/`.

The CLI is pinned because the patch bundle format must match the CLI that reads it.
The script passes `--unsigned`, because signing is the next step, and `--disable-purge`.
The CLI recompiles only the resources it touches, including the manifest the `Morphe screens` patch edits, and reuses the untouched archive entries.

Signing is a separate step because every APK in an install set must carry the same signer.
See [build-and-release.md](build-and-release.md) for the signing rules and the CI jobs.
