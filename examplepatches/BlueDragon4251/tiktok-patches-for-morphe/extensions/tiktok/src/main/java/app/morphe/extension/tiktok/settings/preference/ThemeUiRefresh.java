package app.morphe.extension.tiktok.settings.preference;

import android.app.Activity;
import android.app.FragmentManager;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Locale;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.theme.ThemeEngine;
import app.morphe.extension.tiktok.theme.ThemeStateStore;

/**
 * Keeps the legacy Android preference surface in sync with the runtime Theme Engine.
 *
 * BlueIT settings use android.preference fragments inside the same Activity. Popping the Interface
 * fragment therefore does not recreate or resume the Activity, so the previous ListView can keep
 * rows and drawables that were bound using the old preset. This helper listens to that fragment
 * back stack and explicitly rebinds/repaints the visible preference surface.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class ThemeUiRefresh {
    private static final WeakHashMap<Activity, FragmentManager.OnBackStackChangedListener> LISTENERS =
            new WeakHashMap<>();

    private ThemeUiRefresh() {}

    public static void install(Context context) {
        Activity activity = resolveActivity(context);
        if (activity == null) return;

        synchronized (LISTENERS) {
            if (!LISTENERS.containsKey(activity)) {
                try {
                    WeakReference<Activity> activityRef = new WeakReference<>(activity);
                    FragmentManager.OnBackStackChangedListener listener = () -> {
                        Activity current = activityRef.get();
                        if (current != null && !current.isFinishing()) {
                            refresh(current);
                        }
                    };
                    activity.getFragmentManager().addOnBackStackChangedListener(listener);
                    LISTENERS.put(activity, listener);
                } catch (Throwable ignored) {
                }
            }
        }

        refresh(activity);
    }

    public static void refresh(Context context) {
        Activity activity = resolveActivity(context);
        if (activity == null || activity.isFinishing()) return;

        try {
            Utils.runOnMainThreadNowOrLater(() -> refreshActivity(activity));
        } catch (Throwable ignored) {
            try {
                activity.runOnUiThread(() -> refreshActivity(activity));
            } catch (Throwable ignoredAgain) {
            }
        }
    }

    private static void refreshActivity(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;

            View decor = window.getDecorView();
            if (decor == null) return;

            boolean themed = isThemeActive(activity);
            boolean glass = themed && ThemeStateStore.isLiquidGlass(activity);
            View candidate = decor.findViewById(android.R.id.list);
            if (candidate instanceof ListView) {
                ListView list = (ListView) candidate;
                if (themed) {
                    list.setBackground(glass
                            ? liquidGlassBackdrop(activity)
                            : new ColorDrawable(opaque(SettingsUi.background())));
                    list.setDivider(new ColorDrawable(Color.TRANSPARENT));
                    list.setDividerHeight(SettingsUi.dp(activity, glass ? 8 : 4));
                } else {
                    list.setBackgroundColor(SettingsUi.background());
                    list.setDivider(new ColorDrawable(SettingsUi.divider()));
                    list.setDividerHeight(1);
                }
                list.setCacheColorHint(opaque(SettingsUi.background()));
                list.setClipToPadding(false);
                list.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);

                notifyAdapter(list);
                list.post(() -> styleVisibleRows(list));
                list.postDelayed(() -> {
                    notifyAdapter(list);
                    styleVisibleRows(list);
                }, 70L);
                list.postDelayed(() -> styleVisibleRows(list), 220L);
            }

            int background = opaque(SettingsUi.background());
            int surface = compositeOver(SettingsUi.surface(), background);
            window.setStatusBarColor(background);
            window.setNavigationBarColor(surface);
            updateSystemBarIcons(decor, background, surface);

            // Also refresh TikTok/classic surfaces around the preference fragment.
            ThemeEngine.requestReapply();
        } catch (Throwable ignored) {
            // Theme refresh must never make settings unusable.
        }
    }

    private static void notifyAdapter(ListView list) {
        try {
            ListAdapter adapter = list.getAdapter();
            if (adapter instanceof BaseAdapter) {
                ((BaseAdapter) adapter).notifyDataSetChanged();
            }
            list.invalidateViews();
            list.invalidate();
        } catch (Throwable ignored) {
        }
    }

    private static void styleVisibleRows(ListView list) {
        Context context = list.getContext();
        if (!isThemeActive(context)) return;

        boolean glass = ThemeStateStore.isLiquidGlass(context);
        for (int i = 0; i < list.getChildCount(); i++) {
            View row = list.getChildAt(i);
            if (row == null) continue;

            View title = row.findViewById(android.R.id.title);
            View summary = row.findViewById(android.R.id.summary);
            if (title != null || summary != null) {
                row.setBackground(SettingsUi.roundedSurface(context, glass ? 19 : 14, false));
                SettingsUi.styleTitleAndSummary(row);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    row.setElevation(SettingsUi.dp(context, glass ? 2 : 1));
                }
            } else {
                // Header/caption preferences draw their own child views. Make their old opaque
                // backing transparent so the selected palette/backdrop remains visible after Back.
                row.setBackgroundColor(Color.TRANSPARENT);
                retintHeaderTree(row, context);
            }
            row.invalidate();
        }
    }

    private static void retintHeaderTree(View view, Context context) {
        if (view instanceof TextView) {
            TextView textView = (TextView) view;
            String text = String.valueOf(textView.getText()).trim();
            String upper = text.toUpperCase(Locale.ROOT);
            float sp = textView.getTextSize() / context.getResources().getDisplayMetrics().scaledDensity;
            if (upper.equals("BLUEIT SERVICE")) {
                textView.setTextColor(SettingsUi.accent());
            } else if (upper.equals("SETTINGS")) {
                textView.setTextColor(SettingsUi.textDisabled());
            } else if (sp <= 14.5f) {
                textView.setTextColor(SettingsUi.textSecondary());
            } else {
                textView.setTextColor(SettingsUi.textPrimary());
            }
        } else if (view instanceof ImageView) {
            CharSequence description = view.getContentDescription();
            if (description != null && "back".equalsIgnoreCase(String.valueOf(description))) {
                ((ImageView) view).setColorFilter(SettingsUi.textPrimary());
            }
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                retintHeaderTree(group.getChildAt(i), context);
            }
        }
    }

    private static GradientDrawable liquidGlassBackdrop(Context context) {
        int base = opaque(SettingsUi.background());
        int accent = opaque(SettingsUi.accent());
        int surface = compositeOver(SettingsUi.surface(), base);

        GradientDrawable drawable = new GradientDrawable(
                GradientDrawable.Orientation.TR_BL,
                new int[]{
                        mix(base, accent, 0.16f),
                        mix(base, surface, 0.08f),
                        base,
                        mix(base, accent, 0.07f)
                }
        );
        drawable.setGradientType(GradientDrawable.LINEAR_GRADIENT);
        return drawable;
    }

    private static boolean isThemeActive(Context context) {
        try {
            return context != null && !"default".equals(ThemeStateStore.currentPreset(context));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Activity resolveActivity(Context context) {
        if (context instanceof Activity) return (Activity) context;
        try {
            return Utils.getActivity();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void updateSystemBarIcons(View decor, int status, int navigation) {
        try {
            int visibility = decor.getSystemUiVisibility();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (luminance(status) > 0.58f) {
                    visibility |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                } else {
                    visibility &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                }
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                if (luminance(navigation) > 0.58f) {
                    visibility |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                } else {
                    visibility &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                }
            }
            decor.setSystemUiVisibility(visibility);
        } catch (Throwable ignored) {
        }
    }

    private static int opaque(int color) {
        return Color.rgb(Color.red(color), Color.green(color), Color.blue(color));
    }

    private static int compositeOver(int foreground, int background) {
        int alpha = Color.alpha(foreground);
        if (alpha >= 255) return opaque(foreground);
        if (alpha <= 0) return opaque(background);
        float a = alpha / 255f;
        return Color.rgb(
                Math.round(Color.red(foreground) * a + Color.red(background) * (1f - a)),
                Math.round(Color.green(foreground) * a + Color.green(background) * (1f - a)),
                Math.round(Color.blue(foreground) * a + Color.blue(background) * (1f - a))
        );
    }

    private static int mix(int from, int to, float amount) {
        float t = Math.max(0f, Math.min(1f, amount));
        return Color.rgb(
                Math.round(Color.red(from) * (1f - t) + Color.red(to) * t),
                Math.round(Color.green(from) * (1f - t) + Color.green(to) * t),
                Math.round(Color.blue(from) * (1f - t) + Color.blue(to) * t)
        );
    }

    private static float luminance(int color) {
        float r = Color.red(color) / 255f;
        float g = Color.green(color) / 255f;
        float b = Color.blue(color) / 255f;
        r = r <= 0.03928f ? r / 12.92f : (float) Math.pow((r + 0.055f) / 1.055f, 2.4);
        g = g <= 0.03928f ? g / 12.92f : (float) Math.pow((g + 0.055f) / 1.055f, 2.4);
        b = b <= 0.03928f ? b / 12.92f : (float) Math.pow((b + 0.055f) / 1.055f, 2.4);
        return 0.2126f * r + 0.7152f * g + 0.0722f * b;
    }
}
