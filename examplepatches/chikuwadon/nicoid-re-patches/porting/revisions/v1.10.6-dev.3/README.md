# v1.10.6-dev.3 — Actions lockfile, gesture UX and audio focus

Development verification only; maintains the previous version's compatibility.

- GitHub Actions: official machine-generated `.github/workflows/actions.lock`
  from gh-actions-lock v0.4.1; verify provenance in CI; preserve SHA-pinned
  upstream actions and weekly Dependabot updates
- Gesture sensitivity: keep the primary label as before and render the second
  line of explanation smaller in grey, on initial display and slider updates
- Gesture instruction: remove only the final Japanese/English/Chinese period
- Gesture vertical-only recognition: default OFF, applying to UD, DU, UDU,
  DUD and other vertical-only combinations; retain mixed horizontal strokes
- Gesture switch title: 上下方向のみのジェスチャーを認識
- Gesture switch summary: OFFの場合、上下方向のみの操作をジェスチャーとして認識せず、スクロールを継続します
- Other settings: optional オーディオフォーカス toggle, default OFF, with
  concise localized summary
- Audio focus: use existing normal-player AudioFocusHelper and native
  popup/background listener only when user has enabled the setting
- Preserve existing playback handoff, background playback, popup handling,
  tabs, gesture assignments, video history and downloads
- Published releases, main and issues remain untouched

Device/runtime verification is necessary before approving an official release.
