/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.ather;

import android.content.Context;
import android.content.Intent;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Owns the account screen row and keeps the stock rows working.
 *
 * The section list is built from Ather's CMS payload. The row is inserted directly
 * above the server-driven `General settings` section; when that section is absent the
 * section is appended at the end instead.
 *
 * Two server-side changes broke the stock rows on patched builds, so {@link #inject}
 * also repairs them before the screen reads the list:
 *
 * 1. The app resolves each row's destination from its id through
 *    {@code AccountDestinationEnum.fromString}, which compares case-sensitively against
 *    uppercase names such as {@code VOICE_ASSISTANT}. Rows whose id no longer matches
 *    are rewritten to the uppercase name so the app opens its own screen again.
 * 2. Rows with a web link are routed through {@link #route}, which hands
 *    {@code https://app.atherenergy.com/...} links to {@link MorpheWebActivity} so they
 *    open inside the app instead of an external browser.
 */
public final class MorpheAccount {
    private static final String SENTINEL = "morphe://settings";
    private static final String GENERAL_SETTINGS_TITLE = "General settings";

    /** The item id of the Morphe row. */
    private static final String ITEM_ID = "morphe_settings";
    private static final String ITEM_TITLE = "Morphe settings";
    private static final String ITEM_DESCRIPTION = "Maps, analytics and ride log";
    private static final String SECTION_TITLE = "Morphe";

    /**
     * The destination names the app resolves row ids against. The CMS has started
     * sending lowercase variants, which the case-sensitive lookup no longer matches.
     */
    private static final String[] KNOWN_DESTINATIONS = {
        "ACCESSORIES", "ADD_A_SCOOTER", "ATHER_COMMUNITY", "CHAT_BOT",
        "CUSTOMER_REFERRAL", "DELETE_DEACTIVATE", "EDUCATION_CENTER", "LABS",
        "LOGOUT", "MANAGE_SCOOTERS", "NEW_FEATURES", "NOTIFICATION",
        "PRIVACY_POLICY", "PURCHASE_TERMS", "SET_APP_ICON", "SMART_HELMETS",
        "SUBSCRIPTION", "TRUE_HEALTH", "VOICE_ASSISTANT", "WARRANTY",
    };

    private MorpheAccount() {
    }

    /**
     * Adds the Morphe row above the General settings section and repairs the stock
     * rows. Returns the input list untouched when anything goes wrong.
     */
    public static List<?> inject(List<?> sections) {
        if (sections == null) {
            return null;
        }
        try {
            fixStockRows(sections);

            Object item = findAnyItem(sections);
            if (item == null) {
                return sections;
            }
            Object morpheItem = buildItem(item);
            if (morpheItem == null) {
                return sections;
            }
            Object section = newSection(SECTION_TITLE, true, toList(java.util.Arrays.asList(morpheItem)));
            if (section == null) {
                return sections;
            }

            List<Object> out = new ArrayList<>(sections.size() + 1);
            boolean inserted = false;
            for (Object existing : sections) {
                if (!inserted && GENERAL_SETTINGS_TITLE.equalsIgnoreCase(titleOf(existing))) {
                    out.add(section);
                    inserted = true;
                }
                if (existing != null) {
                    out.add(existing);
                }
            }
            if (!inserted) {
                out.add(section);
            }
            return out;
        } catch (Throwable t) {
            return sections;
        }
    }

    /**
     * Routes a clicked row link. Returns null when this patch consumed the link, so the
     * app's own dispatch skips it.
     */
    public static String route(String url) {
        if (url == null || SENTINEL.equals(url)) {
            Context context = MapPref.appContext();
            if (context != null) {
                Intent intent = new Intent(context, MorpheMapSettingsActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
            return null;
        }
        if (url.startsWith("morphe://web?")) {
            String target = url.substring("morphe://web?".length());
            Context context = MapPref.appContext();
            if (context != null && !target.isEmpty()) {
                Intent intent = new Intent(context, MorpheWebActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                intent.putExtra(MorpheWebActivity.EXTRA_URL, target);
                context.startActivity(intent);
            }
            return null;
        }
        if (isWebLink(url)) {
            Context context = MapPref.appContext();
            if (context != null) {
                Intent intent = new Intent(context, MorpheWebActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                intent.putExtra(MorpheWebActivity.EXTRA_URL, url);
                context.startActivity(intent);
            }
            return null;
        }
        return url;
    }

    /**
     * True for links that open a real web page. The app's own screens use the
     * {@code https://app.atherenergy.com/app/...} deep links and must pass through
     * to the app's navigation graph untouched.
     */
    private static boolean isWebLink(String url) {
        if (url.startsWith("https://www.atherenergy.com/") || url.startsWith("http://www.atherenergy.com/")
                || url.startsWith("https://shop.atherenergy.com/") || url.startsWith("http://shop.atherenergy.com/")) {
            return true;
        }
        return url.startsWith("https://app.atherenergy.com/buyer-agreement")
                || url.startsWith("https://app.atherenergy.com/login_to_discourse_via_token");
    }

    /**
     * The app's own deep link for a stock row, keyed by the row id the server sends.
     * These are the app's navigation-graph routes, so the app opens its own screen.
     * Rows without a route (or web-only rows) return null and stay untouched.
     */
    private static String routeFor(String id) {
        if (id == null) {
            return null;
        }
        switch (id) {
            case "subscription":
                return "https://app.atherenergy.com/app/subscription";
            case "warranty":
                return "https://app.atherenergy.com/app/warranty";
            case "voice_assistant":
                return "https://app.atherenergy.com/app/explore-ather-voice";
            case "labs":
                return "https://app.atherenergy.com/app/ather-labs";
            case "true_health":
                return "https://app.atherenergy.com/app/ather-true-health";
            case "manage_scooters":
                return "https://app.atherenergy.com/app/manage-or-add-scooter";
            case "purchase_terms":
                return "morphe://web?" + "https://app.atherenergy.com/buyer-agreement";
            case "privacy_policy":
                return "morphe://web?" + "https://www.atherenergy.com/ather-app-privacy-policy";
            default:
                return null;
        }
    }

    /**
     * Rewrites each stock row id to the uppercase destination name the app's
     * case-sensitive lookup expects, when the lowercase form is what broke it.
     */
    private static void fixStockRows(List<?> sections) {
        for (Object section : sections) {
            if (section == null) {
                continue;
            }
            List<?> items = itemsOf(section);
            if (items == null) {
                continue;
            }
            for (Object item : items) {
                if (item == null) {
                    continue;
                }
                try {
                    String id = stringOf(item, "getId");
                    String deep = stringOf(item, "getDeepLinkUrl");
                    String redirect = stringOf(item, "getRedirectUrl");
                    Log.i("MorpheAccount", "row title=" + invokeGetter(item, "getTitle")
                        + " id=" + id
                        + " deep=[" + deep + "] redirect=[" + redirect + "]");
                    if (isBlank(deep)) {
                        String target = !isBlank(redirect) ? redirect : routeFor(id);
                        if (isBlank(target)) {
                            continue;
                        }
                        Field field = findField(item.getClass(), "deepLinkUrl");
                        if (field != null) {
                            field.setAccessible(true);
                            field.set(item, target);
                            Log.i("MorpheAccount", "filled deep link -> " + target);
                        } else {
                            Log.i("MorpheAccount", "no deepLinkUrl field");
                        }
                    }
                } catch (Throwable t) {
                    Log.i("MorpheAccount", "row repair failed: " + t);
                }
            }
        }
    }

    /**
     * Maps the row the user sees to the destination the app routes on. The server
     * no longer sends ids the routing table recognises, so the visible title is
     * the stable key.
     */
    private static String destinationFor(Object item) {
        String title;
        try {
            title = (String) invokeGetter(item, "getTitle");
        } catch (Exception ignored) {
            title = null;
        }
        if (title != null) {
            String name = title.trim();
            if ("Voice assistant".equalsIgnoreCase(name)) {
                return "VOICE_ASSISTANT";
            }
            if ("App / Notification settings".equalsIgnoreCase(name)) {
                return "NOTIFICATION";
            }
            if ("Delete / De-activate account".equalsIgnoreCase(name)) {
                return "DELETE_DEACTIVATE";
            }
            if ("My subscriptions".equalsIgnoreCase(name)) {
                return "SUBSCRIPTION";
            }
            if ("Warranty".equalsIgnoreCase(name)) {
                return "WARRANTY";
            }
            if ("My Scooter".equalsIgnoreCase(name)) {
                return "MANAGE_SCOOTERS";
            }
            if ("Smart Helmets".equalsIgnoreCase(name)) {
                return "SMART_HELMETS";
            }
            if ("Accessories".equalsIgnoreCase(name)) {
                return "ACCESSORIES";
            }
            if ("Ather Community".equalsIgnoreCase(name)) {
                return "ATHER_COMMUNITY";
            }
            if ("Purchase terms".equalsIgnoreCase(name)) {
                return "PURCHASE_TERMS";
            }
            if ("Terms & privacy policy".equalsIgnoreCase(name)) {
                return "PRIVACY_POLICY";
            }
            if ("Logout".equalsIgnoreCase(name)) {
                return "LOGOUT";
            }
            if ("Ather labs".equalsIgnoreCase(name)) {
                return "LABS";
            }
        }
        // The server may still send a usable id under a different case.
        String id;
        try {
            id = (String) invokeGetter(item, "getId");
        } catch (Exception ignored) {
            id = null;
        }
        if (id != null && id.length() > 0) {
            String upper = id.toUpperCase();
            if (!id.equals(upper) && isKnownDestination(upper)) {
                return upper;
            }
        }
        return null;
    }

    private static String stringOf(Object item, String getter) {
        try {
            Object value = invokeGetter(item, getter);
            return value instanceof String ? (String) value : null;
        } catch (Exception ignored) {
            return null;
        }
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private static boolean isKnownDestination(String upper) {
        for (String known : KNOWN_DESTINATIONS) {
            if (known.equals(upper)) {
                return true;
            }
        }
        return false;
    }

    private static String titleOf(Object section) {
        try {
            Object title = invokeGetter(section, "getSectionTitle");
            if (title instanceof String) {
                return (String) title;
            }
            title = invokeGetter(section, "getTitle");
            if (title instanceof String) {
                return (String) title;
            }
        } catch (Throwable ignored) {
            // Fall through to the empty title.
        }
        return "";
    }

    private static Object invokeGetter(Object target, String name) throws Exception {
        Method method = target.getClass().getMethod(name);
        return method.invoke(target);
    }

    private static Field findField(Class<?> type, String name) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
                // Keep walking up.
            }
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    private static List<Object> toList(List<?> source) {
        List<Object> out = new ArrayList<>(source.size());
        out.addAll(source);
        return out;
    }

    private static Object buildItem(Object anchor) {
        try {
            String leadingIcon = iconOf(anchor, "getLeadingIcon");
            String trailingIcon = iconOf(anchor, "getTrailingIcon");
            Class<?> type = Class.forName("com.ather.account.model.AccountSectionItem");
            for (java.lang.reflect.Constructor<?> constructor : type.getDeclaredConstructors()) {
                Class<?>[] parameters = constructor.getParameterTypes();
                if (parameters.length != 17
                        || parameters[0] != String.class
                        || parameters[1] != String.class
                        || parameters[2] != String.class
                        || parameters[5] != boolean.class
                        || parameters[7] != boolean.class
                        || parameters[8] != boolean.class
                        || parameters[10] != List.class
                        || parameters[13] != boolean.class) {
                    continue;
                }
                constructor.setAccessible(true);
                return constructor.newInstance(
                        ITEM_ID, ITEM_TITLE, ITEM_DESCRIPTION,
                        leadingIcon, trailingIcon,
                        false, "", true, false, "", new ArrayList<>(),
                        "", SENTINEL, false, null, new ArrayList<>(), null);
            }
        } catch (Throwable ignored) {
            // Fall through to the null return.
        }
        return null;
    }

    private static Object newSection(String title, boolean showSection, List<Object> items) {
        try {
            Class<?> type = Class.forName("com.ather.account.model.AccountSection");
            for (java.lang.reflect.Constructor<?> constructor : type.getDeclaredConstructors()) {
                Class<?>[] parameters = constructor.getParameterTypes();
                if (parameters.length == 3
                        && parameters[0] == String.class
                        && parameters[1] == boolean.class
                        && parameters[2] == List.class) {
                    constructor.setAccessible(true);
                    return constructor.newInstance(title, showSection, items);
                }
            }
        } catch (Throwable ignored) {
            // Fall through to the null return.
        }
        return null;
    }

    private static Object findAnyItem(List<?> sections) {
        for (Object section : sections) {
            if (section == null) {
                continue;
            }
            List<?> items = itemsOf(section);
            if (items == null) {
                continue;
            }
            for (Object item : items) {
                if (item != null) {
                    return item;
                }
            }
        }
        return null;
    }

    private static String iconOf(Object item, String getter) {
        try {
            Object value = invokeGetter(item, getter);
            return value == null ? "" : value.toString();
        } catch (Throwable ignored) {
            return "";
        }
    }

    @SuppressWarnings("unchecked")
    private static List<?> itemsOf(Object section) {
        try {
            return (List<?>) invokeGetter(section, "getItems");
        } catch (Throwable ignored) {
            return null;
        }
    }
}
