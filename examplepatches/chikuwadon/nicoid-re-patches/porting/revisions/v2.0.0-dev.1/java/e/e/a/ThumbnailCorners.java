package e.e.a;

import android.content.Context;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.view.ViewOutlineProvider;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Configurable thumbnail shape shared by normal videos and Niconico Live. */
public final class ThumbnailCorners {
    private static final String ENABLED = "thumbnail_rounded_corners";
    private static final int ROW_THUMBNAIL = 0x7f0800cd;
    private static final int NATIVE_THUMBNAIL = 0x7f0801b2;
    private static final WeakHashMap<View, OriginalOutline> ORIGINALS = new WeakHashMap<>();
    private static final ViewOutlineProvider OUTLINE = new ViewOutlineProvider() {
        @Override public void getOutline(View view, Outline outline) {
            float radius = 4 * view.getResources().getDisplayMetrics().density;
            outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radius);
        }
    };

    private static final class OriginalOutline {
        final ViewOutlineProvider provider;
        final boolean clip;
        OriginalOutline(View view) {
            provider = view.getOutlineProvider();
            clip = view.getClipToOutline();
        }
    }

    public static boolean enabled(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(ENABLED, true);
    }

    public static void settings(PreferenceActivity activity, PreferenceGroup other) {
        if (activity == null || other == null || activity.findPreference(ENABLED) != null) return;
        Preference anchor = other.findPreference("show_nicolive_menu");
        if (anchor == null) anchor = other.findPreference("show_shorts_menu");
        int order = anchor == null ? other.getPreferenceCount() : anchor.getOrder() + 1;
        ArrayList<Preference> later = new ArrayList<>();
        for (int i = 0; i < other.getPreferenceCount(); i++) {
            Preference row = other.getPreference(i);
            if (row.getOrder() >= order && row.getOrder() < Integer.MAX_VALUE) later.add(row);
        }
        for (Preference row : later) row.setOrder(row.getOrder() + 1);
        CheckBoxPreference rounded = new CheckBoxPreference(activity);
        rounded.setKey(ENABLED);
        rounded.setDefaultValue(true);
        rounded.setOrder(order);
        rounded.setTitle(PanelUi.tr(activity, "サムネイルの角丸表示",
                "Rounded thumbnails", "縮圖圓角顯示"));
        rounded.setSummary(PanelUi.tr(activity,
                "OFFにすると角丸なしで表示します。変更はアプリの再起動後に反映されます",
                "Turn off for square corners. Changes take effect after restarting the app.",
                "關閉後顯示直角縮圖。變更將在重新啟動應用程式後生效"));
        other.addPreference(rounded);
    }

    public static void apply(View view) {
        if (view == null) return;
        if (!enabled(view.getContext())) {
            OriginalOutline original = ORIGINALS.remove(view);
            if (original != null) {
                view.setOutlineProvider(original.provider);
                view.setClipToOutline(original.clip);
            }
            return;
        }
        if (view.getOutlineProvider() == OUTLINE) return;
        ORIGINALS.put(view, new OriginalOutline(view));
        view.setOutlineProvider(OUTLINE);
        view.setClipToOutline(true);
    }

    /** Live thumbnails contain badges; clip the frame and leave badge corners unchanged. */
    public static void applyFrame(View frame) {
        if (frame == null) return;
        apply(frame);
        Drawable background = frame.getBackground();
        if (background instanceof GradientDrawable) {
            ((GradientDrawable) background).setCornerRadius(
                    enabled(frame.getContext()) ? 4 * frame.getResources().getDisplayMetrics().density : 0);
        }
    }

    /**
     * Clip the thumbnail's artwork frame as well as its image. The native watch
     * progress is drawn in ImageView.getOverlay(), and a background belonging to
     * the frame would otherwise remain rectangular outside the image corners.
     */
    public static void applyWithParent(View thumbnail) {
        if (thumbnail == null) return;
        apply(thumbnail);
        ViewParent parent = thumbnail.getParent();
        if (!(parent instanceof ViewGroup)) return;
        ViewGroup frame = (ViewGroup) parent;
        if (!(frame instanceof FrameLayout || frame instanceof RelativeLayout)) return;
        if (thumbnail.getWidth() > 0 && frame.getWidth() > 0 &&
                frame.getWidth() - thumbnail.getWidth() >
                        8 * thumbnail.getResources().getDisplayMetrics().density) return;
        ViewGroup.LayoutParams size = thumbnail.getLayoutParams();
        if (thumbnail.getWidth() == 0 && frame instanceof RelativeLayout &&
                (size == null || size.width != ViewGroup.LayoutParams.MATCH_PARENT)) return;
        apply(frame);
    }

    public static void applyNative(View row) {
        if (row == null) return;
        View thumbnail = row.findViewById(ROW_THUMBNAIL);
        if (thumbnail instanceof ImageView) {
            if (thumbnail.getParent() == row) apply(thumbnail);
            else applyWithParent(thumbnail);
        }
        thumbnail = row.findViewById(NATIVE_THUMBNAIL);
        if (thumbnail instanceof ImageView) {
            if (thumbnail.getParent() == row) apply(thumbnail);
            else applyWithParent(thumbnail);
        }
    }

    /**
     * The video's original information header is laid out in the unmodified
     * application, not in VideoDetails. Select only the sizeable 16:9 artwork;
     * small round avatars, action icons, and the playback surface are excluded.
     */
    public static void applyDetails(View root) {
        if (root == null) return;
        root.post(() -> {
            ImageView thumbnail = findLargeArtwork(root, null);
            if (thumbnail != null) applyWithParent(thumbnail);
        });
    }

    private static ImageView findLargeArtwork(View view, ImageView candidate) {
        if (view instanceof ImageView && view.getVisibility() == View.VISIBLE) {
            ImageView image = (ImageView) view;
            int width = image.getWidth(), height = image.getHeight();
            int minimum = (int) (96 * image.getResources().getDisplayMetrics().density);
            if (width >= minimum && height > 0 && width >= height * 1.35f &&
                    width <= height * 2.3f &&
                    (candidate == null || (long) width * height >
                                           (long) candidate.getWidth() * candidate.getHeight()))
                candidate = image;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++)
                candidate = findLargeArtwork(group.getChildAt(i), candidate);
        }
        return candidate;
    }

    public static void load(String url, ImageView image, TextView placeholder) {
        applyWithParent(image);
        ShortImages.load(url, image, placeholder);
    }
}
