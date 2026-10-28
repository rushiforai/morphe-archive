package app.morphe.extension.chmate;

import android.app.Activity;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.IdentityHashMap;
import java.util.Map;

/** Adds an in-viewer rotate control and rotates only ChMate's image canvas. */
public final class ImageViewerRotationButton {
    private static final int BUTTON_ID = 0x48415254;
    static final String MENU_KEY = "imageViewerRotationInMenu";
    private static final int ACTION_TAG = 0x48415256;
    private static final int MENU_ID = 0x48415255;
    private static final String LOG_TAG = "HaiagaruImageRotate";

    private ImageViewerRotationButton() {}

    public static void install(Activity activity, String imageViewClassName) {
        if (activity == null || imageViewClassName == null) return;
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) content = activity.getWindow().getDecorView();
        if (!(content instanceof FrameLayout)) {
            android.util.Log.w(LOG_TAG, "No FrameLayout overlay host: " + content);
            return;
        }
        FrameLayout root = (FrameLayout) content;
        if (root.findViewById(BUTTON_ID) != null) return;

        TextView button = new TextView(activity);
        button.setId(BUTTON_ID);
        button.setText("⟳");
        button.setTextSize(32);
        button.setTextColor(Color.WHITE);
        button.setGravity(Gravity.CENTER);
        button.setContentDescription("画像を右に回転");
        button.setFocusable(true);
        button.setClickable(true);
        // A larger touch target, still drawing only the rotation glyph.
        button.setBackground(null);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                dp(activity, 56), dp(activity, 56), Gravity.END | Gravity.BOTTOM);
        params.setMargins(dp(activity, 12), dp(activity, 12),
                dp(activity, 24), dp(activity, 32));
        params.setMarginEnd(dp(activity, 24));
        root.addView(button, params);
        button.bringToFront();
        android.util.Log.i(LOG_TAG, "Rotation button installed on " + root.getClass().getName());
        RotationClickListener action = new RotationClickListener(activity, root, imageViewClassName);
        root.setTag(ACTION_TAG, action);
        button.setOnClickListener(action);
        synchronizeControlsVisibility(activity, root, button);
    }

    /** Add to the native overflow without replacing its other commands. */
    public static void prepareMenu(Activity activity, android.view.Menu menu) {
        if (activity == null || menu == null) return;
        android.view.MenuItem item = menu.findItem(MENU_ID);
        if (item == null) {
            item = menu.add(android.view.Menu.NONE, MENU_ID, android.view.Menu.NONE, "画像を右に回転");
            item.setShowAsAction(android.view.MenuItem.SHOW_AS_ACTION_NEVER);
            item.setOnMenuItemClickListener(selected -> {
                rotate(activity);
                return true;
            });
        }
        item.setVisible(Haiagaru.imageRotationButtonEnabled(activity)
                && VideoViewerSettings.prefs(activity).getBoolean(MENU_KEY, true));
    }

    public static boolean handleMenu(Activity activity, android.view.MenuItem item) {
        if(item == null || item.getItemId() != MENU_ID) return false;
        rotate(activity); return true;
    }
    private static void rotate(Activity activity) {
        View root = activity.findViewById(android.R.id.content);
        if(root == null) return;
        Object action = root.getTag(ACTION_TAG);
        if(action instanceof RotationClickListener) ((RotationClickListener)action).onClick(root);
    }

    /** Follow the native counter's visibility without replacing image gesture listeners. */
    private static void synchronizeControlsVisibility(Activity activity, FrameLayout root, View button) {
        button.setVisibility(View.INVISIBLE);
        ControlPosition position = new ControlPosition(activity, root, button);
        android.view.ViewTreeObserver.OnPreDrawListener listener =
                new android.view.ViewTreeObserver.OnPreDrawListener() {
            private TextView counter;

            @Override
            public boolean onPreDraw() {
                if (!Haiagaru.imageRotationButtonEnabled(activity) || VideoViewerSettings.prefs(activity).getBoolean(MENU_KEY, true)) {
                    if (button.getVisibility() != View.GONE) button.setVisibility(View.GONE);
                    return true;
                }
                position.update();
                if (counter == null || !counter.isAttachedToWindow()) counter = findCounter(root);
                int visibility = counter != null && counter.isShown() && counter.getAlpha() > 0f
                        ? View.VISIBLE : View.INVISIBLE;
                if (button.getVisibility() != visibility) button.setVisibility(visibility);
                return true;
            }
        };
        root.getViewTreeObserver().addOnPreDrawListener(listener);
        button.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View view) {}
            @Override public void onViewDetachedFromWindow(View view) {
                if (root.getViewTreeObserver().isAlive())
                    root.getViewTreeObserver().removeOnPreDrawListener(listener);
            }
        });
    }

    /** Observe insets without replacing ChMate's own inset listener or consuming its events. */
    private static final class ControlPosition {
        private final Activity activity;
        private final FrameLayout root;
        private final View button;
        private final int bottomGap, sideGap;
        private final int[] hostPosition = new int[2], windowPosition = new int[2];

        ControlPosition(Activity activity, FrameLayout root, View button) {
            this.activity = activity;
            this.root = root;
            this.button = button;
            bottomGap = dp(activity, 32);
            sideGap = dp(activity, 24);
        }

        void update() {
            if (root.getWidth() == 0 || root.getHeight() == 0) return;
            int bottom = 0, left = 0, right = 0;
            if (android.os.Build.VERSION.SDK_INT >= 23) {
                android.view.WindowInsets insets = root.getRootWindowInsets();
                if (insets != null) {
                    if (android.os.Build.VERSION.SDK_INT >= 30) {
                        android.graphics.Insets safe = insets.getInsetsIgnoringVisibility(
                                android.view.WindowInsets.Type.navigationBars() | android.view.WindowInsets.Type.displayCutout());
                        android.graphics.Insets gestures = insets.getInsets(android.view.WindowInsets.Type.systemGestures());
                        bottom = Math.max(safe.bottom, gestures.bottom);
                        left = Math.max(safe.left, gestures.left);
                        right = Math.max(safe.right, gestures.right);
                    } else {
                        bottom = Math.max(insets.getSystemWindowInsetBottom(), insets.getStableInsetBottom());
                        left = Math.max(insets.getSystemWindowInsetLeft(), insets.getStableInsetLeft());
                        right = Math.max(insets.getSystemWindowInsetRight(), insets.getStableInsetRight());
                        if (android.os.Build.VERSION.SDK_INT >= 29) {
                            android.graphics.Insets gestures = insets.getSystemGestureInsets();
                            bottom = Math.max(bottom, gestures.bottom);
                            left = Math.max(left, gestures.left);
                            right = Math.max(right, gestures.right);
                        }
                    }
                }
            }
            View decor = activity.getWindow().getDecorView();
            root.getLocationInWindow(hostPosition);
            decor.getLocationInWindow(windowPosition);
            int excludedBottom = Math.max(0, windowPosition[1] + decor.getHeight()
                    - hostPosition[1] - root.getHeight()) + root.getPaddingBottom();
            boolean rtl = root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
            int excludedSide = (rtl ? Math.max(0, hostPosition[0] - windowPosition[0]) + root.getPaddingLeft()
                    : Math.max(0, windowPosition[0] + decor.getWidth() - hostPosition[0] - root.getWidth()) + root.getPaddingRight());
            int bottomMargin = ViewerControlInsets.margin(bottomGap, bottom, excludedBottom);
            int endMargin = ViewerControlInsets.margin(sideGap, rtl ? left : right, excludedSide);
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) button.getLayoutParams();
            if (params.bottomMargin == bottomMargin && params.getMarginEnd() == endMargin) return;
            params.bottomMargin = bottomMargin;
            params.setMarginEnd(endMargin);
            button.setLayoutParams(params);
        }
    }

    private static TextView findCounter(View view) {
        if (view instanceof TextView && view.getId() != BUTTON_ID) {
            String text = ((TextView) view).getText().toString().trim();
            if (text.matches("\\d+\\s*/\\s*\\d+")) return (TextView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findCounter(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static final class RotationClickListener implements View.OnClickListener {
        private final Activity activity;
        private final ViewGroup content;
        private final String imageViewClassName;
        private final Map<View, RotationState> states = new IdentityHashMap<>();

        RotationClickListener(Activity activity, ViewGroup content, String imageViewClassName) {
            this.activity = activity;
            this.content = content;
            this.imageViewClassName = imageViewClassName;
        }

        @Override
        public void onClick(View button) {
            if (!Haiagaru.imageRotationButtonEnabled(activity)) return;
            int[] contentLocation = new int[2];
            content.getLocationOnScreen(contentLocation);
            View image = findCurrentImage(content, imageViewClassName,
                    contentLocation[0] + content.getWidth() / 2f,
                    contentLocation[1] + content.getHeight() / 2f);
            if (image == null) {
                Toast.makeText(activity, "画像を回転できませんでした", Toast.LENGTH_SHORT).show();
                return;
            }
            RotationState state = states.get(image);
            if (state == null) {
                state = new RotationState(image);
                states.put(image, state);
            }
            state.rotate(image);
        }
    }

    private static View findCurrentImage(View view, String targetClass, float centerX, float centerY) {
        View best = null;
        float bestDistance = Float.MAX_VALUE;
        if (view.getVisibility() == View.VISIBLE && view.getClass().getName().equals(targetClass)) {
            int[] location = new int[2];
            view.getLocationOnScreen(location);
            float x = location[0] + view.getWidth() / 2f;
            float y = location[1] + view.getHeight() / 2f;
            bestDistance = distanceSquared(x, y, centerX, centerY);
            best = view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                View candidate = findCurrentImage(group.getChildAt(index), targetClass, centerX, centerY);
                if (candidate == null) continue;
                int[] location = new int[2];
                candidate.getLocationOnScreen(location);
                float x = location[0] + candidate.getWidth() / 2f;
                float y = location[1] + candidate.getHeight() / 2f;
                float d = distanceSquared(x, y, centerX, centerY);
                if (d < bestDistance) {
                    best = candidate;
                    bestDistance = d;
                }
            }
        }
        return best;
    }

    private static float distanceSquared(float x1, float y1, float x2, float y2) {
        float dx = x1 - x2;
        float dy = y1 - y2;
        return dx * dx + dy * dy;
    }

    private static final class RotationState {
        private final int originalWidth;
        private final int originalHeight;
        private final float originalTranslationX;
        private final float originalTranslationY;
        private float rotation;

        RotationState(View view) {
            ViewGroup.LayoutParams params = view.getLayoutParams();
            originalWidth = params == null ? ViewGroup.LayoutParams.MATCH_PARENT : params.width;
            originalHeight = params == null ? ViewGroup.LayoutParams.MATCH_PARENT : params.height;
            originalTranslationX = view.getTranslationX();
            originalTranslationY = view.getTranslationY();
            rotation = view.getRotation();
        }

        void rotate(View image) {
            rotation = (rotation + 90f) % 360f;
            ViewGroup parent = image.getParent() instanceof ViewGroup
                    ? (ViewGroup) image.getParent() : null;
            if (parent != null && parent.getWidth() > 0 && parent.getHeight() > 0) {
                ViewGroup.LayoutParams params = image.getLayoutParams();
                if (params != null) {
                    if (rotation == 90f || rotation == 270f) {
                        params.width = parent.getHeight();
                        params.height = parent.getWidth();
                        image.setLayoutParams(params);
                        image.setTranslationX(originalTranslationX
                                + (parent.getWidth() - parent.getHeight()) / 2f);
                        image.setTranslationY(originalTranslationY
                                + (parent.getHeight() - parent.getWidth()) / 2f);
                    } else {
                        params.width = originalWidth;
                        params.height = originalHeight;
                        image.setLayoutParams(params);
                        image.setTranslationX(originalTranslationX);
                        image.setTranslationY(originalTranslationY);
                    }
                }
            }
            image.setRotation(rotation);
        }
    }
}
