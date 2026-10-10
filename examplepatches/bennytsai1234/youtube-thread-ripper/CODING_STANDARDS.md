# Coding standards

## Fingerprints match structure, not obfuscated names

Patch fingerprints match media3 structure and strings (for example `/videoplayback`, `ump`, `range`, `scl.`, `ssp.`), not obfuscated class or method names such as `alai` or `alkg`, which change with every YouTube version. Names that are not obfuscated (for example `MainActivity.onCreate` in the WARP fingerprint) are fine. Obfuscated names may appear in comments and docs only as "in 21.16.256" notes.
