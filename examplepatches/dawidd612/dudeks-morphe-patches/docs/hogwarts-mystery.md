# Harry Potter: Hogwarts Mystery

The experimental QoL patches target Hogwarts Mystery 7.3.4 (7030400), build `a602b75`, on ARM64 and x86-64. Each patch is opt-in. The original APKM also contains an ARMv7 split.

## Verified input

- File `com.tinyco.potter_7.3.4-7030400_3arch_7dpi_ab10f870af9fe723064344403bbf2545_apkmirror.com.apkm` (185,758,000 bytes).
- APKM SHA-256 `95f7c3b7540e4b733256c0a38f17def020d0a90fd375b9f1463b637b5daa42dd`.
- Package `com.tinyco.potter`, versionName `7.3.4`, versionCode `7030400`, minSdk 28, targetSdk 36.
- All eleven APK signatures passed Android SDK 36.1.0 `apksigner verify`. The signer certificate SHA-256 is `4b214a464c7365f1317deab3b0fccecd03c051f67fa9161293fac7ed394a62af`.
- Contents comprise `base.apk`, `split_config.{arm64_v8a,armeabi_v7a,x86_64}.apk` and `split_config.{ldpi,mdpi,tvdpi,hdpi,xhdpi,xxhdpi,xxxhdpi}.apk`. The seven DPI splits cover 120–640 dpi. There are no separate locale or asset-pack APKs in this archive. APKMirror metadata, an icon and archive signature files are also present.
- The repository's `scripts/verify_apkm.py` validated the outer archive and each inner APK. Patching used a temporary copy of the input from Windows Downloads.

| Native library | SHA-256 |
|---|---|
| ARM64 `libpotter.so` | `dbf76481e639efebd57beb2ae8c84bd74dab507e4cc029c2f1bd5dfde5c6e22e` |
| x86-64 `libpotter.so` | `dbacc390a56799093562bd356e2d7141038eb826d06813e790d1d829d55658e1` |
| ARMv7 `libpotter.so` (inventory only) | `6ff1c35ea9e6d6198736d48b59a6d84dca863ddab2c2703e3024984212a3cf35` |

Each ABI APK includes `libpotter.so` plus AppLovin, Crashlytics, AndroidX DataStore and Tapjoy native libraries. The base includes four DEX files and the built-in Cocos assets.

## Analysis and scope

Cocos2d-x and the `Bpc`/Griffin gameplay code are compiled together in `libpotter.so`. Exported C++ symbols and ARM64/x86-64 disassembly expose the game code. The Android entry point is `com.tinyco.potter.HPGameActivity`. Cocos view JSON describes buttons, text and presentation. Unity Ads in Android logs is an SDK. The archive contains neither a Unity player nor an IL2CPP gameplay library. The embedded build info reports protobuf schema version `7.3.0.0`.

