# Changelog

## 1.0.20

- **Fixed a crash when a song starts playing** (1.0.18 and 1.0.19). The patch's audio sink hook called code that Android doesn't let BitChord's player reach, so playback stopped with an error. The release checks now catch this.

## 1.0.19

- **The switch to Telegram is now lined up by the waveform:** after the loudness curves find the offset to a few milliseconds, the two waveforms below 3 kHz are compared within that, which finds it to a fraction of a millisecond, even when the stream and the file have different sample rates.
- **No more small repeat at the crossfade:** the Telegram copy took a moment to start after BitChord moved it to the stream's position, so it began a little behind, often by tens of milliseconds. Before the crossfade, while it's still silent, the patch now compares what the two players are playing at that moment and has the Telegram copy leave out exactly the audio it's behind by. Its player is told its position with that audio counted, so lyrics and the progress bar stay on the song. When it's more than 150 ms off, or ahead, it's moved again first. BitChord's wait before the crossfade can now take up to 2.6 seconds for this; the stream keeps playing meanwhile.
- Fixed the offset being measured as if at 1x when a playback speed is set.

## 1.0.18

- **No more repeat when a song switches to Telegram:** BitChord starts the new copy at the same position as the YouTube stream, but two uploads rarely start at the same instant, so the switch repeated or skipped a little. The patch now compares the last seven seconds heard with the same part of the Telegram file, finds the offset to within a few milliseconds, and starts the Telegram copy that much earlier or later.
- **Fixed hi-res files showing "5 kbps":** BitChord reads a bitrate above 3,000 as bits a second, so a 24-bit 192 kHz FLAC's 5,000 kbps showed as 5 kbps. The bitrate is now sent in bits a second.

## 1.0.17

- **Back up and sign out:** **Session → Sign out** now offers to back up first. The backup holds your music chats, settings, corrected names, main channel setup and the saved index, with its fake lossless checks and names found by sound. You're signed out only once it's saved. After you sign in again, a **Welcome back** card restores it all in one tap, without indexing your chats again. **Start fresh** forgets it instead, and the file stays where you saved it.
- Your AcoustID key stays on the phone when you sign out. It's still never in backups.

## 1.0.16

- **Fake lossless check:** with **Check lossless files** on (under **Track details**, on by default), a FLAC or WAV file that plays is checked a minute later. A file made from an MP3 or AAC keeps that encoder's cut-off, and the check finds it in a few stretches of the file, much of which playing has already downloaded. What it finds:
  - made from a lossy file: the legend shows **FLAC 16bit · from ≈128 kbps**, and the file is ranked as that MP3 by BitChord, by **Hide duplicate songs** and by **Lossless only** copying;
  - a hint of a lossy source that isn't conclusive: **· maybe lossy**, with nothing else changed;
  - hi-res made from a CD-quality master: **FLAC 24bit · from 44.1 kHz**, ranked as CD quality;
  - a 24-bit file holding 16 bits: **FLAC 24bit · really 16bit**;
  - a lossy encoder named in the file's tags, such as LAME.
- **Check in the background** (off by default) goes through every lossless file in your music chats too, up to 1 GB a day, keeping to the saved index's Wi-Fi and charging switches. What's found is kept in the saved index, survives its monthly rebuild, and goes with it when you share it.
- **Name untagged files by sound** (under **Track names**, off by default): files without tags are looked up in AcoustID, the free database run by the MusicBrainz community, with your own free AcoustID key. A fingerprint of the file's first two minutes is sent, not the audio. A file that's found gets its real title and artist, so search and BitChord's matching find it by them.

## 1.0.15

- **Community channels** lists only channels, groups and bots. Chats with a person no longer show up there. If you picked one before, open **Community channels** and press **Save** to drop it.

## 1.0.14

- **Basic and Advanced tabs** on the Telegram page. **Basic** has your API details, your account, your music chats, the saved index and track names; **Advanced** has the main channel, track details, playback, storage, and backup and sharing.
- **Chats in folders and the archive:** **Music chats → Choose** first asks where to pick from, **All chats**, one of your Telegram folders, or **Archived chats**, and lists every chat there, not just the first 100. The main channel and community channel pickers include archived chats too.
- **Albums with a cue sheet:** an album kept as one FLAC or WAV file becomes one song per track, named from its cue sheet: a `.cue` file posted in the same chat, a `.cue` in the same zip, or the FLAC file's own. Each track plays exactly its part of the file, decoded on the phone and handed to BitChord losslessly.
- **Albums** in **Playlists and downloads**: a chat's albums (songs Telegram posted together, zips and cue sheet albums), each to save as a playlist or download.
- **Backup and restore:** settings, music chats, corrected names and the main channel setup, and the saved index if you like, to a file you choose. API details and the Telegram session are never in it.
- **Sharing an index:** post a chat's saved index in Telegram (Saved Messages, your main channel, or the chat itself if you can post there) or save it as a file. With **Use shared indexes** on, a chat with an index file there is indexed from it in a minute, then topped up from Telegram. Each song from a shared index is checked against its post when it plays.
- **Newest first** under **Main channel**: copying starts with each community channel's newest post while it's still being indexed.
- **Index only on Wi-Fi** and **Index only while charging** under **Saved index**.
- The saved index goes faster while Telegram answers without asking for a pause, up to about 8,000 files a minute, and slows down when it asks.
- **TrueHD Atmos** is recognised in .mka files.
- Chats indexed by an earlier version are indexed again once, in the background, to find cue sheets and albums; their current index keeps answering meanwhile.

