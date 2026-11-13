package app.template.extension.extension;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/** Screen-level keyboard testing buttons and a real-IME testing dialog. */
public final class HelakuruLitePreviewExtension {
    private static final String BUTTON_TAG = "morphe_helakuru_open_keyboard";

    private HelakuruLitePreviewExtension() { }

    public static void bindThemeEditor(Object fragmentObject, Object rootObject) {
        if (!(rootObject instanceof ViewGroup)) return;
        ViewGroup root = (ViewGroup) rootObject;
        // Keep these views attached: Lite still writes theme colors and images into them.
        for (String name : new String[]{"preview", "preview_border", "preview_keys", "candidate_container"}) {
            int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
            View old = id == 0 ? null : root.findViewById(id);
            if (old != null) {
                old.setVisibility(View.GONE);
                ViewGroup.LayoutParams params = old.getLayoutParams();
                params.height = 0;
                old.setLayoutParams(params);
            }
        }
        // Inflation happens before the fragment is attached to the activity's ScrollView.
        root.post(() -> {
            ViewParent parent = root.getParent();
            while (parent instanceof View) {
                if (parent instanceof ScrollView && parent.getParent() instanceof ViewGroup) {
                    addOpenButton((ViewGroup) parent.getParent(), (View) parent);
                    return;
                }
                parent = parent.getParent();
            }
        });
    }

    public static void bindFrostedSettings(Dialog dialog, Context context) {
        if (dialog == null || dialog.getWindow() == null) return;
        View content = dialog.getWindow().findViewById(android.R.id.content);
        if (content instanceof ViewGroup) {
            addOpenButton((ViewGroup) content, findListView(content));
        }
    }

