# Veloce Patches

Standalone Morphe patch-bundle project for apps used with Veloce.

## Use in Morphe Manager

Add it from Morphe Manager's Patch sources screen or open:

```text
https://morphe.software/add-source?github=M4TH1EU/veloce-patches
```

## Compatibility patches

| App | Patch | Options |
| --- | --- | --- |
| Waze | Allow custom car hosts | `hostPackage`, `hostCertificate`: extends the AndroidX host allowlist |
| Audiobookshelf | Allow Veloce media browsing | `hostPackage`: extends the package-only browser policy |
| Home Assistant **full** | Allow Veloce car host | `hostPackage`, `hostCertificate`: extends the AndroidX host allowlist |
| Spotify | Allow Veloce media browsing | `hostPackage`, `hostCertificate`: trusts the host and enables existing car browsing |

### Defaults and custom hosts

All patches work with the default Veloce identity without entering options:

```text
hostPackage:     ch.broillet.veloce
hostCertificate: 19fc3edb260878c016297c74965b5be95d8777060654cbac77b86e9191d6c38e
```

To allow a custom host, edit the patch's **Host package name** (`hostPackage`)
and **Host signing certificate** (`hostCertificate`) options in Morphe Manager
before patching. These replace the default added identity.

## Build

Use JDK 21 or newer and an Android SDK. Morphe's Gradle plugin requires GitHub
Packages access even for public artifacts. Configure `gpr.user` and `gpr.key`
(a token with `read:packages`) in your **user** `~/.gradle/gradle.properties`, or
set `GITHUB_ACTOR` and `GITHUB_TOKEN` in your environment.

From this directory (for local builds):

```sh
./gradlew buildAndroid
```