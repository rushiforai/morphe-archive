# BaconReader.FakeReddit: a fake Reddit for the end-to-end tests

The end-to-end tests ([BaconReader.E2E](../BaconReader.E2E/README.md)) don't talk to Reddit: automation detection,
throttled logins and content that changes made them flaky. Each scenario makes exactly the Reddit data it needs here,
and BaconReader, patched with the test-only "E2E fake Reddit", talks to this instead of Reddit.

- **Where it runs:** in the test process, an ASP.NET Core minimal API on Kestrel, on a real port of this machine's
  loopback: the phone connects over the network, through `adb reverse`. `FakeRedditServer.StartAsync(url)` starts it
  on `url`'s port (port 0 takes a free one, as its tests do).
- **What it knows:** `RedditWorld`, in memory: accounts, subreddits, posts and their comments, media files; and what
  the app sent: every request, the actions (votes, saves, comments…), what the login saw, and the requests it couldn't
  answer. `Reset()` empties it. Ids are base 36, from a counter per world, so a run is deterministic; tests name things
  by title, never by id.
- **Its tests:** [BaconReader.FakeReddit.Tests](../BaconReader.FakeReddit.Tests) call it over `HttpClient`, as the phone
  does, with no phone (`dotnet test BaconReader.E2E.slnx`, and the "E2E CI" workflow).

## Building a test's Reddit

```csharp
var world = server.World;
var account = world.AddAccount("e2e_user", "e2e-password");
world.Subscribe(account, "e2e");
var post = world.AddPost("e2e", "Weekly thread", post => post.WithText("Some **text**"));
var comment = world.AddComment(post, "Look", comment => comment.WithGif());
world.AddReply(comment, "Nice");
world.AddPost("pics", "A picture", post => post.WithImage());
world.LoginPage.ShowCookieBanner = true;
```

- `Subreddit(name)` makes a subreddit on first use, a default one (the Front Page of an account without
  subscriptions shows its posts) unless `IsDefault` is set to false.
- `PostBuilder`: `By`, `WithText`, `WithTextAndImage`, `LinkingTo`, `WithImage`, `WithGif`, `WithScore`, `PostedAgo`,
  `Nsfw`, `Spoiler`, `Stickied`, `WithFlair`, `WithSilver`, `AsGallery`, `AsVideo`, `WithASignedThumbnail`,
  `LinkingToAPageWithAPreview`, `CrosspostOf`. `CommentBuilder`: `By`, `WithGif`, `WithImage`, `WithVideo`,
  `LinkingToAnImage`, `LinkingToAVideo`, `WithScore`, `WithSilver`; each media one is a paragraph of its own after the
  comment's text. Each fills in everything Reddit sends for it, with media the fake serves:
  - a flair is the post's `link_flair_text`, a `link_flair_css_class` made of its words, and one text part in its
    `link_flair_richtext`;
  - a gallery (`AsGallery`) is one JPEG or more: `is_gallery`, the URL `https://www.reddit.com/gallery/<id>`, Reddit's
    own, which "E2E fake Reddit" doesn't move ("Real addresses in content"), the images in `media_metadata`, with Reddit's
    `p` previews 108, 216 and 320 pixels wide (signed, their "&" HTML-escaped), and `gallery_data`; each image's full
    file at `i.redd.it/<id>.jpeg`, where the gallery viewer loads it;
  - a GIF post (`WithGif`) is `MediaAsset.LargeGif` at i.redd.it, a still of it as thumbnail and preview, and the GIF in
    the preview's `variants.gif`;
  - a video post (`AsVideo`) links `https://v.redd.it/<id>` moved to the fake (`<baseUrl>/_media/v.redd.it/<id>`),
    which answers as v.redd.it does, with a 302 to `/video/<id>`, Reddit's `www.reddit.com/video/<id>`, which redirects
    a browser to the post; its `media.reddit_video` names the DASH and HLS playlists
    and the fallback MP4, with a sound track unless `withSound: false`;
  - a signed thumbnail (`WithASignedThumbnail`) is `preview.redd.it/<id>.jpg?width=140&amp;…&amp;s=…`, as Reddit sends
    one without `raw_json`: the fake refuses it, 403, until its "&" are unescaped;
  - a link post with a preview (`LinkingToAPageWithAPreview`) links a web page the fake serves, with a preview and no
    thumbnail (`"default"`); NSFW and spoiler posts name their thumbnail `"nsfw"` and `"spoiler"`; a crosspost
    (`CrosspostOf`) has the shared post in its `crosspost_parent_list`;
  - Silver is an entry of `all_awardings` with its icon in the media store, counted in `total_awards_received`,
    `gildings` (`gid_1`) and `gilded`: awards as Reddit's API sent them until 2023;
  - a GIF uploaded in a comment is `![gif](<id>)` in its body, an entry in its `media_metadata`, a link to the GIF
    around a preview in its `body_html`, and the GIF itself at `<baseUrl>/_media/i.redd.it/<id>.gif`;
  - an image uploaded in a comment or a post's text (`WithTextAndImage`) is its preview's URL on a line of its own in
    its Markdown, `<baseUrl>/_media/preview.redd.it/<id>.png?width=320&format=png&auto=webp&s=e2e` (`format=pjpg` for a
    JPEG), which serves the image and its HTML makes a bare link, and an entry in its `media_metadata`: as real comments
    in Reddit's API have it (seen in an archive of them, Arctic Shift), unlike a GIF's `![gif](<id>)`;
  - a video uploaded in a comment is a link to its player on a line of its own in its body,
    `https://reddit.com/link/<comment>/video/<id>/player`, named by the comment's own id as in Reddit's API (what the
    patch plays), a `RedditVideo` entry in its `media_metadata` (unconfirmed: the archive has none for these comments),
    and the video as v.redd.it serves it: its DASH playlist at `<baseUrl>/_media/v.redd.it/<id>/DASHPlaylist.mpd` and its
    one rendition, `DASH_240.mp4`, next to it;
  - a link to an image or a video is a bare link to a file at `<baseUrl>/_media/example.com/<id>e2elink.jpg` (or
    `.mp4`).
