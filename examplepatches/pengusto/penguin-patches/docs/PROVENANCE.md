# License and visual provenance

The original `penguin-patches-banner-tailor.png` was AI-generated with OpenAI's built-in Imagegen on 2026-10-23, using the maintainer-provided purple profile banner as a reference for the penguin's identity only. The textile-mending scene, colors and composition were developed independently. That light illustration and its Imagegen dark companion remain unchanged in `docs/assets/`.

The README keeps those original light/dark banners, as explicitly requested by the maintainer on 2026-10-28. Its tagline is native text. The proposed replacement heroes are not part of the final assets. [Asset inventory and maintenance notes](assets/README.md).

The [patch comparison gallery](PATCH_EXAMPLES.md) reuses unedited, previously published screenshots and names the source beside every pair. Remote images are pinned to immutable commits. Most are Android emulator captures of original and Morphe-patched official APKs with synthetic fixtures. Three comparisons have different scopes: Finamp title validation uses real Flutter widget-test captures; Calendar HTML shows a previous versus revised Morphe patch; Infinity+ compares Breal 1.4.123 with the Penguin patch. These distinctions remain visible beside the images.

The Finamp APK images come from the [2026-10-28 evidence](../tests/finamp/evidence/2026-10-28/README.md). The before APK contains official original native code, re-signed with a disposable test certificate for same-key updates. The artist-credit pair uses Dark theme; artist-page loading uses Light before and Dark after. The theme difference is a fixture choice, not patch behavior. Recorded checksums and limits remain in the evidence directory. The gallery links the separate source-widget provenance for the title example; it does not present those widgets as APK captures. The original APK's stale Save state is recorded separately, but its before-image is obscured by the keyboard.

The Morphe link button is a local SVG containing plain text and a purple background. It uses no Morphe logo. The illustrations and button do not establish rights to third-party branding or app assets.

Repository code is distributed under [GPL-3.0](../LICENSE), with the additional project-name terms retained in [NOTICE](../NOTICE). The project began from [Morphe's official patches template](https://github.com/MorpheApp/morphe-patches-template), initial template commit `d4fa104`. Morphe is referenced for compatibility; Penguin Patches uses its own project name.

[NOTICE](../NOTICE) and the app guides credit upstream app source behavior, issue authors and reference implementations. Preserve those credits when redistributing derived work. The repository license does not transfer ownership of upstream app or Morphe branding, third-party app assets or APKs; original APKs come from their respective upstream releases. The source QR represents a URL, while linked UI captures document the upstream app and patched behavior with synthetic fixtures.
