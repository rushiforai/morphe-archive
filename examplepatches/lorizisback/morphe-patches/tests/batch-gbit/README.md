# Offline queue checks

Compile BatchRunner.java and BatchStore.java from the extension together with both Java files in this folder against Android 36. Package using the manifest here, convert classes with d8 and sign. Run only on morphe_sample_api36 using `adb -s emulator-5556 shell am instrument -w app.local.batch.test/app.local.extension.curve.BatchRunnerTest`. Require PASS and result -1.

The test APK targets itself. It contains a fake transport and never loads Curve or sends financial requests. Covers sequential submission, durable submission boundary, disk failure, account change, changed quote, stopping, partial success, unknown outcome replay, definitive rejection and duplicate starts.
