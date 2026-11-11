<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixLostPostVotesTests -->

# Fix lost post votes

A vote made on a post while its comments load stays on the post in the post list.

- Upvoting, downvoting or taking a vote back on a post whose comments are still loading now shows in the post list
  when you go back to it. BaconReader replaced the post with the copy that came with the comments, asked for before
  the vote, so the post showed as not voted. Reddit always got the vote.

No settings.
