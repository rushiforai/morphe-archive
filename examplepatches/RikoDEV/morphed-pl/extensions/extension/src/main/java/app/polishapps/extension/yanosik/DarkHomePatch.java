package app.polishapps.extension.yanosik;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Recolours the XML layouts on the home screen when the system is in dark mode.
 *
 * The home screen's Compose content already has dark colours once it is allowed to use them, but its
 * XML sections hardcode light colours that have no night resource. The replacements below come from
 * the app's own design system tokens, so both kinds of content match. Compose content is skipped.
 */
@SuppressWarnings("unused")
public final class DarkHomePatch {

    /** Design system dark value for `#ffffff` surfaces. */
    private static final int SURFACE = 0xFF192026;
    /** Design system dark value for `#f1f5f7` surfaces, also used for the near-identical page greys. */
    private static final int SURFACE_ALTERNATIVE = 0xFF303A40;
    /** Design system dark value for `#303a40` text. */
    private static final int ON_SURFACE = 0xFFF1F5F7;

    private static final String LOG_TAG = "YanosikDarkHome";

    private DarkHomePatch() {
    }

    /** Hooked right after the home screen sets its content view, before any fragment is added. */
    public static void apply(Activity activity) {
        if (!isNight(activity.getResources().getConfiguration())) {
            return;
        }

        View root = activity.findViewById(android.R.id.content);
        if (root == null) {
            return;
        }

        recolour(root);
        // Fragments and list items arrive after this hook. Recolouring is cheap and only ever changes
        // light colours, so colours that were already replaced are left alone on later passes.
        root.getViewTreeObserver().addOnGlobalLayoutListener(
                new ViewTreeObserver.OnGlobalLayoutListener() {
                    @Override
                    public void onGlobalLayout() {
                        recolour(root);
                    }
                });
    }

    /** Hooked where a section or list item is created, so it doesn't depend on a later layout pass. */
    public static void applyToView(View view) {
        if (isNight(view.getResources().getConfiguration())) {
            recolour(view);
        }
    }

    /** Replaces `setTextColor` where the shortcut adapter sets each label's colour on every bind. */
    public static void setTextColor(TextView view, int colour) {
        boolean darkOnNight = isNight(view.getResources().getConfiguration())
                && Color.alpha(colour) > 0
                && luminance(colour) < 0.35;
        view.setTextColor(darkOnNight ? withAlphaOf(colour, ON_SURFACE) : colour);
    }

