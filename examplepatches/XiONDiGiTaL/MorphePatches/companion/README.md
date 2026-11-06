# Tandem Study (companion app)

A small offline Android app that turns a **Tandem data export** into a study workflow: a word list
built from your own messages, conversation statistics, search over your history, and spaced-repetition
review with a daily reminder.

This is not a Morphe patch and it does not touch Tandem. It has **no `INTERNET` permission**, so the
imported data cannot leave the device even by accident. WorkManager's manifest adds `ACCESS_NETWORK_STATE`,
`WAKE_LOCK`, `RECEIVE_BOOT_COMPLETED` and `FOREGROUND_SERVICE` to the merged manifest — verifiable with
`aapt2 dump permissions` — and none of them can send anything without `INTERNET`.

## Why it is a separate app

Tandem's own logic is R8-obfuscated, and the features below need a store, an algorithm and a screen —
none of which a dex patch can add. Tandem already gives you the data through
**Profile → Settings → Download my data**, so the honest implementation reads that archive instead of
reverse-engineering a database. See [`../Tandem/README.md`](../Tandem/README.md) for what the patch
bundle does.

| Requested feature | Where it lives |
| :--- | :--- |
| Conversation-wide vocabulary extraction | `data/Tokenizer.kt` + import in `data/StudyRepository.kt` |
| Conversation statistics and vocabulary frequency | `ui/StatsScreen.kt` |
| Search over your messages | `ui/SearchScreen.kt` |
| Custom review reminders | `work/Reminders.kt`, `work/ReminderWorker.kt` |
| Translation history, in-app bookmarks, pronunciation scoring | **Not here** — see limits below |

## Build

The app is a standalone Gradle build under `companion/`; the root patch build does not include it.

```bash
cd companion
gradle wrapper --gradle-version 8.9   # once, if you have Gradle installed
./gradlew :app:assembleDebug
# -> app/build/outputs/apk/debug/app-debug.apk
```

Or open the `companion/` folder directly in Android Studio, which supplies the wrapper and the SDK.
Requires JDK 17+, Android SDK 35, AGP 8.7.3, Kotlin 2.0.21, minSdk 26.

Regenerate the README screenshots (they are rendered from the real screens, not drawn by hand):

```bash
cd companion
./gradlew :app:testDebugUnitTest --tests "*ScreenshotTest"
# -> screenshots/words.png, stats.png, search.png, review.png
```

## Using it

1. In Tandem: **Profile → Settings → Download my data**, wait for the archive.
2. Open Tandem Study, tap **Import**, pick the downloaded file (a `.zip` or a single `.json`).
3. **Words** for the frequency list, **Stats** for activity and per-conversation numbers, **Search**
   for history, **Review** for the spaced-repetition queue and the daily reminder.

Re-importing the same archive is safe: messages are keyed by conversation + timestamp + text hash, and
duplicates are ignored.

## How the import works

The archive's layout is not documented, so the importer does not assume paths. It unzips the archive,
reads every `.json`/`.jsonl` entry (48 MB per-entry cap) and walks the whole JSON tree, recognising a
message by the fields it carries:

| Field group | Keys checked |
| :--- | :--- |
| Text (one is required) | `text`, `body`, `message`, `content`, `messageText`, `message_text`, `msg` |
| Timestamp (one is required) | `created_at`, `createdAt`, `timestamp`, `sentAt`, `sent_at`, `date`, `time`, `ts`, `created` |
| Conversation | `conversationId`, `conversation_id`, `chatId`, `chat_id`, `threadId`, `thread_id`, `partnerId`, `partner_id`, `withUserId` |
| Sender | `senderId`, `sender_id`, `sender`, `fromUserId`, `from_user_id`, `from`, `userId`, `author` |
| Direction | `is_mine`, `isMine`, `fromMe`, `from_me`, `sentByMe`, `outgoing`, `isOutgoing` |
| Identity | `messageId`, `message_id`, `id` |
| Learning language | `learningLanguage`, `targetLanguage`, `languageCode`, `language` |

Timestamps are accepted as epoch seconds, milliseconds or microseconds, or as ISO-8601 strings.
Anything unrecognised is skipped without failing the import, and the snackbar reports how many files
were read and how many messages were found.

If a first real export shows different key names, add them to the lists in
`data/ExportImporter.kt` — that is the only place the format is described.

## Honest limits

- **Surface forms, not lemmas.** `words` counts `house` and `houses` separately. Lemma grouping needs a
  per-language model; a suffix stripper would invent wrong lemmas, so it is not done.
- **Stopwords cover en, de, es, fr, it, pt.** Any other learning language is tokenised without a
  stopword list, so very common words stay in the list.
- **Direction may be missing.** If the export does not mark which messages are yours, reply times are
  unavailable and the stats screen says so instead of guessing.
- **Search is the imported snapshot**, not Tandem's live history, and it is a `LIKE` scan: fine for
  tens of thousands of messages, not an index.
- **No translation history, no in-app bookmarks.** Translations and bookmarks would need writing back
  into Tandem's own storage and UI, which this app deliberately does not do.
- **No pronunciation scoring.** Recognition accuracy is not pronunciation assessment; a score would be
  invented, so no score is shown.
- **The export format is unverified.** No real Tandem export was available while writing this, so the
  key lists above are the tested surface: adjust them after your first import.

## Layout

```
companion/
├── app/src/main/java/app/xiondigital/tandemstudy/
│   ├── StudyApp.kt                  application entry, repository + notification channel
│   ├── data/
│   │   ├── Db.kt                    SQLite schema (conversations, messages, vocabulary, meta)
│   │   ├── ExportImporter.kt        zip/json walker that recognises messages by field
│   │   ├── Tokenizer.kt             word extraction + stopwords
│   │   ├── StudyRepository.kt       import, queries, stats, spaced repetition
│   │   ├── Models.kt                data classes
│   │   └── ServiceLocator.kt        process-wide repository
│   ├── work/                        WorkManager reminder + notification channel
│   └── ui/                          Compose screens: Words, Stats, Search, Review
├── app/src/test/…/ScreenshotTest.kt renders the four screens to screenshots/ (Robolectric)
├── app/src/main/AndroidManifest.xml no INTERNET permission; POST_NOTIFICATIONS plus WorkManager entries
└── screenshots/                     PNGs used by the two READMEs, generated by that test
```
