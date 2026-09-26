# Experimental YouTube Music compatibility

The Jam patch now advertises exactly 9.15.51, 9.35.54, 9.36.50 and 9.37.54.
The three newer targets retain `isExperimental = true`. Validation used the supplied
ARM64, minAPI26 APKs. These results do not establish support for every version or ABI.

## Local validation

On 2026-09-25, `:patches:validateJam` completed with exit code 0 for:

| Version | Patch application | SDK DEX verification | APK construction | Device testing |
| --- | --- | --- | --- | --- |
| 9.37.54 | Pass | Pass | Pass | Pending |
| 9.36.50 | Pass | Pass | Pass | Pending |
| 9.35.54 | Pass | Pass | Pass | Pending |
| 9.15.51 baseline | Pass | Pass | Pass | Prior baseline checks; release acceptance pending |

The harness applies GmsCore support, Hide ads, Jam queue sharing, Lyrics and
background playback, including their dependencies. It rejects patch exceptions,
uses `SdkDexVerifier`, compiles resources and assembles an unsigned APK with the
isolated package `app.morphe.jam.next.music`. This is the tested selection; the
entire optional Morphe patch catalog was not applied.

Local full traces are retained in the workspace's sibling `analysis` directory:

| Version | Trace | Final output |
| --- | --- | --- |
| 9.37.54 | `astra-9.37.54-autoplay.log` | `BUILD SUCCESSFUL in 1m 18s` |
| 9.36.50 | `astra-9.36.50-validation.log` | `BUILD SUCCESSFUL in 1m 10s` |
| 9.35.54 | `astra-9.35.54-validation.log` | `BUILD SUCCESSFUL in 1m 6s` |
| 9.15.51 | `astra-9.15.51-final.log` | `BUILD SUCCESSFUL in 1m 57s` |

The baseline invocation also ran all six Jam regression tests: zero failures,
zero errors and zero skipped tests.
The same six tests passed against 9.37.54. The final `buildAndroid` and
`generatePatchesList` invocation exited 0 (`astra-final-bundle.log`,
`BUILD SUCCESSFUL in 1m 6s`). The local Android bundle contains `classes.dex`.
Catalog generation was repeated with historical local bundles moved aside because
the generator selects the first `.mpp` in `build/libs`; `astra-final-catalog.log`
records the successful regeneration from the current bundle.

Reproduce from this repository with an Android SDK configured:

```powershell
.\gradlew.bat :patches:validateJam `
    '-PjamApk=C:\apks\youtube-music.apk' `
    '-PjamOutput=C:\output\jam-unsigned.apk' `
    --console=plain

.\gradlew.bat :patches:test '-PjamApk=C:\apks\youtube-music.apk' --console=plain
```

Use a separate invocation for each APK. A build without `jamApk` skips the real
APK tests and does not establish compatibility.

Input APK SHA-256 hashes:

```text
9.37.54  a34a7bc48138bdc6b1654286137c1a1dcff6f082353c178cd856cc6f8e28dc0e
9.36.50  2f401fcde1344669a37e2f7cfd85d5cedd25ccd98f856466894b4ec1dcd9bacc
9.35.54  23166b0b6356bfd105db1174dc3f87a3f9f8b6c21a32946acb5fc84106095d6f
9.15.51  a003ac2e673c2979b2268e5acfbfd74f88b93c4b75af5c7d604b3c7fb92768a4
```

## Resolver changes

The original newer-version attempt failed with
`Missing or ambiguous - Jam native menu dispatcher field`. Class merging placed
multiple fields of the dispatcher's type on the queue manager. The resolver now
requires the unique field actually read by the native enqueue method. The negative
fixture confirms that adding an unused same-type field is accepted, while reading
two different dispatcher fields still fails.

Further 9.37.54 failures exposed these optimizer changes:

- Seek wrappers store controls as `Object`; constructor parameter types preserve
  their relationship to the resolved playback control interface.
- The watch page's `onStart` lifecycle still identifies the current-item source.
- The current-item menu body can be inlined into a click handler. Its watch-page
  field, exact accessor and menu call identify the entry point.
- Merged playback listeners cast their `Object` field to the resolved control type.
- Autoplay feature-flag branches can precede header creation. The header field's
  `isEmpty` and list insertion calls identify the creation block directly.

These changes use fingerprints and BytecodeUtils instruction filters. Discovery
contains no version branches, obfuscated host identifiers or arbitrary candidate
selection. Existing ABI checks and bridge installers remain in place.

The multi-session regression suite also exposed a fingerprint cleanup defect in
the vendored patcher: clearing the weak-reference registry removed reusable
singletons from subsequent cleanup. Live fingerprints now remain registered so
each session clears cached DEX references before their backing mapping closes.
Closing an inspection or failed session also clears matches even when `get()`
was never called.

## User testing handoff

After the prerelease is published, use `AgentKosticka/Jam-Patches` in Morphe Manager
with prereleases enabled. Select a clean APK of the exact target version and enable
Jam in Player settings after patching. Restart YouTube Music.

On host and participant devices, check:

- Pairing, discovery, reconnect and Companion interoperability.
- Queue enqueue, removal, reorder and selecting the intended item.
- Play/pause, next/previous, seeking and clock synchronization.
- Full-player and mini-player titles, artwork and the current-item menu.
- Autoplay headers and queue transitions, including an empty queue.

Record the app version, device, patch selection and failure logs with any report.
Local compiler success is not a runtime pass. These experimental targets await
this manual acceptance, including the published Manager installation flow.
