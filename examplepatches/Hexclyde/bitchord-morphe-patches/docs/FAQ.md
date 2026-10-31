# Frequently asked questions

## Do I need a server?

No. Your phone connects directly to Telegram. The audio stays in your Telegram chats and downloads to the phone as it plays. You need internet access and space for cached files.

## Why do I need API credentials and a login?

The API ID and hash identify your Telegram application. Your account login gives that application access to your account. Both are needed. A bot token cannot replace them. Follow the [setup guide](SETUP.md).

## Can I use a private channel?

Yes, if your signed-in account can access it. Join it in the official Telegram app first. Every listener needs their own permitted access. Protected or self-destructing content is excluded from this player.

## Can I delete the original file from my phone?

Yes, after its upload to Telegram has completed. The channel message and file must remain available, and your account must still have access. Playing it will download and cache bytes on your phone again.

## Does it scan my whole channel first?

You don't have to wait for anything. Search runs against your selected chats when you enter a query, and returns up to 200 tracks, so search by a specific title, artist or filename.

With **Saved index** on (under **Music library**), the patch also lists your selected chats' music in the background, slowly, so it never looks like a burst of searches. Once it's built, lookups are answered from it, and Telegram is only searched when it has nothing. It also answers when Telegram's search is rate limited or busy. Turning it off deletes it.

The **Saved index** line counts the files as they come in, against Telegram's own count for the chat. It speeds up while Telegram answers without asking for a pause, up to about 8,000 files a minute, and slows down when Telegram asks. A channel of 200,000 files takes about an hour the first time, and uses about 150 MB of storage. **Index only on Wi-Fi** and **Index only while charging** hold it back until then; search and playback aren't affected.

If someone in the same chat has shared its index, the patch can use theirs instead of reading the chat itself; see below.

## Why does regular search still play from YouTube?

Regular BitChord search can choose another provider. Open **Search → Addons** and select a Telegram result. Automatic replacement of regular search results with Telegram files is not reliable yet.

## Does it change the audio quality?

The patch reads the uploaded file without transcoding it. It does not turn a lossy recording into lossless audio or add bitrate controls. Increasing the cache only changes storage use.

With **Report audio quality** on, the patch tells BitChord what each file is: FLAC, WAV, AIFF and ALAC count as lossless, and other files as high or low quality from their bitrate. BitChord uses that to choose between your file and its other sources, so a 128 kbps MP3 can lose to a better copy elsewhere. Turn it off to let BitChord judge from the file type alone. A FLAC file found to be made from an MP3 is reported as that MP3; see the next question.

## How does it tell a fake FLAC?

A lossy encoder throws away the top of the spectrum: a 128 kbps MP3 keeps nothing above about 16 kHz, a 192 kbps one nothing above about 19 kHz. Turning the MP3 into FLAC doesn't bring that back, so the cut-off stays, as a sudden drop of 15 dB or more within a few hundred hertz, well below the top of the band. With **Check lossless files** on (under **Track details**, on by default), a FLAC or WAV file that plays is checked a minute later: four stretches of eight seconds are decoded, their spectrum averaged and the edge looked for. How often the music reaches right up to the edge tells an encoder, which cuts some moments lower than others, from a recording that simply never had much up there.

- **FLAC 16bit · from ≈128 kbps:** a clear lossy cut-off. The file is reported to BitChord as that MP3 would be, loses to a genuine copy under **Hide duplicate songs**, and isn't copied by **Lossless only**.
- **· maybe lossy:** a cut-off that could be an encoder's, or an old master's filter. Nothing else changes.
- **FLAC 24bit · from 44.1 kHz:** a hi-res file whose music stops at a CD's limit, made from a CD-quality master. It's reported as CD quality.
- **FLAC 24bit · really 16bit:** a 24-bit file whose last 8 bits are always zero. This is also read from the first bytes of each file, with no extra download.
- A file whose tags name a lossy encoder, such as LAME, shows **maybe lossy** too.

