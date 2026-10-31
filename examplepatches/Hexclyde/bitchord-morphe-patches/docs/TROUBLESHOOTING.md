# Troubleshooting

These steps apply to the current patch release and the original **BitChord 1.8.1** Android APK. For installation, start with the [Morphe guide](MOBILE.md).

## The source shows Unnamed or Metadata N/A

Morphe has saved a source entry but could not load its details or patch bundle.

1. Open the [releases page](https://github.com/Hexclyde/bitchord-morphe-patches/releases) in your phone's browser and check that the newest `.mpp` file can download.
2. If it downloads, remove only the failed source and add it again under **Sources → + → Remote**, using:

   ```text
   https://raw.githubusercontent.com/Hexclyde/bitchord-morphe-patches/main/patches-bundle.json
   ```

3. If that still fails, add the downloaded `.mpp` under **+ → Local**.

## BitChord or the patches do not appear

Expand this source's card. Enable **Pre-release patches**, then **Experimental app versions**, and keep BitChord selected under **Apps**. Check that the source shows the newest version. An **Update Morphe** badge means you need a newer Morphe Manager.

For a Local source, select the `.mpp` file, not the source-code ZIP or an APK.

## Patching or installation fails

- Select the original BitChord **1.8.1** Android APK for your phone's architecture. Use both patches from this source.
- If Morphe reports an API option error, set the patch's API ID to **0** and API hash to **empty**. Enter your actual credentials after installation.
- Check free space and Android's installer error. Updates need the same Morphe signing key as the installed app.
- Open **Bitchord+**, or the name you chose, after installing. Your original BitChord has separate settings.

Save the patch log if Morphe fails. Read it for private information before sharing it.

## API details are rejected

Copy **App api_id** and **App api_hash** from your own application at [my.telegram.org/apps](https://my.telegram.org/apps). Use the numeric ID and its matching 32-character hash. The app title, short name, phone number, bot token and login code do not belong in these fields.

If Telegram's registration form fails, follow its displayed requirements. Use your existing application if one is already registered. Repeated submissions or a different example name do not guarantee acceptance.

## Login does not complete

Check your existing Telegram app for the verification code and follow the step shown in Bitchord+. Include your country code in the phone number. Respect any waiting period Telegram gives you.

You need an existing Telegram account. Account registration and some purchase- or passkey-dependent login flows are not supported. Never give another person your code, password or session files to troubleshoot a login.

## A channel in a folder or in my archive isn't listed

**Music chats → Choose** first asks where to pick from, **All chats**, one of your folders, or **Archived chats**, and lists every chat there.

## A channel or track is missing

1. Check that the same account can access the channel and open the file in the official Telegram app.
2. In Bitchord+, open **Account & integrations → Unofficial Telegram → Music chats → Choose** and select the chat.
3. If it is absent from the picker, add its `@username` or numeric chat ID. Invite links are not supported in that field.
4. Use **Search → Addons** and try a specific title or filename. A query returns up to 200 results.

Recently uploaded files can take time to appear. BitChord can reuse the same search for up to ten minutes; change the query or restart Bitchord+ and try again.

If **Unofficial Telegram** is missing from playback sources, tap **Playback → Telegram source → Repair** on the Telegram page. Check that the source is enabled.

## Copy into main channel shows no progress

Copying from a community channel starts once the saved index has been through it, oldest post first; with **Newest first** on, it starts straight away. The line under **Copy into main channel** says which channels it's waiting for and how far their indexing has got; the **Saved index** line shows the time left. Your main channel is indexed first, and with **Skip duplicates** on, copying waits for it too.

If the line says **Couldn't copy**, Telegram refused the copy and the reason follows. It's tried again three times, ten minutes apart, then skipped. Check that your account can still post in your main channel. BitChord's log has a line for each refused copy.

## "Telegram API rate limited" appears

Telegram has asked your account to pause searches for a while, usually after many searches in a short time. The message says when searching starts again. Until then, the patch sends no searches, because searching during the pause can make it longer. BitChord plays songs from its other sources in the meantime.

With **Saved index** on, searches are answered from it during the pause, once it has been built. Selecting fewer music chats helps, since each search covers every selected chat. You can also turn off **Format legend** under **Track details**, which searches Telegram while you use BitChord's main search.

## A file I trust shows "maybe lossy" or "from ≈… kbps"

**maybe lossy** only means a cut-off that an encoder or an old master's filter could both have left; nothing else changes. **from ≈128 kbps** means a clear encoder cut-off in four stretches of the file, which a genuine CD rip doesn't have. To take every file at its word, turn off **Check lossless files** under **Track details**; what was found is kept, and used again if you turn it back on.

## "AcoustID refused the key" appears

The key under **Track names → AcoustID key** isn't an application key AcoustID knows. Copy the **API key** of an application from [acoustid.org/applications](https://acoustid.org/applications), not your user key, and save it again. Lookups start again with the new key.

## Search crashes, or playback or seeking stops

Confirm you are using the newest source version, original BitChord **1.8.1** and both patches. Try a small file you are allowed to use that plays in the official Telegram app. Check your connection and whether the message still exists.

For background interruptions, check Android's battery and notification settings for Bitchord+. File extensions alone do not guarantee that your device can decode a file.

If the problem continues, [report it](../CONTRIBUTING.md) with the steps and error text. Do not include your API hash, account codes or private channel details.

## Channel View will not open a chat or link

Channel View supports selected, accessible, unprotected channels. It does not open every chat type. Some Telegram links require an installed Telegram client. Ordinary channel videos also open there.

Telegram may return no sponsored messages. If a sponsored card reports a loading or media error, try its retry action. See [Known limitations](KNOWN_LIMITATIONS.md) for unsupported link and media cases.

## Storage is too high

Stop playback before clearing **Storage → Clear Telegram audio cache** on the Telegram page. Check BitChord's song cache and downloads separately. The cache target can be exceeded by active files, and signing out does not erase saved copies.
