<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: PromptToOpenRedditLinksTests -->

# Prompt to open Reddit links

BaconReader asks once to set up Reddit links to open in it, which Android doesn't let an app do by itself.

- Since Android 12, Android opens Reddit links only in the apps you select for them: reddit.com verifies only Reddit's
  own app.
- While no Reddit link opens in BaconReader, the main screen asks "Open Reddit links with BaconReader?", with "Not now"
  and "Set up".
- "Set up" opens Android's "Open by default" screen for BaconReader: tap "Add link", tick the Reddit links and tap
  "Add".
- Either answer, or closing the question, stops it: it isn't asked again. The links can be set up later in Android's
  settings: App info → Open by default.

No settings.
