/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import java.util.Arrays;
import java.util.List;

/** Asks the chat list hooks the way Chats does. */
public final class ChatListForTests {
    private ChatListForTests() {
    }

    /** Three tiles, as the tile state hands them over. */
    static List<String> tiles() {
        return Arrays.asList("your note", "a friend note", "a friend who is active");
    }

    /** True when the hook handed back something other than the tiles it was given: the switch changing what Chats draws. */
    public static boolean dropsTheNotesTiles() {
        List<String> tiles = tiles();
        return ChatList.notesTiles(tiles) != tiles;
    }

    /** True when a promotion banner's show question would answer no for Facebook. */
    public static boolean hidesAPromotion() {
        return ChatList.hidesPromotion();
    }
}