The method follows [Spectra](https://github.com/aravindrejidev/Spectra). It can show a file looks lossy; it can't prove a file is genuine. 256 and 320 kbps MP3s cut at 19.5 to 20 kHz, where CD-era masters also stop, so they're called inconclusive rather than fake.

**Check in the background** (off by default) also goes through every lossless file in your music chats, and in the community channels you copy from, newest first. About 4 MB of each file is downloaded, up to 1 GB a day, keeping to the **Index only on Wi-Fi** and **Index only while charging** switches under **Saved index**. What's found is kept in the saved index, survives its monthly rebuild and goes with it when you share it, so a friend's index can carry the checks they've done.

## What does the bitrate display mean?

Enable **Settings → Advanced options → Show stats for nerds**. The overlay shows the playing source and available bitrate. `≈… avg` is an approximate file average; `≈… estimated` is an estimate from the selected quality. `PCM` describes decoded audio data. Missing information shows **Bitrate unavailable**. These values do not measure download speed or Bluetooth bitrate.

## Why is the app using more storage than the Telegram cache setting?

The Telegram setting is a target, and active files can exceed it. BitChord's own song cache and downloads use additional space. Clear each separately. Signing out does not delete existing BitChord copies.

## A file has the wrong name. Do I need to upload it again?

No. Open **Settings → Account & integrations → Unofficial Telegram → Track names**, search for the file under **Fix a track name**, and correct its title or artist. The correction stays on your phone; the file on Telegram isn't changed. BitChord then finds and matches the file under the new name, so a regular search can play it instead of YouTube. BitChord may keep an earlier search result for a few minutes.

With **Suggest fixes** on, the page also lists files that look misnamed. A suggestion appears when a song plays from another source and one of your chats has a file by the same artist, about as long, whose title is a few letters off ("Ine More Light" for "One More Light"). Nothing is renamed until you tap **Use name**.

Saving a name also removes BitChord's saved copy of that song, if it played from YouTube recently. BitChord plays a song it has already saved without checking your other sources, so this is what lets the next play pick your Telegram file. Songs you started from an album or playlist page may not carry a length, and BitChord then won't switch sources mid-song; start the song from search if it still plays from YouTube.

You can turn off **Use corrected names** to see every file as uploaded, without losing your corrections, and **Suggest fixes** to stop the background searches.

## My files have no title tags. Will they still match?

Usually. With **Names from file names** on (under **Track details**), a file without a title tag gets its name from the file name: `03 - Linkin Park - Numb (Official Audio).flac` becomes "Numb" by Linkin Park. Track numbers and tags like "(Official Audio)", "[HQ]" or "[320kbps]" are removed; "(Live)" and "(Remix)" are kept because they're a different recording. If a name still comes out wrong, fix it under **Track names**, or let the patch name the file by sound.

## Can it name files that have no tags and a useless file name?

Yes, with **Name untagged files by sound** under **Track names** (off by default). It looks each untagged file up in [AcoustID](https://acoustid.org), the free database of recordings run by the MusicBrainz community, the same way Picard and beets do. You need your own AcoustID key, which is free:

1. Open [acoustid.org/new-application](https://acoustid.org/new-application) and sign in.
2. Register an application with any name and version, and copy its **API key**.
3. On the Telegram page, tap **Track names → AcoustID key → Enter**, paste the key and tap **Save**.
4. Turn on **Name untagged files by sound**.

A song that plays is looked up a minute later. Your other untagged files are gone through in the background, up to 500 a day, keeping to the saved index's Wi-Fi and charging switches. For each file, the first two minutes are decoded on the phone into a Chromaprint fingerprint, and only that, the file's length and your key are sent; no audio leaves the phone. When AcoustID knows the recording, the file gets its title and artist, and search and BitChord's matching find it under them. A file it doesn't know is asked about again after a month. Songs in zips and cue albums are named from the zip or the cue sheet instead. The key stays on your phone when you sign out, and is never put in backups or index files.

## Can it play 5.1 or 7.1 files as stereo?

Yes. Turn on **Play surround as stereo** (under **Playback**; it's off by default). With it on, surround files are mixed down to stereo inside BitChord's player: the centre and surround channels are mixed in 3 dB lower and the bass (LFE) channel is left out, the same mix as `ffmpeg -ac 2`. The file isn't converted or changed, so nothing extra is stored and there's no wait. It applies to every song BitChord plays and takes effect from the next song. With it off, Android does its own mix.

## What is the "FLAC 24bit" next to a title?

The format legend, under **Track details**. It shows the format of the copy you'd hear: FLAC 16bit or 24bit, ALAC, WAV, or a lossy format with its bitrate, like MP3 320kbps or OPUS 160kbps.

- **Addons tab:** Telegram files are labelled from the file itself. The patch reads the start of a few lossless files in each search (and of any file you play) to find the bit depth, and remembers it.
- **Main search:** when you search, the patch searches your selected Telegram chats for the same words, once per search, and matches results by title, artist and length. Songs you have on Telegram get their legend as soon as that match comes in.
- **Everywhere else:** songs show the format of the stream BitChord used the last time they played.

Turning the legend off also stops the extra search.

## A better copy started playing halfway through a song. Will I hear a gap?

Not with **Smooth quality switch** on (under **Playback**). BitChord sometimes starts a song from YouTube and finds a better copy, such as your Telegram FLAC, a few seconds later. The patch has BitChord load that copy on its standby player while the current one keeps playing, then crossfades between them at the same point. If the standby player isn't free, for example during an Automix transition, the switch happens BitChord's usual way, with a short pause. The crossfade mixes decoded audio, so that half second isn't bit-perfect.

Two uploads of a song rarely start at exactly the same instant: one may have a few hundred milliseconds more silence at the start. So before switching, the patch compares the last seven seconds you heard with the same part of the Telegram file and finds how far apart they are: first by their loudness, to a few milliseconds, then by their waveforms below 3 kHz, where a lossy and a lossless copy still agree, to a fraction of a millisecond. The Telegram copy starts that much earlier or later. This takes a second or two, during which the stream keeps playing. When the two don't clearly match, the switch happens without a shift.

Starting the Telegram copy at that point still takes a moment, so it begins a little behind. While it's still silent, the patch compares what the two players are playing at that moment, and the Telegram copy leaves out exactly the audio it's behind by, to the sample, before the crossfade starts. Its player is told its position with that audio counted, so lyrics and the progress bar stay on the song. If it's more than 150 ms off, or ahead, it's moved again first. This adds up to about a second, at most 2.6 seconds, before the crossfade. If the two still can't be lined up, the crossfade goes ahead as it is.

## Why don't I see album covers?

Telegram only has a cover for files that were uploaded with one, or that it recognises. Covers are downloaded the first time a file shows up in a search, and BitChord keeps search results for a few minutes, so a new cover can take a later search to appear. Turn **Album covers** off under **Track details** to stop downloading them.

## What does tapping Unofficial Telegram under Sources do?

It opens the patch's own settings page, the same one as **Settings → Account & integrations → Unofficial Telegram**. BitChord's add-on editor isn't used for it, because there's nothing to edit there.

## What is telegram.bitchord.invalid?

It's the address BitChord uses to talk to the patch, and you'll see it in BitChord's log as `https://telegram.bitchord.invalid/***`. It never leaves your phone: the patch answers it inside the app, and there's no website or server behind it. Domains ending in `.invalid` are reserved and can't exist on the internet, so even if a request did get out, it couldn't reach anyone.

## What does "Check matches by sound" do?

BitChord only plays your Telegram file instead of a song when the file's length is within a few seconds of the song's. A file with the right title but a length further off is usually another recording, but sometimes it's the same one with a longer fade, a hidden track or extra silence.

With **Check matches by sound** on (under **Playback**, off by default), the patch notes those files. The next time the song plays from its start, it listens to its first 15 seconds as BitChord plays them, reads the first 45 seconds of the Telegram file, and compares the two with audio fingerprints, the method Shazam uses. If they're the same recording, starting at the same point, a message says so and the file is used the next time the song plays.

It compares recordings, not quality: a match means the same recording, not that the file is better. Each check downloads up to about 15 MB of the Telegram file. The song's audio is only used on your phone for the comparison and isn't kept or sent anywhere.

## Can I play or download a whole channel?

Yes. Under **Music library → Playlists and downloads**, pick a chat and choose:

- **Save as playlist** makes a playlist named after the chat in BitChord's **Library**, oldest post first. Save it again later to bring it up to date; the old copy is replaced.
- **Download all** puts the files in BitChord's downloads. They're saved at BitChord's download quality, so set **Download quality** to **Lossless** to keep FLAC files as FLAC.

**Albums** in the same menu lists the chat's albums: songs Telegram posted together as one album, zips, and albums with a cue sheet. Each album can be saved as a playlist named after it, or downloaded.

Both take the chat's newest 1,000 music files. The menu shows how many songs that is, and the download's size, before you confirm.

Both use the saved index, so **Saved index** has to be on and done with that chat. Making the playlist sends nothing to Telegram. Each download fetches its file from Telegram, the same as playing it.

## Can it play albums shared as zip files?

Yes, with **Saved index** on. When the index comes across a zip, it reads only the end of the zip, where the list of files is, and the first few KB of each song. Every audio file inside (FLAC, WAV, AIFF, ALAC, MP3 and the rest) becomes a song of its own: named from its file name, with its artist from the file name or the album's folder or zip name, and its length and format from its header. You can search for it by title, artist or album, play it, add it to playlists and download it, and BitChord can match it like any other Telegram file.

Playing a song reads just that song's part of the zip. Most music zips are stored without compression, so these play and seek like any other file. A song that was compressed inside the zip plays too, but seeking far into it takes a moment, because it's decompressed from its start. Zips split into parts (`.z01`, `.zip.001`) and password-protected zips aren't supported. The **Saved index** line shows how many zips are still waiting to be opened.

With **Copy into main channel** on, a zip is copied to your main channel once, like any other post. Telegram copies whole posts, so a zip is copied when any song in it is new, even if some of its songs are already in your main channel.

## Can it play albums kept as one FLAC file with a cue sheet?

Yes, with **Saved index** on. Each track of the album becomes a song of its own, named from the cue sheet, and plays only its part of the file, starting and ending exactly where the sheet says. The sheet can be a `.cue` file posted in the same chat, a `.cue` file in the same zip, or the FLAC file's own. WAV albums work the same way.

A track is decoded on the phone as it plays and handed to BitChord as uncompressed audio, so it stays lossless. Only the parts of the album file around what's playing are downloaded. Seeking reads a few small pieces of the file to find the spot.

## Why does a song show only once when I have several copies?

**Hide duplicate songs** (under **Track details**, on by default) shows each song once in search results: copies with the same title and artist and lengths within two seconds, such as a song posted twice or found in two zips. The best copy is the one shown and played: lossless over lossy, then the higher bit depth, sample rate and bitrate. Turn it off to see every copy.

## Can I collect music from other channels into my own?

Yes, under **Main channel** on the **Advanced** tab. Choose a private channel you created as your main channel, add the community channels to copy from, and turn on **Copy into main channel**. Every option is off until you turn it on, and each one explains itself first.

- Files are copied, not forwarded, so they show as your own posts without "Forwarded from". Telegram doesn't upload them again, and a copy stays in your channel even if the community channel deletes the original.
- **Newest first** starts with each channel's newest post while the channel is still being indexed, instead of waiting for all of it and starting with the oldest. Your main channel then lists the music in the opposite order.
- **Keep in sync** also copies new posts as the saved index finds them. Without it, the copy stops at what the channels had when it started.
- **Lossless only** copies FLAC, ALAC, WAV and AIFF files and skips the rest.
- **Skip duplicates** doesn't copy a file your main channel already has: the same Telegram file, or the same title, artist, length and format. Nothing is ever deleted. A zip is copied whole when any song in it is new.
- The status line counts the audio files copied, counting each song in a zip: "Copied 2,140 audio files in 1,310 posts".
- The pace is 1 to 500 files an hour, and copying pauses whenever Telegram asks it to.

The files come from the saved index, so **Saved index** has to be on; your main channel is indexed as soon as you choose it, and the community channels while copying is on. Copying from a community channel starts once that channel has been indexed all the way back to its first post, since copies go oldest post first, unless **Newest first** is on. Your main channel is indexed before anything else, and the other chats take turns a page at a time, so a channel with 200,000 files doesn't hold up a small one. Until then the status line says which channels it's waiting for and how far their indexing has got. A copy Telegram refuses is tried again three times, ten minutes apart, before it's skipped, and the status line says why.

Only private channels you created can be the main channel. Telegram tells each account what it is in a channel, and only the person who created it (or was handed ownership) is "creator"; admins aren't. A channel with a public @username isn't private. Community channels can be channels, groups or bots; chats with a person and your own private channels aren't offered, and chats with protected content can't be copied from.

**This carries a risk to your account.** Telegram watches for accounts that copy many messages, and can limit or ban one that does it too fast. A slower pace is safer. You're also responsible for what you copy: only copy music you're allowed to keep.

## Does it play Dolby Atmos?

Yes. Dolby Digital (.ac3), Dolby Digital Plus (.ec3, .eac3), and Dolby files in .m4a, .mp4 and .mka are treated like any other music file. Telegram only knows a file's name and type, which can't tell Dolby Atmos from plain Dolby Digital Plus, so the patch reads the first 64 KB of a few files per search, as it does to tell 16-bit FLAC from 24-bit. Dolby Atmos is marked in the file's first frame (and in the track's description in an .m4a); the format legend then shows **Dolby Atmos**, and BitChord gets the file as Atmos and shows its own badge.

BitChord has its own decoder for Dolby Digital, Dolby Digital Plus and Dolby TrueHD, so they play on any phone. Dolby Atmos plays as its 5.1 or 7.1 mix, or with its height sound on a phone or speaker that supports Dolby Atmos. With **Play surround as stereo** on, it's mixed to stereo like any surround file. Dolby AC-4 needs a decoder in the phone itself, and **Hide Dolby files this phone can't play** keeps those files out of search on phones without one. Dolby TrueHD in an .mka with Atmos shows as **TrueHD Atmos**.

## Where are Main channel, Track details and Storage?

On the **Advanced** tab of the Telegram page. **Basic** has what most people need: your API details, your account, your music chats, the saved index and track names.

## Can I back up my settings or move them to another phone?

Yes. On the **Advanced** tab, **Backup and sharing → Back up** saves a file wherever you choose: your settings, your music chats, your corrected names, your main channel setup, and the saved index too if you leave **Include the saved index** ticked. **Restore** reads it back. A backup never holds your API details or your Telegram session, so on a new phone you enter the API details and sign in first, then restore.

Signing out removes your music chats, the saved index, corrected names and main channel setup from the phone, so **Session → Sign out** offers **Back up and sign out** first. You're signed out only once the backup is saved. When you sign in again on the same phone, the **Basic** tab shows **Welcome back → Restore what you had before signing out**, and one tap brings everything back, with the index and its checks, without reading your chats from Telegram again. **Start fresh** stops offering it; the file stays where you saved it, and **Restore** can still read it later.

## Can my friends use my index of a channel we're both in?

Yes. **Backup and sharing → Share a chat's index** makes a file of one chat's saved index and posts it in your Saved Messages, your main channel, or the chat itself if you can post there, or saves it as a file. With **Use shared indexes** on (the default), the patch looks for an index file of a chat before reading the chat from Telegram: in the chat itself, where only a channel's admins can post, in your Saved Messages, and in your main channel. If there's one, the chat's index comes from it in a minute instead of an hour, and only what's been posted since is read from Telegram. A file you've been sent elsewhere can be added with **Restore**.

An index file lists the music in a chat, so anyone who can see it sees that list. It doesn't hold anyone's account details or Telegram's own file numbers; each song is checked against its post when it plays, and a file that doesn't match isn't played.

## Can the Telegram page be in my language?

Yes. It follows your phone's language, in Spanish, Portuguese, French, German, Russian, Turkish, Arabic, Urdu, Hindi, Bengali, Chinese (Simplified), Japanese, Korean and Indonesian, and in English otherwise. Arabic and Urdu are laid out right to left. Names of BitChord's own screens, such as **Addons**, stay as BitChord shows them. To fix a translation, edit that language's file in `translations/`.

## Can I rename the installed app?

Yes. In Morphe, open **Install as Bitchord+ → Installation name** before patching. Leave it blank for **Bitchord+**. Changing the name does not create another separate installation or change your registered Telegram API app title.

## Why are screenshots blocked on the Telegram page?

That page handles API credentials and login details, so it requests Android's screenshot and recording protection. You can describe a problem in text when asking for help. Never share your hash, login codes or passwords.

## Why do sponsored messages appear in Channel View?

They are official messages returned by Telegram. Their menu can show sponsor details and reporting choices. Telegram may return none, and there is no local switch to suppress them. They are shown in Channel View, not in the audio player. Some Telegram links open in an installed Telegram client.

## Can I use more than one Telegram account?

Only one signed-in account is supported. Sign out before switching accounts. To revoke a session, use the official Telegram app's **Settings → Devices** page.

## Does this unlock premium features or include music?

No. It adds a Telegram audio source and nothing else. You are responsible for the files you upload, share and play.

## Is this an official Telegram or BitChord release?

No. It is an independent, experimental project. See [Known limitations](KNOWN_LIMITATIONS.md).
