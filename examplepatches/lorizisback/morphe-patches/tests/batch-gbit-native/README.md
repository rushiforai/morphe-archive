# Batch GBIT native regression checks

Run only after the three-reviewer gate, on the dedicated signed-out `morphe_sample_api36` emulator. Verify its AVD name before installing. This instrumentation refuses physical hardware and signed-in Curve installations. It never invokes GBIT, loads transaction history or starts the foreground service.

The probe constructs Curve's real transaction model with a synthetic REST timestamp, tests UTC mapping in another timezone, interrupts a fake suspended request, and checks wake-lock acquisition, release and expiry on an unattached service instance. Synthetic screens verify retained checkbox focus, centred card snapping by scrolling and touch, selection controls and the completed-results action. A synthetic asset URL exercises Curve's card image loader. Notification pending intents open only the private results activity with the exact requested batch ID. The service is never dispatched to Android or given a batch to execute. The test restores timezone and releases its wake lock in `finally` blocks.

Use the compile, DEX, package, align and signing steps in [the existing screen-test instructions](../curve-screen/README.md), substituting this directory's source and manifest. Compile against Android 36, with Java 17 bytecode and DEX min API 28. Use the same local signing key as the patched Curve APK.

Run:

```sh
adb -s emulator-5556 shell am instrument -w -r \
  -e avd morphe_sample_api36 \
  app.local.curve.batch.probe/app.local.curve.screen.test.NativeBatchProbe
```

Require the `PASS Batch native` result and `INSTRUMENTATION_CODE: -1`. The three synthetic screenshots are saved as `batch-selection.png`, `batch-cards.png` and `batch-progress.png` in Curve's external files directory. This does not validate real financial operations, actual screen-off execution, TalkBack, or authenticated reopening of completed results.
