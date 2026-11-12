# v2.0.0-dev.1-12 local verification candidate

Source-only changes, based on 5c8d9c7e277670eff8315e4d058731bb9f621cf2.

- Align the live-screen overflow glyph with the native overflow weight
- Offer normal or popup playback on tapping a live listing
- Keep nicoid on-screen while opening the service-owned live popup
- Show explicit access requirement tags (paid, member-free, partial-free)
- Warn only when the watch-page API explicitly reports canWatch=false
- Remove local watch-history items or cancel remote timeshift reservations on long press

The reservation cancellation uses DELETE https://live2.nicovideo.jp/api/v2/timeshift/reservations?programIds=lv... and refreshes the server list only after a 2xx response.

Not yet validated on a device or built into the Morphe MPP. To build, use the README, v1.11.1 base MPP, and the original nicoid 6.49 APK.
