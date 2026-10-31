# Connect Telegram and start listening

Install the patch first using the [Morphe guide](MOBILE.md). These steps use the default app name, **Bitchord+**; open your chosen name if you changed it during patching.

You need an existing Telegram account and audio you have permission to access. No server or bot is required.

## 1. Get your Telegram API details

1. Open [my.telegram.org](https://my.telegram.org) in your browser and sign in with your Telegram account. Check your existing Telegram app for the login code.
2. Open **API development tools**, or go directly to [my.telegram.org/apps](https://my.telegram.org/apps).
3. If you already have an application, open it. Otherwise, create one with an accurate description of how you will use it.

   | Field | Example |
   | --- | --- |
   | App title | `My Client` |
   | Short name | `myclient`, if accepted and available |
   | Platform | `Android` |
   | Description | A personal Telegram client for my own account. |
   | URL | Your project URL, if requested; leave blank only if the form allows it. |

4. Find **App api_id** and **App api_hash**. Keep the page open while you enter them in Bitchord+.

The API ID is a number. The API hash is a 32-character value. They identify your Telegram application; signing in to your account is a separate step. A bot token, phone number or verification code will not work in these fields.

Use your own details and keep the hash private. Telegram controls application registration and may show your registered app title in sign-in alerts. See Telegram's [API registration instructions](https://core.telegram.org/api/obtaining_api_id) if the form fails.

## 2. Enter the API details in Bitchord+

1. Open **Settings → Account & integrations → Unofficial Telegram**.
2. Enter your **App API ID** and **App API hash (secret)**.
3. Tap **Save and continue**.

To change these later, use **Application → Change** on the same page. Stop playback before changing them.

Screenshots and screen recording are blocked on this page because it contains account details. This is expected.

## 3. Sign in to your Telegram account

1. Enter your phone number with its country code and tap **Continue**.
2. Enter the verification code delivered by Telegram. Check your existing Telegram app and follow the instructions shown.
3. Enter your two-step verification password if asked. Telegram may also request email verification or confirmation on another device.
4. Wait until the page shows **Connected to Telegram**.

Do not share verification codes, passwords or session files. If Telegram asks you to wait before requesting another code, wait for that period. Account creation and some login flows are not supported yet; see [Troubleshooting](TROUBLESHOOTING.md).

Once you're signed in, the Telegram page has two tabs. **Basic** has your API details, your account, your music chats, the saved index and track names. **Advanced** has the main channel, track details, playback, storage, and backup and sharing.

## 4. Choose your music channels

Check in the official Telegram app that your account can open the channel and play its audio. Join private channels there first through their normal invitation process.

1. In Bitchord+'s Telegram page, open **Music library → Music chats → Choose**.
2. Pick where to choose from: **All chats**, one of your Telegram folders, or **Archived chats**.
3. Select the chats containing your audio, then tap **Save**. You can select more than one, and from more than one folder.
4. If a channel is missing, enter its `@username` or numeric chat ID in **@channel or numeric chat ID**, then tap **Add chat**. Invite links do not work in this field.

The picker lists every chat in your chat list and your archive, up to 2,000 in each.

Each listener needs their own account, API details and access to the channel. Selecting a channel in your app does not grant access to anyone else.

## 5. Search and play

1. Go back to BitChord.
2. Open **Search → Addons**.
3. Search for a song title, artist or filename from your selected chats.
4. Open a Telegram result and press **Play**.

You don't need to wait for an index. A search returns up to **200 tracks** across your selected chats, so use a specific query for large libraries. Files uploaded as documents may be easier to find by filename.

The playback source **Unofficial Telegram** is added automatically. If it is missing, return to the Telegram page and tap **Playback → Telegram source → Repair**.

Regular BitChord search may still play from another provider. Use **Addons** when you want a Telegram result. To check the playing source, enable **Settings → Advanced options → Show stats for nerds**. A value marked `≈` is an estimate or file average; it is not a download-speed reading.

## Browse channel posts

On the Telegram page, tap **Music library → Channel View → Browse** and select a channel.

Channel View shows recent posts. **Load older posts** extends the visible history, up to 150 retained posts. Ordinary channel videos open in an installed Telegram client through **Open message in Telegram**.

Telegram may return an official **Sponsored** or **Recommended** card alongside the posts. Its **•••** menu provides sponsor information and reporting options when available. External websites ask for confirmation before opening. There is no local switch to hide returned sponsored messages, and no sponsored card is added to the audio player.

Channel View currently opens selected, accessible, unprotected channels. Other selected chats can still be audio sources. See [Known limitations](KNOWN_LIMITATIONS.md) for remaining link and sponsored-message support gaps.

## Manage storage

On the Telegram page's **Advanced** tab, adjust **Storage → Telegram audio cache target**, then tap **Apply cache size**. The range is **64 MiB to 16 GiB**, with a default of **256 MiB**.

This setting controls retained Telegram audio. It does not reserve space or download your entire channel. Active files can temporarily exceed the target. Increasing it does not improve audio quality.

To free space, stop playback and tap **Clear Telegram audio cache**. BitChord also has its own song cache and downloads; clear those separately if needed.

## Sign out or revoke access

Use **Session → Sign out** on the Telegram page's **Basic** tab. Signing out removes your music chats, saved index and other settings from the phone, so it offers **Back up and sign out** first; after you sign in again, **Welcome back** restores everything in one tap. You can also revoke this session in the official Telegram app under **Settings → Devices**.

Signing out does not delete audio already saved in BitChord's cache or downloads. See [Privacy](../PRIVACY.md) for account access and storage details.
