# Anghami behaviour specs

Target application: `com.anghami`, version 8.0.28 (version code 8000280).

| # | Behaviour | Spec | Default | Risk |
|---|---|---|---|---|
| 1 | Block ads between tracks | [audio-ads.md](audio-ads.md) | yes | low |
| 2 | Block promotional popups | [promotional-popups.md](promotional-popups.md) | yes | low |
| 3 | Remove sponsored content | [sponsored-content.md](sponsored-content.md) | yes | low |
| 4 | Expand download limits | [download-limits.md](download-limits.md) | yes | medium |
| 5 | Show profile Plus badge | [profile-plus-badge.md](profile-plus-badge.md) | yes | medium |
| 6 | Plus entitlement state | [plus-entitlement.md](plus-entitlement.md) | yes | high |
| 7 | Stock signature assertion | [signature-assertion.md](signature-assertion.md) | yes | high |
| 8 | Full lyrics access | [lyrics-access.md](lyrics-access.md) | yes | high |
| 9 | Disable forced shuffle | [forced-shuffle.md](forced-shuffle.md) | yes | medium |
| 10 | Unlimited track skips | [track-skips.md](track-skips.md) | yes | medium |
| 11 | Disable analytics and crash reporting | [analytics.md](analytics.md) | yes | high |
| 12 | Hide Gold upsell | [gold-upsell.md](gold-upsell.md) | yes | low |
| 13 | Hide upgrade banners | [upgrade-banners.md](upgrade-banners.md) | yes | medium |
| 14 | Disable in-app rating prompt | [rating-prompt.md](rating-prompt.md) | yes | low |
| 15 | Allow screenshots | [screenshots.md](screenshots.md) | yes | medium |
| 16 | Hide premium feature buttons | [premium-buttons.md](premium-buttons.md) | yes | medium |
| 17 | Hide shuffle badges | [shuffle-badges.md](shuffle-badges.md) | yes | medium |
| 18 | Hide in-feed ad banners | [feed-ad-banners.md](feed-ad-banners.md) | yes | low |
| 19 | Ignore the forced update requirement | [forced-update.md](forced-update.md) | yes | medium |
| 20 | Disable first-party Silo telemetry | [silo-telemetry.md](silo-telemetry.md) | yes | low |

## Status

All twenty specs are `derived` and implemented: audio ads, in-feed ad banners,
promotional popups, sponsored content, download limits, lyrics, forced shuffle,
shuffle badges, premium buttons, screenshots, track skips, analytics, Silo
telemetry, the rating prompt, the profile Plus badge, the Plus entitlement state,
the Gold upsell, the upgrade banners, the stock signature assertion and the forced
update requirement.

`derived` means the behaviour has a spec, a record of how it was derived and an
implementation that builds and applies. It does not mean it has been checked on a
device: no test device is available to this project yet, so every spec still
carries unchecked acceptance criteria.

## Notes on defaults

All twenty behaviours are enabled by default, including the four that change
server-facing state or remove diagnostics: entitlement state, signature assertion,
analytics and Silo telemetry. This preserves the behaviour set of the collection
this project replaces and is recorded as decision `0004`.

The risk of each behaviour is stated in its spec. A user who does not want one of
the high-risk behaviours disables it in the manager; the bundle does not make that
choice for them.

## Not included

Behaviours that exist in other collections but are absent from this project are
not listed here on purpose. If they are wanted, they are new work: a new spec,
new derivation, new implementation.
