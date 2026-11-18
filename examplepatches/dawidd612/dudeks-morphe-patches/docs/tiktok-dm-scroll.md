# Keep TikTok DM scroll position

## Scope and control

Default-enabled add-on for TikTok Global **47.0.3 (2024700030)**, `com.zhiliaoapp.musically`, compatible with kveld9 **v1.42.2**. Select it in Morphe with the other TikTok patches. Its Morphe description is English only; Polish usage instructions remain below. No Piko panel is added. Deselect the patch and rebuild to disable it.

## Why v1.28.0 was insufficient

The first implementation filtered only own messages with a reply reference at the event-to-scroll decision. Ordinary sends were intentionally excluded. Other events can enqueue scroll requests, and an earlier queued request can be executed on a later list commit. Passing the old reply guard therefore did not guarantee that the eventual commit would not scroll.

Small movement is a separate issue: input/citation collapse, keyboard/insets and RecyclerView item animations change the visible message's screen offset even without a scroll-to-zero call. TikTok's `InnerChatLinearLayoutManager` also observes viewport changes and dispatches height-settle notifications after 48 ms. A reply-only boolean guard did not preserve this geometry.

## New native hook

`CommitScrollFingerprint` locates the actual commit callback via `set_and_diff`, `, shouldScroll=` and `onSubmitListComplete`, plus `stopScroll` and `scrollToPositionWithOffset` calls. In the inspected DEX this is `LX/18o4;->invoke()`; this obfuscated name is not hardcoded.

The native callback drains the timestamp queue first, then calls `RecyclerView.stopScroll()` and `LinearLayoutManager.scrollToPositionWithOffset(0, 0)`. The hook skips precisely those calls when the chat was in history. It retains queue consumption, dataset updates, completion callbacks, logging and exception handling. This covers ordinary sends, replies of any content type and other automatic commit-time scroll requests.

The last drawn position is used when available: after insertion at index zero, even a user who was at latest can temporarily appear to be at position one. Testing only the new adapter position would incorrectly suppress normal bottom-of-chat scrolling.

## Viewport anchor and navigation

The extension is installed only through `InnerChatLinearLayoutManager.onAttachedToWindow` and removed at teardown. It holds one visible child and its visual screen offset. Stable adapter IDs are preferred; without them it validates the attached view, adapter position and item-count shift. It stores no message content, account identity or conversation history.

While reading history, a viewport change or suppressed commit starts a bounded 1-second anchor transition. Before drawing, the extension compensates changes in the anchored child's visual position with a local `scrollBy`, including item translation animations. It preserves the original physical position rather than repeatedly capturing an already shifted frame. A subsequent resize starts a fresh transition, so this does not depend on a timer measured from pressing Send.

Dragging/flinging, explicit message navigation, width changes, focus loss, a detached/rebound/resized anchor or an unavailable layout manager retire the anchor. A clamped correction also stops restoration. Detach removes listeners; the registry has weak keys and weak values, avoiding View/State reference retention.

The actual latest-button callback is fingerprinted by `TAP_SCROLL_BOTTOM` plus the `ChatroomEventAbility.refresh()` call. It grants a one-shot exception for loading/jumping to newest. Dragging cancels it. Five message-ID/position APIs in `MessageListScrollAbilityImpl` clear the resize anchor, preserving quote/search navigation. No global RecyclerView scroll methods are patched. Opening an empty conversation and normal conversation at latest retain native scrolling.

## Verification

Run with Java 21:

```sh
python3 scripts/test_tiktok_dm_hook.py
./gradlew :patches:buildAndroid :patches:generatePatchesList --no-daemon
javac -cp morphe.jar -d /tmp/dm-test scripts/VerifyTikTokDmDex.java
java -cp morphe.jar:/tmp/dm-test VerifyTikTokDmDex patched.apk
```

The host tests execute the production Java hook with Android fakes: all-message guards, delayed requests, latest-position insertion, dataset movement with/without viewport changes, stable/non-stable adapter IDs, multiline composer collapse, keyboard/insets, translation animation, drag, explicit navigation, focus/width changes and detach cleanup. The DEX checker verifies the actual commit branch target, register lifetime, queue-consumption ordering, navigation and lifecycle injections. These are not physical-device rendering tests.

The repository Actions workflow builds both extensions and runs both Instagram and TikTok host suites. Combined APK validation uses the official Global 47.0.3 XAPK and all 25 default-enabled kveld9 v1.42.2 patches, in Morphe Desktop FULL bytecode mode. Supported inputs have not changed:

```text
base APK SHA-256: 5d7382191ac50abeae151292f8a46e6b2c5c4b6f304994823c263ccfdb4a0b4b
feature df_a_dex.apk: 8db8c3f8b2744f3046d1454d8124b922fc31857d1b53be95364230e5905d2d9e
kveld v1.42.2 bundle: 74473979c22ca7982e03c9cc6104a92ae1d86e9d57e7c9736aa6c438a9da4df0
```

## Sprawdzenie na telefonie

1. Odśwież źródło Dudeks w Morphe. Spatchuj czystego TikToka Global 47.0.3 razem z patchami kveld9 i zaznaczonym **Keep TikTok DM scroll position**.
2. Przewiń długą rozmowę około 100 wiadomości wstecz. Wyślij kilka zwykłych wiadomości bez cytatu, potem odpowiedzi na film, zdjęcie i tekst.
3. Powtórz z tekstem zajmującym kilka linii. Obserwuj tę samą wiadomość podczas wysyłania, zwijania cytatu i otwierania/zamykania klawiatury.
4. Sprawdź ręczny scroll natychmiast po wysłaniu, przycisk przejścia na dół, dotknięcie cytatu i ponowne otwarcie rozmowy.
5. Na dole rozmowy sprawdź normalne wysyłanie i odbieranie wiadomości. Automatyczne przewijanie powinno nadal działać.

Kod i testy nie zastępują sprawdzenia animacji na fizycznym telefonie.
