/*
 * YTAfterglow for Android.
 *
 * The filtering flow (identifier and path search, then the filter's own check)
 * follows the Litho filter of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), itself forked from
 * ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3).
 * Modified for YTAfterglow: preference-gated filters, lazily encoded proto
 * bytes, and no list item removal. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.extension.litho;

import android.util.Log;

import java.util.List;

import app.afterglow.extension.Afterglow;

/**
 * Entry point of the Litho filter.
 *
 * <p>The patch calls {@link #isFiltered} at the end of YouTube's element
 * conversion ({@code Lvnf;->a} in 21.43.523). When it answers true, YouTube
 * gets an EmptyComponent instead of the component it built, so the element
 * takes no space. YouTube's own code has already run in full by then.
 *
 * <p>This runs for every component YouTube converts, on Litho's layout threads.
 * When no pattern matches, it allocates nothing and reads no preferences: the
 * identifier and path go through prefix trees of every registered pattern, and
 * only a hit reads the group's preferences and asks the filter.
 *
 * <p>To find what to match, run {@code adb shell setprop log.tag.YTAGLitho DEBUG}
 * and restart YouTube: every component is logged to {@code adb logcat -s YTAGLitho}
 * with its identifier, accessibility and path. {@code VERBOSE} also logs the
 * printable strings of each element's proto, which is slow.
 */
public final class LithoFilterPatch {
    static final String LOG_TAG = "YTAGLitho";
    private static final boolean LOG_COMPONENTS = isLoggable(Log.DEBUG);
    private static final boolean LOG_BUFFERS = isLoggable(Log.VERBOSE);

    private static final TrieSearch.Text IDENTIFIER_SEARCH = new TrieSearch.Text();
    private static final TrieSearch.Text PATH_SEARCH = new TrieSearch.Text();
    private static final ThreadLocal<LithoComponent> COMPONENT = ThreadLocal.withInitial(LithoComponent::new);

    static {
        // Never let a filter that fails to load break class initialization:
        // YouTube calls isFiltered directly, and a failed initializer would crash it.
        try {
            for (LithoFilter filter : LithoFilters.all()) {
                register(IDENTIFIER_SEARCH, filter, filter.identifierCallbacks, LithoFilter.MatchType.IDENTIFIER);
                register(PATH_SEARCH, filter, filter.pathCallbacks, LithoFilter.MatchType.PATH);
            }
            if (LOG_COMPONENTS) {
                Log.d(LOG_TAG, "Litho filters: " + IDENTIFIER_SEARCH.patternCount() + " identifier and "
                        + PATH_SEARCH.patternCount() + " path patterns");
            }
        } catch (Throwable error) {
            Afterglow.error("LithoFilterPatch: filters failed to load", error);
        }
    }

    private LithoFilterPatch() {}

    private static boolean isLoggable(int level) {
        try {
            return Log.isLoggable(LOG_TAG, level);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void register(TrieSearch.Text search, LithoFilter filter, List<StringFilterGroup> groups,
                                 LithoFilter.MatchType matchType) {
        String filterName = filter.getClass().getSimpleName();
        for (StringFilterGroup group : groups) {
            for (CharSequence pattern : group.patterns) {
                search.addPattern(pattern, (startIndex, length, parameter) -> {
                    if (!group.isEnabled()) return false;

                    LithoComponent component = (LithoComponent) parameter;
                    try {
                        boolean hide = filter.isFiltered(component, group, matchType, startIndex);
                        if (hide && LOG_COMPONENTS) {
                            Log.d(LOG_TAG, filterName + " hid " + matchType + " match: " + component.describe(false));
                        }
                        return hide;
                    } catch (Throwable error) {
                        // A broken filter keeps the component; the other filters still decide.
                        Afterglow.error(filterName + ".isFiltered", error);
                        return false;
                    }
                });
            }
        }
    }

    /**
     * Injection point, called for every converted Litho element.
     *
     * @param context           YouTube's conversion context.
     * @param element           the element proto being converted (YouTube's {@code Lwdi;}).
     * @param accessibilityId   accessibility id of the element's button view model, or "".
     * @param accessibilityText accessibility text of the element's button view model, or "".
     * @return true to replace the component with an EmptyComponent.
     */
    public static boolean isFiltered(LithoContext context, Object element,
                                     String accessibilityId, String accessibilityText) {
        try {
            if (context == null) return false;
            String identifier = context.afterglow_getIdentifier();
            StringBuilder path = context.afterglow_getPathBuilder();
            if (identifier == null || identifier.isEmpty() || path == null || path.length() == 0) return false;

            LithoComponent component = COMPONENT.get();
            component.reset(context, element, identifier, path, accessibilityId, accessibilityText);
            try {
                if (LOG_COMPONENTS) Log.d(LOG_TAG, component.describe(LOG_BUFFERS));
                return IDENTIFIER_SEARCH.matches(identifier, component) || PATH_SEARCH.matches(path, component);
            } finally {
                component.clear();
            }
        } catch (Throwable error) {
            Afterglow.error("LithoFilterPatch.isFiltered", error);
            return false;
        }
    }
}
