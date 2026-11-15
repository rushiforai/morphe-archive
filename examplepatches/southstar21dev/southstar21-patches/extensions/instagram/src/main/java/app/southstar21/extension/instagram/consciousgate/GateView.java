package app.southstar21.extension.instagram.consciousgate;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import app.southstar21.extension.instagram.settings.Icons;

/**
 * Covers a gated screen from the moment it starts to frost.
 * <ul>
 *   <li>While frosting, taps are blocked so nothing can be opened or interacted with, but drags
 *       are passed straight to the list's own scrolling, so it still scrolls. A badge says the
 *       gate is active and how many seconds are left.</li>
 *   <li>Once closed, every touch is swallowed and a card says why, with an optional button
 *       for extra minutes that counts down before it can be used.</li>
 * </ul>
 * The tabs of the tab bar stay usable either way: the floating tab bar sits over the bottom of
 * the list, so the gate covers it, but touches on its tabs go straight through.
 */
@SuppressLint("ViewConstructor")
final class GateView extends FrameLayout {
    private static final int ACCENT = 0xFF0095F6;
    private static final int ICON_COLOR = 0xFF30B0C7;
    private static final long FADE_MS = 350;
    /** How long the gate keeps swallowing touches as it fades out after opening. */
    private static final long LEAVE_MS = 400;

    private final float density;
    private final TextView badgeLabel;
    private final View card;
    private final TextView title;
    private final TextView body;
    private final TextView extra;
    private final TextView close;
    private final int[] ownLocation = new int[2];
    private final int[] listLocation = new int[2];
    private final Rect tabRect = new Rect();
    private WeakReference<View> list = new WeakReference<>(null);
    private WeakReference<View> tabBar = new WeakReference<>(null);
    private boolean scrollable;
    private boolean shown;
    private boolean closed;
    private boolean extraAvailable;
    private boolean closable;
    private boolean leaving;
    private int extraMinutes;
    /** Seconds until the extra time button can be used. */
    private int countdown;
    private int waitSeconds;
    private final Runnable countdownTick = this::countdownTick;

    // Sideways swipes go on to Instagram's swipe navigation (left of Home is Create): opening
    // the camera to post isn't scrolling, so the gate mustn't stop it.
    private final int touchSlop;
    private final int[] containerLocation = new int[2];
    private WeakReference<View> swipeContainer = new WeakReference<>(null);
    /** The gesture's down, replayed to the swipe container when the gesture turns sideways. */
    private MotionEvent swipeDown;
    /** The current gesture belongs to the swipe container. */
    private boolean handedOff;
    /** Set while passing events to the container, in case it ever routes them back here. */
    private boolean forwarding;

    GateView(Context context, boolean dark) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        touchSlop = android.view.ViewConfiguration.get(context).getScaledTouchSlop();
        int text = dark ? 0xFFF5F5F5 : 0xFF111111;
        int secondary = dark ? 0xB3FFFFFF : 0x99000000;
        int surface = dark ? 0xE61C1C1E : 0xEBFFFFFF;
        int hairline = dark ? 0x26FFFFFF : 0x14000000;

        setClickable(true);
        setFocusable(true);
        setAlpha(0f);
        setVisibility(GONE);

        LinearLayout badge = new LinearLayout(context);
        badge.setOrientation(LinearLayout.HORIZONTAL);
        badge.setGravity(Gravity.CENTER_VERTICAL);
        badge.setPadding(dp(8), dp(6), dp(14), dp(6));
        badge.setBackground(rounded(surface, dp(18), hairline));
        badge.setElevation(dp(6));
        View badgeIcon = new View(context);
        badgeIcon.setBackground(Icons.tile(Icons.Glyph.HOURGLASS, ICON_COLOR, density));
        badge.addView(badgeIcon, new LinearLayout.LayoutParams(dp(22), dp(22)));
        badgeLabel = new TextView(context);
        badgeLabel.setTextColor(text);
        badgeLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        badgeLabel.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        badgeLabel.setSingleLine(true);
        LinearLayout.LayoutParams labelParams = wrap();
        labelParams.leftMargin = dp(8);
        badge.addView(badgeLabel, labelParams);
        LayoutParams badgeParams = new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        badgeParams.topMargin = dp(12);
        addView(badge, badgeParams);

        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        int pad = dp(24);
        card.setPadding(pad, dp(28), pad, dp(20));
        card.setBackground(rounded(surface, dp(28), hairline));
        card.setElevation(dp(12));
        card.setVisibility(GONE);

