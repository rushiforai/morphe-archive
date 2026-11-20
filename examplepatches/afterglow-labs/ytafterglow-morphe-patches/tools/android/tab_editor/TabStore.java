package app.afterglow.extension.settings;

import java.util.ArrayList;
import java.util.List;

/** In-memory preference fixture. Never reads or changes the installed app. */
public final class TabStore {
    public static final int MINIMUM_ACTIVE_TABS = 2;
    public static int maximum = 11;
    public static int writes;
    public static List<String> active = new ArrayList<>();
    public static void reset(int limit, List<String> tabs) { maximum = limit; active = new ArrayList<>(tabs); writes = 0; }
    public static int maximumActiveTabs() { return maximum; }
    public static List<String> currentActiveTabs() { return new ArrayList<>(active); }
    public static void setActiveTabs(List<String> tabs) { active = new ArrayList<>(tabs); writes++; }
}
