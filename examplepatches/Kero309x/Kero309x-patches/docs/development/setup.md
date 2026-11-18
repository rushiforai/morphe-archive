# Development setup

## Required

| Tool | Version | Why |
|---|---|---|
| JDK | 21 | Gradle and the framework plugin |
| Git | any current | version control |
| Gradle | via the committed wrapper | builds |
| Android SDK, platform 36 | only when an extension module exists | Android library builds |

Node.js and Python are not required. The release workflow uses `gh`, which is
preinstalled on GitHub runners.

## Registry credentials

The framework Gradle plugin is published to GitHub Packages and requires an
authenticated read, even for a public repository.

Create a personal access token with `read:packages` only, then put it outside the
repository, in `%USERPROFILE%\.gradle\gradle.properties`:

```properties
gpr.user=<github-username>
gpr.key=<token>
```

Never put these in the repository, in a workflow file, or in a log. In CI they
are read from the `MORPHE_REGISTRY_TOKEN` secret, which must exist in two places:

- the repository's Actions secrets, for pushes and pull requests;
- the repository's Dependabot secrets, because Dependabot-triggered runs cannot
  read the Actions secret store.

Both workflows refuse to build when that secret is empty, so a missing credential
fails immediately with a clear message instead of a plugin-resolution error.

## First build

The wrapper is committed, so a checkout only needs a JDK:

```bash
./gradlew build
```

The wrapper was generated with the installed Gradle rather than copied, so the
checksum in `gradle/wrapper/gradle-wrapper.properties` belongs to the distribution
it points at. Regenerate it only when the Gradle version changes.

To build the bundle the way a release does, use `buildAndroid`; it adds
`classes.dex` and, when a signing key is present, the signature. It also
regenerates `patches-list.json` from the catalogue, so a build can leave that file
modified; commit the result with the change that caused it.

```bash
./gradlew buildAndroid --no-configuration-cache
```

`buildAndroid` captures the project, so the configuration cache must stay off. The
same applies to `generateSigningKey`.

The wrapper is pinned to Gradle 9.8.2, which is the newest version the framework
plugin supports. Gradle 9.9.0 applies the plugin and then fails with `Cannot set
a fallback for a provider using a null value`, so it cannot be used until the
framework plugin is updated.


## Verifying against a stock build

The stock application is never committed and never uploaded. Point the build at a
local copy:

```bash
./gradlew verifyPatches -Papk="C:/path/to/stock-build.apk"
```

Every patch of the APK's own application is applied to the stock build with
validation enabled. The run prints one line per patch and fails if a fingerprint
does not match, if a patch throws, or if the bytecode it produces does not
assemble. Add `-Pout="C:/path/to/patched.apk"` to write the patched, unsigned
APK, which also proves that the result compiles.

This is the gate every patch passes before it is released. It proves that the
patches find what they expect and that the result assembles; it does not prove
runtime behaviour. That still needs a device.

## Deriving code points

Derivation is done with a general decompiler against the stock build. Record what
you used and what you concluded in `docs/provenance/LOG.md`. Do not consult
another patch collection while deriving.

## Useful paths

```
patches/                  bundle sources
docs/specs/<app>/         behaviour specs, one per patch
docs/provenance/LOG.md    derivation records
```
