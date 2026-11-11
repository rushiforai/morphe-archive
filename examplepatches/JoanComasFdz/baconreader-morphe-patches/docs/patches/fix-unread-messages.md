<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixUnreadMessagesTests -->

# Fix unread messages

The orange inbox envelope turns back to normal once every message is read.

- "Mark read" on a message checks with Reddit whether unread messages are left. When none is, the menu's button loses
  the orange envelope, and BaconReader's new messages notification goes away. Before, the envelope stayed orange.
- "Mark unread" is gone from a message's menu: Reddit no longer supports it, so it did nothing.
- With Reddit chat's "Chat messages apart from the inbox" on, unread chat messages don't keep the envelope orange.

No settings.
