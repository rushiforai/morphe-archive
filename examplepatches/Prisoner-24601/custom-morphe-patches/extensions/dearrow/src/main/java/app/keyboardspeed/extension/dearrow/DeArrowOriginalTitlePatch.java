package app.keyboardspeed.extension.dearrow;

import android.util.Log;

import java.lang.reflect.Field;
import java.util.Locale;
import java.util.Set;

/**
 * Shows both the DeArrow title and the original title, such as "DeArrow title | Original title",
 * in the order chosen in the patch options.
 * <p>
 * The patch makes the DeArrow code of the official Morphe YouTube patches always fetch the original
 * title of a video that has a DeArrow title, and passes both titles to {@link #combineTitles}.
 */
@SuppressWarnings("unused")
public final class DeArrowOriginalTitlePatch {
    private static final String TAG = "DeArrowOriginalTitle";

    private static final String DEARROW_REQUEST_CLASS =
            "app.morphe.extension.youtube.patches.dearrow.DeArrowBrandingRequest";

    private static boolean initialized;

    /**
     * Titles that Morphe treats as DeArrow titles, such as for showing the DeArrow icon.
     * Null if not found, and then the combined titles are shown without the icon.
     */
    private static Set<String> deArrowTitles;

    private DeArrowOriginalTitlePatch() {
    }

    /**
     * Text between the DeArrow title and the original title.
     * The body is replaced at patch time with the separator chosen in the patch options.
     */
    private static String getSeparator() {
        return " | ";
    }

    /**
     * If the original title is shown before the DeArrow title.
     * The body is replaced at patch time with the order chosen in the patch options.
     */
    private static boolean isOriginalTitleFirst() {
        return false;
    }

    /**
     * Injection point. Called off the main thread, by multiple threads at the same time.
     *
     * @param deArrowTitle  The DeArrow title, or null if Morphe shows the original title instead.
     * @param originalTitle The title as set by the uploader, or null if it failed to fetch.
     * @return Both titles in the chosen order, or the DeArrow title
     *         if there is no original title or both titles are the same.
     */
    public static String combineTitles(String deArrowTitle, String originalTitle) {
        try {
            if (deArrowTitle == null || originalTitle == null) {
                return deArrowTitle;
            }
            String original = originalTitle.trim();
            if (original.isEmpty() || normalize(deArrowTitle).equals(normalize(original))) {
                // DeArrow often only changes the capitalization.
                return deArrowTitle;
            }

            String combined = isOriginalTitleFirst()
                    ? original + getSeparator() + deArrowTitle.trim()
                    : deArrowTitle.trim() + getSeparator() + original;
            registerDeArrowTitle(combined);
            return combined;
        } catch (Exception ex) {
            Log.e(TAG, "combineTitles failure", ex);
            return deArrowTitle;
        }
    }

    private static String normalize(String title) {
        return title.trim().replaceAll("\\s+", " ").toLowerCase(Locale.ROOT);
    }

    /**
     * Morphe shows the DeArrow icon only before the titles it fetched from DeArrow,
     * so the combined title is added to them.
     */
    @SuppressWarnings("unchecked")
    private static void registerDeArrowTitle(String title) {
        synchronized (DeArrowOriginalTitlePatch.class) {
            if (!initialized) {
                initialized = true;
                try {
                    Class<?> requestClass = Class.forName(DEARROW_REQUEST_CLASS, true,
                            DeArrowOriginalTitlePatch.class.getClassLoader());
                    Field field = requestClass.getDeclaredField("fetchedTitles");
                    field.setAccessible(true);
                    deArrowTitles = (Set<String>) field.get(null);
                } catch (Exception ex) {
                    Log.w(TAG, "Morphe DeArrow titles not found, the DeArrow icon is not shown", ex);
                }
            }
        }

        Set<String> titles = deArrowTitles;
        if (titles != null) {
            // Morphe compares the trimmed text.
            titles.add(title.trim());
        }
    }
}