## 1.0.13

- **Dolby audio:** Dolby Digital (.ac3), Dolby Digital Plus (.ec3, .eac3) and Dolby files in .m4a, .mp4 and .mka are found and played like any other music file. The patch reads the start of each file to tell what's inside:
  - the format legend shows **Dolby Atmos**, **DD+ 5.1**, **DD 2.0**, **TrueHD 7.1** or **AC-4**;
  - a Dolby Atmos file is passed to BitChord as Atmos, so it gets BitChord's own Dolby Atmos badge and ranking;
  - Dolby Digital Plus in an .m4a is no longer mistaken for ALAC from its bitrate, and Dolby TrueHD counts as lossless;
  - ALAC in an .m4a now shows its real bit depth, such as ALAC 24bit.
- BitChord's own decoder plays Dolby Digital, Dolby Digital Plus and Dolby TrueHD on any phone; Dolby Atmos plays as 5.1 or 7.1, or with its height sound where the phone or speaker supports it. **Hide Dolby files this phone can't play** (under **Track details**, on by default) hides Dolby AC-4 files on phones without an AC-4 decoder.
- **The Telegram page in 14 languages:** Spanish, Portuguese, French, German, Russian, Turkish, Arabic, Urdu, Hindi, Bengali, Chinese (Simplified), Japanese, Korean and Indonesian. It follows the phone's language, and Arabic and Urdu read right to left. Anything not translated shows in English.
- **Fixed Copy into main channel waiting for hours with nothing to show.** The saved index went through one chat at a time, so the community channels and the main channel waited behind any large music chat, and copying waits for a channel to be indexed. Now the main channel is indexed first and the other chats take turns a page at a time. Copying starts from each community channel as soon as it's indexed, and the status line says which channels it's still waiting for and how far they've got.
- A copy Telegram refuses is tried again three times, ten minutes apart, with the reason on the status line, instead of being skipped straight away. Refused copies are counted, and a song is only counted as in your main channel once it's really been copied.
- **Community channels** no longer lists private channels you own.
- Your main channel is indexed as soon as you choose it, not only while copying is on.

## 1.0.12

- **Hide duplicate songs** (under **Track details**, on by default): search results show each song once, as its best copy. Copies with the same title and artist and lengths within two seconds count as the same song; lossless beats lossy, then the higher bit depth, sample rate and bitrate win.
- **Copy into main channel** counts audio files: "Copied 2,140 audio files in 1,310 posts", counting each song in a zip.
- A zip is copied when any of its songs is new, and its songs are judged together even in a large zip. Songs that go over inside a copied zip no longer count as skipped duplicates.

## 1.0.11

- **Albums shared as zip files.** With **Saved index** on, every audio file inside a zip post becomes a song of its own: searchable by title, artist or album, playable, and usable in playlists, downloads and BitChord's matching. Only the end of the zip and the first few KB of each song are downloaded to find them; the length, bit depth and sample rate come from each song's header. Songs stored without compression, which is most of them, play and seek like any other file. Split and password-protected zips are skipped. The **Saved index** line counts the zips still to open.
- With **Copy into main channel** on, zip posts are copied too, once each, and **Skip duplicates** knows a zip your main channel already has.
- The saved index's database gains a column for songs inside zips; the files already indexed are kept.

## 1.0.10

- **Main channel:** copy music from community channels into a private channel you own. Choose the main channel (only private channels you created) and the community channels under **Main channel**, then turn on **Copy into main channel**. Files are copied without "Forwarded from", oldest post first, and stay in your channel even if the original is deleted. **Keep in sync**, **Lossless only** and **Skip duplicates** can be turned on separately, and the pace is 1 to 500 files an hour. Everything is off by default, and each option shows a warning before it turns on: copying many messages can get a Telegram account limited.
- The **Saved index** line shows how far it's got, from Telegram's own count of each chat's music and files, with the time left: "Indexing: 12,920 files found · 6% · about 1 h 40 min left". The second pass through a chat's files, which finds FLACs posted as files, reads as many messages as the first but finds less music, so the count of files grows slowly there while the percentage keeps moving. BitChord's log gets a progress line every 25 pages.
- Each setting's explanation now sits under that setting, instead of in paragraphs after the last one.
- The **Open BitChord** button is gone; Back does the same.

