package app.hushmessenger.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.view.inspector.WindowInspector;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Chat bar buttons in the + menu (#198). The camera, gallery and microphone buttons leave the chat bar, so only + stays
 * beside the message box, and each one gets a row in the menu + opens. A row taps the real button, which is only hidden,
 * so everything Messenger does from it stays as it was.
 *
 * Messenger's bar keeps + inside a frame of its own and the other buttons directly in the bar, which tells them apart in
 * every language. The rows take the name and the look of the button they stand for. The menu is a pop-up window Messenger
 * fills from a list of its own, so the rows go in below that list and the window grows upward by their height, keeping its
 * bottom edge on the chat bar. Needs Android 10, the first version that lists an app's windows.
 */
public final class ChatBarPlus {
    static final String KEY = "chat_bar_plus";
    static final String ROWS = "chat_bar_plus_rows";
    private static final String BAR = "ComposerBarLeftPrimaryButtonsView";
    private static final String BUTTON = "ComposerActionButton";
    /** How far the menu's bottom edge may sit from the chat bar and still be the menu + opened. */
    private static final int NEAR_BAR_DP = 16;
    private static final int ROW_DP = 48;
    private static final int ICON_DP = 24;
    private static final int ICON_SLOT_DP = 44;
    private static final int EDGE_DP = 16;
    private static final int DARK_TEXT = 0xFF050505;
    private static final int LIGHT_TEXT = 0xFFE4E6EB;

    private static final Map<View, Boolean> watched = new WeakHashMap<>();

    private ChatBarPlus() { }

    /** The chat fragment's view, on its way in. Called whether the switch is on or off. */
    public static void chatShown(Object fragment, View view) {
        try {
            watch(view);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't follow the chat bar", error);
        }
    }

    /** The chat now followed for [view], or null when there's nothing to follow. */
    static Chat watch(View view) {
        if (view == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.Q || watched.containsKey(view)) return null;
        watched.put(view, true);
        Chat chat = new Chat(view);
        view.addOnAttachStateChangeListener(chat);
        if (view.isAttachedToWindow()) chat.onViewAttachedToWindow(view);
        return chat;
    }

    /** A button taken off the bar and the picture of it its row shows. */
    private static final class Moved {
        final View button;
        final Bitmap icon;

        Moved(View button, Bitmap icon) {
            this.button = button;
            this.icon = icon;
        }
    }

    /** The added rows, which remember the window they made taller. */
    private static final class Rows extends LinearLayout {
        final View window;

        Rows(View window) {
            super(window.getContext());
            this.window = window;
        }
    }

    /** One open chat. Held only by its own view's listeners, so it goes when the chat does. */
    static final class Chat implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener,
            ViewTreeObserver.OnWindowFocusChangeListener {
        private final View root;
        private final List<Moved> moved = new ArrayList<>();
        private ViewGroup bar;

        Chat(View root) {
            this.root = root;
        }

        @Override public void onViewAttachedToWindow(View view) {
            ViewTreeObserver observer = view.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(this);
            observer.addOnWindowFocusChangeListener(this);
            look();
        }

        @Override public void onViewDetachedFromWindow(View view) {
            ViewTreeObserver observer = view.getViewTreeObserver();
            observer.removeOnGlobalLayoutListener(this);
            observer.removeOnWindowFocusChangeListener(this);
        }

        @Override public void onGlobalLayout() {
            look();
        }

        /** The chat's window losing focus is how a menu opening over it shows up. */
        @Override public void onWindowFocusChanged(boolean focused) {
            if (!focused) root.post(this::findMenu);
        }

        /** Takes the buttons off the bar, again whenever Messenger shows them, or gives them back with the switch off. */
        void look() {
            try {
                if (!Settings.wouldUse(KEY)) {
                    giveBack();
                    return;
                }
                ViewGroup found = bar != null && bar.isAttachedToWindow() ? bar : barIn(root);
                if (found != bar) giveBack();
                bar = found;
                if (bar == null || !holdsPlus(bar)) {
                    giveBack();
                    return;
                }
                boolean any = false;
                for (int i = 0; i < bar.getChildCount(); i++) {
                    View child = bar.getChildAt(i);
                    // A button with no name could get no row, so it stays where it can be reached.
                    if (!isButton(child) || child.getVisibility() != View.VISIBLE || InvisibleButtons.nameOf(child) == null) continue;
                    if (!isMoved(child)) moved.add(new Moved(child, iconOf(child)));
                    child.setVisibility(View.GONE);
                    any = true;
                }
                if (any) Settings.enabled(KEY);
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't tidy the chat bar", error);
            }
        }

        private boolean isMoved(View button) {
            for (Moved item : moved) if (item.button == button) return true;
            return false;
        }

        private void giveBack() {
            for (Moved item : moved) if (item.button.getVisibility() == View.GONE) item.button.setVisibility(View.VISIBLE);
            moved.clear();
        }

        /** Finds the menu + just opened among the app's windows and adds the rows. */
        void findMenu() {
            try {
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q || moved.isEmpty() || bar == null
                    || !bar.isAttachedToWindow() || !Settings.wouldUse(KEY)) return;
                for (View window : WindowInspector.getGlobalWindowViews()) {
                    if (window == null || !InvisibleButtons.isMenu(window) || InvisibleButtons.ours(window.getContext())) continue;
                    if (window.getHeight() == 0 && listIn(window) != null) {
                        afterLayout(window);
                        continue;
                    }
                    if (!isPlusMenu(window)) continue;
                    addRows(window);
                    return;
                }
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't add to the + menu", error);
            }
        }

        /** A menu that has no size yet can't be placed against the bar, so the look happens again once it has one. */
        private void afterLayout(View window) {
            window.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                        int oldLeft, int oldTop, int oldRight, int oldBottom) {
                    view.removeOnLayoutChangeListener(this);
                    view.post(Chat.this::findMenu);
                }
            });
        }

        /** A pop-up holding a list, whose bottom edge sits on the chat bar and which starts over the bar's end of the screen. */
        private boolean isPlusMenu(View window) {
            if (!window.isAttachedToWindow() || listIn(window) == null) return false;
            int[] menuAt = new int[2];
            int[] barAt = new int[2];
            window.getLocationOnScreen(menuAt);
            bar.getLocationOnScreen(barAt);
            return Math.abs(menuAt[1] + window.getHeight() - barAt[1]) <= dp(window, NEAR_BAR_DP)
                && menuAt[0] < barAt[0] + bar.getWidth();
        }

        private void addRows(View window) {
            View list = listIn(window);
            View holder = list;
            ViewParent up = list.getParent();
            while (up instanceof View && !(up instanceof LinearLayout)) {
                holder = (View) up;
                up = up.getParent();
            }
            if (!(up instanceof LinearLayout)) throw new IllegalStateException("No column around the menu's list");
            LinearLayout card = (LinearLayout) up;
            View old = card.findViewWithTag(ROWS);
            // The chat can lose focus again with the same menu open, and that window has already grown.
            if (old instanceof Rows && ((Rows) old).window == window) return;
            if (old != null) card.removeView(old);
            if (card.getChildCount() == 1) card.setOrientation(LinearLayout.VERTICAL);
            else if (card.getOrientation() != LinearLayout.VERTICAL) throw new IllegalStateException("The menu isn't a column");

            // Messenger's part keeps the height it has, and the card's look moves out to hold both parts.
            ViewGroup.LayoutParams held = holder.getLayoutParams();
            held.height = holder.getHeight();
            if (held instanceof LinearLayout.LayoutParams) ((LinearLayout.LayoutParams) held).weight = 0;
            holder.setLayoutParams(held);
            wearCard(card, list);

            int height = rowHeight(window, list);
            int color = textOn(card);
            Rows rows = new Rows(window);
            rows.setOrientation(LinearLayout.VERTICAL);
            rows.setTag(ROWS);
            int count = 0;
            for (Moved item : moved) {
                String name = InvisibleButtons.nameOf(item.button);
                if (name == null) continue;
                rows.addView(row(window, item, label(name), height, color), new LinearLayout.LayoutParams(-1, height));
                count++;
            }
            if (count == 0) return;
            card.addView(rows, new LinearLayout.LayoutParams(-1, -2));
            grow(window, rows, height * count);
            Settings.enabled(KEY);
        }

        private View row(View window, Moved item, String name, int height, int color) {
            Context context = window.getContext();
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(height);
            row.setPadding(dp(window, 2), 0, dp(window, EDGE_DP), 0);
            row.setClickable(true);
            row.setFocusable(true);
            row.setContentDescription(name);
            TypedValue ripple = new TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true) && ripple.resourceId != 0) {
                row.setBackgroundResource(ripple.resourceId);
            }
            ImageView icon = new ImageView(context);
            icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
            icon.setImageBitmap(item.icon);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            row.addView(icon, new LinearLayout.LayoutParams(dp(window, ICON_SLOT_DP), dp(window, ICON_DP)));
            TextView title = new TextView(context);
            title.setText(name);
            title.setTextColor(color);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
            title.setSingleLine(true);
            title.setEllipsize(TextUtils.TruncateAt.END);
            title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            row.addView(title, new LinearLayout.LayoutParams(0, -2, 1));
            View button = item.button;
            row.setOnClickListener(tapped -> {
                close(window);
                // After the menu has gone, so whatever the button opens isn't closed along with it.
                root.post(button::performClick);
            });
            return row;
        }
    }

    /** The window taller by [added] with its bottom edge where it was, and wide enough for the rows when it can be. */
    private static void grow(View window, View rows, int added) {
        WindowManager.LayoutParams params = (WindowManager.LayoutParams) window.getLayoutParams();
        if ((params.gravity & Gravity.VERTICAL_GRAVITY_MASK) != Gravity.BOTTOM) params.y -= added;
        if (params.height > 0) params.height += added;
        rows.measure(View.MeasureSpec.UNSPECIFIED, View.MeasureSpec.UNSPECIFIED);
        int room = window.getResources().getDisplayMetrics().widthPixels - 2 * Math.max(0, params.x);
        int wanted = Math.min(rows.getMeasuredWidth(), room);
        if (params.width > 0 && wanted > params.width) params.width = wanted;
        ((WindowManager) window.getContext().getSystemService(Context.WINDOW_SERVICE)).updateViewLayout(window, params);
    }

    /** Moves the menu's background from whichever view under [card] paints it, so it runs behind the new rows too. */
    private static void wearCard(LinearLayout card, View list) {
        if (card.getBackground() != null) return;
        View painted = null;
        for (View step = list; step != card; step = (View) step.getParent()) {
            if (step.getBackground() != null) painted = step;
        }
        if (painted == null) return;
        Drawable background = painted.getBackground();
        painted.setBackground(null);
        card.setBackground(background);
        card.setOutlineProvider(painted.getOutlineProvider());
        card.setClipToOutline(painted.getClipToOutline());
        card.setElevation(painted.getElevation());
        painted.setElevation(0);
    }

    /** Text that reads on the card: its own color decides, and the phone's dark setting when it has none to read. */
    private static int textOn(View card) {
        Drawable background = card.getBackground();
        if (background != null) {
            Bitmap sample = Bitmap.createBitmap(8, 8, Bitmap.Config.ARGB_8888);
            Rect bounds = background.copyBounds();
            background.setBounds(0, 0, 8, 8);
            background.draw(new Canvas(sample));
            background.setBounds(bounds);
            int pixel = sample.getPixel(4, 4);
            sample.recycle();
            if (Color.alpha(pixel) > 128) return Color.luminance(pixel) < 0.5f ? LIGHT_TEXT : DARK_TEXT;
        }
        int night = card.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return night == Configuration.UI_MODE_NIGHT_NO ? DARK_TEXT : LIGHT_TEXT;
    }

    /** Back, the way a pop-up window expects it, which closes the menu. */
    private static void close(View window) {
        long now = SystemClock.uptimeMillis();
        window.dispatchKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK, 0));
        window.dispatchKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK, 0));
    }

    /** What the button drew, cut to the drawing itself, or null when it can't be read here. */
    private static Bitmap iconOf(View button) {
        int width = button.getWidth();
        int height = button.getHeight();
        if (width <= 0 || height <= 0) return null;
        Bitmap all = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        try {
            button.draw(new Canvas(all));
        } catch (IllegalArgumentException hardwareBitmap) {
            return null; // A picture only the GPU can read. The row still works with its name alone.
        }
        int[] pixels = new int[width * height];
        all.getPixels(pixels, 0, width, 0, 0, width, height);
        int left = width, top = height, right = -1, bottom = -1;
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                if (Color.alpha(pixels[x + y * width]) <= 16) continue;
                left = Math.min(left, x);
                right = Math.max(right, x);
                top = Math.min(top, y);
                bottom = Math.max(bottom, y);
            }
        }
        return right < 0 ? null : Bitmap.createBitmap(all, left, top, right - left + 1, bottom - top + 1);
    }

    /** A button's spoken name reads as a sentence. As a row it doesn't need the full stop. */
    static String label(String name) {
        return name.endsWith(".") ? name.substring(0, name.length() - 1) : name;
    }

    private static int rowHeight(View window, View list) {
        if (list instanceof ViewGroup && ((ViewGroup) list).getChildCount() > 0) {
            int height = ((ViewGroup) list).getChildAt(0).getHeight();
            if (height > 0) return height;
        }
        return dp(window, ROW_DP);
    }

    private static boolean isButton(View view) {
        return BUTTON.equals(view.getClass().getSimpleName());
    }

    /** + sits in a frame of its own inside the bar, where the other buttons are the bar's own children. */
    private static boolean holdsPlus(ViewGroup bar) {
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (isButton(child) || !(child instanceof ViewGroup)) continue;
            ViewGroup frame = (ViewGroup) child;
            for (int j = 0; j < frame.getChildCount(); j++) if (isButton(frame.getChildAt(j))) return true;
        }
        return false;
    }

    private static ViewGroup barIn(View view) {
        if (!(view instanceof ViewGroup) || ChatJump.isList(view.getClass())) return null;
        ViewGroup group = (ViewGroup) view;
        if (BAR.equals(group.getClass().getSimpleName())) return group;
        for (int i = 0; i < group.getChildCount(); i++) {
            ViewGroup found = barIn(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static View listIn(View view) {
        if (ChatJump.isList(view.getClass())) return view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View found = listIn(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
}