        View icon = new View(context);
        icon.setBackground(Icons.tile(Icons.Glyph.HOURGLASS, ICON_COLOR, density));
        card.addView(icon, new LinearLayout.LayoutParams(dp(56), dp(56)));

        title = new TextView(context);
        title.setTextColor(text);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams titleParams = wrap();
        titleParams.topMargin = dp(16);
        card.addView(title, titleParams);

        body = new TextView(context);
        body.setTextColor(secondary);
        body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        body.setGravity(Gravity.CENTER);
        body.setLineSpacing(0, 1.15f);
        LinearLayout.LayoutParams bodyParams = wrap();
        bodyParams.topMargin = dp(8);
        card.addView(body, bodyParams);

        extra = new TextView(context);
        extra.setTextColor(0xFFFFFFFF);
        extra.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        extra.setTypeface(Typeface.DEFAULT_BOLD);
        extra.setGravity(Gravity.CENTER);
        extra.setPadding(dp(20), dp(12), dp(20), dp(12));
        extra.setBackground(rounded(ACCENT, dp(24), 0));
        extra.setOnClickListener(v -> {
            if (countdown <= 0) ConsciousGatePatch.takeExtra();
        });
        LinearLayout.LayoutParams extraParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        extraParams.topMargin = dp(20);
        card.addView(extra, extraParams);

        // Stories cover the whole screen, close button and all, so the gate brings its own.
        close = new TextView(context);
        close.setText("Close");
        close.setTextColor(text);
        close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        close.setTypeface(Typeface.DEFAULT_BOLD);
        close.setGravity(Gravity.CENTER);
        close.setPadding(dp(20), dp(12), dp(20), dp(12));
        close.setBackground(rounded(hairline, dp(24), 0));
        close.setVisibility(GONE);
        close.setOnClickListener(v -> {
            if (getContext() instanceof Activity) ((Activity) getContext()).onBackPressed();
        });
        LinearLayout.LayoutParams closeParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        closeParams.topMargin = dp(10);
        card.addView(close, closeParams);

