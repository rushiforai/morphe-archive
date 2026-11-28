# Native speech engine

`eppywhisper/` is a small JNI layer (`jni.c`) over [whisper.cpp](https://github.com/ggml-org/whisper.cpp)
v1.9.5 (MIT), used by `app.morphe.extension.sabp.read.Whisper` to transcribe audiobooks on the phone.

The `Native engine` workflow builds it and pushes the results to the `native-libs` branch:

- `arm64-v8a/libeppywhisper.so` (armv8-a) and `libeppywhisper_v82.so` (armv8.2-a + fp16 + dotprod),
- `libs.txt`, sizes, exported symbols, and host transcription test output with timings.

To bundle a build: copy `arm64-v8a/*.so` and `libs.txt` from `native-libs` into
`patches/src/main/resources/sabp/native/` (`libs.txt` beside `arm64-v8a/`). The `eppy` patch's
native-libs step adds them to the APK and sets `android:extractNativeLibs="true"`; with no
`libs.txt` it does nothing, and read-along falls back to text matching.

whisper.cpp's licence (MIT) applies to the libraries; see its LICENSE.
