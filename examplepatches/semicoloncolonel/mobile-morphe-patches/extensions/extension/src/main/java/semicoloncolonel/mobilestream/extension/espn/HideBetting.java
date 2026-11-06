package semicoloncolonel.mobilestream.extension.espn;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Hides sports betting in ESPN by answering the app's own betting switches.
 */
@SuppressWarnings("unused")
public final class HideBetting {
    private static final String PREFS = "sportsBettingPrefs";

    private HideBetting() {
    }

    /**
     * Each value read from ESPN's betting settings file: the "hide" switches
     * read as on, and the betting features read as off. Other files and keys
     * pass through.
     */
    public static boolean pref(String file, String key, boolean value) {
        if (!PREFS.equals(file) || key == null) return value;
        switch (key) {
            case "hideSportsBetting":
            case "hideSportsBettingAmount":
                return true;
            case "sixPackEnabled":
            case "myBetsModuleEnabled":
            case "betContainerAsyncContentEnabled":
            case "soccerThreePackEnabled":
            case "sportsBettingAccountLinkingEnabled":
            case "espnBetAccountLinked":
                return false;
            default:
                return value;
        }
    }

    /**
     * The betting features ESPN sends with each request, all turned off, as
     * ESPN does for users under 18.
     */
    @SuppressWarnings("unchecked")
    public static void featuresOff(Map<?, ?> features) {
        if (features == null) return;
        try {
            for (Map.Entry<Object, Object> entry : ((Map<Object, Object>) features).entrySet()) {
                entry.setValue("false");
            }
        } catch (Throwable ignored) {
        }
    }

    /** A team or league page's sections without the odds sections. */
    public static List<?> sections(List<?> sections) {
        if (sections == null || sections.isEmpty()) return sections;
        try {
            List<Object> out = null;
            for (int i = 0; i < sections.size(); i++) {
                Object section = sections.get(i);
                if (isOdds(section)) {
                    if (out == null) out = new ArrayList<>(sections.subList(0, i));
                } else if (out != null) {
                    out.add(section);
                }
            }
            return out == null ? sections : out;
        } catch (Throwable t) {
            return sections;
        }
    }

    private static boolean isOdds(Object section) {
        return "nativeOdds".equalsIgnoreCase(string(section, "getType"))
                || "content:bets".equalsIgnoreCase(string(section, "getUid"));
    }

    private static String string(Object target, String getter) {
        try {
            Method method = target.getClass().getMethod(getter);
            Object value = method.invoke(target);
            return value instanceof String ? (String) value : null;
        } catch (Throwable t) {
            return null;
        }
    }
}