## 1.0.9

- **Check matches by sound** (under **Playback**, off by default, with a warning when you turn it on). A Telegram file with the song's title but a length more than a few seconds off is usually another recording, but sometimes it's the same one with a longer fade or extra silence. With this on, the patch listens to the song's first 15 seconds as it plays, reads the start of the Telegram file and compares their audio fingerprints, the way Shazam does. When they're the same recording, starting at the same point, a message says so and the file plays from Telegram the next time the song does. Recordings that start at a different point are refused, so switching copies mid-song never jumps.

## 1.0.8

- **A channel as a playlist:** under **Music library → Playlists and downloads**, pick a chat and **Save as playlist**. It appears in BitChord's Library, named after the chat, oldest post first, and plays from Telegram like a search result. Saving it again replaces it with the chat's current files.
- **Download a whole channel:** **Download all** in the same place queues the files in BitChord's downloads. They're saved at BitChord's download quality, so set it to **Lossless** to keep FLAC files.
- Both take a chat's newest 1,000 music files, and the menu shows the number of songs and the download size first. A channel of 200,000 files would otherwise make a playlist BitChord can't hold, and a download of several terabytes.
- **The saved index handles large channels.** It's kept in a database now, instead of files that had to be read into memory and written out whole, which a channel of 200,000 files outgrew. A search takes a few hundredths of a second at that size. The index from 1.0.6 and 1.0.7 is deleted and built again.
- The **Saved index** line keeps counting while the page is open, against Telegram's own count: "Indexing: 12,300 files so far, of about 223,776". A full rebuild, which drops deleted files, now happens monthly instead of weekly.
- Once the saved index has every selected chat, BitChord's lookups are answered from it without asking Telegram. Telegram is only searched when the index has nothing, which also covers files posted since the last top-up. This keeps a channel download, or a long listening session, from adding up to a lot of searches.

## 1.0.7

- **Fixed songs with a word like "You're" in the title playing from YouTube.** BitChord drops apostrophes before asking add-ons, so it looked for "Nobody Knows You When **Youre** Down and Out". Telegram's search matches whole words and found nothing, though the file was in the channel. When Telegram finds nothing now, the saved index is checked, and it treats "youre" and "You're" as the same word. Without the index, Telegram is searched again without such words (youre, dont, cant, aint, im and others), and the results are checked against the full title here.

## 1.0.6

- **Saved index:** the patch keeps a list of the music files in your selected chats on your phone. It's built slowly in the background, one page of 100 files every few seconds and only while nothing else is searching, so it doesn't add to Telegram's limits. It's topped up with new posts every few hours and rebuilt weekly, which drops deleted files. When Telegram's search is rate limited, busy or times out, BitChord's lookups are answered from it, so songs can still play from Telegram. The format legend and name suggestions search it instead of Telegram once it's built. It's on by default. Turn it off under **Music chats → Saved index**, which also deletes it. BitChord's log notes when a search was answered from the index.

## 1.0.5

