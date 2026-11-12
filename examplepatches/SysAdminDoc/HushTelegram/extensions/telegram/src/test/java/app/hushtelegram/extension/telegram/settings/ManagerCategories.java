/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Morphe Manager's category for each patch, read from patches-list.json, and the settings page
 * that holds each category's switches. Tests hold the screen to this rather than to the page
 * list the screen itself reads.
 */
final class ManagerCategories {
    private ManagerCategories() {}

    /** Each category with switches to the page they sit on. Fixes and Settings have no page of their own. */
    static final Map<String, String> PAGES;

    static {
        Map<String, String> pages = new LinkedHashMap<>();
        pages.put("Ads", "Ads");
        pages.put("Search", "Ads");
        pages.put("Chats", "Chat list");
        pages.put("Stories", "Chat list");
        pages.put("Conversations", "Conversations");
        pages.put("Writing", "Conversations");
        pages.put("Playback", "Playback");
        pages.put("Notifications", "Notifications");
        pages.put("Interface", "Look and feel");
        pages.put("Theme", "Look and feel");
        pages.put("Privacy", "Privacy");
        PAGES = Collections.unmodifiableMap(pages);
    }

    /** The switch pages in the order the screen draws them. */
    static final List<String> PAGE_ORDER = Collections.unmodifiableList(Arrays.asList(
            "Ads", "Chat list", "Conversations", "Playback", "Notifications", "Look and feel", "Privacy"));

    /**
     * The families whose switches live on a page named for something other than their category:
     * the link switches have the Links page, update checks the Updates page, the push repair
     * (a fix) sits with the other notification switches, the crop guard (a fix) with the other
     * sending switches, and My messages (a search) with the other switches inside a chat.
     */
    static String pageOf(PatchFamily family) throws Exception {
        switch (family) {
            case OPEN_EXTERNAL_LINKS:
            case STRIP_LINK_TRACKING:
                return "Links";
            case DISABLE_UPDATE_CHECKS:
                return "Updates";
            case CROP_GUARD:
            case CAPTION_ORDER:
            case MY_MESSAGES:
                return "Conversations";
            case REPAIR_FIREBASE_PUSH:
                return "Notifications";
            default:
                String category = categories().get(family.patchName);
                if (category == null) throw new AssertionError(family.patchName + " isn't in patches-list.json");
                String page = PAGES.get(category);
                if (page == null) throw new AssertionError(family.patchName + "'s category " + category + " has no page");
                return page;
        }
    }

    /** Patch name to its Manager category. */
    static Map<String, String> categories() throws Exception {
        Map<String, String> categories = new HashMap<>();
        for (JSONObject patch : patches()) categories.put(patch.getString("name"), patch.getString("category"));
        return categories;
    }

    /** Patch name to the description Manager shows. */
    static Map<String, String> descriptions() throws Exception {
        Map<String, String> descriptions = new HashMap<>();
        for (JSONObject patch : patches()) descriptions.put(patch.getString("name"), patch.getString("description"));
        return descriptions;
    }

    private static List<JSONObject> patches() throws Exception {
        JSONArray patches = new JSONObject(new String(Files.readAllBytes(patchesList().toPath()),
                StandardCharsets.UTF_8)).getJSONArray("patches");
        JSONObject[] each = new JSONObject[patches.length()];
        for (int i = 0; i < each.length; i++) each[i] = patches.getJSONObject(i);
        return Arrays.asList(each);
    }

    /** patches-list.json at the repository root, found from wherever Gradle runs the test. */
    static File patchesList() {
        for (File dir = new File("").getAbsoluteFile(); dir != null; dir = dir.getParentFile()) {
            File candidate = new File(dir, "patches-list.json");
            if (candidate.isFile()) return candidate;
        }
        throw new AssertionError("no patches-list.json above " + new File("").getAbsolutePath());
    }
}
