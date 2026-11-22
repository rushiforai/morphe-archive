# Where to Watch

Replace the film row and its destination with a local, region-specific service
selection. Preserve the app's toolbar, row, service icons, offer categories,
and JustWatch attribution.

## Native Android surfaces

- Add `patches/src/main/kotlin/app/template/patches/letterboxd/WhereToWatchPatch.kt`
  for the Android 3.6.7 stock film-row and availability-fragment hooks.
- Add `extensions/extension/src/main/java/app/template/extension/watch/WatchScreen.java`.
  Reuse the native film row, destination and Back action, `item_text_row`,
  `item_header`, `availability_powered_by_footer` and the existing spinner.
  Keep settings accessible when results are empty, loading or unavailable.
- Add `WatchHooks.java` for host film identity and view binding, and
  `WatchViews.java` for native resource and dialog lookup, in the same package.
- Depends on the stock 3.6.7 (515) layout, Mod settings and local selection.
  Verify with `./gradlew buildAndroid` and the exact patched APK on device.

## Local service selection

- Add `WatchAvailability.java`, `WatchPreferences.java`, and
  `WatchServicePicker.java` under the extension's `watch` package.
  Persist local favorites by country and provider ID. A fresh setup has no
  selected providers. Load a catalog when Settings opens or the country changes.
  Show selected services in a searchable list with Apply and Cancel. Combine
  offers from all saved regions, with the region on each provider row.
- Depends on Android preferences and a provider catalog supplied by the
  availability source. Local selection can be tested independently of transport.
- Compile `WatchAvailability.java` and `WatchAvailabilityTest.java` into a
  temporary directory and run
  `java -ea -cp <directory> app.template.extension.watch.WatchAvailabilityTest`.
  Check Apply, Cancel, region changes and reopening Settings on device.

## Availability integration

- Add `JustWatch.java` under the extension's `watch` package. Use the approved
  public website endpoint and the samples in `docs/api/justwatch.md`.
  Match the film by stable external ID when possible. Exclude ambiguous matches.
  Fetch offers for the selected country, cache successful lookups temporarily,
  and load icons off the main thread. Expose a retry on lookup failure.
- Depends on endpoint confirmation and a successful live title/catalog/offer
  probe. Verify API handling with fixtures and a film with confirmed live offers.
- Verify the signed DEX contains the extension model without references to
  `RecordTag`. Morphe's extension packaging did not include the D8-generated
  superclass used by Java records in the first candidate.

## Verification

- Run `./gradlew buildAndroid`. Patch the stock 3.6.7 APK with the previous
  patch set plus Where to Watch. Check the Morphe result and use `adb install -r`.
- On the installed build, open a known film, select a provider with a live
  offer, verify the icon and link, leave and reopen Settings to verify retention,
  and check an empty selection or no matching offers.
