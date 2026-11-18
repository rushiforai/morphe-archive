# FairEmail Patches v0.3.1 — source display name update

**The Morphe patch source now displays as "FairEmail Patches"**, matching the simple naming style of sources such as "Gboard Patches".

This is a **branding-only update** from `v0.3.0`; the six patch names, code behavior, supported upstream FairEmail APKs, default selections, license, and GitHub repository URL are unchanged. The source's embedded MPP manifest now uses `Name: FairEmail Patches`.

## Updating an existing Morphe source

1. Open **Morphe Manager → Sources** and disable **Use prerelease patches** in settings if you previously enabled it.
2. Refresh the existing `rikunode/fairemail-morphe-patches` source. It should offer `v0.3.1` with **six patches** and the display name **FairEmail Patches**.
3. If you previously set your own name using the source's **Rename (pencil)** action, Morphe preserves your custom override. Rename the source locally to `FairEmail Patches` if the old title remains.
4. **Do not delete and re-add the source; do not re-patch, uninstall or replace the installed FairEmail app solely for this naming update.** Source-label changes do not alter an installed APK.

For a new source, use the same repository:
`https://morphe.software/add-source?github=rikunode/fairemail-morphe-patches&name=FairEmail%20Patches`.

## Six patches (unchanged)

| Patch | Default | Compatible FairEmail |
| --- | --- | --- |
| Clone FairEmail alongside official app | ON | 1.2338 |
| Suppress automatic changelog popup | ON | 1.2338 |
| Permanently hide donation banner | ON | 1.2337, 1.2338 |
| Enable OAuth setup in re-signed FairEmail (experimental) | OFF | 1.2338 |
| Enable local Pro features (experimental) | OFF | 1.2337, 1.2338 |
| Enable local settings export (experimental) | OFF | 1.2337, 1.2338 |

## Existing limitations and privacy

The original FairEmail 1.2338a APK SHA-256 is `666b9f4ada53f69199355f1ccc2bed73e01fa23786fc0189cf81cc51932dc5a9`. This remains an independent unofficial GPLv3 Morphe patch source (not an upstream FairEmail or Morphe release). Its experimental OAuth/Pro/export features remain opt-in. **Still unverified:** Gmail SMTP sending from the modified app, unattended token refresh, new-mail synchronization on the destination after backup import, safe in-place signed-clone updates, and device lifecycle suppression of changelog. See [the v0.3.0 release notes](https://github.com/rikunode/fairemail-morphe-patches/releases/tag/v0.3.0) and [open device acceptance tests](https://github.com/rikunode/fairemail-morphe-patches/issues/5).

No pre-signed FairEmail APK, signing key, personal Gmail credentials or backup archives are included. To preserve data, **never uninstall or clear an existing clone** just to change a source name.
