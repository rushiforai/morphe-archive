# Hook map (NewX, X 12.40)

NewX is the Jetpack Compose rewrite of X. R8 renames almost every class and member, and the
names change between releases. The patch therefore never names an obfuscated member. It finds
each one at patch time from something stable: a `toString` string, a kept type, a signature
shape or the code around it. If any of these finds zero or several candidates, the patch stops
with a `PatchException`. The names below are from 12.37.2-prod.01 and 12.40.1-prod.01 and are
only examples.

## Working rules

These rules keep the patch safe across X releases. Follow them for every new hook.

- Never write an obfuscated name into the patch. Anchor on `toString` labels, strings, kept
  types (thrift, AndroidX, Kotlin) and signature shapes.
- Fail closed. Every lookup must find exactly one candidate and check its type (`single`,
  `requirePublic`, `requireDefinedIn`). Zero or several candidates stop the patch.
- Keep injected smali small. It loads registers and calls a static method in the extension;
  the logic lives in Java. Members the extension needs are reached through stubs whose bodies
  the patch writes (`ComposeBridge`, `ModelBridge`), not through reflection, so `d8` checks
  every reference.
- In stub smali, give each path its own `return`. ART's verifier types a register that two
  paths write as their common superclass, and returning that as `String` rejects the whole
  stub class: every call into it then throws `VerifyError`. `d8` doesn't catch this.
- Every hook catches its exceptions and falls back to X's own behaviour, so X's code path runs
  unchanged. Hooks called for every model object also turn their feature off after the first
  failure, so a changed release can't flood the log.
- Filters send no requests of their own. They read only what X already loaded, and profile
  details stay in memory. The one change to X's requests: while a saved filter needs profile
  details, X's own timeline queries ask for them (see "Profile details in timelines").
- Verify each change: patch the APKM alone and together with piko, run `d8` on the patched
  dex files, and decompile the injected code with jadx to check the resolved members. Then
  run ART's verifier: sign the patched APK, install it on an emulator, run `adb shell cmd
  package delete-dexopt com.twitter.android`, clear logcat, run `adb shell cmd package compile
  -m verify -f com.twitter.android`, and check that `adb logcat -d | grep "dex2oat.*Verification
  error"` names no `app.xposed` class and no class the patch changed.
- Unit-test pure logic in `extensions/extension/src/test`.
- Never commit decompiled X code.

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

- The focal post composable: static, first parameter the `AvailablePost` type (from
  `"AvailablePost(entryId="`), second its `authorAppealPivot` type (`x1.a`). X calls it only for
  the post opened in a conversation, through `FocalPostState`. The patch stops unless a class
  with `"FocalPostState(timelinePostState="` has fields of the `authorAppealPivot` type and
  `Long` (the view count) and the composable takes a `Long`.
- Timeline rows: static composables whose first parameter is the `AvailablePost` type and that
  call a `(Instant, User, ...)` header which reaches the name row class (`ports.appbar.j.b`
  for posts, replies and thread posts, `h.a` for condensed posts). Both take the row's
  `PaddingValues` (`y2`).
- Quote cards: of the composables with consecutive parameters `(User, Instant, String)`, the
  one that calls the others (`quote.c.c`). It only highlights: the composer's quote preview,
  Grok cards and Spaces use it too.
- The post composables and the quote card call `Hooks.onPost(user, post, modifier, composer,
  padding, focal)` at entry. The quote card passes `null` for the post, so the quote rules
  apply: location warnings and post languages don't hide quotes, as in X-Posed. `Hooks.HIDE`
  returns at once, so nothing is drawn. Any other result replaces the `Modifier` argument; the
  patch clears its `$default` and `$changed` bits so the composable uses and compares it.
  `focal` is true only from the focal post composable, which is highlighted, not hidden,
  unless an account filter matched.