    private static void addOpenButton(ViewGroup host, View scrollingContent) {
        if (host.findViewWithTag(BUTTON_TAG) != null) return;
        Context context = host.getContext();
        FrameLayout overlay = new FrameLayout(context);
        overlay.setTag(BUTTON_TAG);
        overlay.setElevation(dp(context, 12));
        // This overlay belongs to the screen, never to its scrolling content.
        ViewGroup.LayoutParams overlayParams = host instanceof RelativeLayout
                ? new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
                : new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        host.addView(overlay, overlayParams);
        TextView open = createOpenButton(context);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(context, 52), Gravity.BOTTOM | Gravity.RIGHT);
        int margin = dp(context, 16);
        params.setMargins(margin, margin, margin, margin);
        overlay.addView(open, params);
        final int[] originalPadding = scrollingContent == null ? null : new int[]{
                scrollingContent.getPaddingLeft(), scrollingContent.getPaddingTop(),
                scrollingContent.getPaddingRight(), scrollingContent.getPaddingBottom()};
        overlay.setOnApplyWindowInsetsListener((view, insets) -> {
            int[] safe = systemInsets(insets);
            // The parent may already fit system bars. Add only the clearance still overlapping it.
            int[] location = new int[2];
            overlay.getLocationInWindow(location);
            View decor = overlay.getRootView();
            int bottom = Math.max(0, safe[3] - Math.max(0, decor.getHeight() - location[1] - overlay.getHeight()));
            int left = Math.max(0, safe[0] - location[0]);
            int right = Math.max(0, safe[2] - Math.max(0, decor.getWidth() - location[0] - overlay.getWidth()));
            params.setMargins(margin + left, margin, margin + right, margin + bottom);
            open.setLayoutParams(params);
            if (scrollingContent != null) {
                scrollingContent.setPadding(originalPadding[0], originalPadding[1], originalPadding[2],
                        originalPadding[3] + dp(context, 84) + bottom);
                if (scrollingContent instanceof ViewGroup) ((ViewGroup) scrollingContent).setClipToPadding(false);
            }
            return insets;
        });
        overlay.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, or, ob) -> {
            if (l != ol || t != ot || r != or || b != ob) view.requestApplyInsets();
        });
        overlay.requestApplyInsets();
    }

    public static void openKeyboardPreview(Context context) {
        try {
            EditText editor = new EditText(context) {
                @Override public void onWindowFocusChanged(boolean focused) {
                    super.onWindowFocusChanged(focused);
                    if (focused && hasFocus()) post(() -> {
                        if (!isAttachedToWindow() || !hasWindowFocus() || !hasFocus()) return;
                        InputMethodManager manager = (InputMethodManager)
                                context.getSystemService(Context.INPUT_METHOD_SERVICE);
                        if (manager != null) manager.showSoftInput(this, InputMethodManager.SHOW_IMPLICIT);
                    });
                }
            };
            KeyboardTestDialog dialog = new KeyboardTestDialog(context, editor);
            FrameLayout root = new FrameLayout(context);
            root.setOnClickListener(view -> dialog.cancel());
            BottomSheetLayout sheet = new BottomSheetLayout(context, dialog, editor);
            dialog.sheet = sheet;
            GradientDrawable gradient = new GradientDrawable(GradientDrawable.Orientation.TL_BR,
                    new int[]{0xFF18456F, 0xFF76345F});
            float radius = dp(context, 28);
            gradient.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
            sheet.setBackground(gradient);
            sheet.setClipToOutline(true);
            sheet.setElevation(dp(context, 16));
            sheet.setClickable(true);
            FrameLayout.LayoutParams sheetParams = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT,
                    Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            root.addView(sheet, sheetParams);
            FrameLayout content = new FrameLayout(context);
            sheet.addView(content, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            final int[][] safeInsets = {new int[4]};
            Runnable layoutSheet = () -> {
                if (root.getHeight() == 0) return;
                int[] safe = safeInsets[0];
                int height = Math.max(1, root.getHeight() - safe[1] - dp(context, 24));
                int width = Math.min(root.getWidth(), dp(context, 640));
                if (sheetParams.height != height || sheetParams.width != width) {
                    sheetParams.height = height;
                    sheetParams.width = width;
                    sheet.setLayoutParams(sheetParams);
                }
                // Exclude IME insets: the sheet and gradient keep their dimensions while typing.
                content.setPadding(safe[0], 0, safe[2], safe[3]);
            };
            root.setOnApplyWindowInsetsListener((view, insets) -> {
                safeInsets[0] = systemInsets(insets);
                layoutSheet.run();
                return insets;
            });
            root.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, or, ob) -> layoutSheet.run());

            FrameLayout handleTarget = new FrameLayout(context);
            handleTarget.setContentDescription("Close keyboard testing sheet");
            handleTarget.setOnClickListener(view -> dialog.dismiss());
            FrameLayout.LayoutParams handleTargetParams = new FrameLayout.LayoutParams(
                    dp(context, 64), dp(context, 40), Gravity.TOP | Gravity.CENTER_HORIZONTAL);
            content.addView(handleTarget, handleTargetParams);
            View handle = new View(context);
            GradientDrawable handleBackground = new GradientDrawable();
            handleBackground.setColor(0x99FFFFFF);
            handleBackground.setCornerRadius(dp(context, 2));
            handle.setBackground(handleBackground);
            handleTarget.addView(handle, new FrameLayout.LayoutParams(
                    dp(context, 32), dp(context, 4), Gravity.CENTER));

            int margin = dp(context, 24);
            TextView title = new TextView(context);
            title.setText("Try the keyboard");
            title.setTextColor(Color.WHITE);
            title.setTextSize(20);
            FrameLayout.LayoutParams titleParams = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START);
            titleParams.setMargins(margin, dp(context, 48), dp(context, 64), 0);
            content.addView(title, titleParams);

            TextView close = new TextView(context);
            close.setText("×");
            close.setTextSize(30);
            close.setTextColor(Color.WHITE);
            close.setGravity(Gravity.CENTER);
            close.setContentDescription("Close keyboard preview");
            FrameLayout.LayoutParams closeParams = new FrameLayout.LayoutParams(dp(context, 52), dp(context, 52),
                    Gravity.TOP | Gravity.END);
            closeParams.setMargins(0, dp(context, 32), dp(context, 12), 0);
            content.addView(close, closeParams);
            close.setOnClickListener(view -> dialog.dismiss());

            editor.setSingleLine(false);
            editor.setMinLines(2);
            editor.setMaxLines(4);
            editor.setHint("Type here to preview your keyboard");
            editor.setTextColor(Color.WHITE);
            editor.setHintTextColor(0xCCFFFFFF);
            GradientDrawable editorBackground = new GradientDrawable();
            editorBackground.setColor(0x66303030);
            editorBackground.setCornerRadius(dp(context, 18));
            editor.setBackground(editorBackground);
            editor.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
            FrameLayout.LayoutParams editorParams = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP);
            editorParams.setMargins(margin, dp(context, 104), margin, 0);
            content.addView(editor, editorParams);

            dialog.setContentView(root);
            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawableResource(android.R.color.transparent);
                window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS
                        | WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                window.setDimAmount(0.32f);
                window.setStatusBarColor(Color.TRANSPARENT);
                window.setNavigationBarColor(Color.TRANSPARENT);
                if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
                else window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
                window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING
                        | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
            }
            dialog.setOnShowListener(ignored -> {
                if (window != null) window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                root.requestApplyInsets();
                sheet.setTranslationY(context.getResources().getDisplayMetrics().heightPixels);
                sheet.post(() -> {
                    if (!dialog.isShowing() || dialog.dismissing) return;
                    sheet.animate().translationY(0).setDuration(280)
                            .setInterpolator(new DecelerateInterpolator()).start();
                });
                editor.requestFocus();
                editor.post(() -> {
                    if (!dialog.isShowing()) return;
                    InputMethodManager manager = (InputMethodManager) context.getSystemService(Context.INPUT_METHOD_SERVICE);
                    if (manager != null) manager.showSoftInput(editor, InputMethodManager.SHOW_IMPLICIT);
                });
            });
            dialog.show();
        } catch (Throwable ignored) {
            // Testing the keyboard must never interrupt settings or theme editing.
        }
    }

    /** A modal sheet owns its enter/exit motion independently of the IME window. */
    private static final class KeyboardTestDialog extends Dialog {
        private final EditText editor;
        private View sheet;
        private boolean dismissing;

        KeyboardTestDialog(Context context, EditText editor) {
            super(context, android.R.style.Theme_Material_NoActionBar);
            this.editor = editor;
        }

        @Override public void dismiss() {
            if (dismissing) return;
            dismissing = true;
            InputMethodManager manager = (InputMethodManager)
                    getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
            if (manager != null) manager.hideSoftInputFromWindow(editor.getWindowToken(), 0);
            editor.clearFocus();
            if (sheet == null || !isShowing() || !sheet.isAttachedToWindow()) {
                super.dismiss();
                return;
            }
            sheet.animate().cancel();
            sheet.animate().translationY(sheet.getHeight()).setDuration(220)
                    .setInterpolator(new DecelerateInterpolator())
                    .withEndAction(() -> super.dismiss()).start();
        }
    }

    /** Drag the actual sheet; let text selection and text-field scrolling keep their gestures. */
    private static final class BottomSheetLayout extends FrameLayout {
        private final KeyboardTestDialog dialog;
        private final EditText editor;
        private final int touchSlop;
        private VelocityTracker velocity;
        private float startX, startY;
        private boolean tracking;
        private boolean dragging;

        BottomSheetLayout(Context context, KeyboardTestDialog dialog, EditText editor) {
            super(context);
            this.dialog = dialog;
            this.editor = editor;
            touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        }

        @Override public boolean dispatchTouchEvent(MotionEvent event) {
            if (dialog.dismissing) return true;
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                animate().cancel();
                startX = event.getRawX();
                startY = event.getRawY() - getTranslationY();
                Rect bounds = new Rect();
                editor.getDrawingRect(bounds);
                offsetDescendantRectToMyCoords(editor, bounds);
                tracking = !dialog.dismissing && !bounds.contains((int) event.getX(), (int) event.getY());
                dragging = false;
                if (velocity != null) velocity.recycle();
                velocity = VelocityTracker.obtain();
            }
            if (velocity != null) velocity.addMovement(event);
            if (event.getActionMasked() == MotionEvent.ACTION_POINTER_DOWN) {
                tracking = false;
                if (dragging) settle();
                dragging = false;
            }
            boolean handled = super.dispatchTouchEvent(event);
            if (event.getActionMasked() == MotionEvent.ACTION_UP
                    || event.getActionMasked() == MotionEvent.ACTION_CANCEL) {
                if (velocity != null) velocity.recycle();
                velocity = null;
                if (!dialog.dismissing && getTranslationY() > 0 && !dragging) settle();
            }
            return handled;
        }

        @Override public boolean onInterceptTouchEvent(MotionEvent event) {
            if (event.getActionMasked() == MotionEvent.ACTION_MOVE && tracking) {
                float dx = event.getRawX() - startX;
                float dy = event.getRawY() - startY;
                if (Math.abs(dx) > touchSlop && Math.abs(dx) > Math.abs(dy)) tracking = false;
                if (dy > touchSlop && dy > Math.abs(dx) * 1.5f) {
                    dragging = true;
                    return true;
                }
            }
            return false;
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            float dx = event.getRawX() - startX;
            float dy = event.getRawY() - startY;
            if (event.getActionMasked() == MotionEvent.ACTION_MOVE && tracking) {
                if (Math.abs(dx) > touchSlop && Math.abs(dx) > Math.abs(dy)) tracking = false;
                if (dy > touchSlop && dy > Math.abs(dx) * 1.5f) dragging = true;
                if (dragging) setTranslationY(Math.max(0, dy));
            } else if (event.getActionMasked() == MotionEvent.ACTION_UP) {
                if (dragging && tracking) {
                    float speed = 0;
                    if (velocity != null) {
                        velocity.computeCurrentVelocity(1000);
                        speed = velocity.getYVelocity();
                    }
                    float threshold = Math.min(getHeight() * 0.25f, dp(getContext(), 160));
                    if (getTranslationY() >= threshold
                            || (dy >= dp(getContext(), 24) && speed >= dp(getContext(), 800))) {
                        dialog.dismiss();
                    } else settle();
                }
                dragging = false;
                tracking = false;
            } else if (event.getActionMasked() == MotionEvent.ACTION_CANCEL) {
                if (dragging) settle();
                dragging = false;
                tracking = false;
            }
            return true;
        }

        private void settle() {
            if (!dialog.dismissing) animate().translationY(0).setDuration(200)
                    .setInterpolator(new DecelerateInterpolator()).start();
        }
    }

    private static int[] systemInsets(WindowInsets insets) {
        int left, top, right, bottom;
        if (Build.VERSION.SDK_INT >= 30) {
            android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            left = bars.left; top = bars.top; right = bars.right; bottom = bars.bottom;
        } else {
            left = insets.getStableInsetLeft(); top = insets.getStableInsetTop();
            right = insets.getStableInsetRight(); bottom = insets.getStableInsetBottom();
            if (Build.VERSION.SDK_INT >= 28 && insets.getDisplayCutout() != null) {
                left = Math.max(left, insets.getDisplayCutout().getSafeInsetLeft());
                top = Math.max(top, insets.getDisplayCutout().getSafeInsetTop());
                right = Math.max(right, insets.getDisplayCutout().getSafeInsetRight());
                bottom = Math.max(bottom, insets.getDisplayCutout().getSafeInsetBottom());
            }
        }
        return new int[]{left, top, right, bottom};
    }

    private static TextView createOpenButton(Context context) {
        TextView button = new TextView(context);
        button.setText("⌨  Open Keyboard");
        button.setTextColor(Color.WHITE);
        button.setTextSize(14);
        button.setGravity(Gravity.CENTER);
        button.setPadding(dp(context, 18), 0, dp(context, 18), 0);
        GradientDrawable background = new GradientDrawable();
        background.setColor(0xFF6750A4);
        background.setCornerRadius(dp(context, 28));
        button.setBackground(background);
        button.setElevation(dp(context, 6));
        button.setClickable(true);
        button.setFocusable(true);
        button.setContentDescription("Open Keyboard");
        button.setOnClickListener(view -> openKeyboardPreview(context));
        return button;
    }

    private static ListView findListView(View view) {
        if (view instanceof ListView) return (ListView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                ListView found = findListView(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
