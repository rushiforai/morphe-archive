/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.BiPredicate;
import java.util.function.Function;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The second switch of View stories anonymously: a Mark as seen button over the story viewer.
 *
 * <p>Facebook draws the story viewer's header with Litho, so there's no row of views to put a
 * button in. The eye goes on the story viewer's window instead, at the top end, left of where the
 * header's menu and close buttons sit. The patch calls {@link #onCard} first thing in the seen
 * helper's per-card method, which runs for each card Facebook is about to count as viewed, with the
 * account's session, so the button always speaks for the card on screen. It shows where that card
 * stands ({@link StoryMarks}): an eye with a slash while it's held back, a solid eye once marked,
 * dimmed once sent. A tap marks the card, or takes the mark back before it goes. A card a batch
 * already held back is sent straight away through the sender that held it ({@link StorySeen#sendHeld}).
 *
 * <p>The seen helper doesn't count every card (some bucket types skip it, and a late callback can
 * count a card the viewer has already left), so a second patch hook, {@link #onActive}, runs when
 * Facebook makes a card the active one. The button speaks for that card only: moving to a card the
 * helper hasn't named hides the eye, a card counted after the viewer moved on never gets it, and a
 * tap on an eye that no longer matches the active card marks nothing. A card is sent at once only
 * while it's still the active card; otherwise the mark waits for the next batch that holds it. A
 * viewer that only goes behind another screen, like the share sheet, keeps its card and comes
 * back with the eye on it; one that closes forgets it, whether it closes in front or behind
 * another screen.
 *
 * <p>Each card is named for the story viewer that was newest when Facebook named it, and the eye
 * binds a card only over that viewer. One viewer is the same from its open to its close, through
 * a rebuild for a configuration change. So a viewer opened after another one closed never shows,
 * or sends with a quick tap, the card the closed one left behind.
 *
 * <p>The button shows only while views are anonymous and its own switch is on, and only over
 * StoryViewerActivity while it's in front. Either switch off, Hushfacebook paused or the settings
 * not read yet, it's hidden and forgets its card, and the send hook holds batches back or lets them
 * through as it would without it.
 */
public final class StorySeenButton {
    /** The story viewer's activity, a kept class name. */
    static final String VIEWER = "com.facebook.stories.viewer.activity.StoryViewerActivity";

    static final String HOOK = "story seen button";

    /** The eye's size, and its place from the window's top end, in dp: left of the menu and close buttons. */
    static final int SIZE_DP = 40;
    static final int TOP_DP = 14;
    static final int END_DP = 92;

    /** The card on screen: the account it's viewed on, its id and the story viewer it was named for. */
    static final class Shown {
        final String account;
        final String card;
        /** The viewer's token ({@link #viewers}), or null when no viewer was open. */
        @Nullable
        final Object viewer;

        Shown(String account, String card, @Nullable Object viewer) {
            this.account = account;
            this.card = card;
            this.viewer = viewer;
        }
    }

    /** The card Facebook made active, and the story viewer it was made active in. */
    static final class Active {
        final String card;
        @Nullable
        final Object viewer;

        Active(String card, @Nullable Object viewer) {
            this.card = card;
            this.viewer = viewer;
        }
    }

    /** Where {@link #onCard} reads a card's id: the patch's filled stub. Tests hand in their own. */
    static volatile Function<Object, String> cardIds = StorySeenButton::cardId;

    /** What a tap uses to send a held card at once, with its account and id. Tests record the calls instead. */
    static volatile BiPredicate<String, String> sendNow = StorySeen::sendHeld;

    /** How many cards' accounts {@link #known} remembers. */
    static final int KNOWN_CARDS = 64;

    @Nullable
    private static volatile Shown shown;
    /** The card Facebook made active last, or null before any, or once its viewer closed. */
    @Nullable
    private static volatile Active active;
    /**
     * A token for each open story viewer, one viewer from its open to its close. Read and written on
     * the main thread only.
     */
    private static final Map<Activity, Object> viewers = new WeakHashMap<>();
    /** The newest story viewer's token, which the cards Facebook names now belong to, or null with none open. */
    @Nullable
    private static volatile Object newest;
    /** The token of a viewer destroyed to be rebuilt for a configuration change, for the instance that replaces it. */
    @Nullable
    private static Object rebuilding;
    /** The account each recently counted card was viewed on, so a card returned to can show the eye again. */
    private static final Map<String, String> known = new LinkedHashMap<String, String>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > KNOWN_CARDS;
        }
    };
    private static volatile WeakReference<Activity> viewer = new WeakReference<>(null);
    private static volatile WeakReference<ImageView> button = new WeakReference<>(null);

    private StorySeenButton() {
    }

    /**
     * Injected first thing in the seen helper's per-card method, with the account's session, the
     * card's bucket and the card. Points the button at that card while the switches are on, and
     * hides it otherwise. Never throws.
     */
    public static void onCard(@Nullable Object session, @Nullable Object bucket, @Nullable Object card) {
        try {
            HookStatus.invoked(FamilyNames.STORY_SEEN);
            Shown now = null;
            if (switchedOn() && card != null) {
                String id = cardIds.apply(card);
                String account = StorySeen.account(session);
                if (id != null && !id.isEmpty() && account != null) {
                    remember(id, account);
                    // A card counted after the viewer moved on isn't the one on screen.
                    Object viewer = newest;
                    String current = activeIn(viewer);
                    if (current == null || current.equals(id)) now = new Shown(account, id, viewer);
                }
            }
            rebind(now);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /**
     * Injected where Facebook's story controllers take a card as the active one, with the card.
     * Points the button at that card when the seen helper has counted it on an account, and hides
     * the eye otherwise, so it never stays on the card the viewer left. Runs once per controller
     * that listens, so it's cheap and repeats harmlessly. Never throws.
     */
    public static void onActive(@Nullable Object card) {
        try {
            HookStatus.invoked(FamilyNames.STORY_SEEN);
            String id = card == null ? null : cardIds.apply(card);
            if (id != null && id.isEmpty()) id = null;
            Object viewer = newest;
            active = id == null ? null : new Active(id, viewer);
            Shown now = null;
            if (id != null && switchedOn()) {
                String account;
                synchronized (known) {
                    account = known.get(id);
                }
                if (account != null) now = new Shown(account, id, viewer);
            }
            rebind(now);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /** The card active in [viewer], or null when the active card belongs to another viewer or there's none. */
    @Nullable
    private static String activeIn(@Nullable Object viewer) {
        Active current = active;
        return current != null && current.viewer == viewer ? current.card : null;
    }

    private static void remember(String id, String account) {
        synchronized (known) {
            known.put(id, account);
        }
    }

    /** Points the button at [now], or hides it for null, redrawing only when that changes something. */
    private static void rebind(@Nullable Shown now) {
        Shown was = shown;
        if (now == null && was == null) return;
        if (now != null && was != null && now.card.equals(was.card) && now.account.equals(was.account)
                && now.viewer == was.viewer) {
            return;
        }
        shown = now;
        Utils.runOnMainThread(StorySeenButton::refresh);
    }

    /** Whether the button shows: views held back and its own switch on. Both read off while paused. */
    static boolean switchedOn() {
        return Utils.settingsReady() && Settings.VIEW_STORIES_ANONYMOUSLY.get() && Settings.MARK_STORIES_SEEN.get();
    }

    /** The card the button speaks for, or null. */
    @Nullable
    static Shown shown() {
        return shown;
    }

    /**
     * From the activity callbacks: [activity] was created. A story viewer gets its token here, the
     * one of the viewer it replaces when that one was rebuilt for a configuration change, so the
     * cards Facebook names while it opens are its own. Never throws.
     */
    public static void activityCreated(Activity activity) {
        try {
            if (!VIEWER.equals(activity.getClass().getName())) return;
            Object token = rebuilding != null ? rebuilding : new Object();
            rebuilding = null;
            viewers.put(activity, token);
            newest = token;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /** From the activity callbacks: [activity] came to the front. Never throws. */
    public static void activityResumed(Activity activity) {
        try {
            if (!VIEWER.equals(activity.getClass().getName())) return;
            newest = tokenOf(activity);
            viewer = new WeakReference<>(activity);
            refresh();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /** [activity]'s token, given one now when its creation went unseen. Main thread. */
    private static Object tokenOf(Activity activity) {
        Object token = viewers.get(activity);
        if (token == null) {
            token = new Object();
            viewers.put(activity, token);
        }
        return token;
    }

    /**
     * From the activity callbacks: [activity] left the front. Hides the eye if it was over it. A
     * viewer that's closing forgets its cards. One that only went behind another screen, like the
     * share sheet, is still on the card it showed when it comes back, so it keeps them, and a tap
     * then still sends a held card at once. Never throws.
     */
    public static void activityPaused(Activity activity) {
        try {
            if (viewer.get() != activity) return;
            viewer = new WeakReference<>(null);
            if (activity.isFinishing()) closed(viewers.get(activity));
            ImageView eye = button.get();
            if (eye != null) hide(eye);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /**
     * From the activity callbacks: [activity] is gone. A story viewer that closed behind another
     * screen forgets its cards here, since its pause didn't know it was closing. One destroyed to be
     * rebuilt for a configuration change hands its token to the instance that replaces it. Never
     * throws.
     */
    public static void activityDestroyed(Activity activity) {
        try {
            if (!VIEWER.equals(activity.getClass().getName())) return;
            Object token = viewers.remove(activity);
            if (viewer.get() == activity) {
                viewer = new WeakReference<>(null);
                ImageView eye = button.get();
                if (eye != null) hide(eye);
            }
            if (token == null) return;
            if (activity.isChangingConfigurations()) {
                rebuilding = token;
                return;
            }
            closed(token);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /**
     * The viewer with [token] closed. The newest viewer closing forgets everything, as before a
     * viewer opens. An older one, closing behind a newer viewer, takes only its own cards with it.
     */
    private static void closed(@Nullable Object token) {
        if (token == null || token == newest) {
            forget();
            return;
        }
        Shown was = shown;
        if (was != null && was.viewer == token) shown = null;
        Active current = active;
        if (current != null && current.viewer == token) active = null;
    }

    /** Forgets the card on screen, the active one, the accounts of the cards counted and the newest viewer. */
    private static void forget() {
        shown = null;
        active = null;
        newest = null;
        synchronized (known) {
            known.clear();
        }
    }

    /** Shows the eye for the card on screen over the story viewer in front, or hides it. Main thread. */
    static void refresh() {
        try {
            Activity activity = viewer.get();
            Shown now = shown;
            ImageView eye = button.get();
            // A card named for another viewer, or before any, is never this viewer's to show.
            if (activity == null || now == null || now.viewer == null || now.viewer != viewers.get(activity)
                    || !switchedOn()) {
                if (eye != null) hide(eye);
                return;
            }
            if (eye == null || eye.getContext() != activity || eye.getParent() == null) {
                eye = attach(activity);
                if (eye == null) return;
                button = new WeakReference<>(eye);
            }
            eye.setTag(now);
            show(eye, StorySeen.MARKS.state(now.account, now.card));
            eye.setVisibility(View.VISIBLE);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /** A tap on [eye]: marks its card or takes the mark back, and shows where it stands. Never throws. */
    static void tapped(ImageView eye) {
        try {
            if (!(eye.getTag() instanceof Shown)) return;
            if (!switchedOn()) {
                hide(eye);
                return;
            }
            Shown bound = (Shown) eye.getTag();
            Context shownOn = eye.getContext();
            if (!(shownOn instanceof Activity) || bound.viewer == null || bound.viewer != viewers.get(shownOn)) {
                // The eye's card belongs to another viewer than the one it sits on.
                hide(eye);
                return;
            }
            String current = activeIn(bound.viewer);
            if (current != null && !current.equals(bound.card)) {
                // The viewer moved on and the eye hasn't caught up: this tap isn't for that card.
                hide(eye);
                return;
            }
            // Send at once only while the card is known to be on screen. Without that, the mark
            // waits and goes with the next batch that holds the card.
            boolean onScreen = current != null;
            if (StorySeen.MARKS.toggle(bound.account, bound.card) == StoryMarks.State.MARKED && onScreen) {
                sendNow.test(bound.account, bound.card);
            }
            StoryMarks.State now = StorySeen.MARKS.state(bound.account, bound.card);
            show(eye, now);
            eye.announceForAccessibility(describe(now));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
        }
    }

    /** What the button says it does, for TalkBack. */
    static String describe(StoryMarks.State state) {
        switch (state) {
            case MARKED:
                return L10n.t("Marked as seen. Tap again to undo.");
            case SENT:
                return L10n.t("Marked as seen and sent");
            default:
                return L10n.t("Mark as seen");
        }
    }

    /** Forgets the card, the viewer and the button. */
    static void resetForTests() {
        cardIds = StorySeenButton::cardId;
        sendNow = StorySeen::sendHeld;
        forget();
        viewers.clear();
        rebuilding = null;
        viewer = new WeakReference<>(null);
        button = new WeakReference<>(null);
    }

    /** The eye on [activity]'s window, or null when the window has no frame to put it in. */
    @Nullable
    private static ImageView attach(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        if (!(decor instanceof FrameLayout)) return null;
        float density = activity.getResources().getDisplayMetrics().density;
        ImageView eye = new ImageView(activity);
        eye.setImageDrawable(new Eye(density));
        eye.setScaleType(ImageView.ScaleType.CENTER);
        eye.setClickable(true);
        eye.setFocusable(true);
        eye.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        TypedValue ripple = new TypedValue();
        if (activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true)
                && ripple.resourceId != 0) {
            eye.setBackgroundResource(ripple.resourceId);
        }
        eye.setOnClickListener(view -> tapped((ImageView) view));
        int size = Math.round(SIZE_DP * density);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.END);
        WindowInsets insets = decor.getRootWindowInsets();
        params.topMargin = (insets == null ? 0 : insets.getSystemWindowInsetTop()) + Math.round(TOP_DP * density);
        params.setMarginEnd(Math.round(END_DP * density));
        ((ViewGroup) decor).addView(eye, params);
        return eye;
    }

    /** Hides [eye] and forgets its card, so nothing can mark it until a card shows it again. */
    private static void hide(ImageView eye) {
        eye.setVisibility(View.GONE);
        eye.setTag(null);
    }

    private static void show(ImageView eye, StoryMarks.State state) {
        Drawable drawable = eye.getDrawable();
        if (drawable instanceof Eye) ((Eye) drawable).setState(state);
        eye.setContentDescription(describe(state));
        eye.setEnabled(state != StoryMarks.State.SENT);
        eye.setAlpha(state == StoryMarks.State.SENT ? 0.6f : 1f);
    }

    /**
     * The button's eye, drawn rather than taken from Facebook's resources: an outline with a slash
     * while the card is held back, solid once it's marked or sent. White with a soft shadow, so it
     * reads over any story.
     */
    static final class Eye extends Drawable {
        private final float unit;
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint iris = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path outline = new Path();
        private StoryMarks.State state = StoryMarks.State.UNMARKED;

        Eye(float density) {
            unit = density;
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(2 * density);
            stroke.setStrokeCap(Paint.Cap.ROUND);
            stroke.setColor(Color.WHITE);
            stroke.setShadowLayer(2 * density, 0, 0, 0x66000000);
            fill.setStyle(Paint.Style.FILL);
            fill.setColor(Color.WHITE);
            fill.setShadowLayer(2 * density, 0, 0, 0x66000000);
            iris.setStyle(Paint.Style.FILL);
            iris.setColor(0xFF1C1E21);
        }

        StoryMarks.State state() {
            return state;
        }

        void setState(StoryMarks.State state) {
            if (this.state == state) return;
            this.state = state;
            invalidateSelf();
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Rect bounds = getBounds();
            float x = bounds.exactCenterX();
            float y = bounds.exactCenterY();
            float reach = 10 * unit;
            outline.reset();
            outline.moveTo(x - reach, y);
            outline.cubicTo(x - 5 * unit, y - 8 * unit, x + 5 * unit, y - 8 * unit, x + reach, y);
            outline.cubicTo(x + 5 * unit, y + 8 * unit, x - 5 * unit, y + 8 * unit, x - reach, y);
            outline.close();
            if (state == StoryMarks.State.UNMARKED) {
                canvas.drawPath(outline, stroke);
                canvas.drawCircle(x, y, 2.5f * unit, stroke);
                canvas.drawLine(x - 9 * unit, y + 9 * unit, x + 9 * unit, y - 9 * unit, stroke);
            } else {
                canvas.drawPath(outline, fill);
                canvas.drawCircle(x, y, 3 * unit, iris);
            }
        }

        @Override
        public int getIntrinsicWidth() {
            return Math.round(24 * unit);
        }

        @Override
        public int getIntrinsicHeight() {
            return Math.round(24 * unit);
        }

        @Override
        public void setAlpha(int alpha) {
            stroke.setAlpha(alpha);
            fill.setAlpha(alpha);
            iris.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter filter) {
            stroke.setColorFilter(filter);
            fill.setColorFilter(filter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled in by the patch: the id Facebook's seen helper queues for [card], a StoryCard. */
    @Nullable
    public static String cardId(Object card) {
        return null;
    }
}
