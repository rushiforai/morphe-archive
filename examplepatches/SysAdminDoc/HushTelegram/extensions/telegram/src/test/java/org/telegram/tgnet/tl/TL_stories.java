/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet.tl;

/** Test stand-ins named like Telegram's story requests, which the extension tells apart by name. */
public final class TL_stories {
    private TL_stories() { }

    /** Marks stories up to an id seen. */
    public static class TL_stories_readStories { }

    /** Adds this account to the viewers of the stories it opened. */
    public static class TL_stories_incrementStoryViews { }

    /** Any other story request. */
    public static class TL_stories_getAllStories { }
}
