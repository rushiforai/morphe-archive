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
  `Nsfw`, `Stickied`, `WithFlair`. `CommentBuilder`: `By`, `WithGif`, `WithImage`, `WithVideo`, `LinkingToAnImage`,
  `LinkingToAVideo`, `WithScore`; each media one is a paragraph of its own after the comment's text. Each fills in
  everything Reddit sends for it, with media the fake serves:
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
- `AddMessage(account, subject, body)` sends the account an unread private message: the newest of its inbox.
- `AddTrouble(new RequestTrouble(matches, delay, status, explanation, drops))` makes the requests it matches
  (`RedditWorld.CommentsOf(post)`, `RedditWorld.PostsOf(subreddit)`) misbehave until the world is reset: after `delay`,
  they fail with `status` (Reddit's error JSON, with its `explanation` when set), or lose their connection (`drops`), or
  get the answer the world gave when they came, late: a vote made meanwhile isn't in it. BaconReader's Reddit requests
  have no timeout, so a delay alone never fails one.
- `AddMedia(path, contentType, bytes)` serves any file; `MediaAsset` holds the small ones it ships: a GIF, a JPEG, a
  PNG, an MP4 with an audio track (two seconds, and `LongMp4`, ten), and a ten-second video as a DASH playlist and its
  rendition.
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
| `GET /r/{sub}/about`, `/r/{sub}/stylesheet` | `t5`; an empty stylesheet |
| `GET /reddits/mine`, `/subreddits/mine/{where}`, `/reddits/popular`, `/reddits/default` (and `/subreddits/…`) | `t5` listings |
| `GET /_onelouder/explore-api/def_subs` | the default subreddits, as BaconReader's own server sent them: `app.top_level_categories[0].subreddits[]` with `name` and `display_name` |
| `GET /api/v1/me`, `/api/me`, `/api/v1/me/prefs`, `/api/v1/me/friends`, `/prefs/blocked`, `/api/multi/mine` | the account (never on today's day of the year, so no "Happy Cake Day!"), with `has_mail` and `inbox_count` from its unread messages; its prefs, empty lists |
| `GET /message/{where}` | the account's private messages (t4), newest first: all of them for `inbox` and `messages`, the unread ones for `unread`, none for the other tabs |
| `GET /user/{name}/about` | `t2`, for the world's accounts |
| `POST /api/vote`, `save`, `unsave`, `hide`, `unhide`, `subscribe`, `comment`, `editusertext`, `del`, `morechildren`, `read_message`, `read_all_messages`, and others BaconReader sends | what Reddit answers (`{}`, or the comment), applied to the world and recorded in `Actions`, logged out too |
| `GET /api/v1/authorize.compact` (and `/api/v1/authorize`, `/login.compact`, `/login`) | Reddit's login page: "Log In", the fields in elements with Reddit's ids, `login-username` and `login-password`, a "Log In" button; first the cookie banner when the world asks for it |
| `POST` of the login page | with a known account and its password, "Hey, &lt;user&gt;! &lt;app&gt; would like to connect with your reddit account", the permissions asked, and "Accept"; otherwise the login page with "Incorrect username or password". The app is named by its client ID: RedReader's is "RedReader (Release)" |
| `GET /favicon.ico` | 204: the web view asks for the login page's icon |
| `GET /api/v1/authorize/answer` ("Accept" or "Decline") | 302 to `<redirect_uri>?state=<state>&code=<code>`, or `error=access_denied` |
| `POST /api/v1/access_token` | Basic auth by the client ID; trades a code (once) or a refresh token for `access_token`, `refresh_token`, `token_type`, `expires_in`, `scope` |
| `GET /_media/{host}/{path}` | the media store's file; `www.reddit.com/video/…` is `v.redd.it/…`, as BaconReader rewrites it |
| `GET`, `POST`, `PUT /_fake/…` | for debugging: `requests`, `unhandled`, `actions`, `logins`, `world`; `reset`, `accounts`, `subscriptions`, `posts`, `comments`, `media/{path}` |
| anything else | 404, recorded in `Unhandled` |

Each step of the login records the client ID, redirect URI and User-Agent it saw (`Logins`), so a test can check that
"Spoof client" logged in as RedReader.

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
- **Galleries:** BaconReader recognizes one by a `url` containing `<baseUrl>/gallery/` (its `https://www.reddit.com/gallery`
  moved there), and needs `gallery_data` and `media_metadata`.
- **Relative links:** `RedditSpanner` builds `//reddit.com/…` for relative links, which stays on Reddit.
- **Reddit links in content:** BaconReader recognizes them by bare domain. Content that should open as a Reddit link
  says `https://www.reddit.com/…`: the app then fetches it through the moved API. Not `<baseUrl>/r/…`.
- **Out of scope:** Reddit's chat (`chat.reddit.com`, `accounts.reddit.com`, `.reddit.com` cookies) and Snoomoji emotes
  (`www.redditstatic.com`).
