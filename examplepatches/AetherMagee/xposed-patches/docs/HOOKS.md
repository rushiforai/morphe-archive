# Hook map (X 12.19.1-release.0)

Found by decompiling the APKM with jadx. Obfuscated names are only valid for this version;
fingerprint by the strings/classes noted instead.

## Lookups: `com.x.repositories.profile.u` (DefaultAboutProfileRepository)
- Constructor takes `com.x.repositories.graphql.g` (the app's authenticated GraphQL client).
- `a(UserIdentifier, ContinuationImpl)`: AboutProfileQuery by user id (suspend fun).
- `b(String screenName, ContinuationImpl)`: AboutProfileByScreenNameQuery (suspend fun).
- Returns `com.x.result.b` (`b.C4676b` = success holding `a.C4648a(MinimalUser, ProfileAboutMetadata)`).
- Fingerprint strings: `"Missing GraphqlUser.screen_name for "`, `"mapper on "`;
  continuation classes `s`/`t` carry `@DebugMetadata(c = "com.x.repositories.profile.DefaultAboutProfileRepository")`.
- `com.x.models.profile.ProfileAboutMetadata` holds account_based_in, source, location_accurate, etc.

## Timeline entries (hide mode)
- `JsonTimelineEntry$$JsonObjectMapper.parse` and `JsonTimelineModuleItem$$JsonObjectMapper.parse`
  (unobfuscated). Piko hooks the same spots to drop ads; returning null removes the entry.
- `GraphqlJsonTwitterUser$$JsonObjectMapper` parses every user in a response. Good place to
  prefetch lookups before views bind. It also has an `about_profile` field (`Q0`), but timeline
  queries don't request it.

## Post header (badges)
- `com.twitter.ui.tweet.TweetHeaderView.c(String name, String username, String timestamp, List badges)`
  = setData. Callers: `tweetview/core/ui/tweetheader/c.java` (main timeline), `timeline/itembinder/b.java`,
  `explore/timeline/events/r.java`, `longform/threadreader/implementation/o.java`, `app/profiles/prompt/h.java`.
- MVP badge: decorate `username` with flag and device emoji at the start of `c()`.

## Filters (hide/highlight)
- Quoted posts: the quote's TweetHeaderView sits inside `com.twitter.tweetview.core.QuoteView`.
- Rows: the RecyclerView child above the header (`androidx.recyclerview.widget.RecyclerView`, unobfuscated).
- X resets row visibility/size after binding the header, so verdicts are re-applied in a `post()`.

## Cloud cache (x-posed)
- `GET https://x-posed-cache.xaitax.workers.dev/lookup?users=a,b` (<=100 handles), no auth.
  Result keys: l=location, d=source, a=location accurate, af=affiliation, id, t=timestamp.
- `POST /contribute` with `{"entries": {...}}`.
