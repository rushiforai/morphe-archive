/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */

package app.morphe.extension.pinedrama.share;

import java.util.Locale;

/** One spelling for each share action's key, whichever form the sheet hands over. */
public final class ShareActionCatalog {
    private ShareActionCatalog() {
    }

    public static String canonical(String value) {
        if (value == null) return "";
        String key = value.trim().toLowerCase(Locale.ROOT).replace('_', ' ').replace('-', ' ');
        switch (key) {
            case "copy":
            case "copy link":
                return "copy";
            case "not interested":
            case "dislike":
                return "dislike";
            case "save video":
            case "download":
            case "save":
                return "save";
            case "create group":
            case "im create group":
                return "im create group";
            case "why this post":
            case "why this video":
                return "why this video";
            case "add to story":
            case "share to story":
                return "share to story";
            case "set as wallpaper":
            case "live photo":
                return "live photo";
            case "promote":
            case "promote for others fyp":
                return "promote for others fyp";
            default:
                return key;
        }
    }
}
