<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FlairFilterTests -->

# Flair filter

A "Flair" button in a subreddit's sort bar shows only the posts with the flairs you pick.

- On a subreddit, the sort bar shows "Flair". Front Page, All, Popular, Friends and multireddits don't have it.
- Tapping it opens "Show posts with flair": tick one or more flairs and tap "APPLY" to show only the posts with any of
  them. The sort bar then shows the chosen flairs, such as "Discussion, News".
- The list holds the subreddit's flairs as Reddit lists them. When a subreddit keeps its flairs private, it holds the
  flairs of the posts loaded so far, so scrolling the subreddit adds more.
- "CLEAR" shows all the posts again.

No settings.

**Limits**:
- The filter is a Reddit search in the subreddit, so it shows what Reddit's search finds. Search has no "Best" sort:
  with "Best", the filtered posts are sorted as "Hot".
