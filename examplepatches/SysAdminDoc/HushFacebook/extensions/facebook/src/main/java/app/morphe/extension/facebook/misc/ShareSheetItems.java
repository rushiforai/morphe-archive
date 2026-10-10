/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the share sheet's item list hook asks. Facebook builds every share sheet from one method
 * that answers a list of item types, constants of one enum: SHARE_NOW, COPY_LINK, SEND_IN_WHATSAPP
 * and about ninety more. The hook goes in when Hide Meta upsells or Share sheet items is picked, and
 * each list it's handed comes here: Hide Meta upsells' Threads switch first, when that patch is in,
 * then the items picked in Share sheet items' list, when that one is. What's left keeps Facebook's
 * order.
 *
 * <p>Share sheet items also writes down the item types Facebook offers on this phone, so its list
 * shows the real ones beside the common ones. The picker and the written-down types follow
 * icysymmetra/tiktok-patches-for-morphe's Share sheet modification, which seeds the channels it
 * knows and adds the ones it sees.
 *
 * <p>Nothing picked, paused, settings that aren't ready yet, or a failure in here, and the list
 * goes through as it came.
 */
public final class ShareSheetItems {
    /** Counted under the patch's name each time a sheet loses an item. */
    static final String HIDDEN = "Share sheet item kept out";

    /** At most this many types are written down, so a renamed enum can't grow the setting forever. */
    static final int SEEN_LIMIT = 150;

    /**
     * The longest the list of types to keep out gets, in chars, each one byte in a settings file.
     * Room for every one of Facebook's ninety-odd types, and little enough that a settings file
     * holding it beside full word and sources lists still fits.
     */
    public static final int MAX_HIDDEN_CHARS = 2048;

    /**
     * The types the list offers before Facebook has shown a sheet, in the order a sheet usually has
     * them. Each is a constant of 581's item enum.
     */
    static final List<String> COMMON = Collections.unmodifiableList(Arrays.asList(
            "SHARE_NOW", "SEND_AS_MESSAGE", "ADD_TO_STORY", "SHARE_TO_GROUP", "SHARE_TO_PAGE", "COPY_LINK",
            "SHARE_TO_META_AI", "SHARE_TO_THREADS", "SEND_IN_WHATSAPP", "SEND_IN_WHATSAPP_STATUS",
            "SEND_IN_INSTAGRAM_DIRECT", "SHARE_TO_INSTAGRAM_STORY", "SEND_IN_SMS", "SHARE_TO_SNAPCHAT",
            "SEND_IN_TWITTER", "SHARE_TO_TELEGRAM", "SHARE_TO_DISCORD", "SHARE_TO_REDDIT"));

    /** An enum constant's name, the only thing the settings ever hold. */
    private static final Pattern TYPE = Pattern.compile("[A-Z][A-Z0-9_]*");

    private static final String FAMILY = FamilyNames.SHARE_SHEET_ITEMS;

    /** The types written down so far, read once, so a sheet that offers nothing new writes nothing. */
    @Nullable
    private static volatile Set<String> seen;

    private static volatile boolean logged;

    private ShareSheetItems() {
    }

