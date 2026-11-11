<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: MarkdownEditorTests -->

# Markdown editor

A big text box with Reddit's formats above it and a character counter, for comments, replies, edits, messages and
text posts.

- The text box takes the screen, instead of a few lines. On the reply screen, the comment you reply to keeps at most
  a third of it.
- A bar of Reddit's formats replaces BaconReader's "A" button: "Bold", "Italic", "Strikethrough", "Superscript",
  "Spoiler", "Inline code", "Link", "Heading", "Bulleted list", "Numbered list", "Quote", "Code block", "Table" and
  "Horizontal line". They format the selected text, or the text at the cursor.
- The text shows formatted while you type. The markdown marks stay, dimmed, and the text sent is the same.
- A counter shows the characters against Reddit's limit, such as "0 / 10,000" for comments and messages and
  "0 / 40,000" for posts. It changes color near the limit, and turns red past it.
- For a text post, the counter follows the subreddit's own rules once you type it: "5 / 100 (min. 10)", or "No text in
  r/linksonly" when the subreddit takes no text.

No settings.
