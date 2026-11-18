# Changelog

## 1.7.9

### Twitter / X

- **"Bypass native certificate validation (X)" is now default-off**, as its v1.7.7 description
  already stated. It was shipping default-on, which silently disabled X's native server-cert
  validation for everyone who didn't untick it. Only select it to MITM-inspect your own traffic.

## 1.7.8

### Feeld (9.10.0)

- **Removed "Unblur profile photos".** Nulling expo-image's `blurRadius` did not reveal gated
  profile photos on-device, so the patch is dropped rather than shipped broken.

## 1.7.7

### Twitter / X (12.7.1)

**"Show media tab for sensitive profiles" — reworked into a proper restriction bypass.**

- The empty profile Media tab ("@user hasn't posted media") is a **server-side** restriction: when
  a profile's media is sensitive and the viewer is not authorised for sensitive content (e.g. an
  age/region-restricted viewer account), the server returns `media_timeline_v2` empty on every
  client — the web grid is empty for the same viewer too. No client-side "show sensitive media"
  unmasking can fill it, because the media is never delivered to that operation.
- The patch now bypasses this by rebuilding the Media tab from the posts-and-replies timeline
  (`user_with_profile_tweets_and_replies_query_v2`), which is **not** withheld the same way, trimmed
  to the owner's own posts that carry media. Reposts (which carry the original author) are excluded.
- **Fallback only, never an unconditional swap** (fixes the v1.6.0 over-application bug where
  non-restricted profiles such as media-rich accounts showed only ~2 items): a profile keeps using
  the server's media grid and only falls back to posts-and-replies once its media timeline has
  actually come back empty.
- **Fixed the repost leak:** filtered entries are now written back by mutating the list in place
  (`clear`/`addAll`) rather than by reflective assignment to the `final` list field, which silently
  no-ops on current ART — so reposts are now actually removed, not just intended to be. The filter
  is also per-entry fail-open so one malformed entry can't abort the whole pass.
- Limitation: posts-and-replies is a sparser source than the real media grid, so an account that
  mostly reposts shows few own-media items, and older own media appears only as you scroll. A
  restricted profile also needs one Media-tab refresh to fill in (the fallback arms after the first
  empty response).

**New: "Bypass native certificate validation (X)"** — optional, off by default. Stubs X's custom
`X509TrustManager` (`com.x.android.io.impl.d`) so an intercepting proxy with a user-installed CA can
read X's native API traffic. For inspecting your own device's traffic; pair with the universal MITM
patches. Leave off for normal use.

## 1.6.0

### Twitter / X (12.7.1)

- Added "Show media tab for sensitive profiles" and "Hide GIF replies from media tab".
