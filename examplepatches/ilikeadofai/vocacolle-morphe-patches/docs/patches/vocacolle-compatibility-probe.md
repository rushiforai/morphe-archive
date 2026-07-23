# VocaColle compatibility probe

## Purpose

The `VocaColle compatibility probe` is an opt-in no-op bytecode patch for:

- package: `jp.nicovideo.nicobox`
- version name: `7.40.0`
- version code: `177`
- input type: base APK

It exists to validate the patching pipeline before any resource, bytecode,
network, login, playback, or database behavior is changed.

## Implementation constraints

The probe:

- declares exact package and version compatibility;
- is disabled by default;
- has no fingerprint;
- has no extension;
- has no `execute` block;
- inserts no instructions;
- changes no resources.

The metadata is covered by
`VocaColleCompatibilityProbePatchTest`.

## Build verification

Run:

```shell
./gradlew --no-daemon :patches:test buildAndroid
```

Verified result:

- Gradle build: successful
- metadata test: successful
- MPP generation: successful
- Morphe patch-list loading: successful
- bundle contains only `VocaColle compatibility probe`

The local MPP generated during validation had SHA-256:

```text
5cad919b466e10816cb10d8703dafe5a461256034e1fdb2ccc9b3a54f05d9eef
```

The hash is build-specific and is included only as an audit record.

## APK patching verification

Original base APK SHA-256:

```text
9228fd05e21a910821108d0ef050040b3ce2f30354170bc41db3b39d90121164
```

The source file and rollback copy matched this hash after patching. Morphe
reported all pipeline stages as successful:

- `PATCHING`
- `REBUILDING`
- `SIGNING`

The output retained:

- package `jp.nicovideo.nicobox`
- version name `7.40.0`
- version code `177`
- five DEX files
- the same DEX header counts for every DEX
- the same class descriptor set for every DEX

Additional checks passed:

- ZIP integrity
- 4-byte APK alignment
- APK Signature Scheme v2
- APK Signature Scheme v3
- package and version extraction

## SDK verifier exception

Morphe's optional `--verify-with-sdk` cross-DEX verification reports four
missing-type issues for:

```text
com.amazon.privacypass.PrivacyPass
com.amazon.privacypass.VerificationContext
```

This is an input-app false positive, not a patch regression. The original
`classes4.dex` references both types but neither type is defined in any of the
five original DEX files. The patch therefore runs without this optional check,
then uses ZIP, signature, manifest, DEX-count, DEX-header, and class-set checks
as independent verification.

## Waydroid split installation

The development input is a base APK and cannot be installed by itself. The
existing Waydroid installation contained these required splits:

- `split_config.en.apk`
- `split_config.ko.apk`
- `split_config.tvdpi.apk`
- `split_config.x86_64.apk`

The patched base and all four split APKs were signed with the same stable local
BKS development key, then installed as one Android Package Manager transaction.
The installed package reported:

```text
packageName=jp.nicovideo.nicobox
versionName=7.40.0
versionCode=177
primaryCpuAbi=x86_64
```

Installing only the patched base is expected to fail and must not be treated as
a patch failure.

## Rollback protection

Before replacing the Waydroid package, two local backups were created under
Git-ignored `backups/` paths:

1. an app-specific `tar.zst` containing the installed base/splits, credential-
   encrypted and device-encrypted data directories, and package metadata;
2. a full Btrfs reflink copy of the Waydroid `/data` directory, including the
   Android Keystore state.

The local development signing key is stored outside the repository with mode
`0600`. It must be reused for all later development APKs and must never be
committed.

## Runtime verification

Manual Waydroid verification on 2026-07-22 confirmed that the patched app:

- launches normally;
- reaches the application UI;
- does not immediately crash.

Because replacing the signing certificate required a fresh install, the app is
expected to start logged out. Functional login and playback checks belong to
later feature-patch validation and should be performed manually when relevant.

## Result

The compatibility gate passed. Functional VocaColle patches can now be added
incrementally while retaining this probe as an explicit pipeline diagnostic.
