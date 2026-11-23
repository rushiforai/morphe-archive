# Measurements

FanFiction.Net 66.5 (build 918) on a physical arm64 phone, signed in, measured on 2026-11-20 with the
"Enable debug logging" patch (logcat tag `FFNTao`) and mitmproxy. Patched builds used "Clone app" so they
could run next to the official app.

## How the app talks to the server

- The API (`v3.geolb.com`) is a custom HTTP/2 client over raw sockets on port 443, with its own encryption
  and zstd compression. It is not TLS, ignores the system proxy, and can't be read with mitmproxy or curl.
  Request counts come from the debug logging patch instead.
- The server answers each user's requests one at a time, in order (seen in HTTP/2 frame logs). Every
  unnecessary request delays the ones a screen is waiting for.
- Sync endpoints are delta-based (`?syncversion=`); list endpoints (favorites, follows, own stories) are not.

## Firebase telemetry (mitmproxy, about 2 minutes)

| Host | Stock | Patched |
|---|---|---|
| `app-measurement.com` | 21 | 0 |
| `firebase-settings.crashlytics.com` | 7 | 0 |
| `firebaselogging(-pa).googleapis.com` | 3 | 0 |
| `crashlyticsreports-pa.googleapis.com` | 1 | 0 |

Logcat also confirms `App measurement deactivated via the manifest`.

## API requests

- Images (`/api/image/id/v2`) were the largest share: 48 of the requests in one session (30 sent, 18
  merged as duplicates). The app has no image cache and fetches every cover and avatar again each time
  it is shown. "Cache images" serves repeats from disk.
- One session sent 165 requests, of which 44 duplicated a request still in flight. "Merge duplicate
  requests" sends them once.
- Each launch pulled 6 sync jobs. "Throttle sync" skipped all 6 on relaunches within 15 minutes.
- Per-item lookups (`story/basic`, `story/chapter`, `user`) appear while the app works through unread
  notifications. The app stores story details in its local database and does not look them up again, so a
  client-side story cache would rarely hit. Over three launches, only the first (a sync refresh) sent
  `story/basic`, already batched: 230 ids in 5 requests.

## Relaunch cost

| Build | API requests on a relaunch |
|---|---|
| Stock | about 25-29 |
| Default patch set | 3 (profile counts, subscriptions, story update check) |

## Favorites outage (2026-11-20)

`/api/user/fav/story/v3` became extremely slow for all app users. Server time grows with the number of
matching favorites: 1 story about 12 s, letter A about 61 s per page, all 993 never finished. Because the
server answers one request at a time, the slow call blocks every request queued behind it. The website,
which runs on separate servers, was unaffected.