- `Subreddit(name).LinkFlairs`: the flairs `api/link_flair` lists for it; null (the default) keeps them private, and
  Reddit refuses the list with 403 Forbidden.
- `Subreddit(name).PostRequirements`: what `api/v1/<sub>/post_requirements` says it asks of a text post's text, at
  least and at most so many characters, or no text at all; null (the default) is Reddit's defaults.
- `AddShareLink(owner, target)` makes a share link, `/<owner>/s/<code>` (`owner` is `r/<sub>` or `u/<user>`), that
  leads to the path `target`, and returns its path. A post on a user's profile is a post in `u_<name>`, as Reddit keeps
  it.
- `AddMessage(account, subject, body)` sends the account an unread private message: the newest of its inbox.
- `AddReply` to a comment of an account's, by someone else, puts the reply in its inbox too, unread: a comment reply,
  as Reddit's inbox sends it (a t1 with `was_comment`, its post's subreddit, title and context).
- `AddTrouble(new RequestTrouble(matches, delay, status, explanation, drops))` makes the requests it matches
  (`RedditWorld.CommentsOf(post)`, `RedditWorld.PostsOf(subreddit)`) misbehave until the world is reset: after `delay`,
  they fail with `status` (Reddit's error JSON, with its `explanation` when set), or lose their connection (`drops`), or
  get the answer the world gave when they came, late: a vote made meanwhile isn't in it. BaconReader's Reddit requests
  have no timeout, so a delay alone never fails one.
- `AddMedia(path, contentType, bytes)` serves any file; `MediaAsset` holds the small ones it ships: a GIF, a bigger one
  (`LargeGif`, 0.4 MB), a JPEG, a PNG, an MP4 with an audio track (two seconds, and `LongMp4`, ten), a ten-second video
  as DASH and HLS playlists and their video and sound renditions (and playlists without the sound), and a web page whose
  script asks for the page again with `?script=ran` once it runs. `AddVideoWithoutPost()` serves one that no post has, whose `/video/<id>` is a 404. `AddRedditVideo(id)` serves a video as v.redd.it
  does.
- `Imgur.AddAlbum(…)` makes an Imgur album ("Imgur" below), `RedGifs.AddGif(…)` a RedGIFs video ("RedGIFs" below),
  `YouTube.AddVideo(…)` a YouTube video ("YouTube" below), `X.AddPost(…)` and `Bluesky.AddPost(…)` a post ("X and
  Bluesky" below).
- `GiveAvatar(user, seeThrough)` gives a user an avatar, a picture or one that is all see-through, which `api/user_data_by_account_ids` names.
- A `RequestTrouble` with `Times` hits only the first requests it matches: a network hiccup.
- The E2E project wraps this in the Gherkins' words (`Infrastructure/Reddit/`).

## What it answers

Reddit's www, oauth and api hosts all land here. A path works with and without `.json` and a trailing slash, in any
case (BaconReader asks for `/r/All/.json`). A request with `Authorization: bearer <token>` is that account's; one
without is logged out, and Reddit's API refuses it with `HTTP 403 Blocked`, as Reddit does to BaconReader
(`BlocksLoggedOut`, on by default): the login, BaconReader's own server and media still answer.

| Endpoint | Answers |
|---|---|
| `GET /`, `/{sort}`, `/r/{sub}`, `/r/{sub}/{sort}` (`best`, `hot`, `new`, `top`, `rising`, `controversial`); `r/all`, `r/popular`, `r/a+b` | a `Listing` of `t3`, paged by `after`, `before` and `limit`; `top` and `controversial` by `t`. The Front Page is the account's subscriptions, or the default subreddits; a subreddit's hot feed starts with its stickied posts; an unknown subreddit is a 404 |
| `GET /comments/{id}`, `/r/{sub}/comments/{id}/{slug}[/{comment}]` | `[Listing(t3), Listing(t1 tree in replies)]`, by `sort`; a comment's id shows its thread |
| `GET /r/{sub}/search` | a search in the subreddit, as BaconReader sends a feed with a query (`restrict_sr=on`): for `flair_name:"A" OR flair_name:"B"`, its posts with one of those flairs ("Flair filter"); for other words, its posts whose title holds each; in `sort` |
| `GET /api/link_flair?r={sub}`, `/r/{sub}/api/link_flair` | the post flairs the subreddit lets users choose (`text`, `text_editable`, `id`, `css_class`…), or 403 Forbidden when it keeps them private |
| `GET /r/{sub}/s/{code}`, `/u/{user}/s/{code}` | a share link, logged out too: 301 to `https://www.reddit.com<target>` with Reddit's share query (`share_id`, `utm_source=share`…); a subreddit's code the world doesn't know is a 307 to `https://www.reddit.com/r/{sub}/`, as Reddit answers one; a user's is a 404 |
| `GET /r/{sub}/about`, `/r/{sub}/stylesheet` | `t5`; an empty stylesheet |
| `GET /reddits/mine`, `/subreddits/mine/{where}`, `/reddits/popular`, `/reddits/default` (and `/subreddits/…`) | `t5` listings |
| `GET /video/{id}` | Reddit's `www.reddit.com/video/<id>`, where v.redd.it redirects a video's address: a 302 to the video's post, on `www.reddit.com`, for a browser (a `Mozilla/` User-Agent), a 403 for other clients, as Reddit refuses them, and a 404 for a video no post has |
| `GET /api/info?url=…` | a Listing of the posts linking to the URL, newest first; for a video's `https://v.redd.it/<id>`, the video's post and the crossposts of it |
| `GET /_onelouder/explore-api/def_subs` | the default subreddits, as BaconReader's own server sent them: `app.top_level_categories[0].subreddits[]` with `name` and `display_name` |
| `GET /api/v1/me`, `/api/me`, `/api/v1/me/prefs`, `/api/v1/me/friends`, `/prefs/blocked`, `/api/multi/mine` | the account (never on today's day of the year, so no "Happy Cake Day!"), with `has_mail` and `inbox_count` from its unread messages; its prefs, empty lists |
| `GET /message/{where}` | the account's inbox, newest first: everything for `inbox`, the unread for `unread`, the private messages (t4) for `messages`, the comment replies (t1) for `comments`, none for the other tabs |
| `GET /api/v1/{sub}/post_requirements` | what the subreddit asks of a text post's text (`body_restriction_policy`, `body_text_min_length`, `body_text_max_length`), Reddit's defaults unless the world set them; 404 for no such subreddit |
| `GET /user/{name}/about` | `t2`, for the world's accounts |
| `GET /api/user_data_by_account_ids?ids=…` | for each fullname of a user the world gave an avatar (`GiveAvatar`), its `name` and `profile_img`; the others aren't in the answer |
| `POST /api/vote`, `save`, `unsave`, `hide`, `unhide`, `subscribe`, `comment`, `editusertext`, `del`, `morechildren`, `read_message`, `read_all_messages`, and others BaconReader sends | what Reddit answers (`{}`, or the comment; for a `comment` on a private message, the reply as a t4, kept in its `SentReplies`), applied to the world and recorded in `Actions`, logged out too |
| `GET /api/v1/authorize.compact` (and `/api/v1/authorize`, `/login.compact`, `/login`) | Reddit's login page: "Log In", the fields in elements with Reddit's ids, `login-username` and `login-password`, a "Log In" button; first the cookie banner when the world asks for it |
| `POST` of the login page | with a known account and its password, "Hey, &lt;user&gt;! &lt;app&gt; would like to connect with your reddit account", the permissions asked, and "Accept"; otherwise the login page with "Incorrect username or password". The app is named by its client ID: RedReader's is "RedReader (Release)" |
| `GET /favicon.ico` | 204: the web view asks for the login page's icon |
| `GET /api/v1/authorize/answer` ("Accept" or "Decline") | 302 to `<redirect_uri>?state=<state>&code=<code>`, or `error=access_denied` |
| `POST /api/v1/access_token` | Basic auth by the client ID; trades a code (once) or a refresh token for `access_token`, `refresh_token`, `token_type`, `expires_in`, `scope` |
| `GET`, `HEAD /_media/{host}/{path}` | the media store's file; `www.reddit.com/video/…` is `v.redd.it/…`, as BaconReader rewrites it; a video's own `v.redd.it/<id>` is a 302 to `/video/<id>`, and BaconReader's rewrite of it, `www.reddit.com/video/<id>`, answers as `/video/<id>`; a `preview.redd.it` URL whose query still has `&amp;` is a 403, as Reddit refuses a signature that doesn't match |
| `GET /_imgur/3/album/{id}/images` | Imgur's API, "Imgur" below: the album's images (`{"data": [image…], "success": true, "status": 200}`); 404 with `"album not found"` for an album the world doesn't have |
| `GET /_imgur/3/gallery/{id}` | Imgur's gallery post: the album with its title and images; Imgur's HTML 404 page for one the world doesn't have |
| `POST /_imgur/3/image` | an upload: the raw file stored at `i.imgur.com/<id>.<ext>` and answered as Imgur does (`link`, `type`, `deletehash`…), recorded in `Imgur.Uploads` with its content type; one sent as a form (`application/x-www-form-urlencoded`, BaconReader's without "Fix Imgur API") or that isn't a PNG or a JPEG is refused, 400 |
| `GET /_redgifs/v2/auth/temporary` | RedGIFs' API, "RedGIFs" below: a temporary token for the request's User-Agent (`token`, `addr`, `agent`, `session`, `rtfm`) |
| `GET /_redgifs/v2/gifs/{id}` | the video's information (`gif.urls`: `hd`, `sd`, `poster`, `thumbnail`, `html`), with a token RedGIFs gave and its User-Agent; RedGIFs' errors otherwise |
| `GET /_youtube/oembed?format=json&url=…` | YouTube's oEmbed, "YouTube" below: the linked video's title and channel; 404 `Not Found` for one YouTube removed or never had |
| `GET /_x/tweet-result?id=…&token=…` | X's embed service, "X and Bluesky" below: the post; a 404 page for one X doesn't have |
| `GET /_bluesky/xrpc/app.bsky.feed.getPostThread?…&uri=at://…` | Bluesky's public API: the post's thread; `400 NotFound` for one Bluesky doesn't have |
| `GET`, `POST`, `PUT /_fake/…` | for debugging: `requests`, `unhandled`, `actions`, `logins`, `world`; `reset`, `accounts`, `subscriptions`, `posts`, `comments`, `media/{path}` |
| anything else | 404, recorded in `Unhandled` |

Each step of the login records the client ID, redirect URI and User-Agent it saw (`Logins`), so a test can check that
"Spoof client" logged in as RedReader.

## Imgur

"E2E fake Reddit" moves Imgur's API, `https://api.imgur.com/`, to `<base>/_imgur/`, and its images,
`https://i.imgur.com/`, to `<base>/_media/i.imgur.com/`: "Fix Imgur API" and "Embed comment images" fetch albums and
upload images there. `RedditWorld.Imgur` holds the albums and the uploads.

- `Imgur.AddAlbum(title, images, inGallery, videos)`: an album of that many JPEGs, then MP4 videos, linked
  `https://imgur.com/a/<id>`, or on Imgur's gallery `https://imgur.com/gallery/<id>`. A post or a comment links it at
  that address, Imgur's own: BaconReader and "Embed comment images" know an album by it ("Real addresses in content").
- Its answers have every field Imgur's API sent BaconReader's client ID on 2026-11-03 (album `AmB1y`, gallery post
  `EoM2jZi`), in Imgur's order: a still image with `"mp4": ""`, as Imgur sends it, not left out; a video with its `mp4`,
  `gifv`, `hls`, `mp4_size` and `processing`. Each image's `link` is at the fake's address, which BaconReader only loads.
- `i.imgur.com/<id><size>.<ext>` serves the image whatever size letter (`s`, `b`, `t`, `m`, `l`, `h`) and extension are
  asked for, as Imgur does; a video's sizes are a still of it.
- A request without Imgur's `Authorization: Client-ID …` is refused, 401.
- Unconfirmed: what Imgur answers an upload it refuses (the fake doesn't upload to the real Imgur to see).

## RedGIFs

"E2E fake Reddit" moves RedGIFs' API, `https://api.redgifs.com/`, to `<base>/_redgifs/`: "Fix Redgifs API" asks it for a
temporary token and for a video's files, "Fix list thumbnails" for a video's thumbnail, and "Improve post media
loading" tells from its errors that a video is gone. `RedditWorld.RedGifs` holds the videos, the tokens it gave and
what the app asked (`RedGifs.Requests`: each token asked for, and each lookup with its token, User-Agent and status).

- `RedGifs.AddGif(state)`: a video, linked `https://www.redgifs.com/watch/<id>`, RedGIFs' own address, which BaconReader
  and the patches know it by. Its id is lowercase letters, as RedGIFs' are, and its files are served at
  `<base>/_media/media.redgifs.com/<Id>.mp4`, `-mobile.mp4`, `-poster.jpg` and `-mobile.jpg`, named as RedGIFs names
  them. `RedGifState.Deleted` makes one RedGIFs deleted.
- Every answer is RedGIFs' own of 2026-11-03, its fields in RedGIFs' order: a token is bound to the User-Agent it was
  given to (RedGIFs binds it to the address too); a lookup without a token is `401 AuthorizationHeaderMissing`, with one
  RedGIFs never gave `401 Unauthorized`, with another User-Agent `401 WrongSender`; a deleted video is `410 GifDeleted`,
  one RedGIFs never had `404 GifNotFound`.
- `RedGifs.ForgetTokens()` refuses each token it gave, `401 WrongSender`, as RedGIFs does once the phone's address
  changes, until the app asks for a new one.

## YouTube

"E2E fake Reddit" moves YouTube's oEmbed endpoint, `https://www.youtube.com/oembed`, to `<base>/_youtube/oembed`, and
its thumbnails, `https://i.ytimg.com/`, to `<base>/_media/i.ytimg.com/`: "Embed comment images" asks oEmbed for a bare
YouTube link's title, and it and "Fix list thumbnails" load a video's thumbnail. `RedditWorld.YouTube` holds the videos.

- `YouTube.AddVideo(title, channel, removed)`: a video on the channel `@<channel>`, linked
  `https://www.youtube.com/watch?v=<id>` (or `https://youtu.be/<id>`, `/shorts/<id>`), YouTube's own address, which the
  patches know it by. Its id is 11 characters, as YouTube's are, and its thumbnails are served at
  `i.ytimg.com/vi/<id>/mqdefault.jpg` and `hqdefault.jpg`. `removed` makes one YouTube no longer has.
- oEmbed answers as YouTube answered on 2026-11-04, every field in its order (`title`, `author_name`, `author_url`,
  `type`, `height`, `width`, `version`, `provider_name`, `provider_url`, `thumbnail_height`, `thumbnail_width`,
  `thumbnail_url`, `html`). A video YouTube removed or never had is `404` with the body `Not Found`, as YouTube answers
  one (an id it can't read is `400 Bad Request` there; the patch treats both alike).
- Its `thumbnail_url` is YouTube's own address, as YouTube sends it. The patches load a video's thumbnail from its id
  instead, and read this one only for a playlist, which the fake doesn't have: the patch takes it only at an https
  address, which the fake's plain HTTP isn't.

## X and Bluesky

"E2E fake Reddit" moves X's embed service, `https://cdn.syndication.twimg.com/`, to `<base>/_x/`, Bluesky's public API,
`https://public.api.bsky.app/`, to `<base>/_bluesky/`, and X's photos, `https://pbs.twimg.com/`, to
`<base>/_media/pbs.twimg.com/`: "Embed comment images" shows a bare X or Bluesky link as the post. `RedditWorld.X` and
`RedditWorld.Bluesky` hold the posts.

- `X.AddPost(name, handle, text, createdAt, media, long)`: a post linked `https://x.com/<handle>/status/<id>`, X's own
  address. Its answer is X's of 2026-11-04, its fields in X's order: a photo or video still in `mediaDetails`, at the
  fake's `pbs.twimg.com` (the patch asks for it with `?name=small`), whose `t.co` link ends the text, outside
  `display_text_range`; a `long` post cut at 279 characters, with `note_tweet`. A post X doesn't have is `404` with an
  HTML page. X didn't check the token on 2026-11-04, and neither does the fake.
- `Bluesky.AddPost(name, handle, text, createdAt, embed)`: a post linked `https://bsky.app/profile/<handle>/post/<key>`.
  `getPostThread` answers as Bluesky did on 2026-11-04, with the embed's view: `images`, `video`, `external` (a link
  card) or `gallery`, which Bluesky sent for a post of several photos; each picture at the fake's `cdn.bsky.app` or
  `video.bsky.app`. A post Bluesky doesn't have is `400 {"error": "NotFound", …}`.

## Emotes

A comment's emotes are `![img](emote|<pack>|<name>)` in its body: a Snoomoji, Reddit's own (`free_emotes_pack`), or a
subreddit's (`t5_<subreddit id>`). `CommentBuilder.WithSnoomoji(name)` and `WithSubredditEmote()` add one after the
body's text, on its line. Reddit's API sent every emote the same way on 2026-11-05 (an r/wallstreetbets comment of 2024,
`RedditEmotes`), and so does the fake: its placeholder, the Snoomoji `dizzy_face`, in `body_html`
(`<img src="…/dizzy_face.gif" width="60" height="60" style="vertical-align:middle">`) and in `media_metadata` (an
`AnimatedImage` whose `s.gif` is that GIF, `t` `sticker`). "Embed comment images" finds a Snoomoji's GIF from its name,
at `https://www.redditstatic.com/…/free_emotes_pack/<name>.gif`, which "E2E fake Reddit" moves to
`<base>/_media/www.redditstatic.com/`; the fake serves the placeholder and each Snoomoji a comment has. A subreddit's
emote had its own image in `media_metadata` until 2024 (the Arctic Shift archive); now nothing Reddit sends holds it. No
comment written since early 2025 has an emote.

## Imgflip

"E2E fake Reddit" moves `https://i.imgflip.com/` to `<base>/_media/i.imgflip.com/`: "Fix meme templates" shows Imgflip's
100 most used templates in the drawing screen's template grid, a fixed list in the patch, as their thumbnails
(`4/<id>.jpg`), and downloads a tapped one at full size (`<id>.jpg` or `.png`). `Imgflip.Templates` is the same list, in
the patch's order, with each template's name on Imgflip.

- `RedditWorld.Imgflip.AddTemplates()`: Imgflip serves every template, as Imgflip did on 2026-11-05: a thumbnail is a
  JPEG, a full template a JPEG or a PNG, as its file says.
- `RemoveTemplate(name)`: Imgflip no longer has the template at full size: `404` with an HTML page, as Imgflip answers an
  image it doesn't have. Its thumbnail still shows.
- Without `AddTemplates()`, a request for a template is unhandled.

## Reddit chat

"Reddit chat" shows `https://www.reddit.com/chat` in a web view, which "E2E fake Reddit" moves to `<base>/chat` with the
rest of www.reddit.com. Reddit's chat is a website behind a login, with no API, so the fake answers `/chat` and its
pages with a plain page of its own, not Reddit's: the heading "Chats", then a link each `RedditWorld.Chat.AddLink(text,
address)` made. A scenario gives it the links it taps, at Reddit's own addresses, as a link in the chat has them.

## The JSON

- System.Text.Json, snake_case, with a few names by hand (`over_18`), and nothing escaped that Reddit doesn't escape.
- **Every field Reddit sends, with Reddit's defaults** (`Json/Wire.cs`). BaconReader parses Reddit with Jackson and
  reads some fields without a null check: a missing `over_18`, `is_self`, `saved` or `hidden` crashes it.
- **Things are `{"kind": …, "data": …}`, in that order and nothing else:** BaconReader's parser refuses any other shape,
  for a listing, its children and a comment's `replies`.
- **Reddit's quirks:** `replies` is `""` when a comment has none (`RepliesConverter`); `edited` is `false`;
  `body_html` and `selftext_html` are entity-escaped HTML (`&lt;div class="md"&gt;…`), from `RedditMarkdown`, which
  covers what the scenarios write: paragraphs, quotes, lists, headings, code, links (bare URLs and r/ and u/ names too),
  bold, italics, strikethrough, and GIFs uploaded in a comment.
- **Media URLs point at the fake** (`<baseUrl>/_media/…`), never at a host "E2E fake Reddit" doesn't move
  (`external-preview.redd.it`, `*.redditmedia.com`).

## Known traps

- **`v.redd.it` links:** BaconReader turns any link containing "v.redd.it" into one with `www.reddit.com/video`, by
  string replace: `/_media/www.reddit.com/video/x` serves `v.redd.it/x`. A video post needs `media.reddit_video` with
  an `.mp4` `fallback_url`: without it, BaconReader follows a redirect that must point at a reddit.com host.
- **Galleries:** BaconReader recognizes one by a `url` containing `https://www.reddit.com/gallery/`, which "E2E fake
  Reddit" leaves as it is, and needs `gallery_data` and `media_metadata`.

## Real addresses in content

**Content links that a patch must recognize as Reddit's keep Reddit's real address; only what the app fetches goes to
the fake.** "E2E fake Reddit" moves every full Reddit URL prefix in the app's code to the fake. Data the fake serves is
not code: a link in it stays as written. Write a link the app or a patch checks by host or prefix as Reddit sends it
(`https://www.reddit.com/…`, `https://v.redd.it/<id>`); what the app then fetches, from addresses its code makes,
reaches the fake. A link written with the fake's address takes a path real Reddit never takes, and the scenario
doesn't test the patch. Two such gaps reached users or a test:

- A gallery's `url`, `https://www.reddit.com/gallery/<id>`: moved, "Fix Reddit links" didn't take it for a Reddit link,
  and its gallery regression passed the tests. The patch now leaves strings that start with it alone.
- A link post to a video, `https://v.redd.it/<id>` (`Reddit.HasALinkPostLinkingToTheVideoOf`): BaconReader turns it
  into `https://www.reddit.com/video/<id>` to find the video's post, which "Fix Reddit links" answers with the video.
  Moved, it was `<baseUrl>/_media/www.reddit.com/video/<id>`, which the patch doesn't know: the app's own lookup got a
  403.

Where a check needs Reddit's address and the content can't keep it, "E2E fake Reddit" has the smallest hook instead:
`RedditVideo.isValid` takes a URL under `<baseUrl>/_media/v.redd.it/` for a Reddit video, so videos posted to the fake
play. A comment's link to a video's address uses the moved form for that reason, and is faithful through the hook.

Media files the app only loads (`i.redd.it`, `preview.redd.it`, a video's playlists, an example page) are at the fake's
address: nothing checks their host before loading them, beyond the hook.
- **Video posts:** BaconReader plays and saves a post as a Reddit video only when its URL's host is `v.redd.it`, then plays
  its HLS playlist and saves its `fallback_url` made https. "E2E fake Reddit" takes a URL under
  `<baseUrl>/_media/v.redd.it/` for a Reddit video and keeps the fake's plain HTTP when a video is saved; without them,
  BaconReader opens the real reddit.com in its browser.
- **Slow media:** BaconReader's own cache loader, which loads GIFs with "Improve post media loading", gives up after about
  15 s and shows a web page instead: answer media late by less (8 s).
- **Relative links:** `RedditSpanner` builds `//reddit.com/…` for relative links, which stays on Reddit.
- **Reddit links in content:** BaconReader recognizes them by bare domain. Content that should open as a Reddit link
  says `https://www.reddit.com/…`: the app then fetches it through the moved API. Not `<baseUrl>/r/…`.
- **Out of scope:** Reddit's own chat app (`chat.reddit.com`, `accounts.reddit.com`, `.reddit.com` cookies): see
  "Reddit chat".