    private static boolean isNight(Configuration configuration) {
        return (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    private static void recolour(View view) {
        // Compose draws its children itself and picks its own colours.
        if (view.getClass().getName().startsWith("androidx.compose.ui.platform.")) {
            return;
        }

        recolourBackground(view);

        if (view instanceof TextView) {
            recolourText((TextView) view);
        } else if (view instanceof ImageView) {
            recolourIcon((ImageView) view);
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                recolour(group.getChildAt(index));
            }
        }
    }

    /**
     * CardView paints its colour with a private drawable, which the background check can't read. Its
     * accessors keep their names in the app but the class isn't available at compile time, so they're
     * called reflectively.
     */
    private static void recolourCard(View view) {
        try {
            ColorStateList colours = (ColorStateList) view.getClass()
                    .getMethod("getCardBackgroundColor").invoke(view);
            if (colours == null) {
                return;
            }
            int colour = colours.getDefaultColor();
            Integer replacement = darkSurfaceFor(colour);
            if (replacement != null) {
                view.getClass().getMethod("setCardBackgroundColor", int.class)
                        .invoke(view, withAlphaOf(colour, replacement));
            }
        } catch (ReflectiveOperationException | ClassCastException exception) {
            Log.w(LOG_TAG, "Card colour accessors failed on " + view.getClass().getName(), exception);
            Drawable background = view.getBackground();
            if (background != null) {
                background.setTint(SURFACE);
            }
        }
    }

    private static void recolourBackground(View view) {
        if (view.getClass().getName().contains("CardView")) {
            recolourCard(view);
            return;
        }

        Drawable background = view.getBackground();

        if (background instanceof ColorDrawable) {
            int colour = ((ColorDrawable) background).getColor();
            Integer replacement = darkSurfaceFor(colour);
            if (replacement != null) {
                view.setBackgroundColor(withAlphaOf(colour, replacement));
            }
        } else if (background instanceof GradientDrawable) {
            ColorStateList colours = ((GradientDrawable) background).getColor();
            if (colours != null) {
                int colour = colours.getDefaultColor();
                Integer replacement = darkSurfaceFor(colour);
                if (replacement != null) {
                    // Drawables loaded from resources share state, so never change the shared copy.
                    ((GradientDrawable) background.mutate()).setColor(withAlphaOf(colour, replacement));
                }
            }
        }
    }

    private static void recolourText(TextView view) {
        // Keep dark text that sits on its own coloured or still-light background, such as a button.
        if (hasOwnLightBackground(view)) {
            return;
        }

        int colour = view.getCurrentTextColor();
        if (Color.alpha(colour) > 0 && luminance(colour) < 0.35) {
            view.setTextColor(withAlphaOf(colour, ON_SURFACE));
        }

        int hint = view.getCurrentHintTextColor();
        if (Color.alpha(hint) > 0 && luminance(hint) < 0.35) {
            view.setHintTextColor(withAlphaOf(hint, ON_SURFACE));
        }
    }

    /**
     * Icons that are dark through a tint can be detected. The username arrow is a vector with a
     * hardcoded dark fill and no tint, which can't be read back, so it is matched by its view ID.
     */
    private static void recolourIcon(ImageView view) {
        if (hasOwnLightBackground(view)) {
            return;
        }

        ColorStateList tint = view.getImageTintList();
        if (tint != null) {
            int colour = tint.getDefaultColor();
            if (Color.alpha(colour) > 0 && luminance(colour) < 0.35) {
                view.setImageTintList(ColorStateList.valueOf(withAlphaOf(colour, ON_SURFACE)));
            }
        } else if (view.getId() != View.NO_ID && view.getId() == view.getResources().getIdentifier(
                "userNameDropdown", "id", view.getContext().getPackageName())) {
            view.setImageTintList(ColorStateList.valueOf(ON_SURFACE));
        }
    }

    private static boolean hasOwnLightBackground(View view) {
        Drawable background = view.getBackground();
        int colour;
        if (background instanceof ColorDrawable) {
            colour = ((ColorDrawable) background).getColor();
        } else if (background instanceof GradientDrawable
                && ((GradientDrawable) background).getColor() != null) {
            colour = ((GradientDrawable) background).getColor().getDefaultColor();
        } else {
            return false;
        }
        return Color.alpha(colour) > 0 && luminance(colour) >= 0.35;
    }

    /** Returns the dark replacement for a neutral light surface, or null to leave the colour alone. */
    private static Integer darkSurfaceFor(int colour) {
        if (Color.alpha(colour) == 0) {
            return null;
        }
        int red = Color.red(colour);
        int green = Color.green(colour);
        int blue = Color.blue(colour);
        boolean neutral = Math.max(red, Math.max(green, blue)) - Math.min(red, Math.min(green, blue)) <= 8;
        if (!neutral || luminance(colour) < 0.85) {
            return null;
        }
        return red == 255 && green == 255 && blue == 255 ? SURFACE : SURFACE_ALTERNATIVE;
    }

    private static int withAlphaOf(int source, int colour) {
        return (colour & 0x00FFFFFF) | (source & 0xFF000000);
    }

    private static double luminance(int colour) {
        return (0.2126 * Color.red(colour) + 0.7152 * Color.green(colour) + 0.0722 * Color.blue(colour)) / 255.0;
    }
}
