<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: RedditChatTests -->

# Reddit chat

Reddit's chat inside BaconReader, with its unread messages counted and notified.

- Chat in the menu, after the Inbox, shows the chat of Reddit's mobile website, www.reddit.com/chat, in place of the
  post list, under the toolbar titled "Chat". The menu still opens, and Refresh reloads the chat.
- Back goes back in the chat's pages, then to the post list. Choosing a feed leaves the chat.
- In the chat, other Reddit links open in BaconReader and other sites in the browser. Reddit chat links you tap
  elsewhere open the chat.
- The attach button opens Android's file picker. On Android 10 and later, the chat is dark with BaconReader's dark
  themes.
- Reddit also sends each chat message to the inbox, titled "[direct chat room]". They're left out of the inbox and of
  its orange envelope, counted next to Chat, such as "Chat (2)", and notified as chat messages, such as "2 new chat
  messages", while BaconReader's "Notify on messages" is on. Tap the notification to open the chat.
- Opening the chat marks them as read on Reddit and clears the count and the notification.

**Settings** (BaconReader → Settings → Patches, under "Chat"):
- **Chat messages apart from the inbox** (on by default): handles the chat messages Reddit sends to the inbox as above.
  Off, they stay in the inbox as before.

**Limits**:
- BaconReader's own login doesn't work on Reddit's website: log in once in the chat, with your user name and password.
  Google sign-in may not work inside the app; then set a password for your Reddit account on Reddit's website and use
  it. Each BaconReader account keeps its own chat login.
- Reddit has no app interface for its chat, so the chat is Reddit's website, and the unread count comes from
  BaconReader's own message check, when the app opens and at its update interval.
