# Afterglow build118 preview

[Release](https://github.com/afterglow-labs/ytafterglow-morphe-patches/releases/tag/v0.1.0-build.118) · [Add source](https://morphe.software/add-source?github=afterglow-labs/ytafterglow-morphe-patches&name=Afterglow)

Afterglow now includes **122 selectable patches**, with **99 selected by default**.
The bundle adds 87 features from the pinned **Morphe 2.0.0** source, including
Return YouTube Dislike, DeArrow, Downloads, Copy text, Download post images,
Search comments, queues, swipe controls and playback tools. GmsCore support and
stream spoofing use the same imported dependency graph.

These are the original Morphe implementations and settings. Features already
covered by Afterglow retain their existing owner; 23 additions with overlapping
controls are optional. The two branding patches are excluded. The
[complete catalog](morphe-catalog.md) records every inclusion and disposition.

## Use the bundle

1. Update the **Afterglow** source in Morphe Manager, or add the repository using
   the link above. The updated source contains **122 patches**.
2. Patch an unpatched **YouTube 21.43.523** APK with the **default 99 selections**.
   Use the compatibility patches in this bundle. The non-root installation still
   needs a compatible GmsCore companion app.
3. Open **Afterglow settings → Additional features** for the imported controls.

Dislikes and title/comment copying start enabled. DeArrow's title scopes start
off and can be enabled in Additional features → DeArrow. Downloads retains
Morphe's in-app and external-downloader choices. Existing preferences survive
upgrades; selecting a patch does not enable every runtime setting.

## Verification

Morphe Desktop **1.20.0 / patcher 2.1.0** strictly applies and rebuilds each
of these selections from this bundle alone:

- The **99 default patches**.
- An independent **eight-patch selection** containing Comments header, GmsCore
  support, Spoof video streams, Return YouTube Dislike, DeArrow, Downloads,
  Copy text and Download post images.
- **All 122 patches**, including the optional overlapping additions.

The actual bundle loader verifies 122 unique names, 99 defaults, an acyclic
411-object dependency graph and six forwarded original option objects.
Morphe Manager **2.6.0 / patcher 2.4.0** updates the existing published GitHub
source from 35 to 122 patches. Using that downloaded build118 source alone, it
applies all 99 defaults, rebuilds and signs the stock APK successfully in 39.0
seconds. The temporary local source is removed, and the published Afterglow
source remains enabled. Manager's internal version display remains 0.1.0; the
feed version is 0.1.0-build.118.

The source import is reproducible from pinned, hash-checked inputs. All 1,378
provenance records match, and the three original runtime extension assets are
unchanged. The builder freezes 1,710 production/provenance inputs. Original
notices and dependency licenses are included, with no imported branding assets
or duplicate public exports. Settings visibility/default/reset checks pass
**518/518**.

Integration checks cover shared Litho filters, Cast hooks, enum matching,
navigation policies, speed limits and hold controls, and theme-color hook order.
These fixes preserve the original feature implementations while allowing both
sets of hooks to share YouTube methods. The optional Seekbar helper keeps its
color controls without installing Morphe's branded splash animation.

## Runtime scope

The final build118 default APK on Android 16 advances playback from 8 to 15
seconds, displays 12K dislikes on the test video, copies its exact full title,
and replaces/restores its title when DeArrow is switched on/off. Organic feed
recommendations and the shared settings entry remain visible. The installed APK
hash matches the signed candidate; the captured crash buffer is empty. DeArrow
is restored to its default and the app is stopped. The native download action reaches
the account picker on the signed-out emulator; a completed download is not
claimed. Comment copying, post-image saving and DeArrow thumbnails are present
but were not separately exercised in this release's runtime checks.

Physical devices, account login, casting and every optional runtime combination
remain unverified. Applying all patches successfully does not establish every
combination of runtime settings. Configure overlapping optional policies one at
a time. The custom iOS parity ledger remains separate from this imported feature
coverage and does not gate these features.

The public feed points to build118 and its anonymous download matches SHA-256
`1a024b624c0a23706c8ea88cc69c42d456af83790e7c1fed4af21707631f586f`
(**24,339,655 bytes**). The release tag points to source commit
`46310a3c5cd30dd4be837eac5aaa28571de6edb3`.

The release includes the `.mpp`, SHA-256 checksum and a delivery manifest with
the source commit, pinned inputs and validation results. Only the patch bundle
is distributed; the test YouTube APKs remain local.
