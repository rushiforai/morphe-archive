package app.lchanc3.extension.jptt;

import androidx.fragment.app.Fragment;

import java.util.Arrays;

/**
 * The extra tab these patches add to JPTT's settings.
 *
 * <p>{@code SettingsPagerAdapter} derives everything from one string array of
 * tab titles built in its static initialiser: how many tabs there are, what each
 * is called, and how large the array of fragments it caches them in needs to be.
 * So the tab is added by lengthening that array as it is stored, which leaves
 * {@code getCount()} and {@code getPageTitle()} untouched and correct.
 *
 * <p>That leaves {@code getItem()}, whose switch has no case for the new
 * position and falls through to returning null.
 */
@SuppressWarnings("unused")
public final class SettingsTab {

    public static final String TITLE = "lchanc3";

    /** Where the app's own tabs end, learned from the array being extended. */
    private static volatile int extraPosition = -1;

    /** Called from {@code SettingsPagerAdapter.<clinit>} as the array is stored. */
    public static String[] withExtraTab(String[] appTitles) {
        if (appTitles == null) {
            return null;
        }
        extraPosition = appTitles.length;
        String[] extended = Arrays.copyOf(appTitles, appTitles.length + 1);
        extended[appTitles.length] = TITLE;
        return extended;
    }

    /**
     * Called from the branch of {@code getItem()} that has no tab of its own to
     * return. Null for every position but ours, which is what that branch did.
     */
    public static Fragment fragment(int position) {
        return position == extraPosition ? new PatchSettingsFragment() : null;
    }

    private SettingsTab() {
    }
}
