package app.bin0culars.extension.reddit;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.hardware.display.DisplayManager;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Display;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

public final class PostSidePanelPatch {

    private static final Map<Object, Boolean> DECISIONS = Collections.synchronizedMap(new WeakHashMap<>());
    private static Context appContext;

    private static Context getApplicationContext() {
        if (appContext != null) {
            return appContext;
        }
        try {
            appContext = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable ignored) {
        }
        return appContext;
    }

    public static boolean usePanel(Object screen) {
        try {
            if (screen == null) {
                return false;
            }
            Boolean existing = DECISIONS.get(screen);
            if (existing != null) {
                return existing;
            }
            boolean enabled = BinocularsMods.isEnabled("post_side_panel");
            Context context = getApplicationContext();
            if (context == null) {
                return false;
            }
            DisplayManager dm = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
            if (dm == null) {
                return false;
            }
            Display display = dm.getDisplay(Display.DEFAULT_DISPLAY);
            if (display == null) {
                return false;
            }
            DisplayMetrics metrics = new DisplayMetrics();
            display.getRealMetrics(metrics);
            float widthDp = metrics.widthPixels / metrics.density;
            boolean decision = enabled && widthDp >= 840;
            DECISIONS.put(screen, decision);
            return decision;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void onScreenViewCreated(Object screen, View root) {
        try {
            if (!Boolean.TRUE.equals(DECISIONS.get(screen)) || !(root instanceof ViewGroup)) {
                return;
            }

            Context context = root.getContext();
            Resources res = context.getResources();
            int containerId = res.getIdentifier("screen_modal_container", "id", context.getPackageName());
            if (containerId == 0) {
                return;
            }

            View containerView = root.findViewById(containerId);
            if (!(containerView instanceof ViewGroup)) {
                return;
            }
            ViewGroup container = (ViewGroup) containerView;

            applyBackdrop(root);

            final float density = res.getDisplayMetrics().density;
            final int radius = Math.round(16f * density);
            // Clip container so Compose content background respects rounded left corners.
            container.setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline outline) {
                    int width = view.getWidth();
                    int height = view.getHeight();
                    if (view.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL) {
                        outline.setRoundRect(-radius, 0, width, height, radius);
                    } else {
                        outline.setRoundRect(0, 0, width + radius, height, radius);
                    }
                }
            });
            container.setClipToOutline(true);

            ViewGroup.LayoutParams lp = container.getLayoutParams();
            ViewGroup.MarginLayoutParams marginLp;
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                marginLp = (ViewGroup.MarginLayoutParams) lp;
            } else {
                marginLp = new ViewGroup.MarginLayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT);
            }
            marginLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            marginLp.height = ViewGroup.LayoutParams.MATCH_PARENT;
            marginLp.setMargins(0, 0, 0, 0);
            marginLp.setMarginStart(0);
            marginLp.setMarginEnd(0);
            container.setLayoutParams(marginLp);

            View contentView = container.getChildAt(0);
            if (contentView != null) {
                ViewGroup.LayoutParams contentLp = contentView.getLayoutParams();
                if (contentLp != null) {
                    contentLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
                    contentLp.height = ViewGroup.LayoutParams.MATCH_PARENT;
                    contentView.setLayoutParams(contentLp);
                }
            }

            final View handle = new View(context);
            int handleWidth = Math.round(24f * density);
            int handleHeight = Math.round(96f * density);
            FrameLayout.LayoutParams handleLp = new FrameLayout.LayoutParams(
                    handleWidth,
                    handleHeight,
                    Gravity.START | Gravity.CENTER_VERTICAL);
            handle.setLayoutParams(handleLp);

            int textColorSecondary = resolveColor(context, android.R.attr.textColorSecondary);
            int baseAlpha = Color.alpha(textColorSecondary);
            int alpha = Math.round((baseAlpha != 0 ? baseAlpha : 255) * 0.45f);
            int pillColor = Color.argb(
                    alpha,
                    Color.red(textColorSecondary),
                    Color.green(textColorSecondary),
                    Color.blue(textColorSecondary));

            GradientDrawable pill = new GradientDrawable();
            pill.setShape(GradientDrawable.RECTANGLE);
            pill.setCornerRadius(2f * density);
            pill.setColor(pillColor);

            int insetHorizontal = Math.round(10f * density);
            int insetVertical = Math.round(28f * density);
            InsetDrawable insetDrawable = new InsetDrawable(
                    pill,
                    insetHorizontal,
                    insetVertical,
                    insetHorizontal,
                    insetVertical);
            handle.setBackground(insetDrawable);
            handle.setContentDescription("Resize panel");
            handle.setElevation(4f * density);

            container.addView(handle);
            handle.bringToFront();

            final float[] downRawX = new float[1];
            final int[] downWidth = new int[1];
            final int[] draggedWidth = new int[] { 0 };

            handle.setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    try {
                        int action = event.getActionMasked();
                        int rootWidth = root.getWidth();
                        if (rootWidth <= 0) {
                            return false;
                        }
                        String choice = BinocularsMods.getChoice("post_side_panel_width");
                        if (choice == null || choice.isEmpty()) {
                            choice = "one";
                        }

                        if (action == MotionEvent.ACTION_DOWN) {
                            if (v.getParent() != null) {
                                v.getParent().requestDisallowInterceptTouchEvent(true);
                            }
                            downRawX[0] = event.getRawX();
                            int marginStart = 0;
                            ViewGroup.LayoutParams lp = container.getLayoutParams();
                            if (lp instanceof ViewGroup.MarginLayoutParams) {
                                marginStart = ((ViewGroup.MarginLayoutParams) lp).getMarginStart();
                            }
                            downWidth[0] = rootWidth - marginStart;
                            return true;
                        } else if (action == MotionEvent.ACTION_MOVE) {
                            float dx = event.getRawX() - downRawX[0];
                            boolean isRtl = root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
                            int targetWidth = Math.round(isRtl ? (downWidth[0] + dx) : (downWidth[0] - dx));
                            int columnWidth = getColumnWidth(rootWidth, density, choice);
                            int newWidth = clampWidth(targetWidth, rootWidth, density, columnWidth);
                            draggedWidth[0] = newWidth;

                            ViewGroup.LayoutParams lp = container.getLayoutParams();
                            if (lp instanceof ViewGroup.MarginLayoutParams) {
                                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                                mlp.setMarginStart(rootWidth - newWidth);
                                container.setLayoutParams(mlp);
                            }
                            container.invalidateOutline();
                            return true;
                        } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                            if (v.getParent() != null) {
                                v.getParent().requestDisallowInterceptTouchEvent(false);
                            }
                            if (draggedWidth[0] > 0 && BinocularsMods.isEnabled("post_side_panel_remember_width")) {
                                BinocularsMods.putStoredFloat(
                                        "post_side_panel_drag_width_" + choice,
                                        draggedWidth[0] / (float) rootWidth);
                            }
                            return true;
                        }
                    } catch (Throwable ignored) {
                    }
                    return false;
                }
            });

            root.setOnApplyWindowInsetsListener((v, insets) -> {
                v.setPadding(insets.getSystemWindowInsetLeft(), 0, insets.getSystemWindowInsetRight(), 0);
                return insets;
            });
            root.requestApplyInsets();

            boolean[] animated = new boolean[] { false };
            root.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override
                public void onLayoutChange(
                        View v,
                        int left,
                        int top,
                        int right,
                        int bottom,
                        int oldLeft,
                        int oldTop,
                        int oldRight,
                        int oldBottom) {
                    try {
                        int rootWidth = right - left;
                        if (rootWidth <= 0) {
                            return;
                        }
                        if (right - left != oldRight - oldLeft || bottom - top != oldBottom - oldTop) {
                            container.invalidateOutline();
                        }
                        boolean isWide = rootWidth >= 840f * density;
                        handle.setVisibility(isWide ? View.VISIBLE : View.GONE);

                        int panelWidth = computePanelWidth(rootWidth, density, draggedWidth[0]);
                        final int targetStartMargin = isWide ? (rootWidth - panelWidth) : 0;

                        ViewGroup.LayoutParams currentLp = container.getLayoutParams();
                        if (currentLp instanceof ViewGroup.MarginLayoutParams) {
                            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) currentLp;
                            if (mlp.getMarginStart() != targetStartMargin || container.getClipToOutline() != isWide) {
                                final boolean finalIsWide = isWide;
                                root.post(() -> {
                                    ViewGroup.LayoutParams p = container.getLayoutParams();
                                    if (p instanceof ViewGroup.MarginLayoutParams
                                            && ((ViewGroup.MarginLayoutParams) p).getMarginStart() != targetStartMargin) {
                                        ((ViewGroup.MarginLayoutParams) p).setMarginStart(targetStartMargin);
                                        container.setLayoutParams(p);
                                    }
                                    if (container.getClipToOutline() != finalIsWide) {
                                        container.setClipToOutline(finalIsWide);
                                    }
                                });
                            }
                        }

                        if (!animated[0]) {
                            animated[0] = true;
                            float startTranslation = root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL
                                    ? -panelWidth
                                    : panelWidth;
                            container.setTranslationX(startTranslation);
                            container.animate()
                                    .translationX(0f)
                                    .setDuration(250)
                                    .setInterpolator(new DecelerateInterpolator());
                        }
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }

    private static int resolveColor(Context context, int attr) {
        TypedValue typedValue = new TypedValue();
        if (context.getTheme().resolveAttribute(attr, typedValue, true)) {
            if (typedValue.type >= TypedValue.TYPE_FIRST_COLOR_INT && typedValue.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return typedValue.data;
            }
            if (typedValue.resourceId != 0) {
                try {
                    return context.getColor(typedValue.resourceId);
                } catch (Throwable ignored) {
                }
            }
        }
        return 0;
    }

    private static int getColumnWidth(int rootWidth, float density, String choice) {
        int cols = BinocularsMods.isEnabled("tablet_grid_feed") ? TabletGridFeedPatch.columns() : 3;
        cols = Math.max(cols, 2);
        int feedWidth = rootWidth - Math.round(96f * density);
        int span = "two".equals(choice) ? 2 : 1;
        span = Math.min(span, cols - 1);
        return Math.round(feedWidth * span / (float) cols);
    }

    private static int clampWidth(int width, int rootWidth, float density, int columnWidth) {
        int minWidth = Math.round(320f * density);
        int maxWidth = rootWidth - Math.round(96f * density) - Math.round(240f * density);
        if (maxWidth < minWidth) {
            return columnWidth;
        }
        return Math.max(minWidth, Math.min(width, maxWidth));
    }

    private static int computePanelWidth(int rootWidth, float density, int draggedWidth) {
        String choice = BinocularsMods.getChoice("post_side_panel_width");
        if (choice == null || choice.isEmpty()) {
            choice = "one";
        }
        int columnWidth = getColumnWidth(rootWidth, density, choice);

        int rawWidth;
        if (draggedWidth > 0) {
            rawWidth = draggedWidth;
        } else if (BinocularsMods.isEnabled("post_side_panel_remember_width")) {
            float fraction = BinocularsMods.getStoredFloat("post_side_panel_drag_width_" + choice, 0f);
            if (fraction > 0f) {
                rawWidth = Math.round(fraction * rootWidth);
            } else {
                rawWidth = columnWidth;
            }
        } else {
            rawWidth = columnWidth;
        }

        return clampWidth(rawWidth, rootWidth, density, columnWidth);
    }

    private static void applyBackdrop(View root) {
        try {
            if (root == null) {
                return;
            }
            String dimChoice = BinocularsMods.getChoice("post_side_panel_dim");
            float alpha;
            if ("off".equals(dimChoice)) {
                alpha = 0f;
            } else if ("light".equals(dimChoice)) {
                alpha = 0.38f;
            } else if ("strong".equals(dimChoice)) {
                alpha = 0.72f;
            } else {
                alpha = 0.55f;
            }
            try {
                root.getClass().getMethod("setBackdropAlpha", float.class).invoke(root, alpha);
            } catch (Throwable ignored) {
                if (root.getBackground() != null) {
                    root.getBackground().setAlpha(Math.round(alpha * 255));
                }
            }
        } catch (Throwable ignored) {
        }
    }
}