- Highlight: `Modifier.drawWithContent` (told apart from `drawBehind` and `drawWithCache` by
  its node's draw method), then the `android.graphics.Canvas` reached through the draw scope,
  `CanvasDrawScope`, `DrawParams` (from `"DrawParams(density="`) and `AndroidCanvas`. A
  composable's restart lambda keeps the modifier our hook gave it, so `Highlights` maps each
  highlighted modifier back to the original and the hooks start from that.
- People lists: the item with `"TimelineUserState(user="` renders the whole row in its
  `(LazyItemScope, Boolean, PaddingValues, Modifier, Composer, Int)` method (`urt.items.user.k.a`);
  List members wrap it (`"ListMembersTimelineUserState(timelineUserState="`) and render it with a
  method of the same shape. `Hooks.onPersonRow(user, modifier)` only highlights. Rows without a
  follow button are the signed-in account's own.

### Collapsed posts

- X's notice for posts it can't show, `(RichText, RichText, Function1, Modifier, Function0,
  Composer, Int)` (`ports.buttons.y0.g`): the only static method of that shape whose first two
  parameters share a type. `RichText` is checked by its `"RichText(text="` `toString`, built
  with `(String, false, Natural, emptyList())`.
- The quote item, `(item, Boolean, Modifier, Composer, Int)` with `instance-of UnavailablePost`
  and a call to the notice (`ports.user.p.p`), calls `Hooks.onQuote(author, quotedPost,
  modifier, composer)` at entry. In Hide mode it draws the notice and returns, so the card and
  its border are not drawn. `Modifier.fillMaxWidth` is the factory that produces the notice's
  modifier in that item; `Modifier.padding(PaddingValues)` is the one X uses before the notice
  in its own unavailable timeline rows.
- "Show" adds the post to a reveal set and writes a `MutableIntState` the hook read, which
  recomposes the item with X's own card.

### Lists and related posts

- List timelines: X's timeline screen provides its component through a CompositionLocal that
  holds a wrapper (`urt.ui.c1`). The patch finds X's own reader of it (a `Composer` consume
  whose result is cast to the wrapper) and the List component, the class whose constructor
  takes `ListsTimelineArgs` (`"ListsTimelineArgs(listId="`). `ComposeBridge.timelineHost` reads
  the local in a post hook; `ModelBridge.isListTimeline` checks the component's class. Lists
  pinned to Home use the same component.
- Related posts: `CanonicalPost` also gives `author`, `repliedPostId`,
  `repliedToUserScreenName` and `quotedStatusId`, which `Observed` keeps as post relations
  (`PostRelations`, 5000 posts). `AvailablePost.quotePostState` is the quoted post shown in a
  row. With "Hide replies and quotes of filtered posts", a row whose quoted post or chain of
  replied and quoted posts (up to 32 steps) has a matching author becomes the notice.

### Filter data (`ModelBridge`)

`badges/Models.kt` writes the bodies of `ModelBridge`'s stubs. Each member comes from a
`toString` label and is checked against the type that declares it.

- User interface accessors are found through the getters `MinimalUser` (`g5`) implements
  them with: `name`, `profileDescription`, `verifiedType`, `userLabel`, `entities`,
  `relationshipCounts`, `parodyCommentaryFanLabel` and `friendship`.
- Enum constants (`Government`, `Parody`, `Commentary`, `Fan`) are read from the static
  fields each enum's `<clinit>` assigns after building the constant with that name, not from
  `name()`, which R8 may strip.
- `RelationshipCounts.following`, `UserLabel.description` (the affiliation),
  `PostEntityList.urls` and `UrlEntity.expandedUrl` (links in the bio).
- `Friendship.isFollowedByMe` (`i3`): whether the signed-in account follows the user. X's
  timeline query fetches it (`relationship_perspectives.following`), and it is false when X
  doesn't say, so only a reported follow exempts an account from the filters.
- `AvailablePost.postId` and `currentUserIdentifier`, the signed-in account. Posts by the
  signed-in account are never filtered.
- Timeline users are `MinimalUser`s, which have no profile location, website or post count.
  Every constructor of `ProfileUser` (`i8`, fields `location`, `website`, `tweetCounts`), which
  X builds when a profile is opened, calls `Hooks.onProfileUser`, and `Observed` keeps those
  details in memory. For timelines, see the next section.
- Post languages: X's timeline posts don't carry a language. Every constructor of
  `CanonicalPost` (`com.x.models.v0`, fields `id` and `language`) calls
  `Hooks.onCanonicalPost`, which records the language by post ID in `Observed`.

### Profile details in timelines

- X's timeline queries include the `UserProfileOnly` fragment of each user only when the
  variable `include_profile_info` is true, which X sets only for profile lookups.
- Apollo writes an operation's variables in two static methods of one class (`api.g0`): as
  JSON for the request (`withDefaultValues = false`) and as a map the parser evaluates
  `@include` with. The patch finds the JSON one as the `(Executable, Adapters) -> String` call
  in X's request composer (the method with `"https://api.x.com/graphql"` returning an Apollo
  HTTP request), and the map one as its sibling with the same parameters.
- Both call `Hooks.beginVariables(operation)` first; the JSON result goes through
  `Hooks.variablesJson`, and the map through `Hooks.variablesMap` where it is cast. When a saved
  filter needs profile details, "Use profile details" is on, and the operation's `name()` is a
  post timeline that X always loads from the network, both say `true`. Otherwise they return
  X's values unchanged.
- The GraphQL user to `MinimalUser` mapper (static, `(GraphqlUser) -> MinimalUser`, with
  `"Missing GraphqlUser.screen_name for "`) calls `Hooks.onGraphqlUser` first. It reads
  `rest_id` and `userProfileOnly` (`location.location`, `website.url`, `tweet_counts.tweets`,
  and `profile_bio.entities.url.graphqlEntitySet.urls`, whose `url` matches the website to its
  `expanded_url`), as X does for `ProfileUser`.

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
