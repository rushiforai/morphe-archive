/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet.tl;

/** Test stand-ins named like Telegram's shared folder requests, which the extension tells apart by name. */
public final class TL_chatlists {
    private TL_chatlists() { }

    /** Adds a shared folder and joins its chats. */
    public static class TL_chatlists_joinChatlistInvite { }

    /** Looks a shared folder link up before adding it. */
    public static class TL_chatlists_checkChatlistInvite { }

    /** Joins the chats a shared folder you have gained since. */
    public static class TL_chatlists_joinChatlistUpdates { }

    /** Asks what a shared folder gained, which joins nothing. */
    public static class TL_chatlists_getChatlistUpdates { }
}
