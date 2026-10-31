package app.syncpatches.titlefont;

import android.graphics.Typeface;
import android.widget.TextView;
import com.laurencedawson.reddit_sync.singleton.SettingsSingleton;
import t7.r0;

import java.lang.reflect.Field;

/**
 * Runtime extension for the "Fix hardcoded title fonts" patch.
 *
 * Resolves the title typeface of the post view mode currently in use,
 * instead of the hardcoded Product Sans / Roboto used by the stock app.
 *
 * Falls back to Product Sans (font id 11) on any failure.
 */
public final class TitleFontFix {

    private TitleFontFix() {
    }

    /**
     * Returns the title typeface of the currently active post view mode.
     */
    public static Typeface titleTypeface() {
        try {
            return r0.d(titleFontId());
        } catch (Throwable t) {
            // Product Sans was the default title font before patching.
            return r0.d(FONT_PRODUCT_SANS);
        }
    }

    /**
     * Sets the title typeface of the currently active post view mode on a
     * ButterKnife-bound field of a view holder (or of any view class that
     * binds its own children in an internal setup method).
     *
     * Used for holders whose stock layouts hardcode Roboto through the
     * `app:typeface` attribute and whose BaseTextViews apply the font inside
     * their own constructor, so there is no typeface manager call to replace.
     * The hook runs after the fields have been resolved, and the new typeface
     * overrides what the constructors set.
     *
     * Non-TextView fields (the holders use raw `View` types for some
     * secondary labels) are skipped, and any failure keeps the stock font.
     *
     * Any pending async precomputed-text job of the target view is dropped
     * first: Sync's modified AppCompatTextView applies a PrecomputedText in
     * `onMeasure` with strict parameter matching, and a typeface change after
     * the precompute was scheduled would make that comparison throw
     * ("PrecomputedText's Parameters don't match") on the next layout pass.
     * The next text bind re-schedules the precompute with the new typeface.
     */
    public static void applyTitleTypeface(Object holder, String fieldName) {
        try {
            for (Class<?> c = holder.getClass();
                 c != null && c != Object.class;
                 c = c.getSuperclass()) {
                Field field;
                try {
                    field = c.getDeclaredField(fieldName);
                } catch (NoSuchFieldException e) {
                    continue;
                }
                field.setAccessible(true);
                Object value = field.get(holder);
                if (value instanceof TextView) {
                    TextView view = (TextView) value;
                    clearPendingPrecomputedText(view);
                    view.setTypeface(titleTypeface());
                }
                return;
            }
        } catch (Throwable t) {
            // Leave the stock typeface in place on failure.
        }
    }

    /**
     * Drops a pending Asynchronous PrecomputedTextCompat future from Sync's
     * modified AppCompatTextView (the private `Future` field) so its cached
     * text-metrics parameters cannot conflict with the typeface that is
     * being set. The class is resolved by name to keep this runtime
     * reflection based and independent of compile-time appcompat classes.
     */
    private static void clearPendingPrecomputedText(TextView view) {
        try {
            for (Class<?> c = view.getClass();
                 c != null && c != Object.class;
                 c = c.getSuperclass()) {
                if (c.getName().equals(
                        "androidx.appcompat.widget.AppCompatTextView")) {
                    Field field = c.getDeclaredField("s");
                    field.setAccessible(true);
                    if (field.get(view) instanceof java.util.concurrent.Future) {
                        field.set(view, null);
                    }
                    return;
                }
            }
        } catch (Throwable t) {
            // No pending precomputed text is a fine outcome.
        }
    }

    /**
     * Returns the font id of the title font of the currently active post view mode.
     */
    public static int titleFontId() {
        try {
            // Mode values:
            // 0 = List, 1 = Compact, 2 = Smaller cards, 3 = Small cards, 4 = Cards, 5 = Slides.
            switch (com.laurencedawson.reddit_sync.singleton.c.a().e()) {
                case 0:
                    return getSetting(SETTING_LIST);
                case 1:
                    return getSetting(SETTING_COMPACT);
                case 2:
                    return getSetting(SETTING_SMALLER_CARD);
                case 3:
                    return getSetting(SETTING_SMALL_CARD);
                case 4:
                    return getSetting(SETTING_CARD);
                default:
                    return getSetting(SETTING_SLIDE);
            }
        } catch (Throwable t) {
            return FONT_PRODUCT_SANS;
        }
    }

    private static int getSetting(String key) {
        // SettingsSingleton.d().e(key) resolves the `int` field of the current
        // settings object with the given name and throws on unknown keys.
        return SettingsSingleton.d().e(key);
    }

    // Font id used by the stock app for titles.
    private static final int FONT_PRODUCT_SANS = 11;

    private static final String SETTING_LIST = "list_font_title";
    private static final String SETTING_COMPACT = "compact_font_title";
    private static final String SETTING_SMALLER_CARD = "smaller_card_font_title";
    private static final String SETTING_SMALL_CARD = "small_card_font_title";
    private static final String SETTING_CARD = "card_font_title";
    private static final String SETTING_SLIDE = "slide_font_title";
}
