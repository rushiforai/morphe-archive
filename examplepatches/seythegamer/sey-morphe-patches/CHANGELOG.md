# Changelog

All notable changes to the **Sey Morphe Patches** bundle are documented here.
Morphe Manager reads this file from the repository root and shows the entries
for every version newer than the installed bundle.

## 1.2.7 (2026-11-22)

### ✨ New Features

* **KICK: Live Streaming:** All patches are enabled by default. Disable them individually in SEYTTINGS.
* **KICK: Live Streaming - CHAT BACKGROUND:** New SEYTTINGS toggle for a pure black chat panel on AMOLED screens. On by default. Requires the SEYTTINGS patch.
* **KICK: Live Streaming - DEFAULT SPLIT VIEW:** New SEYTTINGS toggle to open streams in video/chat split view. A chat mode you pick yourself in the app still wins. On by default. Requires the SEYTTINGS patch.
* **KICK: Live Streaming - EMOTES:** New Emote size option: Native or Twitch-like, for both third-party and KICK image emotes. Twitch-like by default. Requires the SEYTTINGS patch.
* **KICK: Live Streaming - CHAT TEXT SIZE:** Two options, Native or Twitch-like (larger text, wider spacing, lighter messages and bolder usernames). Twitch-like by default. Requires the SEYTTINGS patch.
* **KICK: Live Streaming - CHAT SIZE:** Three options, Native, Twitch-like (about 25% of the screen) or Big. Twitch-like by default, chat resizing on. Requires the SEYTTINGS patch.
* **KICK: Live Streaming - HIDE PINNED:** The pinned message card is hidden by default. Disable the toggle in SEYTTINGS to show it again.

### 🐛 Bug Fixes

* **KICK: Live Streaming - SEYTTINGS:** The tweaks menu now opens with the OK button instead of as soon as the row gains focus.

## 1.2.6 (2026-11-15)

### ✨ New Features

* **Twitch - DEFAULT HOME TAB:** Added a SEYTTINGS toggle that opens the chosen tab (Home, Following, Browse or Search) automatically on every Twitch TV launch instead of the stock start tab. Requires the SEYTTINGS patch.

## 1.2.5 (2026-11-14)

### ✨ New Features

* **KICK: Live Streaming - STOP ON MINIMIZE:** Added a SEYTTINGS toggle that stops playback (audio/video) when the app is minimized or exited, so nothing keeps playing in the background. Open a stream again to resume.
* **KICK: Live Streaming - DEFAULT HOME DESTINATION:** Added a SEYTTINGS option that opens the chosen tab (Home, Categories, Live, Following or Settings) automatically when KICK starts. "Home" keeps the stock behaviour.

## 1.2.4 (2026-11-11)

### ✨ New Features

* **KICK: Live Streaming - HIDE PINNED:** Added a SEYTTINGS toggle that removes the pinned message card and the ad banner attached to it from the top of the chat.
* **KICK: Live Streaming - SKIP 18+ WARNING:** Added a SEYTTINGS toggle that auto-accepts the 18+ mature content warning, so a mature stream starts without the extra click.
* **Twitch - SKIP 18+ WARNING:** Added a SEYTTINGS toggle that auto-accepts the 18+ mature content warning, so a mature stream starts without the extra click.
* **Twitch - HIDE PINNED:** Added a SEYTTINGS toggle that hides the pinned message card above the chat, its "Pinned by" label, the pin badge and any pinned highlight in the message list.

## 1.2.3 (2026-11-10)

### ✨ New Features

* **KICK: Live Streaming - CHAT TEXT SIZE:** Chat messages now get Twitch-like breathing room: the message list uses a 10 dp gap instead of the stock 2 dp whenever the tweak is active, while the Off preset keeps the stock spacing.

## 1.2.2 (2026-11-09)

### ✨ New Features

* **Twitch - Changelog:** Release notes are now published in `CHANGELOG.md`, so Morphe Manager can show what changed after every update.
* **KICK: Live Streaming - Changelog:** Release notes are now published in `CHANGELOG.md`, so Morphe Manager can show what changed after every update.

### 📝 Other

* **Bundle:** Added `CHANGELOG.md` to the release files and documented the per-release changelog step in the README.

## 1.2.1 (2026-11-09)

### 🐛 Bug Fixes

* **Twitch - SEYTTINGS:** The tweak list now scrolls inside a capped dialog, so every function and label stays reachable with the D-pad and the **Close** button stays pinned at the bottom.
* **KICK: Live Streaming - SEYTTINGS:** The tweak list now scrolls inside a capped dialog, so every function and label stays reachable with the D-pad and the **Close** button stays pinned at the bottom.

## 1.2.0 (2026-11-09)

### ✨ New Features

* **Twitch - AMOLED:** Added a toggle that paints the page, letterbox bars and chat panel pure black (`#000000`) while the player, text and badges keep Twitch's colours.

## 1.1.0 (2026-11-09)

### ✨ New Features

* **Twitch - AD BLOCK:** Added an HLS playlist filter that removes stitched ads on live streams and falls back to an ad-free player type during a break.

## 1.0.0 (2026-11-09)

### ✨ New Features

* **Twitch - SEYTTINGS:** Added the native red SEYTTINGS dialog and the first Twitch TV tweaks: **EMOTES** and **EXPAND CHAT**.
* **KICK: Live Streaming - SEYTTINGS:** Added the native red SEYTTINGS dialog and the first KICK tweaks: **EMOTES**, **CHAT SIZE**, **CHAT TEXT SIZE** and **EXPAND CHAT**.
