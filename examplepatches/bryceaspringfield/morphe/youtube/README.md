# YouTube Extras for Morphe

A Morphe patch bundle for YouTube, used together with the official Morphe Patches (v2.1.0 and later for YouTube
21.44.528; the pre-release v2.2.0-dev.3 or later for YouTube 21.45.82). It adds one patch, **YouTube Extras**, whose settings are in Settings > Morphe > YouTube Extras. Every
option is off, or empty, until it is set.

The bundle also holds the Reddit Keyword Filter ([reddit/](../reddit/)). Add this source in Morphe by URL:

```text
https://github.com/bryceaspringfield/morphe
```

## Filters

| Setting | Effect |
|---|---|
| Channel filters | Rules for one channel each, one a line, `CHANNEL: RULE` (table below) |
| Hide videos shorter than, longer than | A length as m:ss, h:mm:ss, or minutes |
| Hide playlists on Home | Playlists and courses in the home feed (Morphe's own option hides mixes) |
| Hide by topic | Videos and channels whose titles or names promote Zionism; fascism, Nazism, and white supremacy; incels and the blackpill; or conspiracy theories. A title opposing the topic (anti-, debunked, explained) is kept |
| Channels to hide | One channel a line; every video of the channel is hidden |
| Hide by category | YouTube's own category of each video (e.g., Gaming, News & Politics), looked up once a video |
| Where the filters apply | Home, Subscriptions, search results, and the videos under the player |

The channel in a rule is an @handle, a channel ID (UC...), or the channel's name as shown. Several rules for a
channel may share a line, separated by commas (`@channel: live, shorts, <3:00`).

| Rule | Hides the channel's |
|---|---|
| `all` | every video |
| `live` | live streams |
| `shorts` | Shorts |
| `playlists` | playlists and mixes |
| `<5:00`, `>1:00:00` | videos shorter or longer than the length |
| a word, or `"a phrase"` | videos whose title or text contains it (a phrase in quotes as whole words) |
| `comments: word` | comments containing the word, under the channel's videos |

## Automatic actions (signed in)

| Setting | Effect |
|---|---|
| Mark hidden videos as not liked | Each video the filters hide gets Not interested > Tell us why > I don't like the video |
| Mark watched videos | Videos with the red progress bar get Not interested > Tell us why > I've already watched the video; Partly marks any bar, Fully only videos played to 90% in this app |
| Like every video watched | Likes a video after 3 seconds in the player, when it is neither liked nor disliked |

These send the same requests as the menu and the like button, as the signed-in account, once a video a session.

## Layout and fixes

| Setting | Effect |
|---|---|
| Save button opens the playlist list | A tap on Save opens Save to..., with Watch later left unchecked |
| Hide the community panel of comments | The community card reached by swiping the comments teaser ("Community ... Visit") |
| Hide dots on the subscribed channels bar | The dots on the channel avatars of Subscriptions |
| Live chat opens on all messages | In place of Top messages |
| Recover playback after the connection changes | Reloads a video whose position stops moving after the connection returns |
| Log feed items | Each feed item's channel, length, and type in Morphe's debug log |
