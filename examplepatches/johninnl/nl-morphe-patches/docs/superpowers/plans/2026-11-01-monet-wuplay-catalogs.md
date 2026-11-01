# Dedicated Monet Wuplay catalog rows

Implement the user's requested Wuplay-only Monet patch in this repository, based on the reviewed Monet 1.1.0 catalog integration. Accept only original `com.klevico.monet` 1.1.0 / 134 / minSdk 26, signer `4bec386a6baae56f0694d3be54f67e0625b973109e0dbb947df2a5d0254975e0`.

- [x] Verify the supplied original APK against complete native method fingerprints and public ABI before any mutation. Strengthen the inherited fingerprints with array payload and exception-table coverage, backed by four negative mutation regressions.
- [x] Add an opt-in **Individual Wuplay catalog rows** patch with a dedicated Java extension. Read only `app.wuplay.androidtv` preview channels with `santodan-launcher/wuplay/` provider IDs. Use Wuplay labels/icons and stable owner/provider-based row identities; preserve native content modes and channel filters.
- [x] Use a foreground, debounced worker subscription independent of Recommendations. Keep successful empty catalogs selectable, retain a saved unavailable selection, preserve shared-title membership and row-local hidden titles, bound reads, retain last successful snapshots on failure, and cancel observers/results on pause. No Nuvio mode or legacy Monet 1.0.97 bindings.
- [x] Reuse only the required modern native hooks; omit obsolete aggregate-reader fallback hooks. Preserve the original native items and launch intents.
- [x] Add tests executing the actual production adapter and observer against the checked modern ABI, including mixed publishers and spoofed prefixes. Apply the real bundle to the supplied APK; independently audit all native methods and extension class ownership.
- [x] Exercise the patched Monet with published Wuplay channels on an isolated TV test install. Preserve physical-device installations; report runtime scope precisely.
- [x] Add bilingual setup documentation, exact evidence and upstream GPL attribution. Prepare a reviewable feature branch without manually changing release versions or generated metadata.

Wuplay's publisher is already released on main in v1.11.0. This patch does not add premium/card controls or modify that publisher. A separate approval is required before promoting this new app patch to main under AGENTS.md.

Verification is recorded in `docs/monet-wuplay-validation.md`.
