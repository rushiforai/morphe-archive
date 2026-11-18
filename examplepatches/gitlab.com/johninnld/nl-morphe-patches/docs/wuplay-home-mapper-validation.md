# Wuplay Home mapper validation (phase 3)

Target: original `app.wuplay.androidtv` 0.9.4-beta / 49, SHA-256 `3f6dc351f7aefeb634d55602c4921c1826555153390d7aee0f622ac7a02d0802`.

## Root cause

The APK's `SidebarScreenKt.resolveRows` resolves an explicit Home screen `rowCatalogIds` list; BoardViewModel falls back to `showHome` and `homeOrder` only when that list is absent/null. An explicit empty list stays empty. The old patch consulted only the fallback fields. The rooted TV's current screen configuration contains all ten reported rows in the reported order, while most of their legacy `showHome` flags are false.

REA method evidence: `ev_6d3f9f19c4da582526bcfd29a12e46b3bcc9ebcce7805a8730a3f006c5086f5f` for the original APK's `resolveRows`. Its complete decompilation matches the row-ID resolution observed in the saved configuration. This is static evidence; the native bridge was also executed in the test install below.

The old publisher explicitly preferred background images and declared a landscape aspect ratio. The repair publishes valid poster URLs with Android's 2:3 aspect ratio, retaining title metadata and stable IDs. Items without usable posters are skipped. The user confirmed portrait posters as the intended choice.

## Implementation

- Resolve the first stored profile's actual Home row IDs in order, retaining the native legacy fallback for unconfigured screens. Skip unresolved IDs, duplicate IDs and navigation groups.
- Admit Library and Watchlist rows when placed on Home. Original `fetchContent-BWLJW6A` handles both using native content flows and returns MetaPreview items; no separate account or HTTP implementation is needed.
- Recheck current Home membership before and after suspended fetches. Keep existing provider ownership and profile guards.
- Present only Cancel and Done. Cancel/Back discards draft edits; Done saves, refreshes and requests outstanding Android TV visibility approvals before returning. System approval cancellation retains saved data. Launchers without the approval activity receive an explanatory message.
- Use a bright focus fill/outline for rows and a cyan action button with dark text. Keep action focus during worker completion; define D-pad paths explicitly.

## Verification

- New production-bridge JVM regression failed on the old implementation and passes with screen precedence, false legacy flags, exact ten-row order, empty/null/missing screen handling, duplicate/missing IDs, local content sources and removal during fetch.
- Release workflow Gradle build/unit-test tasks passed, including patch tests and Medium, Waze, Flitsmeister, Vela and extension tests. Built the bundle with the repository's existing Morphe signing key.
- Applied that actual bundle exclusively to the original APK using Morphe Desktop full bytecode mode and fingerprint validation. APK signature verification and 4-byte alignment passed.
- Freshly decoded original and product APK audit: all 7,961 original classes and methods retained; only the four expected native hook methods changed; 32 extension classes, no bundled Kotlin replacement. Selector remains internal with no launcher intent filter.
- QA manifest enables debugging for preference seeding; all four DEX files match the product APK byte for byte. Isolated Android TV API 36 emulator, package was absent before testing. Private profile/configuration input copied read-only from the rooted TV is not a repository fixture.
- In-UID instrumentation reports all ten Home rows in the exact user-specified order, including Trending Movies and Trending Shows with `legacyHome=false`.

- Final product APK SHA-256: `ace66ae40656cc4e43002babbd6e2148c452ebd8878794c6caee28e824c6c79a`.
- Full Python suite: 414 tests, 45 skipped under existing optional-tool/input conditions, no failures. Strict MkDocs build and 1,238 Markdown link/anchor checks pass.
- Actual Android Activity lifecycle probe failed against the pre-review build on its empty-draft regression, then passed against the final product DEX. It recreates during blocked loading, checks saved-selection recovery, presses Done repeatedly, interleaves a draft edit with queued work, and recreates with a draft and focused action. The test gates automatic foreground publication while using temporary test preferences.
- D-pad entry through native Settings > Catalogs > TV channels shows the actual Home checklist. Right focuses the cyan Done action. Selecting a row and Cancel leaves saved selection empty. The final build opens with all rows unchecked again.
- Selecting the previously missing **Trending Movies** and **Trending Shows** and pressing Done publishes exactly two channels and 200 programs. Android automatically approved the first; Done launched the native Add/Cancel prompt for the second. Approving it made both provider channels browsable.
- In-UID provider inspection finds a nonempty title and portrait aspect ratio 4 (2:3) on all 200 programs. The first movie poster URLs match Verity, The Dog Stars and Spider-Man: Brand New Day from the reported Home row. A second native refresh retains both channel IDs and all 200 program IDs.
- Independent code review found three asynchronous picker issues; all were repaired and the final review reports no remaining findings. If any catalog fetch fails, Done keeps the picker open with a retry message; approval requests begin after a successful refresh.

The stock Android TV test launcher visibly renders separate Wuplay Trending Movies and Trending Shows rows with portrait posters matching the native Home rows. Opening Verity from the published row reaches Wuplay's populated native details screen for Verity; playback itself was not tested.

These runtime checks preceded promotion to main. The physical TV installation was not replaced; physical-launcher acceptance remains separate from emulator and provider evidence. The user authorized main publication and user-guide updates on 2026-11-02.
