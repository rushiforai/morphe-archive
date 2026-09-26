package app.morphe.ather;

import android.content.Context;
import android.content.Intent;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Adds a "Morphe settings" section to the Ather app's account screen.
 *
 * The section is inserted directly above the server-driven "General settings"
 * section rather than inside it. The account list is built from Ather's CMS
 * payload, so its rows can be renamed, reordered or removed at any time; a
 * section of our own cannot collide with that churn, and it keeps patch
 * settings visibly separate from Ather's own.
 *
 * The account screen builds its sections in
 * {@code com.ather.account.model.AccountSectionMapperKt.createAccountSectionList}.
 * That method is patched to route its result through {@link #inject(List)}.
 *
 * Row clicks are dispatched by
 * {@code com.ather.account.ui.account.k1.m(k1, String)}, which is patched to
 * call {@link #handle(String)} first. Rows whose id is not a known
 * {@code AccountDestinationEnum} fall through to their {@code deepLinkUrl}, so
 * the injected row carries {@link #SENTINEL} and never collides with a real
 * destination.
 *
 * The Ather model classes are reached by reflection so the companion can be
 * compiled without stubs. Every entry point swallows its exceptions: a failure
 * leaves the account screen exactly as Ather built it.
 */
public final class MorpheAccount {

    /** Deep-link value that identifies the injected row. */
    public static final String SENTINEL = "morphe://settings";

    /**
     * Item id used to place the injected section. {@code set_app_icon} is the
     * first row of the "General settings" section, so the new section is
     * inserted directly above it.
     */
    private static final String ANCHOR_ID = "set_app_icon";

    private static final String ITEM_ID = "morphe_settings";
    private static final String ITEM_TITLE = "Morphe settings";
    private static final String ITEM_DESCRIPTION = "Maps, analytics and ride log";
    private static final String SECTION_TITLE = "Morphe";

    private MorpheAccount() {
    }

    /**
     * Inserts a "Morphe" section immediately above the section that holds
     * {@link #ANCHOR_ID}. Returns a new list; the input is never modified.
     */
    public static List<?> inject(List<?> sections) {
        try {
            if (sections == null) {
                return null;
            }
            Object anchor = findAnchorItem(sections);
            if (anchor == null) {
                return sections;
            }
            Object item = buildItem(anchor);
            if (item == null) {
                return sections;
            }

            List<Object> out = new ArrayList<>(sections.size() + 1);
            boolean injected = false;
            for (Object section : sections) {
                if (!injected && section != null && containsItem(section, anchor)) {
                    out.add(buildSection(SECTION_TITLE, item));
                    injected = true;
                }
                out.add(section);
            }

            if (!injected) {
                out.add(buildSection(SECTION_TITLE, item));
            }
            return out;
        } catch (Throwable t) {
            return sections;
        }
    }

    /**
     * Passes a link through unchanged, except for the injected row's own link, which opens the
     * patch's screen and then yields {@code null} so the app's own blank check drops it.
     *
     * <p>This is the form the account screen uses: it replaces the url rather than answering a
     * question about it, so the app's own code path is left exactly as it was.
     */
    public static String route(String url) {
        if (!SENTINEL.equals(url)) {
            return url;
        }
        try {
            Context context = MapPref.appContext();
            if (context != null) {
                Intent intent = new Intent(context, MorpheMapSettingsActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
        } catch (Throwable t) {
            // Nothing to do: the row simply does not open.
        }
        return null;
    }

    private static Object buildItem(Object anchor) throws Exception {
        Constructor<?> constructor = Class
                .forName("com.ather.account.model.AccountSectionItem")
                .getDeclaredConstructor(
                        String.class,   // id
                        String.class,   // title
                        String.class,   // description
                        String.class,   // leadingIcon
                        String.class,   // trailingIcon
                        boolean.class,  // showBanner
                        String.class,   // subTitleColor
                        boolean.class,  // showSectionItem
                        boolean.class,  // loading
                        String.class,   // bannerTarget
                        List.class,     // banners
                        String.class,   // redirectUrl
                        String.class,   // deepLinkUrl
                        boolean.class,  // showNewTag
                        Class.forName("com.ather.account.model.AccountItemBadge"),
                        List.class,     // associatedOfferKeys
                        Class.forName("com.ather.common.datastore.models.TopAsset"));
        constructor.setAccessible(true);
        // The constructor rejects null id/title/description/leadingIcon/trailingIcon,
        // subTitleColor, bannerTarget, banners and associatedOfferKeys, so the icon
        // names are copied from the anchor row and the rest get empty values.
        Method getLeadingIcon = anchor.getClass().getMethod("getLeadingIcon");
        Method getTrailingIcon = anchor.getClass().getMethod("getTrailingIcon");
        return constructor.newInstance(
                ITEM_ID,
                ITEM_TITLE,
                ITEM_DESCRIPTION,
                getLeadingIcon.invoke(anchor),
                getTrailingIcon.invoke(anchor),
                false,
                "",
                true,
                false,
                "",
                new ArrayList<Object>(),
                "",
                SENTINEL,
                false,
                null,
                new ArrayList<Object>(),
                null);
    }

    /** Returns the first item whose id is {@link #ANCHOR_ID}, or null. */
    private static Object findAnchorItem(List<?> sections) {
        for (Object section : sections) {
            List<?> items = itemsOf(section);
            if (items == null) {
                continue;
            }
            for (Object item : items) {
                if (item == null) {
                    continue;
                }
                try {
                    Method getId = item.getClass().getMethod("getId");
                    if (ANCHOR_ID.equals(getId.invoke(item))) {
                        return item;
                    }
                } catch (Throwable t) {
                    // Treat an unreadable item as not ours.
                }
            }
        }
        return null;
    }

    private static boolean containsItem(Object section, Object wanted) {
        List<?> items = itemsOf(section);
        return items != null && items.contains(wanted);
    }

    private static List<?> itemsOf(Object section) {
        if (section == null) {
            return null;
        }
        try {
            return (List<?>) section.getClass().getMethod("getItems").invoke(section);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object buildSection(String title, Object item) throws Exception {
        List<Object> items = new ArrayList<>(1);
        items.add(item);
        return newSection(title, items);
    }

    private static Object newSection(String title, List<Object> items) throws Exception {
        Constructor<?> constructor = Class
                .forName("com.ather.account.model.AccountSection")
                .getDeclaredConstructor(String.class, boolean.class, List.class);
        constructor.setAccessible(true);
        return constructor.newInstance(title, true, items);
    }
}
