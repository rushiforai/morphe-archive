<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: SpoofClientTests -->

# Spoof client

You can log in to Reddit again, and BaconReader loads your feeds.

- Reddit stopped accepting BaconReader's own login when BaconReader shut down in 2023. The patch logs in as another
  Reddit app, RedReader by default: Reddit's login asks to connect "RedReader (Release)" with your account.
- Advanced: when patching, you can set the client ID of another Reddit app, such as an "Installed app" of your own
  from https://www.reddit.com/prefs/apps, with its redirect URI and user agent.

No settings.
