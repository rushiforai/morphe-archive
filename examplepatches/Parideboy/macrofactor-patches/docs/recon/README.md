# Reverse-engineering notes

MacroFactor's `com.sbs.diet` build is R8-obfuscated. Names of app classes, of RevenueCat's
classes (from 5.8.13 on) and of the GMS helpers change between releases, so every fingerprint is
anchored to something that survives renaming: a method shape, a JSON key, a string constant.

Those anchors, and the smali they were read from, are recorded per app version:

| Version | Notes |
| :--- | :--- |
| 5.8.13 | [5.8.13.md](5.8.13.md) |
| 5.8.11 | [5.8.11.md](5.8.11.md) |

How the notes are produced: decompile the APK with apktool (`apktool d app.apk -o smali`), read
the smali listed in each file, and confirm the fingerprint by the shape described there. A new
version gets a new file here and, if the anchors moved, updated fingerprints in
`patches/src/main/kotlin/…/**/Fingerprints.kt`.

The single fact that changes everything: 5.8.13 enabled whole-dex R8 renaming. See
[5.8.13.md](5.8.13.md) for what that broke and what it left intact. The per-version files are
the source of truth behind the KDocs on the fingerprints and on
`signature/SpoofSignaturePatch.kt`.
