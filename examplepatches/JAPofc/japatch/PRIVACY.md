# Privacy policy

**Last updated: 27 November 2026**

JaPatch is a patch set for Discord's own Android app. It runs entirely on your phone: the runtime is
bundled in the patch bundle, there is no remote code, no account of ours, and no server of its own
except the ReviewDB one described in section 4. This page lists exactly what can leave your phone, so
you can check it yourself instead of taking it on trust.

Every claim here can be verified with a packet capture (PCAPdroid, NetGuard, your router's log) and
by reading the source, which is public.

---

## 1. What never happens

- **No analytics, no telemetry, no crash reporting.** JaPatch turns Discord's own off: Sentry crash
  reporting, `sendTelemetryEvent`, analytics breadcrumbs and recording, the websocket telemetry hook,
  resume analytics, and the AppsFlyer/AdsModule/InstallReferrer modules. The **Privacy options**
  section in the app is on by default.
- **No password is ever read or stored.** Sign-in goes through Discord's own screens.
- **No Discord token is copied anywhere.** The account switcher only raises Discord's own limits
  (`MAX_ACCOUNTS`, `MAX_PUSH_SYNC_ACCOUNTS`) so the switcher Discord already ships can hold more than
  one account. Discord stores those sign-ins itself. They leave the phone only if *you* export them
  (Settings → JaPatch → Account switcher → Export), which warns first.
- **No keylogging, no screenshots, no clipboard reading, no contact list access.** The only permission
  JaPatch adds is `FOREGROUND_SERVICE_MEDIA_PLAYBACK`, so a voice message can keep playing when you
  leave the app.
- **No advertising ID is read.** The patches that stop Discord's own use of it are on by default.
- **Nothing is sold or shared**, because nothing is collected.

## 2. The only ways data leaves your phone

Every one of these is a feature you switch on yourself, and each is listed with its destination:

| When | Destination | What is sent |
| --- | --- | --- |
| Images, avatars and attachments in chat | `cdn.discordapp.com`, `media.discordapp.net` | Discord's own traffic; JaPatch adds nothing |
| Icon packs (Appearance → Icon packs) | `raw.githubusercontent.com` | A plain GET for the pack's icon files |
| Translate messages (**off** by default) | `translate.googleapis.com`, `clients5.google.com` | The text of the message you asked to translate — no name, no ID, no token |
| User and server reviews (**off** by default) | the ReviewDB server in *Reviews → Server*, which starts as `https://japatch-reviewdb.fly.dev` | The profile or server ID you opened, the review text you typed, and your vote — see section 4 |
| Listen along (**off** by default) | `api.spotify.com` | The track request Discord itself makes |
| Fix link previews (on by default) | an embed service such as `api.fxtwitter.com` | The address of the link you sent |
| Complete Quests / badges (off by default) | Discord only | Whatever Discord's own app sends; nothing anywhere else |
| Check for updates (**on** by default, one switch) | `api.github.com` | A plain GET for the newest release number, made when the About page is opened — no more than once a day. Nothing about you, your account or the phone is in it |
| Install attribution disabled | nothing — AppsFlyer is blocked | — |

Four of these deserve a sentence:

- **Translate sends text to Google.** If that is not acceptable, leave it off; nothing else in JaPatch
  touches a translation service.
- **Reviews talks to exactly one address**, the one written in *Reviews → Server*. Empty the field and
  Reviews is off: no profile ID, no review and no sign-in is made, and the review rows are not drawn
  at all. JaPatch does not quietly pick a community server behind your back — the address is visible
  in the setting, and you can change it to any ReviewDB-compatible server, including your own.
- **Fix link previews** rewrites the link so Discord can draw the post. Only the address of the post
  goes to the embed service.
- **Check for updates** is the one request JaPatch makes without being asked to do something: opening
  Settings → JaPatch → About asks GitHub which release is newest. It is not on a timer, not at launch,
  sends nothing about you, and has its own switch on that page — turning it off means no request is
  made at all.

## 3. What stays on the phone

JaPatch writes two things, both in the app's own private storage (`/data/data/<package>/files`):

- `japatch-patches.json` — your feature switches, your rules, themes, icon-pack links, server edits,
  your **Don't keep these** list (Discord ids only, never message text), and (if you signed in) the
  ReviewDB token. Nothing else.
- its debug log, only while *Debug logging* is on.

Uninstalling the patched app deletes both. **Backup and restore** writes a file where you choose, and
that file deliberately leaves out the ReviewDB sign-in and exported accounts.

Exported chats and downloaded voice messages are written where Android's document picker points, and
they go nowhere unless you share them yourself.

## 4. Reviews (ReviewDB), in detail

Reviews is off by default. When you turn it on, the address in *Reviews → Server* is the only ReviewDB
server the app ever contacts.

- **Signing in** opens Discord's own sign-in page for the application that server uses, and the server
  hands the result back. Only the `identify` scope is asked for: your username, display name and
  avatar. Never your email, never your messages, never your friends list.
- **Reading reviews** sends the profile or server ID you opened to that address, and nothing else.
- **Writing a review** sends the text you typed, with that ID.
- **Voting** sends which review you marked and which way.
- **Deleting** removes your own review (or, for an administrator, one that was reported).
- The sign-in token is kept on your phone and belongs to that one address. Changing the address signs
  you out of the old one first.

The server JaPatch runs for itself is `https://japatch-reviewdb.fly.dev`, a small service with a SQLite
file that is not open source: it is one private deployment, and the address above is the only thing in
JaPatch that ever talks to it. It stores the reviews written on it, the Discord name and avatar of the
people who wrote them, and the votes — nothing else. It has no analytics, and it keeps no access log
beyond what Fly.io keeps as the host.

That it is closed does not make it unverifiable: everything it receives is listed above, and the way to
confirm what leaves your phone is section 6, a packet capture on your own device. If you would rather
not use it, point the field at a server you run, or empty the field and Reviews is off.

A review you write is public to everyone using that server. Do not write anything there you would not
put on a postcard.

## 5. Children

JaPatch is not directed at children and has no way to know who is using it. Discord's own minimum age
applies.

## 6. Checking it yourself

You do not have to read the source to confirm the list above:

1. Install [PCAPdroid](https://github.com/emanuele-f/PCAPdroid) or NetGuard and record while you use
   Discord.
2. With every optional feature off you should see Discord's own domains only (`discord.com`,
   `discordapp.com`, `discordapp.net`, `discord.gg`, and Discord's CDN hosts).
3. Turn on one feature at a time and watch for its domain from the table above.

In the source, the outbound calls are easy to find:

```bash
grep -rn "fetch(\|XMLHttpRequest" patches/src/main/resources/japatch/bootstrap.js | grep -v "^.*//"
grep -rn "https://" patches/src/main/resources/japatch/bootstrap.js
```

The privacy patches themselves are in `patches/src/main/kotlin/app/japatch/patches/PrivacyPatches.kt`
and `HbcPrivacy.kt`.

## 7. Changes to this policy

When a feature changes what leaves the phone, this page changes with it and the date at the top moves.
The history is public: every change to this file is a commit in the repository.

## 8. If you find something

Open an issue at <https://github.com/JAPofc/japatch/issues> with the domain, the screen you were on,
and the feature switches that were on. A privacy claim that can't be checked is worth very little, so
reports are welcome.
