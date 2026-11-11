<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: ImprovePostMediaLoadingTests -->

# Improve post media loading

Post media shows how far its download is, galleries open faster, and you choose which link post pages run JavaScript.

- While a post's image, GIF or video loads, a progress bar shows over a dimmed preview of it, in place of
  BaconReader's spinner. A GIF also shows its size, such as "GIF · 0.4 MB", and how much of it has arrived.
- When the media fails to load, the bar stops and turns red, instead of a spinner that never ends.
- A gallery's thumbnail strip loads small previews, not every full image, and the image shown loads with a progress
  bar over its preview.
- A RedGIFs video that is gone shows "This RedGIFs video was deleted" or "This RedGIFs video was not found", instead
  of RedGIFs' broken web page.
- The page of a link post, in its Slide Show View, runs JavaScript by the settings below. BaconReader allowed it only
  on a short, old list of sites, so many pages showed nothing. BaconReader's own browser always runs it.

**Settings** (BaconReader → Settings → Patches):
- **Preview while loading** (on by default, under "Images and videos"): shows the dimmed preview behind the progress
  bar. Off, only the progress bar shows.
- **JavaScript in link posts** (on by default, under "Links"): every site runs JavaScript, except the blocked sites.
  Off, only the allowed sites do.
- **Blocked sites** (empty by default, under "Links"): sites that never run JavaScript while JavaScript in link posts is
  on. One per line, subdomains included.
- **Allowed sites** (under "Links"): sites that run JavaScript while JavaScript in link posts is off. One per line,
  subdomains included. It starts with BaconReader's own list, without the sites that shut down, plus Bluesky and x.com.
