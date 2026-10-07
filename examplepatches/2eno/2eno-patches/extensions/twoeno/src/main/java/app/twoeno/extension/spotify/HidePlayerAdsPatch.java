package app.twoeno.extension.spotify;

/**
 * Disables ads embedded into playlists and video ads in the now playing view.
 */
@SuppressWarnings("unused")
public final class HidePlayerAdsPatch {
    private static final String EMBEDDED_AD_NPV_PLUGIN = "EmbeddedAdNpvPlugin";

    private HidePlayerAdsPatch() {
    }

    /**
     * Injection point: enum parameters of the embedded ad playlist properties constructor.
     *
     * @return The {@code NONE} constant of the enum, or the original value if there is none.
     */
    public static Object toNone(Object value) {
        if (!(value instanceof Enum)) return value;
        Object none = noneOf(((Enum<?>) value).getDeclaringClass());
        return none != null ? none : value;
    }

    /**
     * @return The {@code NONE} constant of the enum, or null.
     */
    public static Object noneOf(Class<?> enumClass) {
        Object[] constants = enumClass.getEnumConstants();
        if (constants == null) return null;
        for (Object constant : constants) {
            if (((Enum<?>) constant).name().equals("NONE")) return constant;
        }
        return null;
    }

    /**
     * Injection point: enabled parameter of the now playing view plugin entry constructor
     * {@code (String name, Object plugin, boolean enabled)}.
     */
    public static boolean isPluginEnabled(String pluginName, boolean enabled) {
        return enabled && !EMBEDDED_AD_NPV_PLUGIN.equals(pluginName);
    }

    /**
     * Same as {@link #isPluginEnabled(String, boolean)}, to pass all constructor parameters as a register range.
     */
    public static boolean isPluginEnabled(String pluginName, Object plugin, boolean enabled) {
        return isPluginEnabled(pluginName, enabled);
    }
}
