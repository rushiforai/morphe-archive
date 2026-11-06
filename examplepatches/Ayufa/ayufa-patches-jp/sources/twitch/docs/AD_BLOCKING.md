# Ad blocking

The patches use Twitch's native no-ad responses and direct Twitch playlists.
They do not route playback through an external stream proxy.

## Coverage

| Surface | Handling |
| --- | --- |
| Live preroll and midroll video | The IVS HTTP hook replaces detected ad playlists with compatible live segments from alternate player contexts. |
| Native player ad requests | The ad presenter starts in Twitch's disabled state. Changing this setting requires an app restart. |
| Native display ads | The display-ad parser returns Twitch's no-ad result. |
| Following headliner | The request completes with an empty result. |
| React Native feed cards and headliner | Requests complete with no fill; ad items and active headliner state are removed. |
| React Native player display ads | Display surfaces are disabled, including the vertical banner's reserved space. |
| Creator sponsorships | Channel Skins banners and branded avatars are hidden in native layouts; React Native ribbon queries, cached creatives and campaign state are suppressed. |
| React Native stream-ad overlays | Countdown and welcome-banner state follow the stream-ad setting. |
| Turbo and subscription promotions | Separate patches control purchase prompts and discount banners. |

Hook contracts are resolved against each original APK. Full rebuild results and
remaining device checks are recorded in [compatibility data](../config/compatibility.json).
Stories do not currently have verified ad coverage.

## Live playlists

Backup preparation begins when a live master playlist arrives. The selected
rendition is available before the first background poll starts. Playback also
checks for a backup that completed during its foreground search before returning
the original playlist.

Replacements require a clean playlist, known live sequence numbers and compatible
codecs. Matching quality is preferred. Lower compatible renditions can be used
when the requested quality is unavailable. Session cancellation, rendition changes
and disabling the patch discard or isolate their associated state.

The foreground search has a 2.2-second budget. If no usable alternative is found,
playback retains the original media. This can allow an ad to appear briefly until
a clean alternative becomes available. Unsupported playlists are also retained.

Sponsorship visibility follows the existing display-ad toggle. Native layouts
retain the current rendering state for restoration, and React Native layouts use
Twitch's query-skip path. No app restart is required for this setting.

## Further improvements

Reviewed on 2026-10-29: [TwitchAdSolutions](https://github.com/pixeltris/TwitchAdSolutions),
its [vaft implementation](https://github.com/pixeltris/TwitchAdSolutions/blob/master/vaft/vaft.user.js)
and the [0rpi fork](https://github.com/0rpi/twitch-adblock-userscript).
TwitchAdSolutions is archived. These browser implementations use alternate streams,
lower-quality fallback and segment stripping. Their playback recovery cannot be
applied directly to Android's IVS player.

- Refresh an alternate token and master when a previously clean source starts
  returning ads. Evaluate with captured playlists and a bounded retry budget.
- Evaluate an additional player context with its matching token platform and
  rendition checks. Adding a context name alone does not reproduce web behavior.
- Evaluate an optional wait-for-clean-playback policy separately. Upstream segment
  stripping can suspend playback until ads end and relies on browser-specific
  segment substitution and recovery.

Ad reports should include the app and patch versions, channel, player layout,
approximate time, and whether the interruption was ad video or a remaining banner.
