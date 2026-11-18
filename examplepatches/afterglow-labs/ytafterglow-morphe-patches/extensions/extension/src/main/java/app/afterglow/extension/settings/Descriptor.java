package app.afterglow.extension.settings;

import app.afterglow.extension.i18n.L10n;

/**
 * One immutable description of a preference, action or destination, the same
 * shape as the iOS {@code YTAGPreferenceDescriptor}. Rows, search, Control
 * Center and defaults all read this table ({@link Registry#ALL}).
 */
public final class Descriptor {
    public enum Type { BOOLEAN, INTEGER, STRING, ACTION, DESTINATION }

    public static final int FLAG_ADVANCED = 1;
    public static final int FLAG_RESTART_REQUIRED = 1 << 1;

    public final Type type;
    public final String key;
    public final String titleKey;
    public final String fallbackTitle;
    public final String fallbackDescription;
    public final Category category;
    public final Object defaultValue;
    public final String destination;
    public final int flags;
    /** iOS capability name (e.g. "StandardPlayerControls"), or null when unconditional. */
    public final String capability;
    /** SF Symbol name used on iOS; mapped to a drawable by the settings UI. */
    public final String symbol;
    public final String[] aliases;

    public Descriptor(Type type, String key, String titleKey, String fallbackTitle, String fallbackDescription,
                      Category category, Object defaultValue, String destination, int flags,
                      String capability, String symbol, String[] aliases) {
        this.type = type;
        this.key = key;
        this.titleKey = titleKey;
        this.fallbackTitle = fallbackTitle;
        this.fallbackDescription = fallbackDescription;
        this.category = category;
        this.defaultValue = defaultValue;
        this.destination = destination;
        this.flags = flags;
        this.capability = capability;
        this.symbol = symbol;
        this.aliases = aliases;
    }

    public boolean isAdvanced() {
        return (flags & FLAG_ADVANCED) != 0;
    }

    public boolean isRestartRequired() {
        return (flags & FLAG_RESTART_REQUIRED) != 0;
    }

    /** True for values stored in preferences (Boolean, Integer and String rows). */
    public boolean isPersisted() {
        return type == Type.BOOLEAN || type == Type.INTEGER || type == Type.STRING;
    }

    public String descriptionKey() {
        return titleKey + "Desc";
    }

    public String title() {
        return L10n.get(titleKey, fallbackTitle);
    }

    public String description() {
        return L10n.get(descriptionKey(), fallbackDescription);
    }
}
