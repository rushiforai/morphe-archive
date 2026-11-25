# Gboard OCR without Play Services: bundling ML Kit

Date: 2026-11-13. Companion to `2026-11-13-gboard-theming-options.md`.

## Why the shipped OCR patch cannot download models

Evidence from the device and the APK:

1. Gboard bundles no OCR runtime at all: `unzip -l base.apk | grep -iE "libmlkit|text_recognition|ocr"` is empty and there are no `.tflite` files.
2. The module request goes out from the patched app:
   `BoundBrokerSvc: …ModuleInstallService.START … mCallingUid=10138`
3. Play Services refuses it:
   `libbinder.IPCThreadState: … will be dropped but finished with status UNKNOWN_TRANSACTION` (uid 10138).
4. `ModuleInstall` is a restricted GMS API: it serves Google-signed, allowlisted callers. A re-signed Gboard is neither, so the model never arrives.

Conclusion: OCR through GMS is impossible for a re-signed build, regardless of how the patch is written.

## What bundling actually costs

Artifacts from Google Maven, measured:

| Artifact | Size | Contents |
| --- | --- | --- |
| `com.google.mlkit:text-recognition:16.0.1` | 1.4 MB | `assets/mlkit-google-ocr-models/**` (~1.1 MB: taser detector/segmenter, gocr line recognition, aksara layout) |
| `com.google.mlkit:text-recognition-bundled-common:17.0.0` | 17.9 MB | `classes.jar` 987 KB (1 200 classes) + `libmlkit_google_ocr_pipeline.so`: arm64-v8a 11.1 MB, armeabi-v7a 6.8 MB |
| `com.google.mlkit:vision-common:17.3.0`, `common:18.11.0` | 0.7 MB | client classes |

So it is ~12 MB per ABI, not hundreds.

Class collision check: the bundled classes live in
`com.google.android.gms.internal.mlkit_vision_text_bundled_*` (1 013),
`com.google.android.libraries.vision.*` (166),
`com.google.mlkit.vision.text.{pipeline,bundled.common}.*` (20).
Gboard contains `com.google.mlkit.vision.text.TextRecognizer` + `…text.internal`,
and **none** of `mlkit_vision_text_bundled`. No namespace overlap on the
implementation side.

## The integration point is small

Gboard builds its recogniser in one DI provider:

```java
// defpackage/jid.java  (TextRecognizerModule.provideTextRecognizer)
optionalEmpty = Optional.of(new aabt(
    (aabx) ((zeu) aabuVar.a).b(aabyVar),
    (Executor) ((zet) aabuVar.b).a.a(),
    addx.c(... "play-services-mlkit-text-recognition" ...),
    aabyVar));
```

`aabt extends MobileVisionBase implements com.google.mlkit.vision.text.TextRecognizer`
and its constructor triggers the dynamite/GMS load. Replace that construction with
our own implementation and no module request is ever made.

The contract to implement, read from Gboard's own dex:

```java
public interface com.google.mlkit.vision.text.TextRecognizer
        extends Closeable, cbd, lau {
    lxk b(aaat image);   // aaat = { volatile Bitmap a; int b; int c; }
    void close();
}
// lau.a() returns kzf[] — return an empty array: "no modules required".
```

Input conversion is trivial: `aaat` is a bitmap plus its dimensions.

## The real work: the result model

Gboard's OCR consumer (`defpackage/jar`, `OcrCaptureKeyboardPeer.processBitmap`)
does:

```java
lxk task = recognizer.b(aaatVar);
task.k(executor, new lxg() { ... });        // addOnSuccessListener
// success value: Gboard's own obfuscated Text
if (zxoVar == null || zxoVar.a().isEmpty()) ...
jhwVar2.r = new jih(zxoVar);                // wrapper, exposes .c list
graphicOverlay2.a(new jib(context, overlay, jhwVar2.r));   // renders boxes
```

The bundled library returns `com.google.mlkit.vision.text.Text`; Gboard expects
its own obfuscated `Text`/block/line/element graph (`zxo` and friends), because
R8 renamed the unbundled client's result classes. So a bridge must **transcribe**
one graph into the other: blocks, lines, elements, symbols, text, bounding boxes,
corner points, language, and whatever `jib` reads for the overlay.

That transcription is the project. Everything else is packaging.

## Staged plan

1. **Scaffold packaging** (small): extension dex carries the bundled classes; a
   resource patch writes `assets/mlkit-google-ocr-models/**` and
   `lib/<abi>/libmlkit_google_ocr_pipeline.so`; verify the APK still builds and
   installs, and that Gboard starts with the libs present but no bridge yet.
2. **Bridge, Latin only** (medium): implement `TextRecognizer` with an empty
   `kzf[]`, convert `aaat` → `InputImage.fromBitmap`, run the bundled recogniser,
   and return a task (`lxp`) whose result is a *provisional* object.
3. **Result transcription** (large, the hard part): map the bundled `Text` graph
   into Gboard's obfuscated classes field by field, driven by what `jih` and
   `jib` actually read. Validate by rendering the overlay and inserting text.
4. **Other scripts**: the bundled models cover Latin plus the aksara script
   detector; Chinese/Japanese/Korean/Devanagari are separate ML Kit artifacts
   (`text-recognition-chinese`, …-japanese, …-korean, …-devanagari), each its own
   model set and ABI cost.

## Blocker that is not technical

**Licensing.** `libmlkit_google_ocr_pipeline.so` and the OCR models are Google
proprietary binaries shipped under the ML Kit terms, not an open-source licence.
This repository is GPLv3 and redistributes a signed bundle that would embed those
binaries, effectively redistributing Google's model files. The ML Kit terms
restrict that; so does Google's general policy on shipping proprietary SDKs inside
a modified Google app.

Everything above is technically achievable. The question is whether you want this
repository to redistribute Google's OCR engine and models, which is a decision
with a licensing answer, not an engineering one.
