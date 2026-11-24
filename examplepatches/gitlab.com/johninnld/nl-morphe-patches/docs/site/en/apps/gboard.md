# Gboard

**App version:** 18.8.0.1022711984-beta-arm64-v8a · **Build:** 176124766 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select Google's armeabi-v7a APK (build 176124765) or arm64-v8a APK (build 176124766) for this exact release; each build's versionName ends in its own ABI. Android 8.0+ is enough: the minAPI26 and minAPI32 variants of each build both work.

[Read how to use and test every Gboard patch](../guides/gboard.md) · [Make Frosted Glass visible](../guides/gboard.md#frosted-glass)

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Enable Inline Autofill Suggestions** | On | Enables Gboard's Android inline autofill receiver so a password manager such as Bitwarden can offer login chips in the keyboard. Requires Android 11+, an enabled autofill provider and its inline display setting. Works through the Bitwarden client when using Vaultwarden. |
| **Smart Compose** | On | Exposes **Text correction → Smart Compose** and enables the client-side text completion gate. Google's language, model and app eligibility still apply. Separate from password autofill. |
| **Parakeet voice typing** | On | Adds **Parakeet voice typing** to Gboard settings → Voice typing. Once you download a model there and switch it on, the microphone key transcribes on the phone with NVIDIA Parakeet instead of Google's speech recognition. Each sentence is recognised in the language you speak it in, so Dutch and English work in the same dictation without switching. Until a model is ready, Gboard keeps using Google's voice typing. The patched Gboard gets the Parakeet launcher icon. |
| **Rambler voice typing** | On | Adds Google's **Rambler** to Gboard settings → Voice typing, as a choice next to Parakeet (Gboard's Standard voice typing). With Rambler picked, the microphone key sends your speech to Google's servers, which return finished text and carry out spoken edits such as "delete the last sentence". Parakeet stays the default. |
| **Rambler personal dictionary** | On | Adds **Voice dictionary** to Gboard settings → Voice typing, with Gboard's own **Voice correction list**: names and words you add, import or export, which Rambler receives with every dictation so it spells them right. Requires Rambler voice typing. |
| **Rambler contact names** | On | Fills the voice correction list with your contacts' names once you switch on **Contact names** under Voice dictionary. Names you delete are not added again; new contacts are added the next time Rambler starts. Requires Rambler personal dictionary and contacts access. |
| **Rambler custom instructions** | On | Adds **Custom instructions** to Gboard settings → Voice typing → Rambler. Your text is added to Rambler's own instructions, not a replacement for them: Rambler receives it with every dictation and follows it for style only, such as spelling, punctuation, vocabulary and tone. Requires Rambler voice typing. |
| **Rambler cursor-aware editing** | On | Rambler also sees the text after the cursor, so spoken edits reach the whole text and dictating in the middle of a text fits in. With text selected, only the selection is sent, so a spoken edit such as "make this more formal" applies to it, and the result is selected again for the next edit. Requires Rambler voice typing. |
| **Rambler app context** | On | Rambler also receives the name of the app you dictate in and the text field's hint, so it can match the tone of a chat, an e-mail or a search, and custom instructions can depend on the app. This tells Google which app you are typing in. Requires Rambler voice typing. |
| **Rambler stop after silence** | On | Rambler stops by itself after 3 seconds without speech and keeps the text, as when you tap ✓. Change the time (3, 5, 8 or 10 seconds) or switch it off under Gboard settings → Voice typing → Rambler → **Stop after silence**. Requires Rambler voice typing. |
| **Parakeet personal dictionary** | On | Lets Parakeet spell the names and words in the **Voice dictionary**'s voice correction list, including contact names added there. Parakeet favours them while listening and corrects a sound-alike spelling only when a second listen agrees. Needs a 2 MB spelling download under Parakeet voice typing. Requires Parakeet voice typing and Rambler personal dictionary. |
| **Change package name** | On | Installs the patched Gboard under its own package name (app.morphe.android.inputmethod.latin by default), so it sits beside the stock Gboard that most phones have built in. Your stock Gboard, its settings and its dictionary are not touched; choose the patched keyboard in Android's keyboard settings. |
| **Custom branding** | On | Sets the launcher name to **Gboard Parakeet/Rambler** and uses the Parakeet icon by default. Change either in Morphe's patch options. |
| **Add Gboard Signature Bypass** | On | Lets the patched, re-signed Gboard use the parts that check the app's signature, such as Themes, which otherwise stop with a warning about unrecognized certificates. |
| **Rounded Keyboard Panel** | On | Chooses which corners of the keyboard panel are rounded and sets the top and bottom radii separately, on whichever theme is active. |
| **Frosted Glass** | On | Adds live background blur behind the keyboard plus theme or custom transparency for the background and the keys, with an option to extend the effect into the navigation bar. Blur needs Android 12 or newer. |
| **Custom Theme** | On | Adds ZIP theme import to Gboard's own theme screen and a gallery of ready-made theme packs, downloaded on demand and checked by checksum. Adds the INTERNET permission. |
| **G Logo on Spacebar** | On | Shows a built-in icon or your own PNG, WebP or JPEG on the space bar, in its own colours or a single colour, with an adjustable size. |
| **Key Shape Selection** | On | Enables Gboard's own Key shape option in theme details, so a theme's keys keep their shape instead of being forced square. |
| **AMOLED dark keyboard** | On | Turns the dark keyboard background pure black instead of Google's grey, including the dynamic theme that follows your wallpaper, while light mode keeps the light keyboard. There is no separate tile: pick Dynamic Color in Gboard's theme screen — see [AMOLED dark keyboard](#amoled-dark-keyboard). |
| **Enable OCR / Scan Text** | On | Adds Gboard's Scan Text camera entry point: point the camera at text and it is recognised and inserted at your cursor. The patch ships its own on-device OCR engine, because Play Services refuses the download to a re-signed Gboard. Latin text only. You can also pick an existing screenshot or photo in Gboard settings and have its text copied to the clipboard. |
| **AI Writing Tools** | On | Exposes Google's rewrite and tone tools for selected text where supported. Proofread / Auto Fix is outside this port. |
| **Clipboard Enhancements** | On | Controls how long copied snippets stay available, how many are kept, how many preview lines a card shows, and whether cards show a countdown, creation time, order number and column count. |
| **Web Clipboard** | On | Hosts a small Web Clipboard portal on the phone so a desktop browser on the same local network can exchange clipboard text with Gboard. The portal is protected by a pairing code and can be reached from a Quick Settings tile. |
| **Toolbar Editing Buttons** | On | Adds Select All, Copy, Cut and Paste to Gboard's menu so they can be dragged onto the top toolbar and used across supported keyboard languages and editors. |
| **Cursor trackpad mode** | On | Long-press the space bar to move the cursor more precisely with a trackpad and use the lock mode. |
| **Incognito Mode Toggle** | On | Adds an Incognito toggle to the Access Point toolbar and lets you choose whether the clipboard and voice typing stay available while Incognito is active. This controls Gboard's own incognito state; it is not a network-wide tracking blocker. |
| **Simple Calculator** | On | Type an arithmetic expression in a text field and see a scrollable equation with its answer in Gboard's suggestion row, ready to insert. |
| **Advanced voice typing (NGA)** | On | Enables Google's advanced dictation capabilities and bundles the matching dictation component for both ABIs. Availability depends on Gboard's recognizer eligibility. |
| **Use Bluetooth microphone** | On | Shows Gboard's own Voice typing → **Use Bluetooth microphone** switch, which stock hides, so dictation can capture from a paired headset. The stock switch still decides routing. |
| **Rambler toolbar & revert extras (18.8)** | On | Adds the overflow button to the floating Rambler toolbar, keeps the rewritten text when you revert from the full transcript to the cleaned-up text, and passes edit history on the Jetson Lite path. |
| **Rambler automatic retry (18.8)** | On | Lets Rambler retry an eligible recognition failure with audio from the current dictation. It may send that audio to Google again. |
| **Hidden flags (18.8)** | On | Three internal 18.8 flags written through Gboard's own override store: app-specific word biasing, the app-specific suggestion bar and the square normalised search radius. See [Hidden flags](#hidden-flags-188). |
| **Beta features (18.8)** | On | Enables five features for clipboard, floating keyboard, Emoji2 and suggestion removal. Change each under **Patches → More settings → Beta features**. See [Beta features](#beta-features-188). |

Enable Inline Autofill Suggestions, Smart Compose, Clipboard Enhancements, Web Clipboard, Toolbar Editing Buttons, Cursor trackpad mode, Incognito Mode Toggle, Simple Calculator, Rounded Keyboard Panel, Frosted Glass, Custom Theme, G Logo on Spacebar and Key Shape Selection are ported from the GPLv3 [Gboard Patches](https://github.com/jasonwu1994/Gboard-patches) project and updated for Gboard 18.8.0.


### Advanced voice typing (NGA)
This patch enables Google’s advanced dictation capabilities and bundles the matching native component. Gboard still checks that the recognizer and language can start. The selector has two entries, **Rambler** and **Standard** (Parakeet when applied and ready). See [setup and testing](../guides/gboard.md#advanced-voice-typing-nga).

### Use Bluetooth microphone
Stock declares `enable_use_bluetooth_setting` false, so the row never appears. This patch exposes Gboard's **Voice typing → Use Bluetooth microphone** switch; the switch then decides whether recordings come from the headset.

- Two different things: the patch makes the row visible; the stock row enables routing.
- Gboard applies its own input-device rules (Android version, wired/USB preference, car devices can be excluded). A paired headset alone proves nothing — dictating with the phone's and the headset's microphone near different sounds is the test.

### Rambler toolbar and revert extras (18.8)
Three behaviors available when the extras patch is applied:

- **Overflow menu** on the floating Rambler toolbar, where the secondary toolbar actions live.
- **Keep rewritten text on revert**: when you revert from the full transcript to the cleaned-up text, the rewritten version is kept instead of discarded.
- **Lite edit history**: passes edit history into a Jetson Lite request; it has no effect unless the Lite path is active.

### Hidden flags (18.8)
Three flags Gboard keeps for internal builds, written through Gboard's **own override store**, so they apply to the running keyboard:

- **App-specific word biasing** (`enable_dcontext_biasing`)
- **App-specific suggestion bar** (`enable_dcontext_suggestion_bar`)
- **Square normalised search radius** (`square_normalized_search_radius`)

Opening the screen writes nothing. A switch you toggle is recorded as an explicit On or Off and is re-applied after a restart; the curated flags start on, and explicit Off choices stay off. Every write is read back, and a failure is logged as `Hidden flag switch did not take`.

### AMOLED dark keyboard
This patch has no tile of its own in Gboard's theme picker; it recolours the dark palette that the
dynamic theme uses.

1. When patching in Morphe Manager, make sure **AMOLED dark keyboard** is selected. If it was not,
   re-patch with it enabled and install the update.
2. In patched Gboard, open **Settings → Theme**, choose **Dynamic Color**, and tap **Apply**.
3. Turn on Android's dark theme, then reopen the keyboard in a text field.

**What to look for:** the background behind and between the keys is pure black (`#000000`). Key faces
can still be grey or tinted. For a quick A/B test, switch Android back to light mode and reopen the
keyboard — the same theme returns to its light palette.

AMOLED applies automatically to the dark palette.

## Beta features (18.8)

Gboard 18.8 ships five finished features that Google keeps switched off for a re-signed build. **Beta features (18.8)** turns them on together, behind a single switch: Gboard settings → Patch settings → More settings → **Beta features**. It is on once you apply the patch; turn it off and restart Gboard to get Google's behaviour back. None of them needs an account, a download or a server.

| Feature | Where you see it | How to use it |
| --- | --- | --- |
| Quick-paste chip | Suggestion row above the keyboard | Copy text, open a text field: a second chip next to the clipboard suggestion pastes with one tap |
| Clipboard chip on the floating keyboard | Floating keyboard's suggestion strip | Copy text and switch to the floating keyboard: the clipboard item now appears there too |
| Invisible resizing | Edges of the floating keyboard | Drag just inside the left or right edge to make the float wider or narrower; there is no visible handle |
| Emoji2 rendering | Emoji picker | Nothing to press: emoji are drawn by the platform Emoji2 stack instead of Gboard's older provider |
| Swipe-to-remove confirmation | Suggestion row | Drag a suggestion out of the bar: the confirmation bubble uses the newer layout |

### Quick-paste chip

Copied text normally shows one clipboard chip, and tapping it opens the clipboard panel. With the beta switch on, a plain-text clip additionally shows a **paste** chip: one tap inserts the text at the cursor without opening the panel.

- Only plain text gets the extra chip; images and rich content keep the normal chip.
- It follows the clip on top of the clipboard, like the normal suggestion.
- Requires Gboard's clipboard suggestions (Gboard settings → Clipboard) to be on, exactly like the normal chip.

### Clipboard chip on the floating keyboard

The floating keyboard has its own suggestion strip, and stock Gboard refuses clipboard items there. With the beta switch on, the clipboard chip appears in the floating strip as well, so you can paste while the keyboard floats.

- Requires **Clipboard** suggestions in Gboard settings and the keyboard in floating mode.
- On the docked keyboard nothing changes.

### Invisible resizing of the floating keyboard

The floating keyboard can be resized by dragging an invisible band just inside its left or right edge. There is no grip or handle, so the feature is easy to miss: drag inward or outward from the edge and the keyboard follows.

- Only the floating layout resizes; the split and docked layouts are unchanged.
- The size is remembered while the keyboard floats.

### Emoji2 rendering

This switches Gboard's emoji provider from its own implementation to the platform's Emoji2 stack. There is no visible switch: current emoji render correctly and the picker works as before. It is the least visible of the five and safe to leave on.

### Swipe-to-remove confirmation

When you drag a suggestion or a learned word out of the suggestion bar, Gboard asks for confirmation. The beta switch selects the newer confirmation layout. If you never drag suggestions away, you will not notice it.

### Cursor after a Rambler edit

This one is not behind the beta switch: with **Rambler voice typing** applied, Rambler leaves the cursor **after the text it just changed** instead of at the end of the field. Dictate an edit in the middle of a text and keep typing where you were.

### If something does not appear

- Restart Gboard after changing the switch; Android may keep the old keyboard process alive.
- `adb logcat | grep GboardPatches` shows why a beta feature declined to start. Nothing is logged when it works.
- The five features were verified to apply to the 18.8.0 beta, not yet confirmed on a phone. The two clipboard chips also need Gboard's own clipboard setting on, and the floating-keyboard chips need the keyboard to float.

## Choosing a model

| Model | Download | Best for |
| --- | --- | --- |
| Parakeet Ultra (recommended) | about 630 MB | Moondream's further-trained Parakeet TDT v3. More accurate, especially with background noise. |
| Parakeet TDT 0.6B v3 | about 670 MB | NVIDIA's original model, as published by the sherpa-onnx project. |

Both models understand 25 European languages, including Dutch, English, German, French and Spanish, and pick the language per sentence by themselves. Punctuation and capitals are added automatically. The first download also fetches the speech runtime and speech detection (about 40 MB). Every file is checked against a fixed checksum before it is used. After that, voice typing works offline and your audio never leaves the phone.

## Dictating

Tap the microphone key and speak. Text appears while you talk and is settled when you pause. Dictation stops after five seconds of silence or when you tap the microphone key again. Gboard asks for microphone access the first time, as usual.

## Rambler voice typing

Rambler is Google's own voice typing with Gemini: instead of writing down every word, it turns what you say into finished text and follows spoken corrections. Google only switches it on for some Pixel phones; this patch offers it on other phones too.

After applying the patch, open Gboard settings → Voice typing and choose **Rambler** or **Parakeet**. Parakeet, Gboard's Standard voice typing renamed by the Parakeet patch, is selected until you change it. Without a Parakeet model it uses Google's standard recognizer.

- Rambler needs an internet connection and sends your speech to Google. Google limits how much you can dictate per day.
- Parakeet only handles the Parakeet choice. When Rambler cannot reach Google, Gboard falls back to its own standard Google recognizer, not to Parakeet.
- Whether Google's servers accept Rambler from a phone outside its rollout is decided by Google. On a OnePlus phone with these patches it works, including Dutch and spoken corrections.

### Voice dictionary

With **Rambler personal dictionary** applied, Gboard settings → Voice typing shows **Voice dictionary**, above the choice between Rambler and Parakeet. It holds Gboard's own **Voice correction list**: Rambler receives these words with every dictation and uses them to spell names and unusual words correctly.

- Open **Voice correction list**, then its menu, and choose **Import** to add words: type or paste names, separated by commas or new lines. **Export** shares the list as text.
- Select words to delete them, or use **Clear all corrected words** on the Voice dictionary screen to empty the list. Gboard asks for confirmation first.
- **Contact names** asks Gboard for access to your contacts. With **Rambler contact names** applied, your contacts' names are then added to the list the next time Rambler starts, and new contacts are added later. Names you delete stay deleted. Contacts without a name, e-mail-only entries and phone numbers are skipped.
- Gboard's own personal dictionary under Settings → Dictionary stays for typing only, as Gboard says on that screen.

### Parakeet with the voice correction list

With **Parakeet personal dictionary** applied, Parakeet uses the same Voice dictionary, on the phone. It is on under Gboard settings → Voice typing → Parakeet voice typing → **Use the Voice dictionary**; tap **Download spelling data** there if the model was downloaded before (about 2 MB: NVIDIA's Parakeet tokenizer and lists of the 50,000 most frequent Dutch and English words). Your words never leave the phone.

- While you dictate, Parakeet favours the list's names and words, so "Codenberg" becomes Codeberg and "Koolsingel" becomes Coolsingel.
- When a finished sentence still contains a word that sounds like an entry, Parakeet listens to the same audio again with only that entry in mind. The correction is kept only when that second listen writes the entry too; otherwise the sentence stays as first heard.
- Names that are also very common words, such as Vos, Bakker or Visser, are not boosted: the audio cannot tell the name from the word. Ordinary words are never replaced.
- The list is read when a dictation starts. A changed list reloads the model once at the start of the next dictation. With a list, every decode uses beam search, which took about 15% longer on a desktop test; without a list nothing changes.
- With **Rambler contact names** applied, contact names are also added when a Parakeet dictation starts, so Rambler does not have to be used first.

### Custom instructions

With **Rambler custom instructions** applied, Gboard settings → Voice typing → Rambler shows **Custom instructions**. Tap it, type your rules and tap OK. Rambler then receives that text with every dictation.

- Your text is **added** to Rambler's own instructions; it does not replace them. Google's rules still come first: Gboard wraps your text in Google's own guard text, which limits it to how dictated text is written (spelling, grammar, language conventions, vocabulary, formatting, punctuation, capitals and tone) and to the text you just dictated or edited.
- Write style rules, not tasks. "Write every number in digits." works; "Answer in English" or "Summarise what I say" are ignored by design.
- A rule can depend on a word or a situation, such as "When I say 'new paragraph', start a new paragraph." Rambler applies it only when that condition is met.
- There is one text field: saving new text replaces your previous instructions. Leave it empty to send nothing.
- A quick check: save "Write every number in digits.", pick Rambler and dictate "ik heb drie appels". With the instruction it shows "ik heb 3 appels".

### Cursor-aware editing

Stock Rambler only sees the text **before** the cursor. With **Rambler cursor-aware editing** applied it also sees the text after it, and a selection becomes the focus of a spoken edit.

- **Edit anywhere in the text:** put the cursor anywhere, even at the very start, and say what to change: "change Tuesday to Wednesday", "delete the last sentence", "make the second sentence shorter". Rambler finds the words in the whole field, not only before the cursor.
- **Dictate in the middle:** put the cursor between two sentences and dictate. Rambler sees what comes after, so capitals, punctuation and spacing fit around the inserted text.
- **Edit only a selection:** select a sentence or paragraph and say an edit, such as "make this more formal" or "make this shorter". Only the selected text is sent and changed; the rest of the field stays as it is.
- **Keep editing:** after a spoken edit the changed text stays selected, so you can say the next edit ("shorter", "add an exclamation mark") without selecting it again. Tap elsewhere to deselect.
- Rambler receives more of the field this way: the text after the cursor (up to about 2,000 characters on each side of it), or only your selection when you have one.

### App context

With **Rambler app context** applied, each dictation also tells Rambler which app you are in: the app's name and package, the kind of field (such as e-mail address or search) and the field's hint text (at most 100 characters). Rambler uses it to match the style of the app, and custom instructions can refer to it.

- Rules per app work: for example "Only in WhatsApp: end every message with 👍." or "In Gmail, write complete sentences with a greeting."
- Google learns which app you are typing in. Rambler already receives your speech and the text around the cursor; switch this patch off if you do not want to share the app name as well.

### Stop after silence

Google's Rambler keeps listening until you tap ✓ or ✕, with a five-minute limit per dictation. With **Rambler stop after silence** applied it stops by itself once you have stopped speaking, like Parakeet does, and keeps the text just as if you tapped ✓.

- The default is 3 seconds. Change it under Gboard settings → Voice typing → Rambler → **Stop after silence**: 3, 5, 8 or 10 seconds, or **Off** for Google's behaviour.
- Speech is detected from Gboard's own speech level, measured against the background noise around you. Steady noise does not keep Rambler listening; a sudden loud sound can add a moment.
- Each session is noted in logcat under `MorpheRamblerSilence` (the chosen time, how much speech was detected and why it stopped), never with what you said.

## Before using

- A 64-bit ARM phone is required. Keep about 1.4 GB free while downloading; the installed model takes about 650 MB.
- The model uses roughly 700 MB of memory while you dictate and is unloaded after five idle minutes, so the first sentence after a break takes a moment longer.
- With Change package name on, the patched Gboard is a separate app with its own settings: enable it under Android settings → Keyboard, then pick it. Without that patch it cannot be installed on phones that have Gboard built in. Features that depend on Google's own app signature may not work in the patched copy; Parakeet does not need them.
- The 26 Gboard patches (plus the Beta features patch) were verified to build and apply against this 18.8.0 beta build on both ABIs. Patch application is not the same as a full device test of every feature.
- Checked on an Android 14 emulator: the settings entry, the download, and Dutch, English and mixed Dutch-English dictation into a text field, plus silence and background noise without stray text. Dictation on a phone has not been confirmed yet.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md)