        this.card = card;
        addView(card, new LayoutParams(dp(300), LayoutParams.WRAP_CONTENT, Gravity.CENTER));
    }

    /**
     * The surface under the gate. While the gate is open, drags are passed to it if it's a list;
     * other surfaces, such as stories, get no touches at all.
     */
    void setSurface(View surface, boolean scrollable) {
        if (this.list.get() != surface) this.list = new WeakReference<>(surface);
        this.scrollable = scrollable;
    }

    /** The tab bar, whose tabs stay usable where the gate covers them. */
    void setTabBar(View bar) {
        if (tabBar.get() != bar) tabBar = new WeakReference<>(bar);
    }

    /** Whether the closed gate shows a button to close the screen, for stories. */
    void setClosable(boolean closable) {
        if (this.closable == closable) return;
        this.closable = closable;
        close.setVisibility(closable ? VISIBLE : GONE);
    }

    void setBadge(String text) {
        if (!TextUtils.equals(badgeLabel.getText(), text)) badgeLabel.setText(text);
    }

    /**
     * Closes the gate (card, no touches) or keeps it open (badge, scrolling only).
     *
     * @param waitSeconds how long the extra time button counts down before it can be used.
     */
    void setClosed(boolean closed, String titleText, String bodyText,
                   boolean extraAvailable, int extraMinutes, int waitSeconds) {
        if (closed) {
            if (!TextUtils.equals(title.getText(), titleText)) title.setText(titleText);
            if (!TextUtils.equals(body.getText(), bodyText)) body.setText(bodyText);
        }
        this.waitSeconds = waitSeconds;
        if (this.extraAvailable != extraAvailable || this.extraMinutes != extraMinutes) {
            this.extraAvailable = extraAvailable;
            this.extraMinutes = extraMinutes;
            extra.setVisibility(extraAvailable ? VISIBLE : GONE);
            updateExtraLabel();
        }
        if (this.closed == closed) return;
        this.closed = closed;
        card.animate().cancel();
        if (closed) {
            card.setVisibility(VISIBLE);
            card.setAlpha(0f);
            card.setTranslationY(dp(12));
            card.animate().alpha(1f).translationY(0f).setDuration(FADE_MS).start();
            startCountdown();
        } else {
            card.setVisibility(GONE);
            removeCallbacks(countdownTick);
        }
    }

    // region Extra time countdown

    private void startCountdown() {
        removeCallbacks(countdownTick);
        countdown = waitSeconds;
        updateExtraLabel();
        if (countdown > 0) postDelayed(countdownTick, 1000);
    }

    private void countdownTick() {
        countdown--;
        updateExtraLabel();
        if (countdown > 0) postDelayed(countdownTick, 1000);
    }

    private void updateExtraLabel() {
        boolean waiting = countdown > 0;
        extra.setText(waiting
                ? "Wait " + countdown + " s"
                : extraMinutes + " more minute" + (extraMinutes == 1 ? "" : "s"));
        extra.setAlpha(waiting ? 0.45f : 1f);
        extra.setEnabled(!waiting);
    }

    // endregion

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (forwarding) return false;
        // Fading out after opening: a quick second tap on the button mustn't land on the screen.
        if (leaving) return true;
        int action = event.getActionMasked();
        // Not taking the down leaves the whole gesture to the tab under it.
        if (action == MotionEvent.ACTION_DOWN && onTab(event)) return false;

        // A sideways swipe goes to Instagram's swipe navigation, as without the gate.
        if (action == MotionEvent.ACTION_DOWN) {
            handedOff = false;
            if (swipeDown != null) swipeDown.recycle();
            swipeDown = MotionEvent.obtain(event);
        } else if (handedOff) {
            toSwipeContainer(event);
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) handedOff = false;
            return true;
        } else if (action == MotionEvent.ACTION_MOVE && swipeDown != null && sideways(event)) {
            View container = swipeContainer();
            if (container != null) {
                handedOff = true;
                // What had the gesture so far (the card's buttons, or the list) lets go of it.
                MotionEvent cancel = MotionEvent.obtain(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                if (closed) super.dispatchTouchEvent(cancel);
                else toList(cancel);
                cancel.recycle();
                // The container sees the gesture from its start, then where it is now.
                toSwipeContainer(swipeDown);
                toSwipeContainer(event);
                return true;
            }
        }

        // Closed: only the card's buttons work, the rest is swallowed by this clickable view.
        if (closed) return super.dispatchTouchEvent(event);

        // Open: hand the gesture to the RecyclerView's own touch handling, which scrolls it
        // but never reaches its items, so nothing can be tapped, liked or opened.
        toList(event);
        return true;
    }

    /** Passes {@code event} (in this view's coordinates) to the list's own touch handling. */
    private void toList(MotionEvent event) {
        View target = list.get();
        if (!scrollable || target == null || !target.isAttachedToWindow()) return;
        getLocationOnScreen(ownLocation);
        target.getLocationOnScreen(listLocation);
        MotionEvent copy = MotionEvent.obtain(event);
        try {
            copy.offsetLocation(ownLocation[0] - listLocation[0], ownLocation[1] - listLocation[1]);
            target.onTouchEvent(copy);
        } finally {
            copy.recycle();
        }
    }

    /** Whether the finger has moved clearly more sideways than up or down since the down. */
    private boolean sideways(MotionEvent event) {
        float dx = Math.abs(event.getX() - swipeDown.getX());
        float dy = Math.abs(event.getY() - swipeDown.getY());
        return dx > touchSlop && dx > dy * 1.5f;
    }

    /** Instagram's swipe navigation container (feed, camera, messages), which sits under the gate. */
    private View swipeContainer() {
        View cached = swipeContainer.get();
        if (cached != null && cached.isAttachedToWindow()) return cached;
        // Found by its class, whose name Instagram keeps unobfuscated.
        View found = findByClass(getRootView(), SWIPE_CONTAINER_CLASS);
        // Only one that's beside or below the gate, never one containing it.
        for (View v = this; found != null && v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
            if (v == found) found = null;
        }
        swipeContainer = new WeakReference<>(found);
        if (found == null) android.util.Log.w("ConsciousGate", "Swipe navigation container not found");
        return found;
    }

    private static final String SWIPE_CONTAINER_CLASS =
            "com.instagram.ui.swipenavigation.container.SwipeNavigationContainer";

    private static View findByClass(View view, String className) {
        if (view.getClass().getName().equals(className)) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findByClass(group.getChildAt(i), className);
                if (found != null) return found;
            }
        }
        return null;
    }

        /** Dispatches {@code event} (in this view's coordinates) to the swipe container. */
    private void toSwipeContainer(MotionEvent event) {
        View container = swipeContainer.get();
        if (container == null || !container.isAttachedToWindow()) return;
        getLocationOnScreen(ownLocation);
        container.getLocationOnScreen(containerLocation);
        MotionEvent copy = MotionEvent.obtain(event);
        forwarding = true;
        try {
            copy.offsetLocation(ownLocation[0] - containerLocation[0], ownLocation[1] - containerLocation[1]);
            container.dispatchTouchEvent(copy);
        } finally {
            forwarding = false;
            copy.recycle();
        }
    }

    /** Whether a touch lands on one of the tab bar's tabs, which are its children. */
    private boolean onTab(MotionEvent event) {
        View bar = tabBar.get();
        if (!(bar instanceof ViewGroup) || !bar.isShown()) return false;
        // Both in the window's coordinates, as the gate's position is.
        getLocationInWindow(ownLocation);
        int x = Math.round(event.getX()) + ownLocation[0];
        int y = Math.round(event.getY()) + ownLocation[1];
        ViewGroup group = (ViewGroup) bar;
        for (int i = 0; i < group.getChildCount(); i++) {
            View tab = group.getChildAt(i);
            if (tab.isShown() && tab.getGlobalVisibleRect(tabRect) && tabRect.contains(x, y)) return true;
        }
        return false;
    }

    void show() {
        if (shown) return;
        shown = true;
        setVisibility(VISIBLE);
        animate().cancel();
        animate().alpha(1f).setDuration(FADE_MS).start();
        // Coming back to the gate starts the wait again.
        if (closed) startCountdown();
    }

    void hide() {
        if (!shown) return;
        shown = false;
        animate().cancel();
        setAlpha(0f);
        setVisibility(GONE);
    }

    /**
     * Fades out and removes itself once the gate opens. Until it's gone it keeps swallowing
     * touches, so a second tap on the extra time button doesn't open whatever is under it.
     */
    void leave() {
        leaving = true;
        removeCallbacks(countdownTick);
        animate().cancel();
        if (!shown) {
            removeSelf();
            return;
        }
        animate().alpha(0f).setDuration(LEAVE_MS).withEndAction(this::removeSelf).start();
    }

    private void removeSelf() {
        if (getParent() instanceof ViewGroup) ((ViewGroup) getParent()).removeView(this);
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(countdownTick);
    }

    private GradientDrawable rounded(int color, float radius, int stroke) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(radius);
        if (stroke != 0) drawable.setStroke(Math.max(1, dp(0.5f)), stroke);
        return drawable;
    }

    private LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
    }

    private int dp(float value) {
        return Math.round(value * density);
    }
}