- When Telegram limits your searches (a flood wait), a message says **Telegram API rate limited** and when searching starts again, so you know why songs are playing from other sources for a while. It appears once per pause, not once per search. [Troubleshooting](docs/TROUBLESHOOTING.md#telegram-api-rate-limited-appears) explains what to do.

## 1.0.4

- **Fixed songs playing from YouTube when you have them on Telegram.** Since 1.0.2, the format legend and name suggestions run their own Telegram searches in the background. When they were running, BitChord's lookup for the song you were about to play was turned away with "Telegram search is busy", and BitChord fell back to YouTube or its cached copy. The patch only let two searches run at once and refused the rest straight away. Now BitChord's lookups wait up to 10 seconds for a free search, background searches step aside while BitChord is looking something up, and up to three searches can run at once. This was the patch's own limit, not Telegram's. When Telegram asks for a pause (a flood wait), no search is sent until the pause is over, as before.
- BitChord's log (**Player ••• → Copy log**) now shows which files each Telegram search found, which ones were skipped as a different song, and when Telegram asked to pause searches. That makes reports like this easier to look into.

## 1.0.3

- **Fixed a wrong song playing from Telegram.** BitChord accepts a file whose title only *contains* the song's title, so "How I'd Love To Love You" was played for "L-O-V-E". Telegram files now need the same title (brackets and punctuation aside) within 10 seconds of the song's length, or a containing title within 3 seconds. Other sources are matched as before.

## 1.0.2

- **Format legend for every format:** besides FLAC 16bit and 24bit, songs now show MP3 320kbps, AAC 256kbps, OPUS 160kbps and so on. The legend is a small white label on a translucent grey chip.
- **Legends in the main search:** when you search, the patch also searches your selected Telegram chats for the same words, once per search, and matches the results by title, artist and length. Songs you have on Telegram show their format right in the search results, and the legend appears on rows already on screen as soon as the match comes in.
- The project has a website at [hexclyde.github.io/bitchord-morphe-patches](https://hexclyde.github.io/bitchord-morphe-patches/), so it can be found through Google.

## 1.0.1

- The Telegram page's options are switches now, and flipping one no longer jumps the page back to the top. Other actions on the page keep your place too.
- **Play surround as stereo** is off by default. Android's own mixing is the default again; turn it on under **Playback** if you prefer the patch's mix.
- The format legend remembers songs that have played in a lossless format, so it also shows in BitChord's main search, library and queue, not only in the Addons tab. While a song is playing from a lossy stream, it shows nothing.

## 1.0.0

First release in [bitchord-morphe-patches](https://github.com/Hexclyde/bitchord-morphe-patches), which replaces bitchord-telegram-morphe and will hold all my BitChord add-ons. The patches are now **Unofficial Telegram music** and **Install as Bitchord+**, and the playback source is called **Unofficial Telegram**, as Telegram's API terms ask of unofficial apps. Your settings, sign-in and track names carry over when you patch with the same Morphe signing key.

- **Audio quality:** FLAC, WAV, AIFF and ALAC files are reported to BitChord as lossless, and 24-bit files as hi-res. Other files are reported as high or low quality from their bitrate. BitChord uses this to choose between your file and other sources.
- **Album covers:** search results show the cover Telegram has for each file.
- **Names from file names:** files without a title tag, like `03 - Linkin Park - Numb.flac`, show up as "Numb" by Linkin Park, so BitChord can match them. Track numbers and tags like "(Official Audio)" or "[320kbps]" are removed.
- **Format legend:** a small "FLAC 16bit" or "FLAC 24bit" after song titles in search results, the mini player and the queue. Telegram files are labelled from their own header; songs from other sources from the format BitChord was given. The bit depth and sample rate also go to BitChord, so **Show stats for nerds** is exact.
- **Smooth quality switch:** when BitChord finds a better copy of the playing song, such as your Telegram FLAC after it started from YouTube, the new copy is loaded on BitChord's standby player and crossfaded in at the same point instead of restarting the player. If that can't happen (Automix mid-blend, for example), the switch happens the old way.
- **Play surround as stereo:** 5.1 and 7.1 files are mixed down to stereo inside BitChord's player, before its equaliser and effects, the same way `ffmpeg -ac 2` does it. The file isn't changed, nothing is converted ahead of time, and it works for every song BitChord plays.
- Each of these can be turned off under **Unofficial Telegram → Track details** or **Playback**.

## Before 1.0.0

These versions were released as bitchord-telegram-morphe.

### 0.2.3

- Saving a corrected name, or accepting a suggestion, also removes BitChord's saved copy of that song. A song BitChord has already saved from YouTube plays from that copy without checking other sources, so a renamed Telegram file wasn't used until the copy was gone.
- The Track names card updates while it's open: new suggestions appear without reopening the page.

### 0.2.2

- **Track names:** fix a Telegram file's title or artist on your phone without uploading it again, under **Unofficial Telegram → Track names**. BitChord then finds and matches the file under the corrected name.
- **Suggested fixes:** when a song plays from another source and one of your chats has a file by the same artist, about as long, whose title is a few letters off, the patch suggests the correct name. Nothing changes until you accept.
- Both can be turned off on the same page.

### 0.2.1

- Removed the extra "Unofficial Telegram setup" launcher icon. Telegram setup is under **Settings → Account & integrations → Unofficial Telegram**.
- Tapping **Telegram (on device)** under **Sources** now opens the Telegram settings page instead of an editor showing an internal address.
- The package name is unchanged, so 0.2.1 installs over 0.2.0 when you patch with the same Morphe signing key.

### 0.2.0

Initial experimental release for BitChord 1.8.1.

- Sign in to Telegram with your own API credentials and account.
- Search selected chats and stream audio with seeking.
- Browse channel posts and official sponsored messages in Channel View.
- Adjust the Telegram audio cache and view the playing source and bitrate.
- Choose an installation name; the default is **Bitchord+**.

See the [installation guide](docs/MOBILE.md) and [known limitations](docs/KNOWN_LIMITATIONS.md).
