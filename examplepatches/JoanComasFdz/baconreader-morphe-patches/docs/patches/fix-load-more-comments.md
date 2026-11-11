<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixLoadMoreCommentsTests -->

# Fix load more comments

"load more comments" loads the hidden comments again.

- Since October 2026, Reddit refuses apps the request behind "load more comments", so the hidden replies and the
  comments at the end of a long post never loaded.
- When Reddit refuses it, the comments are loaded another way Reddit still allows: a comment's hidden replies, and
  the rest of a long post's comments, 50 at a time, with a new "load more comments" for the next ones.
- Comments Reddit no longer has, deleted or removed, drop out of the list.

No settings.
