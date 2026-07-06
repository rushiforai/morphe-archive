# Google Discover Feed Ad Patch Notes

## Input

Analyzed APKM:

```text
com.google.android.googlequicksearchbox_17.34.30.ve.arm64-301766498_1dpi_3feat_513c7e62be093eb010a4d794f4588e14_apkmirror.com.apkm
```

Bundle contents:

```text
base.apk
split_config.xxhdpi.apk
split_lens_ondevice_engine_feature_module.apk
split_lens_ondevice_engine_play_ml_module.apk
split_tclib_native_feature_module.apk
```

The Discover/feed code is in `base.apk`.

## Decompile Findings

The Google app package/version is:

```text
com.google.android.googlequicksearchbox
17.34.30.ve.arm64
```

`base.apk` contains 13 dex files. The relevant Google Discover implementation is clustered around `classes5.dex`, with public package classes such as:

```text
com/google/android/apps/search/googleapp/discover/streamui/surface/TngDiscoverSurface
com/google/android/apps/search/googleapp/discover/streaming/streamdataservice/StreamingDataServiceViewModel
```

The `StreamingDataServiceViewModel.a(...)` method calls:

```text
byyq.e(...)
```

That path eventually reaches:

```text
byyq.c(Map, bxmd, byyr, byya, Instant, TngDiscoverSurface): byyd
```

`byyq.c(...)` logs:

```text
TB#getStreamSubtree
Created StreamSubTree successfully, items %s
```

and constructs:

```text
new byyd(children, requiredContent, sessionMetadata, distanceToStart, distanceToEnd)
```

`byyd` decompiles to:

```java
public final class byyd {
    public final List a;     // children
    public final Map b;      // requiredContent
    public final bwer c;     // sessionMetadata
    public final int d;
    public final int e;
}
```

The child list element type is `bwes`:

```java
public final class bwes {
    public final String a;   // topLevelContentId
    public final List b;     // children
    public final bxmg c;     // content
    public final String d;   // sessionId
    private final String e;  // contentId
    private final fvah f;    // renderableUnit
}
```

This is a good hook point because filtering `children` before the `byyd` is returned prevents matching nodes from reaching the stream UI.

## Fresh Ad Video Path

A fresh decompile of the same APKM also shows a more specific intrusive ad/video path in `classes8.dex` and `classes9.dex`:

```text
epns       Discover Video spec
fusn       ad video metadata extension, extension id 393053250 on futs
fuyc       ad lightbox/video model, extension field 9 on fusn
epun       ad lightbox renderer
epoz       VideoLightboxActivity launcher plus AdsReporting
```

`epns` checks for the `fusn` extension before inflating:

```text
R.layout.duplo_ad_video
```

`epoz` logs/launches through:

```text
GOOGLEAPP_DISCOVER_VIDEO_CARD_CLICK
GOOGLEAPP_DISCOVER_VIDEO_ACTIVITY_INTENT_STARTED
AdsReporting
```

The extension detector now treats `fusn`/`fuyc` payloads and those ad-video reporting markers as strong ad signals, and it walks superclass fields so protobuf extension storage is visible during reflection.

## Hook Point

Verified smali sequence in `byyq.smali`:

```smali
const-string v3, "TB#getStreamSubtree"
...
const-string v2, "Created StreamSubTree successfully, items %s"
invoke-interface {v13}, Ljava/util/List;->size()I
...
new-instance v0, Lbyyd;
...
invoke-direct/range {v0 .. v5}, Lbyyd;-><init>(Ljava/util/List;Ljava/util/Map;Lbwer;II)V
```

The patch injects before the log string:

```smali
invoke-static {v13}, Lapp/codex/googlefeedads/extension/GoogleFeedAdsPatch;->filterDiscoverFeedNodes(Ljava/util/List;)Ljava/util/List;
move-result-object v13
```

The fingerprint is based on the two stable strings and the immediately following `List.size()` call.

## Current Detector

The extension uses reflection to inspect each stream node and drops nodes that contain strong ad markers such as:

```text
googleadservices
doubleclick
adchoices
ad_lightbox
native_ad
ad_unit
ad_video
fusn/fuyc ad video payloads
AdsReporting
sponsored
gesponsord
anzeige
advertisement
paid content
promoted
```

It also logs compact samples of the first Discover nodes to `logcat` with tag:

```text
GoogleFeedAdsPatch
```

The detector is intentionally conservative/prototype-grade until real feed payload samples are captured from a patched install.

## Build Status

`./gradlew buildAndroid` currently fails before compilation because the Morphe Gradle plugin cannot be resolved from GitHub Packages without configured package credentials:

```text
Plugin [id: 'app.morphe.patches', version: '1.3.2'] was not found
```

Once `gpr.user` and `gpr.key` or equivalent `GITHUB_ACTOR` and `GITHUB_TOKEN` are available to Gradle, rerun:

```bash
./gradlew buildAndroid
```

## Test Loop

1. Build this bundle to produce the `.mpp`.
2. Patch `base.apk` or the APKM through Morphe/Morphe CLI with this patch enabled.
3. Install on the test device.
4. Open Discover and scroll until feed ads would normally appear.
5. Capture:

```bash
adb logcat -s GoogleFeedAdsPatch
```

6. Use the logged node samples to replace the broad string heuristic with a tighter check on a specific `bwes`/`bxmg` field or nested protobuf case.
