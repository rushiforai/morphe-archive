# Deezer AA surface, queue and retained session

Reference implementation: `/Users/jneerdael/Scripts/Aurora`,
`base/app/src/main/java/app/myspoti/car/AuroraCarAppService.kt`.
DriveDeck's `CarAppConnection.onAppInfo` negotiates the lesser of host and
library maximum and checks the declared minimum. Its ordinary queue click
requires ACTION_SKIP_TO_QUEUE_ITEM and dispatches the exact provider queue ID.
Neither reference repository is changed.

Official contracts checked through Context7 and Android Developers:

- https://developer.android.com/training/cars/media
- https://developer.android.com/training/cars/media/enable-playback
- https://developer.android.com/training/cars/apps/media
- https://developer.android.com/training/cars/apps/library/set-up-project

Templated media requires CAL 8 and a registered MediaSession token. API 9-only
features must use the negotiated CarContext level. A selectable media queue
requires the queue, action bit, native callback and matching active item ID.

## Confirmed live failure

The owner's current Deezer playback snapshot has 31 queue rows, actions 257330
(without bit 4096) and active item ID -1. DriveDeck therefore does not dispatch
queue taps. This is not proof of the bridge's underlying rejection reason.

## Connected implementation batch

- Keep the existing `Allow any Android Auto host` name, matching other apps.
  Remove the template certificate option, parsing and extra-host array; use
  ALLOW_ALL_HOSTS_VALIDATOR like Aurora. Native custom-host admission remains
  the existing shared dependency. No caller certificates need to be entered.
- Declare CAL minimum 8 and retain the library's maximum-level resource of 9.
  Use SectionedItemTemplate and media styling only when the negotiated level is
  at least 9; retain the lower-level template fallback. Register Deezer's real
  native media token before rendering playback. Render provider artwork and
  subtitles without changing media IDs or selection dispatch.
- Add bounded, non-content queue rejection diagnostics. Preserve queue identity,
  generation checks, native eligibility and method results. These diagnostics
  close the missing evidence about why selection is suppressed; they do not
  themselves fix or validate selection.
- Port the existing `../deezer/morphe/src/PlaybackSessionPatch.kt` fix for both
  log.listen and log.batch_listen into the shared internal session dependency.
  The same original 9002703 class, prototypes and endpoint constants were
  verified. The previous standalone runtime investigation documents session
  invalidation by these requests and cached replay. Keep sign-in, refresh and
  explicit logout native, alongside the existing incomplete-save guard.
- Leave microG off by default and experimental. Its Google-account mismatch
  remains parked at the owner's request.

Acceptance remains: actual API 9 handshake/rendering in DriveDeck, a non-next
queue selection with matching active identity, and a retained login after cold
startup/rebinding. No build or diagnostic count substitutes for these results.

The live native state also omits PLAY and STOP despite concrete native callback
implementations for all five required standard actions. The queue-session export
now advertises those five while preserving native previous/next and conditional
queue-selection availability. Null media-ID extras receive an empty Bundle
before the original callback writes callingPackage. API9 presentation explicitly
includes the queue-selection dependency, retaining the genuine session token.

## First real acceptance and connected repair

The exported owner log `drivedeck-log (10).txt` proves a successful API 9
handshake: app 8..9, host 9 -> 9. It then records the service disconnecting.
Phone crash evidence identifies an Unsupported URI scheme exception from
CarIcon for android.resource artwork. Resource icons now use resource IDs;
content URIs and supplied bitmaps remain supported, and unsupported/missing
artwork cannot terminate browsing. The API 9 sectioned screen had not yet been
sent because row artwork construction threw first.

DriveDeck resolves the four standard car theme attribute names through the
provider's resources. The imported namespaced attributes alone were invisible
to that lookup. Add canonical public color attributes and values to the owned
car style, preserving the isolated library attributes and original app values.

The native source and playback CursorLoaders are independent. A valid queue
publication can precede playback-cursor readiness. Retain that publication and
retry mapping on later state only while its captured source remains current;
never relabel stale generations. Mapping freshness remains separate from
native selection eligibility. Reconciliation is bounded against recursion.

Queue diagnostic warnings now include the previously silent state-validation
exception class. Session diagnostics record only incomplete-save observations
and logged-out save caller stacks, without account values/tokens or changing
explicit logout. Session retention still needs a controlled fresh-login restart.
