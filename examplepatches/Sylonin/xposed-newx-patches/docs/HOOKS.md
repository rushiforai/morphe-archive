# Hook map (NewX, X 12.34 to 12.37)

NewX is the Jetpack Compose rewrite of X. R8 renames almost every class and member, and the
names change between releases. The patch therefore never names an obfuscated member. It finds
each one at patch time from something stable: a `toString` string, a kept type, a signature
shape or the code around it. If any of these finds zero or several candidates, the patch stops
with a `PatchException`. The names below are from 12.37.2-prod.01 and are only examples.

## Shared tools (`patches/.../util`)

- `toStringFields`: maps the labels of a data class's `toString` ("AvailablePost(entryId=")
  to its fields. It follows the outlined `StringBuilder` helpers R8 creates, whose argument
  order is shuffled, and treats one-field formatters (value class `toString`) as the field.
- `RegisterFlow`: a small dataflow analysis over all paths of a method (branches, switches,
  exception handlers). It tracks parameters, constants, static fields and `parameter & mask`.
- `composableParameter`: uses `RegisterFlow` to find which bits of a composable's `$changed`
  and `$default` ints belong to one parameter. R8 removes unused ints and reorders them, so
  they can't be derived from the signature.
- `ComposeBridge` (extension): static stubs whose bodies the patch writes with the resolved
  Compose members. The extension calls Compose only through it.

## Startup and lookups

- App start: `onCreate()` of the `android.app.Application` subclass (`XApplication`) calls
  `Hooks.onApplicationCreate`.
- GraphQL client: the class with the string `"GraphqlApiImpl-unresolved-"`. Every constructor
  hands `this` to `Hooks.onGraphqlApi`; lookups use the most recent one.
- About this account: the repository with `"Missing GraphqlUser.screen_name for "` and a
  `(String, ContinuationImpl)` method (`com.x.repositories.profile.r`). Field names come from
  the `toString` of `ProfileAboutMetadata`, `AffiliateData`, `MinimalUser` and
  `UserWithProfileAboutMetadata`, and reach `XAboutApi` as a spec string.

## Badges

- The Affiliate badge item (`com.x.ui.common.x2`, from `"Affiliate(contentDescription="`):
  content description, image URL and click target.
- Its composable, `(item, bitmap, Modifier, Float, Composer, Int)` (`y.a`), draws it with
  `Image`. The hook draws items whose URL starts with `xposed:` itself, with a
  `BitmapPainter`, `Modifier.size(w, h)` and `clickable`, because `y.a` crops to a square.
- The badge row (the method in the same class that calls `y.a` and tests `instance-of x2`)
  gives the badge list type, `kotlinx.collections.immutable.b`.
- The name rows get an `xposed:` item appended through `Hooks.onNameRow`. They are the
  static methods in the same class that call the badge row and take `(name, ...)` first, the
  badge list and a later `String`, the handle: `y.o` for post headers and user rows, and
  `y.e` for the reply header, which also shows the time. The patch clears the list's
  `$changed` bits so the row compares the new list with the last one. `NameBadges` returns
  the same list object for the same inputs, so unchanged rows still skip.
- The profile page header builds its name line with other composables and is not hooked.

## Filters

- The post composable: static, first parameter the `AvailablePost` type (from
  `"AvailablePost(entryId="`), second its `authorAppealPivot` type (`z1.a`).
- Reply and condensed layouts: static composables whose first parameter is the
  `AvailablePost` type and that call a `(Instant, User, ...)` header which reaches the
  name row class (`ComparisonsKt.c` for replies, `h.a` for condensed posts). Their header
  path is `f1.f`, then `y.f`, then `y.e`.
- Quote cards: of the composables with consecutive parameters `(User, Instant, String)`, the
  one that calls the others (`quote.b.c`).
- Both call `Hooks.onPost(screenName, userId, modifier)` at entry. `Hooks.HIDE` returns at
  once, so nothing is drawn. Any other result replaces the `Modifier` argument; the patch
  clears its `$default` and `$changed` bits so the composable uses and compares it.
- User model: the interface whose default `"@"` + `screenName()` method exists, with
  `getId()` returning a type with one `long` field (`com.x.models.uh`, `ch`).
- Highlight: `Modifier.drawWithContent` (told apart from `drawBehind` and `drawWithCache` by
  its node's draw method), then the `android.graphics.Canvas` reached through the draw scope,
  `CanvasDrawScope`, `DrawParams` (from `"DrawParams(density="`) and `AndroidCanvas`.

## Recomposition

- `MutableIntState` (from `"MutableIntState(value="`). The hooks read one state per handle
  and one global state, so a finished lookup or a settings change recomposes exactly the rows
  that showed the account. Lookup results reach memory and the states together, on the main
  thread.

## Theme

- NewX keeps its theme in its own preferences file, `<package>_preferences`:
  `dark_mode_state` (`"0"` off, `"1"` on, otherwise follow the system) and
  `dark_mode_appearance` (`"dim"` or `"lights_out"`). It doesn't change the Activity's
  configuration, so `XTheme` reads these.

## Client events

- Every event passes through the reporter method `(LogEvent, Boolean)` with the string
  `"Skipping event with empty event name"` (`com.x.scribing.c1.j`). `Hooks.shouldDropEvent`
  runs first.
- The thrift classes under `com.x.thrift.clientapp.gen` keep their names. The patch checks
  the fields `Engagement` uses: `LogEvent.event_name` and `items`, `Item.tweet_details`, `id`
  and `item_type`, `TweetDetails.author_id`, `ItemType.value` and `ItemType.TWEET`.
- Post impressions (`...:impression`) and engagement events carry an `Item` of type `TWEET`
  with `tweet_details.author_id` set. `...:results` events mostly carry media items, and
  quoted posts use type `QUOTED_TWEET`.

## Cloud cache (x-posed)

- `GET https://x-posed-cache.xaitax.workers.dev/lookup?users=a,b` (<=100 handles), no auth.
  Result keys: l=location, d=source, a=location accurate, af=affiliation, id, t=timestamp.
- `POST /contribute` with `{"entries": {...}}`.