    /**
     * The hook in front of each return of the method that picks the share sheet's items, handed the
     * list of item types. Answers the items to show in Facebook's order, or the list it was handed
     * when nothing comes out. The patch copies the answer back into an ImmutableList. Never throws.
     */
    @Nullable
    public static List<?> targets(@Nullable List<?> targets) {
        // PatchFamily names Settings, which mustn't load before the extension has its context.
        if (targets == null || targets.isEmpty() || !Utils.settingsReady()) return targets;
        List<?> kept = targets;
        try {
            if (PatchFamily.META_UPSELLS.inBuild()) kept = MetaUpsells.shareTargets(targets);
            if (kept == null || kept.isEmpty() || !PatchFamily.SHARE_SHEET_ITEMS.inBuild()) return kept;
            HookStatus.invoked(FAMILY);
            remember(kept);
            Set<String> hidden = parse(Settings.HIDDEN_SHARE_ITEMS.get());
            if (hidden.isEmpty()) return kept;
            List<Object> shown = null;
            for (int index = 0; index < kept.size(); index++) {
                Object item = kept.get(index);
                if (hidden.contains(type(item))) {
                    if (shown == null) shown = new ArrayList<>(kept.subList(0, index));
                } else if (shown != null) {
                    shown.add(item);
                }
            }
            if (shown == null) return kept;
            HookStatus.bound(FAMILY, "share sheet items");
            HookStatus.counted(FAMILY, HIDDEN);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Share sheet items: kept an item out of a share sheet");
            }
            return shown;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "share sheet items", failure);
            return kept;
        }
    }

    /** The types the list offers: the ones Facebook has shown, the common ones, then any picked earlier. */
    public static List<String> choices() {
        Set<String> all = new LinkedHashSet<>(parse(Settings.SEEN_SHARE_ITEMS.savedValue()));
        all.addAll(COMMON);
        all.addAll(parse(Settings.HIDDEN_SHARE_ITEMS.savedValue()));
        return new ArrayList<>(all);
    }

    /** The types picked to keep out, as saved. */
    public static Set<String> hidden() {
        return parse(Settings.HIDDEN_SHARE_ITEMS.savedValue());
    }

    /** Saves [types] as the ones to keep out, dropping anything that isn't a type. */
    public static void hide(Collection<String> types) {
        Settings.HIDDEN_SHARE_ITEMS.save(clean(join(types)));
    }

    /**
     * [saved] as the list of types to keep out is stored: each type once, in order, as far as
     * {@link #MAX_HIDDEN_CHARS} reaches. A type this build doesn't name is kept like any other, so
     * the items of a newer Facebook come through a settings file.
     */
    public static String clean(@Nullable String saved) {
        StringBuilder list = new StringBuilder();
        for (String type : parse(saved)) {
            int length = list.length() == 0 ? type.length() : list.length() + 1 + type.length();
            if (length > MAX_HIDDEN_CHARS) break;
            if (list.length() > 0) list.append(',');
            list.append(type);
        }
        return list.toString();
    }

    /** Whether [list] is a list of types to keep out exactly as {@link #clean} stores it. */
    public static boolean isClean(@Nullable String list) {
        return list != null && list.equals(clean(list));
    }

    /** How many types [list] names. */
    public static int count(@Nullable String list) {
        return parse(list).size();
    }

    /**
     * What the list calls [type]: Facebook's own name for the item where it's known, the app's
     * name for a share to another app, and otherwise the type read out in words.
     */
    public static String label(String type) {
        switch (type) {
            case "SHARE_NOW": return L10n.t("Share now");
            case "SEND_AS_MESSAGE": return L10n.t("Send in Messenger");
            case "ADD_TO_STORY": return L10n.t("Share to your story");
            case "SHARE_TO_GROUP": return L10n.t("Share to a group");
            case "SHARE_TO_PAGE": return L10n.t("Share to a Page");
            case "COPY_LINK": return L10n.t("Copy link");
            default:
                String app = appName(type);
                return app != null ? app : readable(type);
        }
    }

    /** The app a share to another app goes to, by its own name, which no language translates. */
    @Nullable
    static String appName(String type) {
        switch (type) {
            case "SHARE_TO_META_AI": return "Meta AI";
            case "SHARE_TO_THREADS": return "Threads";
            case "SEND_IN_WHATSAPP":
            case "SEND_AS_WHATSAPP":
            case "OFF_PLATFORM_WHATSAPP": return "WhatsApp";
            case "SEND_IN_WHATSAPP_STATUS": return "WhatsApp Status";
            case "SEND_IN_INSTAGRAM_DIRECT":
            case "SEND_IN_INSTAGRAM_MESSAGES": return "Instagram Direct";
            case "SHARE_TO_INSTAGRAM_STORY": return "Instagram Stories";
            case "SEND_IN_SMS": return "SMS";
            case "SEND_IN_TWITTER":
            case "OFF_PLATFORM_TWITTER": return "X";
            case "SHARE_TO_SNAPCHAT":
            case "OFF_PLATFORM_SNAPCHAT": return "Snapchat";
            case "SHARE_TO_TELEGRAM": return "Telegram";
            case "SHARE_TO_DISCORD": return "Discord";
            case "SHARE_TO_REDDIT": return "Reddit";
            case "SHARE_TO_PINTEREST": return "Pinterest";
            case "SHARE_TO_LINE": return "LINE";
            case "SHARE_TO_VIBER": return "Viber";
            case "SHARE_TO_KAKAO_TALK": return "KakaoTalk";
            case "SHARE_TO_ZALO": return "Zalo";
            case "SHARE_TO_IMO": return "imo";
            default: return null;
        }
    }

    /** [type] in words, as SHARE_TO_COWATCH reads "Share to cowatch". */
    static String readable(String type) {
        String words = type.replace('_', ' ').trim().toLowerCase(Locale.ROOT);
        return words.isEmpty() ? type : Character.toUpperCase(words.charAt(0)) + words.substring(1);
    }

    /** Writes down the types in [items] it hadn't yet, up to [SEEN_LIMIT], in the order they came. */
    static void remember(List<?> items) {
        Set<String> known = seen;
        if (known == null) known = parse(Settings.SEEN_SHARE_ITEMS.savedValue());
        Set<String> grown = null;
        for (Object item : items) {
            String type = type(item);
            Set<String> current = grown != null ? grown : known;
            if (type == null || current.contains(type) || current.size() >= SEEN_LIMIT) continue;
            if (grown == null) grown = new LinkedHashSet<>(known);
            grown.add(type);
        }
        if (grown == null) {
            seen = known;
            return;
        }
        seen = Collections.unmodifiableSet(grown);
        Settings.SEEN_SHARE_ITEMS.save(join(grown));
    }

    /** Forgets the cached written-down types, so the next sheet reads the setting again. Tests only. */
    static void forgetForTests() {
        seen = null;
        logged = false;
    }

    /** [item]'s type, the enum constant's name, or null when it isn't one. */
    @Nullable
    static String type(@Nullable Object item) {
        if (!(item instanceof Enum)) return null;
        String name = ((Enum<?>) item).name();
        return TYPE.matcher(name).matches() ? name : null;
    }

    /** The types in a saved list, in order, each once. Anything that isn't a type is dropped. */
    static Set<String> parse(@Nullable String saved) {
        Set<String> types = new LinkedHashSet<>();
        if (saved == null) return types;
        for (String part : saved.split(",")) {
            String type = part.trim();
            if (TYPE.matcher(type).matches()) types.add(type);
        }
        return types;
    }

    static String join(Collection<String> types) {
        return String.join(",", types);
    }
}
