# Known limitations

These apply to the current release on BitChord 1.8.1. This version hasn't been widely tested on real phones yet, so behavior may differ between devices.

I've only tested it on an arm64-v8a device. The armeabi-v7a and x86_64 builds pass the same automated checks but haven't been tried on real hardware. If you run one of them, please [report what you find](../CONTRIBUTING.md).

## Search and playback

- Regular BitChord search may still play from YouTube. Use **Search → Addons** to get Telegram results.
- A search returns up to 200 tracks across your selected chats.
- Only one Telegram account is supported. You can't create a new account from the app, and some login methods aren't supported.
- Only the standard 1.8.1 APKs are supported. TV, Wear OS, split APKs and other BitChord versions are not.

- Copying into your main channel oldest post first starts from a community channel only once the saved index has gone through all of it, which takes about an hour for a channel of 200,000 files. **Newest first** starts straight away.
- The fake lossless check reads FLAC and WAV files, alone, in zips that aren't compressed, or as cue albums. ALAC, AIFF, APE and WavPack files aren't checked. Files made from 256 and 320 kbps MP3s usually can't be told from CD-era masters, and are called inconclusive. An old recording that never had much above 16 kHz can show **maybe lossy**.
- Naming by sound needs your own AcoustID key and finds only recordings AcoustID knows. Songs in zips and cue albums aren't looked up.
- Cue sheet tracks are handed to BitChord as uncompressed WAV, so a downloaded track takes more space than the FLAC would. APE and WavPack albums with a cue sheet aren't supported.
- Albums Telegram posted together are listed from the chat's newest 5,000 files.
- Dolby TrueHD Atmos is recognised in .mka files only. Dolby AC-4 files only play on phones with an AC-4 decoder. Dolby Atmos plays with its height sound only on phones and speakers that support it.
- The Telegram page is translated into 14 languages. Error messages that Telegram itself sends stay in English.

## Channel View

- Only selected, accessible channels without content protection can be opened.
- Telegram links and channel videos open in the Telegram app, not inside BitChord.
- Some formatting, custom emoji and link previews in sponsored messages aren't rendered yet.

## Saved files

- Protected, secret and self-destructing media can't be played.
- Audio already in BitChord's cache or downloads stays playable after you sign out or remove a chat. Clear those copies separately.
