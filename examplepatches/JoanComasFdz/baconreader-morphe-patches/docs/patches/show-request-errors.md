<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: ShowRequestErrorsTests -->

# Show request errors

A failed Reddit request shows its real error instead of BaconReader's message that it stopped working in July 2023.

- The error says what went wrong, such as "reddit: 500 Internal Server Error", or Reddit's own explanation when it sends
  one, such as "reddit: You need to be a moderator to do that".
- When the connection drops, the error is "The target server failed to respond".
- BaconReader's Reddit requests have no timeout: a slow answer keeps the feed loading.

No settings.