- `ScenarioHandler::onActionUpdate` calls `EnergyPool::tryRemoveEnergy` and uses the original price for action and quest progress. `EnergyPool` loads and serializes the balance and countdown through `GriffinMessages`. Temporary unlimited-energy bonuses have a separate spend event and persisted state. [Jam City lesson mechanics](https://jamcity.helpshift.com/hc/en/41-harry-potter-hogwarts-mystery/faq/728-how-can-i-make-my-character-participate-in-class/) · [Energy Toffees](https://jamcity.helpshift.com/hc/en/41-harry-potter-hogwarts-mystery/faq/4510-what-are-energy-toffees/)
- `No energy consumption` allows local actions at any valid nonnegative energy balance and keeps that balance when the game processes the debit. Its default `One point per tap` option uses the native per-point action flow and shows progress out of the original cost. `Game default` follows the game's tap setting. Finish-action mode uses the full remaining price at any balance. Spend events and regeneration follow the game’s own logic, so spend-based counters such as stamp cards can count a completed action while the balance stays the same. The shop, other currencies, balance serialization and linked-account synchronization use separate paths. Administrative project cancellations can refund nominal project progress, a behavior also present with the earlier patch. [Jam City energy rules](https://jamcity.helpshift.com/hc/en/41-harry-potter-hogwarts-mystery/faq/718-how-do-i-earn-energy/)
- `HPGoalProgress::start` seeds a local whole-goal wait in seconds after eligibility checks. `Skip local quest waits` zeros that positive countdown inside `HPGoalProgress::passTime` and uses the existing natural-expiry branch and `QuestAvailableNote`. It passes the real elapsed time to other paths. The paid skip uses the same countdown for its price and takes a separate transaction path. TLSQ queue scheduling uses server-anchored time. Objective cooldowns, TLSQ scheduling, active time limits and prerequisite checks keep their original paths. Save synchronization of an accelerated quest remains unverified.
- `FocusVC::onTap` stores the earned grade before scheduling the result screen. `Faster lesson feedback` shortens this 2-second pause to 1 second. It also shortens the ready and learned banner delays from 1.8 and 1.5 seconds to 0.5 seconds, keeping the original close and button-initialization callbacks. The built-in gesture skip directly invokes a success or failure callback. Entire lessons, player timing windows, grade calculation and reward paths remain part of normal play.
- `InteractionActionButton::updateStats` schedules the progress bar and completion callbacks with the same duration. `onAdvanceProgress` builds a local delay, fade and callback in sequence. Each patch changes the duration inputs for its own function.
- `HPTypewriterLabel::applyDefaults` controls the rendered text rate for both the configured and fallback paths. Dialogue choices and manual advancement use the original handlers.
- `CollectRewardsVC::continueReveal` schedules short presentation delays. The patch reduces three delays from 0.5 to 0.125 seconds and keeps the scheduled actions in order.
- The paid greeting patch bypasses `GreetingManager::queuePurchasableGreetingModal` and filters two exact starter campaign IDs at the automatic featured popup call in `tryToDisplay`. A matching ID takes the original false return and cleanup path. Other IDs call the original display function. The same call displays non-commercial messages such as the Niffler tutorial. The manual shop and transaction handlers use separate paths.
- `CharacterViewerNode::updateConstraints` passes a camera duration to `AvatarBuilderSlotTransition`. The patch halves it from 0.2 to 0.1 seconds. The game still determines the target pose and inventory permissions.

All patches share one package/version and clean library hash check. The writer checks expected bytes for both present 64-bit builds before changing either. A missing supported library or mismatched hash stops patching. Morphe raw resources carry the edits without a DEX extension or game assets in the bundle.

## Community references

HMODs advertised Skip Classes and Infinite Energy for 6.5.2 on Sbenny. The download is gated and the public description supplies neither licensed implementation code nor evidence for 7.3.4. A historical 4PDA index mentions Instant Actions for 2.3.1/2.4.0. No inspectable Faster Gameplay implementation for 7.3.4 was found. JoDylan404's public project automates BlueStacks taps externally. This implementation uses disassembly of the supplied APKM. [HMODs thread](https://forum.sbenny.com/thread/harry-potter-hogwarts-mystery-v6-5-2-ultra-mod-menu-free-shop-skip-classes-unlocked-items-infinite-energy-and-more-updated.187419/) · [4PDA](https://4pda.to/forum/index.php?showtopic=885116&st=1720) · [JoDylan404](https://github.com/JoDylan404/hogwarts-mystery-script-auto-clicker)

## Build, patch and install

1. Run `./gradlew :patches:buildAndroid --no-daemon` (Windows `.\gradlew.bat :patches:buildAndroid --no-daemon`). The bundle is under `patches/build/libs/`. Semantic-release generates the published bundle and index.
2. In Morphe Manager, use Sources → + → Local to add the development bundle. Enable Experimental app versions for that source and turn on Expert mode. After release, use the existing Dudek's Morphe Patches source. Select the full original APKM and enable the desired patches. Keep the ARM64 or x86-64 split for the target device. [Local sources](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md) · [Morphe Manager Expert mode](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md)
3. Export the merged APK and install it on a disposable device first. The Morphe Desktop 2.0.0 output passed signature verification and `zipalign -c -P 16 4`. Desktop 1.17.0 produced a working 4 KiB output on the test emulator, but its two patched libraries failed the 16 KiB ZIP alignment check. [Morphe Desktop releases](https://github.com/MorpheApp/morphe-desktop/releases) · [Android ZIP alignment](https://developer.android.com/tools/zipalign)

```powershell
java -jar MORPHE_DESKTOP.jar patch ORIGINAL.apkm "--patches=PATCHES.mpp" --exclusive "--enable=Faster dialogue text" "--keystore=HOGWARTS.keystore" "--out=HOGWARTS.apk"
adb -s TEST_SERIAL install -r HOGWARTS.apk
```

To disable a patch, apply the updated selection to the original APKM and install with the same signing key. Keep that key outside Git. Android rejected updating the official APK with the Morphe signature (`INSTALL_FAILED_UPDATE_INCOMPATIBLE`). Use an isolated installation or verify save recovery before migrating. [Android app signing](https://developer.android.com/studio/publish/app-signing)

Jam City documents Google linking across Android and PC and a separate Facebook link for recovery. Verify a recoverable link before changing an existing save. A Player ID can assist Jam City support. Google Play Games OAuth clients depend on the registered package and certificate. A linked account was unavailable for testing. [Google linking](https://jamcity.helpshift.com/hc/en/41-harry-potter-hogwarts-mystery/faq/9406-google-account-linking-faq/) · [Facebook recovery](https://jamcity.helpshift.com/hc/en/41-harry-potter-hogwarts-mystery/faq/875-how-do-i-load-a-game-that-was-linked-to-facebook/) · [Player ID](https://jamcity.helpshift.com/hc/en/41-harry-potter-hogwarts-mystery/faq/873-where-can-i-find-my-player-id/) · [Google Play Games client setup](https://developer.android.com/games/pgs/console/setup#generate_an_oauth_20_client_id)

## Repeatable Windows test

Use a dedicated AVD with `-no-window -no-audio`. The host runner checks the AVD name, package version and focused window. Windows OCR processes frames in memory. The runner prints only allowed labels, coordinates and step results. Keep the disposable guest between runs. Use `--from-step` to start at the current stage of a calibrated route. The runner still verifies that stage before tapping. For a different patch selection, use the same key and `adb install -r`. Keep emulator data outside Git.

```powershell
python scripts/hogwarts_smoke.py --serial emulator-5580 status --allow "Rowan"
python scripts/hogwarts_smoke.py --serial emulator-5580 replay scripts/hogwarts_diagon_smoke.json
python scripts/hogwarts_smoke.py --serial emulator-5580 replay scripts/hogwarts_diagon_smoke.json --from-step 2
```

The default AVD is `Morphe_Hogwarts_QoL_API35`. Set `--avd` for another isolated emulator. `--red-channel` is optional and requires Pillow. It compensates for red-only output from the test SwiftShader renderer. A route is a JSON array of steps. Each step checks unique, exact OCR labels. It can then tap a uniquely recognized label or use a coordinate tied to the capture dimensions. Account and purchase screens stop replay.

```json
[
  {"expect": ["Rowan"], "point": [1268, 949], "size": [2400, 1080]},
  {"expect": ["You"]}
]
```

## Verification report

| Patch or requested behavior | Status | Implementation | Tests | Limits |
|---|---|---|---|---|
| Energy Freedom | TESTED AND WORKING | No energy consumption keeps the original prices and progress while retaining the local energy balance, including at zero. | In the x86-64 Charms lesson, the signed patch processed a price of 4 at a balance of 5 and kept 5. At zero, the earlier implementation gave a 5-energy action a progress step of 0. The revised instructions advanced all 5 points, retained the zero balance at debit time and led to the normal lesson reward. Both ABIs passed native execution tests from the built APK. | Covers the audited local energy pool. Linked-account synchronization and physical ARM64 gameplay remain unverified. |
| Skip Waiting Timers | TESTED AND WORKING | Skip local quest waits uses natural expiry for a positive whole-goal countdown on an eligible quest. | The x86-64 control started a 3600-second wait for Stop Merula and still showed 56m 43s after a restart. A same-key update with the patch enabled preserved the save and made the quest playable. 192 instruction cases passed across both ABIs. | The live positive case covers one whole-goal timer on x86-64. Objective starts, repeat cooldowns, timed-event scheduling and synchronization are outside this result. |
| Skip Classes | TESTED AND WORKING | Faster lesson feedback trims the result pause and two post-fade lesson pauses. | x86-64 Focus awarded a perfect grade with a 1-second pause versus 2 seconds in the control. The learned banner used 0.5 seconds versus 1.5 seconds. The lesson still completed and applied its reward. | The ready banner still needs a runtime test. Full lesson skipping is unimplemented. |
| Instant Actions | TESTED AND WORKING | Faster action feedback changes 300 ms to 125 ms. | x86-64 Potions actions used 125 ms of feedback and consumed their actual energy costs. The control used 300 ms in Charms. | Scope is local button feedback. |
| Faster Animations | TESTED AND WORKING | Faster interaction fades changes local pause and fade durations. | Live x86-64 Fast mode ran 0.25-second pause and fade stages for the four book interactions and in Potions. All options passed binary tests. | Normal and Very Fast still need gameplay timing. Scope is action-button feedback. |
| Faster Dialogues | TESTED AND WORKING | Faster dialogue text configures 100 characters per second. | The x86-64 and translated ARM64 guests passed the Rowan-to-player dialogue route. On x86-64, four memory-only frames captured Rowan before the text and the full 98-character line about one second later. Manual advance reached the next turn. The x86-64 guest also selected a normal response from three Rowan choices and received the matching reply. | Timing is approximate. Later scenes and other languages remain untested. |
| Quick Rewards | TESTED AND WORKING | Quicker reward reveals shortens three local presentation delays. | The x86-64 Postbox gift used a 125 ms reveal and credited 10 energy after collection. Native execution from the APK verified all three changed inputs and normal continuation on both ABIs. | One reveal path exercised in gameplay. |
| Clean UI | BUILT / NOT RUNTIME TESTED | Hide automatic paid greeting suppresses greeting type `0x21` and two exact automatic starter offers. | The old patch still showed Premium Starter Offer! and New Player Offer! on the x86-64 AVD. The rebuilt APK passed 120 native cases on both ABIs. The same-key startup preserved the shop entry. | Neither campaign became eligible again in that follow-up startup. Other campaign IDs and manually opened offers keep the game's behavior. |
| Cosmetics QoL | TESTED AND WORKING | Quicker outfit previews halves the camera transition duration. | A clean x86-64 guest reached the character creator. The live Cocos transition was 0.10 seconds. The preview remained open while switching selections. | Verified in character creation. The later wardrobe remains untested. |

The full Gradle build and `generatePatchesList` passed with Morphe Gradle Plugin 1.3.3. The generated preview indexed Hogwarts Mystery as a ninth app. The seventeen existing patch definitions matched the released metadata exactly. The build kept the existing source, CI and release workflow. The bundle SHA-256 before the zero-cost energy update was `e32839ec4d93eb2a312b646d32e3ebb1a7fb0d02a6564470f78dc58425dad31d`.

Morphe CLI verified the seven original selections and each new selection individually. Desktop 2.0.0 applied all nine together. The independent binary checks verified the 25 existing edit ranges and eight new ranges across ARM64 and x86-64. The nine-patch APK differed from the verified seven-patch APK only at the eight new native ranges. The APK kept all 24 native libraries from the three input ABIs. ARMv7 and the other libraries matched the original payloads. Tests also rejected base-only input and an already modified library without writing a patched APK.

The isolated API 35 x86-64 AVD installed and launched the original split set, then the re-signed combined APK. Same-key upgrade and a cold emulator restart returned to the guest's Diagon Alley progress. Later testing reached Flourish and Blotts and opened the first book interaction. The ARM64-only APK passed signing and 16 KiB checks and launched with `primaryCpuAbi=arm64-v8a` through the x86-64 emulator's native bridge. It loaded the guest's Diagon Alley progress and passed the same dialogue replay. No physical ARM64 device was tested. The nine-patch APK installed as a same-key x86-64 update. The guest completed the four book interactions, answered Rowan, and reached Get Your Wand. The earlier OCR stop occurred at a swipe-only tutorial prompt. A guarded swipe and local highlight detection completed the route. A local read-only probe measured the energy interval and actual Cocos action durations. Linked-account sign-in and cloud recovery remain open.

The calibrated Diagon Alley route passed in four local OCR frames. Resuming at step 2 passed in two frames. The seven synthetic runner tests cover safe replay, resume, unknown screens, OCR ambiguity, sensitive screens and bounds. An emulator snapshot restored offline on this host until cold boot. Resuming with `--from-step` uses the currently running scene and avoids that dependency.

The first-lesson follow-up resumed the same x86-64 guest at Get Your Wand. OCR handled dialogue and the chapter reward screens. A gesture traced along the highlighted wand path earned Ollivander's “Splendid!” response. The guest completed chapter 1 and used `COLLECT`, which opened the chapter 2 start screen. The live energy pool remained at 24/24 with a 30-second interval.

Starting Welcome to Hogwarts stopped at the animated crest twice. The second attempt used the same guest after a process restart with no active probe. The restart restored the final Rowan dialogue in Diagon Alley, so only that exchange and the chapter transition were repeated. The game process remained alive on the crest for over two minutes. Logs showed compressed texture upload errors around the transition and HTTP 403 responses for some static resources during startup. Their relationship to the stall is unconfirmed. With `swangle` and `swiftshader`, the game returned to the Android launcher during startup. Android recorded both as process exits with status 0. After restoring `-gpu host`, a fresh launch after emulator startup returned to Diagon Alley with the same installation and data.

At that checkpoint, the first lesson had yet to exercise energy spending, below-cap refill, action timing, minigame results and reward collection. The chapter 1 reward reached a separate screen from the targeted reward reveal hook.

### Same-key control for the chapter 2 transition

A zero-selection Morphe Desktop 2.0.0 run rebuilt all eleven original APKs as one APK with the same signer as the nine-patch build. SHA-256 comparison of ZIP payloads found differences only in the ARM64 and x86-64 copies of `libpotter.so`. All three control library hashes matched their original splits. The control passed signature and 16 KiB alignment checks. Its APK SHA-256 was `7a5d240138b575d89ed8b3b0f0af9a7b7fcb7b94001d468fdf8e12534111527e`. A private backup preceded `adb install -r` on the same AVD. The app ID and first installation time were preserved.

The zero-selection APK entered the Great Hall twice. The original nine-patch APK also passed on retest from a byte-identical local save at the final Rowan checkpoint. Its transition reached scene completion and left the crest after about 28 seconds. A probe saw no positive quest wait during that run. Nine Cocos cache files appeared during the first successful control transition and remained available for the subsequent runs. The earlier hang has not been reproduced with that cache. The cache change, previous graphics errors and HTTP 403 responses do not establish a cause, so no patch was changed on that evidence.

The zero-selection control completed the first Charms lesson, Lumos, with two stars. Guarded OCR and highlight detection opened the actions. The original button scheduled 300 ms of feedback. The first debit spent 3 energy (24 to 21). The remaining 30-second countdown carried over from the previously installed build and yielded one energy. The following countdown reset to 240 game seconds and also yielded one energy below the cap. The first star reward increased coins from 103 to 203. The Focus minigame received a real touch inside the green timing window, returned a perfect passing grade and used the original 2-second result pause. OCR selected `COLLECT` on the success screen. The game marked the lesson complete, applied the class reward and credited 30 attribute XP.

The nine-patch APK was reinstalled over the control after Lumos. The saved file was byte-identical through the update. Hogwarts Record showed Lumos as learned after relaunch. The separate post-lesson Lumos trace rejected the generated touch paths and was advanced with the game's visible `Skip` button. On the same save, the patched APK completed Cure for Boils with two stars. Watch Merula used 125 ms of feedback, debited 3 energy (24 to 21) and the pool recovered one point about 30 seconds later. All 12 measured debits matched their action costs. Completion pause and fade each took 0.25 seconds. Focus again produced a perfect passing grade after a real tap. The result pause measured 1 second and the learned banner pause 0.5 seconds. The final cauldron trace registered a failed gesture. The game then showed the two-star success screen, applied the class reward of 10 attribute XP on `COLLECT`, recorded project completion and displayed the level-up screen. A cold app launch with the nine-patch APK and the probe detached returned to the selected post-lesson reply. OCR replayed the remaining dialogue and verified the next objective, Report to Angelica.

### Earlier energy implementation and Chapter 3 follow-up

`No energy consumption` replaces `Faster energy regeneration` in the development bundle. The full Gradle build and `generatePatchesList` succeeded. The generated preview had nine Hogwarts definitions and matched the seventeen existing definitions exactly. The new `patches/build/libs/patches-1.39.1.mpp` SHA-256 is `1ee2c59bf243ca80dcf98b71c200db3f209ceeedf137dc61c3b5f936073f076e`. Morphe Desktop applied the nine patches to the original APKM. The APK passed the same-certificate and 16 KiB alignment checks. Its only payload changes from the previous build were the new zero-cost instructions and the restoration of the original energy regeneration instructions. A local backup preceded the in-place update and the saved file retained its exact bytes during installation.

On the x86-64 AVD, OCR resumed Report to Angelica, completed the House Points tutorial and advanced to Collect Slugs. In Escape the Devil’s Snare, all nine energy-priced actions advanced with 24/24 before and after each action. The total nominal cost was 40, with zero calls to debit or refill. The game awarded five stars, completed the project and applied the reward through `COLLECT`. The run used the visible built-in `Skip` for repeated Lumos gestures. The previous build failed the same balance assertion on all twelve recorded paid actions.

Instruction tests on the APK reran 192 timer cases across both ABIs. The targeted whole-quest timer did not receive a positive countdown on the tested route. The eight-hour activity time limit continued counting down. The Devil’s Snare reward used the project completion view. A cold launch after the escape loaded the saved progress and unlocked the Postbox. The welcome gift reached the targeted `CollectRewardsVC` path and measured a 125 ms delay. The final `COLLECT` closed the reveal and raised the real balance from 24 to 34. Native execution verified all three delay inputs and normal continuation. The live offer manager ran without an eligible `0x21` call, and the separate manual `SPECIAL` tile remained visible. The game was left at the second Report to Angelica objective in Year 1, Chapter 3, part 3 of 6.

### Starter offer regression

A same-key control with the timer and offer patches disabled displayed **Premium Starter Offer!** automatically at the Chapter 3 checkpoint. The previous all-patch build also displayed it and then **New Player Offer!**. The native probe matched both campaigns to `GreetingManager::tryToDisplay` kind `41`. The subsequent **Niffler in Hogwarts!** reward tutorial shared that path.

Both exact starter IDs passed through the original display function in the native red test. In the rebuilt APK, the 120 instruction cases covered both IDs, every single-byte substitution, different lengths and ordinary messages across both ABIs. The exact IDs returned false and all other inputs forwarded the original arguments. Each edited range was checked against the original ELF mapping, symbols and references. The x86-64 AVD then loaded the same guest with the revised APK. The saved file matched a private backup byte for byte through installation. OCR showed the manual `SPECIAL` tile. No starter campaign reached the filter on that later startup, so the live retest did not establish the suppression result for a newly eligible campaign.

OCR completed the second Report to Angelica, selected an owned outfit and reached Summon Broom. The x86-64 probe counted 18 actions with a nominal total of 33 energy and no debits. The lesson timer continued counting down. The polish gesture passed, the summoning gesture received a failing grade, and the two-star lesson completed with the original reward and a higher energy limit. Gobstones and the Chapter 3 reward completed on the same save. The revised APK also displayed the automatic Chocolate Frogs reward greeting, and the earned cards were collected normally. The offer patch built by itself. Its addition changed only the nine audited starter-offer instruction and data ranges relative to the previous nine-patch APK.

### Chapter 4 story wait control

The same guest reached Chapter 4, finished Search for the Book and played through the vision. This run used the revised offer filter with `Skip local quest waits` disabled. The two APK selections were compared entry by entry to verify the control used the original timer instructions. The Chapter 4 part 3 card displayed `GO` for Meet with Rowan. The game entered the Great Hall and started the conversation. The native trace recorded quest availability and no positive quest or objective wait at that point. The historical 90-minute wait described by the walkthrough did not reproduce on this save. A private, verified checkpoint was kept before the book reward and again at the Great Hall. [Chapter 4 walkthrough](https://www.hogwarts.cafe/hogwarts-mystery-year-1-chapter-4-dueling-motives/)

The native game keeps objective-start timers separate from the whole-goal countdown. A whole-goal wait can gate the story card and scenario selection. This run exercised both a normal three-hour lesson limit and an eight-hour book-search limit, which are distinct from an unlock wait. On both ABIs, the save loader restores serialized objective-start timers and repeat cooldowns into the same map. A blanket edit of that map's countdown would also affect restored repeat cooldowns, so the patch keeps its whole-goal scope.

### Chapter 5 positive timer A/B

The same x86-64 guest continued from Meet with Rowan using OCR. The active chapter 4 chain was `C4_v2`, whose six goals all have zero configured wait. The older `Y1_C4_P3` definition still has a 5400-second wait. After the chapter 5 practice duel, the active `Y1_C5_P2_v2` definition started at 3600 seconds and the native tick decremented it to 3599. OCR read 59m 41s on Stop Merula. The control still showed a locked card with 56m 43s remaining after a cold launch.

The APK pair differed only at the two timer instructions, one per supported ABI, apart from signatures. A same-key in-place update with the patch enabled preserved the saved file byte for byte before launch. About two minutes after starting the update, OCR verified `GO` on the Stop Merula card. The normal route entered the Courtyard scenario and started the opening dialogue with Rowan. This verifies the whole-goal timer change in the published v1.40.0 code on the same save.

### Energy balance regression at zero

In the five-star Wingardium Leviosa lesson on the API 35 x86-64 AVD, the original energy logic spent 4 points (37 to 33), reached 0/25 through ordinary actions and displayed `Out of Energy` on the next tap. The signed revised APK independently processed `WATCH` at a displayed price of 4 and a balance of 5/25. The action completed and the HUD still read 5/25.

After a partial action was lost on an app restart, the same-process comparison loaded the exact guarded instruction bytes from the two signed APKs into the isolated test process. At 0/25, v1.40.0 accepted `Attempt to Cast` at a remaining price of 5 but clipped the action step to 0. The revised code on the same action and balance kept the step and displayed cost at 5. The debit returned success with a balance of 0 before and after. Completing the action credited a separate 3-energy reward, and regeneration later increased 3 to 4. The lesson awarded its fifth star, accepted the traced spell, showed `Success!` and granted the completion reward through `COLLECT`.

The signed revised APK repeated the final gesture and reward after an early restart resumed an older autosave. The test used the game's `Save Game` control and waited for a local write containing the 23/25 balance. An in-place update with the same signer preserved that file byte for byte. The standalone patch then launched with `primaryCpuAbi=arm64-v8a` through the emulator's native bridge and returned to the classroom after the lesson, with 23/25 on the HUD. [Jam City manual save instructions](https://jamcity.helpshift.com/hc/en/41-harry-potter-hogwarts-mystery/faq/4684-how-do-i-save-the-game/)

The full Gradle build and Morphe metadata generation passed. All other 25 definitions matched the published index. The energy-only and all-patches APKs passed signature and 16 KiB alignment checks. A matched control differed only in the three guarded energy instruction ranges per ABI. The two-ABI native matrix covered zero, below-price, funded and overflow balances, original progress amounts, corrupt balances and the existing unlimited-energy bonus branch.

### Manual interaction taps

`No energy consumption` defaults to `One point per tap`. Both touch handlers use the game's per-point path, and the action bubble shows progress out of the original price. The game's scripted action and long-press handlers retain their original behavior. `Faster action feedback` can be enabled separately for a shorter animation.

In the first Flourish and Blotts visit, all four book selections completed with zero progress points and no energy debit. The same result was observed with the new default and with `Game default`. The tutorial uses the game's zero-cost completion path as soon as the player selects a book. The per-point mode applies to actions with a positive progress requirement.

Both signed APK variants passed 96 native dispatch, HUD, hold and scripted-progress checks across x86-64 and ARM64. The manual variant passed 208 native wallet checks. The generated index changed only the energy patch definition. Comparing both APKs confirmed that the options differ only at the three guarded input and HUD branches per ABI.

```powershell
python -m unittest discover -s scripts -p test_hogwarts_smoke.py -v
```
