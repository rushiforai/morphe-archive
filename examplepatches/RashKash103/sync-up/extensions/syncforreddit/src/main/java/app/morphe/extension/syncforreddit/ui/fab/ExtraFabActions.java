package app.morphe.extension.syncforreddit.ui.fab;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import com.laurencedawson.reddit_sync.singleton.SettingsSingleton;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

import com.laurencedawson.reddit_sync.ui.activities.BaseActivity;
import com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom.ActionsBottomSheetFragment;

/**
 * The feed's floating button, with more than one thing on it.
 *
 * <p>Sync's own button carries exactly one of three things. Everything else it can do is in the
 * actions sheet behind it, each known there by a number and carried out by one call.
 *
 * <p>What is drawn is one surface: the extra actions and, last, the button's own action, on a
 * single rounded shape the size and colour of the button. Sync's button stays exactly where it
 * was and keeps doing everything it did — deciding what it is for, and hiding itself as the feed
 * scrolls — but draws nothing, and the surface is laid over it every frame, taking its position,
 * its scale and its fade. So it slides and fades away with the feed rather than being told to.
 *
 * <p>Nothing here is allowed to take the feed down with it: every step is guarded, and Sync's
 * button is given back what it draws with if any of it fails.
 *
 * @noinspection unused
 */
public final class ExtraFabActions {
    /** How many actions can stand beside the button. */
    public static final int SLOTS = 3;

    /**
     * Sync's own setting for what its button is for, which is now chosen out of everything
     * rather than the three it offered.
     */
    private static final String ITS_OWN_SETTING = "main_fab_action";

    /**
     * Where our actions begin in that setting. The three Sync already meant keep the numbers
     * they had, and ours follow straight on: Sync looks the number up in its own list of names
     * by position, so anything past the end of it is a crash rather than a number it ignores.
     */
    private static final int OURS_START_AT = 3;

    /**
     * The actions offered for the button itself, in the order they are offered in, which is what
     * turns the number stored into the number the action is known by.
     *
     * <p>Two are left out: Hide read, which the button already does by itself, and Sort, which
     * has a name and an icon but is never dispatched, so choosing it did nothing. This has to
     * match the list the settings are built from.
     */
    private static final int[] OFFERED = {
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
    };

    private static final String SLOT = "sync_up_fab_slot_";
    private static final String ORIENTATION = "sync_up_fab_orientation";
    private static final String SEPARATORS = "sync_up_fab_separators";

    /** What a slot holds when it holds nothing. */
    private static final int NOTHING = -1;

    /** Stacked up the screen, the button's own action at the bottom. */
    private static final int VERTICAL = 0;

    private static final String TAG = "sync-up-fab-actions";

    private static final int SEPARATOR_DP = 1;

    /** What the part standing where the button stands is marked with. */
    private static final int ITS_OWN = 0x7E000010;

    /** Said once: that the button was the one taking the taps meant for the surface. */
    private static boolean toldWhoTakesIt;

    /** How often the chosen actions are looked at again, in frames. */
    private static final int LOOK_AGAIN_EVERY = 30;

    /**
     * How long the button has to stay down before the surface goes down with it.
     *
     * <p>Sync throws its button between two places for a frame or three at a time — on a
     * refresh, on a jump to the top, on taking the restore offer, and while a screen is
     * changing. Those excursions are the app's own: they happen with none of this running. The
     * button is small and goes by; a surface standing in for it is taller and reads as a
     * flicker, so a jump is only followed once the button has stayed where it jumped to.
     */
    private static final int SETTLE_FRAMES = 4;

    private ExtraFabActions() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /** Called as Sync sets its own button up. */
    public static void attach(View fab, String subreddit) {
        if (!isPatchIncluded()) {
            return;
        }
        try {
            SyncUpSettings.report("fab", ITS_OWN_SETTING, SLOT + "1", SLOT + "2", SLOT + "3",
                    ORIENTATION, SEPARATORS);
            rebuild(fab);
            watch(fab);
            listen(fab);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "fab: could not put the actions on the button: " + ex);
        }
    }

    /**
     * What is remembered about one button.
     *
     * <p>Held against the button rather than in one place: a second window has a second button,
     * and one set of these between them left each answering for the other — a change made with
     * one window up did nothing to the other, and what one button was drawn with was put on the
     * other.
     */
    private static final class Its {
        String built;
        Drawable icon;
        Drawable background;
        boolean listening;

        /** Where the surface is actually being kept, which is not always where the button is. */
        float restingY = Float.NaN;

        /** Where the button has jumped to and may yet stay, and for how many frames running. */
        float settlingAt = Float.NaN;

        int settling;
    }

    private static final java.util.Map<View, Its> theirs =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<View, Its>());

    private static Its of(View fab) {
        synchronized (theirs) {
            Its its = theirs.get(fab);
            if (its == null) {
                its = new Its();
                theirs.put(fab, its);
            }
            return its;
        }
    }

    /** Rebuilds the moment a setting changes, rather than when the feed next draws. */
    private static void listen(View fab) {
        Its its = of(fab);
        if (its.listening) {
            return;
        }
        its.listening = true;
        Runnable rebuild = () -> fab.post(() -> {
            try {
                // Forgotten first, so the answer is built again rather than recognised as the
                // one already standing there.
                of(fab).built = null;
                rebuild(fab);
                fab.invalidate();
            } catch (Throwable ex) {
                Logger.printInfo(() -> "fab: could not rebuild after a change: " + ex);
            }
        });
        SyncUpSettings.whenChanged("sync_up_fab_", rebuild);
        // Sync's own, which is what the button itself is for.
        SyncUpSettings.whenChanged(ITS_OWN_SETTING, rebuild);
    }

    private static void rebuild(View fab) {
        ViewGroup parent = fab.getParent() instanceof ViewGroup
                ? (ViewGroup) fab.getParent() : null;
        if (parent == null) {
            Logger.printDebug(() -> "fab: the button has nothing to be laid over");
            return;
        }

        List<Integer> wanted = chosen();
        String now = wanted + "+" + mainAction() + "/"
                + SyncUpSettings.number(ORIENTATION, VERTICAL)
                + "/" + SyncUpSettings.flag(SEPARATORS, true);
        Its its = of(fab);
        if (now.equals(its.built) && parent.findViewWithTag(TAG) != null) {
            return;
        }
        its.built = now;
        Logger.printDebug(() -> "fab: building for " + now);

        View previous = parent.findViewWithTag(TAG);
        if (previous != null) {
            parent.removeView(previous);
        }
        if (wanted.isEmpty() && mainAction() == NOTHING) {
            Logger.printDebug(() -> "fab: nothing chosen, giving the button back what it draws");
            giveBack(fab);
            return;
        }

        LinearLayout surface = build(fab, wanted);
        if (surface == null) {
            giveBack(fab);
            return;
        }
        parent.addView(surface);
        Logger.printDebug(() -> "fab: laid a surface of " + surface.getChildCount()
                + " part(s) over the button");
    }

    /** @return What the button's own part carries, or NOTHING to leave it as Sync set it. */
    private static int mainAction() {
        int held = SyncUpSettings.number(ITS_OWN_SETTING, NOTHING);
        int at = held - OURS_START_AT;
        if (at < 0 || at >= OFFERED.length) {
            // One of Sync's own three, or nothing set: the button keeps doing what it did.
            return NOTHING;
        }
        return OFFERED[at];
    }

    /**
     * @return The actions standing beside the button, furthest first.
     *
     * <p>The button's own action is drawn last, at the end nearest where the button was, so the
     * first slot has to be drawn immediately before it and the rest further out again. That is
     * the reverse of the order they are set in.
     */
    private static List<Integer> chosen() {
        List<Integer> actions = new ArrayList<>();
        for (int slot = SLOTS; slot >= 1; slot--) {
            int action = SyncUpSettings.number(SLOT + slot, NOTHING);
            if (action == NOTHING || actions.contains(action)) {
                continue;
            }
            actions.add(action);
        }
        return actions;
    }

    private static LinearLayout build(View fab, List<Integer> actions) {
        Context context = fab.getContext();
        boolean vertical = SyncUpSettings.number(ORIENTATION, VERTICAL) == VERTICAL;
        boolean separators = SyncUpSettings.flag(SEPARATORS, true);

        Its its = of(fab);
        if (its.icon == null && fab instanceof ImageView) {
            its.icon = ((ImageView) fab).getDrawable();
        }
        if (its.background == null) {
            its.background = fab.getBackground();
        }

        int size = fab.getHeight() > 0 ? fab.getHeight() : (int) fromDp(context, 56);
        int ground = colourOfTheButton(fab);
        ColorStateList tint = tintForTheIcons(fab, ground);

        LinearLayout surface = new LinearLayout(context);
        surface.setTag(TAG);
        surface.setOrientation(vertical ? LinearLayout.VERTICAL : LinearLayout.HORIZONTAL);
        surface.setGravity(Gravity.CENTER);
        surface.setElevation(fab.getElevation());
        surface.setBackground(surfaceFor(context, fab, size));
        surface.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        for (int action : actions) {
            View part = extra(context, action, size, tint);
            if (part == null) {
                continue;
            }
            if (separators && surface.getChildCount() > 0) {
                surface.addView(separator(context, size, vertical, ground));
            }
            surface.addView(part);
        }
        if (separators && surface.getChildCount() > 0) {
            surface.addView(separator(context, size, vertical, ground));
        }
        surface.addView(itsOwn(context, fab, size, tint));
        return surface;
    }

    /**
     * The part standing where the button stands.
     *
     * <p>Sync lets its button be one of three things. Where an action has been chosen for it
     * here, it carries that instead — any of the twenty-five — and where none has, it hands the
     * tap straight back to the button and is drawn with whatever the button is drawn with.
     */
    private static View itsOwn(Context context, View fab, int size, ColorStateList tint) {
        Its its = of(fab);
        int main = mainAction();
        if (main != NOTHING) {
            View chosen = extra(context, main, size, tint);
            if (chosen != null) {
                chosen.setTag(ITS_OWN, Boolean.TRUE);
                Logger.printDebug(() -> "fab: the button itself carries action " + main
                        + ", drawn with " + (((ImageView) chosen).getDrawable() == null
                        ? "nothing" : "an icon"));
                return chosen;
            }
            Logger.printInfo(() -> "fab: action " + main + " could not be drawn for the button");
        }

        Logger.printDebug(() -> "fab: the button keeps its own action, drawn with "
                + (its.icon == null ? "nothing yet" : "its own icon"));
        ImageView part = part(context, size);
        part.setTag(ITS_OWN, Boolean.TRUE);
        if (its.icon != null) {
            part.setImageDrawable(its.icon.getConstantState() == null
                    ? its.icon : its.icon.getConstantState().newDrawable().mutate());
            part.setImageTintList(tint);
        } else {
            Logger.printDebug(() -> "fab: the button is drawn with nothing to copy");
        }
        part.setContentDescription(fab.getContentDescription());
        part.setOnClickListener(view -> {
            Logger.printDebug(() -> "fab: handing the tap back to the button");
            fab.performClick();
        });
        part.setOnLongClickListener(view -> fab.performLongClick());
        return part;
    }

    private static View extra(Context context, int action, int size, ColorStateList tint) {
        try {
            ImageView part = part(context, size);
            part.setImageResource(t7.b.d(action));
            if (tint != null) {
                part.setImageTintList(tint);
            }
            String label = t7.b.h(action);
            part.setContentDescription(label == null ? null : label.replace('\n', ' '));
            part.setOnClickListener(view -> carryOut(view, action));
            Logger.printDebug(() -> "fab: part for action " + action + " (" + label + ")");
            return part;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "fab: action " + action + " could not be drawn: " + ex);
            return null;
        }
    }

    private static ImageView part(Context context, int size) {
        ImageView part = new ImageView(context);
        part.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        int padding = (int) (size * 0.28f);
        part.setPadding(padding, padding, padding, padding);
        part.setScaleType(ImageView.ScaleType.FIT_CENTER);
        part.setClickable(true);
        part.setFocusable(true);
        return part;
    }

    /**
     * The one shape the parts share.
     *
     * <p>Drawn here rather than taken from the button: the button's own shape was there to copy
     * on one pass and not on the next, so which of the two was used depended on when the surface
     * happened to be built, and the ends did not match.
     */
    /**
     * What the surface is drawn on, which is what the button is drawn on.
     *
     * <p>The button's own background, copied and stretched across the whole surface. Taken
     * rather than rebuilt, so the ground and the corner are the button's by construction: a
     * rounded square stays a rounded square at the width of several of them, where one built
     * here was a guess at both and looked like neither.
     */
    private static Drawable surfaceFor(Context context, View fab, int size) {
        try {
            Drawable its = of(fab).background;
            if (its != null && its.getConstantState() != null) {
                Drawable copy = its.getConstantState().newDrawable().mutate();
                copy.setState(new int[]{ android.R.attr.state_enabled });
                Logger.printDebug(() -> "fab: the surface is drawn on the button's own "
                        + copy.getClass().getSimpleName());
                return copy;
            }
        } catch (Throwable ex) {
            Logger.printDebug(() -> "fab: the button's own background cannot be used: " + ex);
        }

        float radius = cornerOf(fab, size);
        Logger.printDebug(() -> "fab: rounding the surface by " + radius + " at every corner");
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(radius);
        shape.setColor(colourOfTheButton(fab));
        return shape;
    }

    /**
     * @return The corner the button itself is drawn with.
     *
     * <p>Asked of the button's own outline rather than assumed to be half its height. A button
     * drawn as a rounded square next to an end rounded to a semicircle is what made the two
     * ends of the surface look nothing like each other.
     */
    private static float cornerOf(View fab, int size) {
        try {
            Drawable its = of(fab).background;
            // Outline.getRadius arrived in API 24. Below that the button is not asked and the
            // corner Material draws one of these with is used instead.
            if (its != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                android.graphics.Outline outline = new android.graphics.Outline();
                its.setBounds(0, 0, size, size);
                its.getOutline(outline);
                float radius = outline.getRadius();
                if (radius > 0 && radius <= size) {
                    Logger.printDebug(() -> "fab: the button is drawn with a corner of " + radius);
                    return radius;
                }
            }
        } catch (Throwable ex) {
            Logger.printDebug(() -> "fab: the button will not say what corner it has: " + ex);
        }
        // What Material draws a button of this kind with, rather than a semicircle: Sync's is
        // a rounded square, and an end rounded fully looks nothing like it.
        float rounded = fromDp(fab.getContext(), 16);
        Logger.printDebug(() -> "fab: the button says nothing about its corner, rounding by "
                + rounded);
        return Math.min(rounded, size / 2f);
    }

    /**
     * What to draw the icons in, which is what the button draws its own in.
     *
     * <p>Sync's button does not always say: its icon is often a drawable that is already the
     * colour it should be, with no tint on the view at all. Asked for one and given none, an
     * icon of ours keeps the colour it was drawn in, which is dark, and a dark button then has
     * dark icons on it. What the ground is, is known, so the fallback is the colour that shows
     * against it — the same choice Material makes for what sits on a coloured surface.
     */
    private static ColorStateList tintForTheIcons(View fab, int ground) {
        ColorStateList said = fab instanceof ImageView
                ? ((ImageView) fab).getImageTintList() : null;
        if (said != null) {
            // Asked for the colour it draws an icon it can be tapped in, not the list's own
            // default: the default of Sync's is the greyed out one, a near black at a third of
            // its alpha, which on a coloured button is barely there at all.
            int enabled = said.getColorForState(
                    new int[]{ android.R.attr.state_enabled }, said.getDefaultColor());
            if (shows(enabled, ground)) {
                Logger.printDebug(() -> "fab: the button draws its icons in " + hex(enabled)
                        + ", on a ground of " + hex(ground));
                return ColorStateList.valueOf(enabled);
            }
            Logger.printDebug(() -> "fab: the button says it draws its icons in " + hex(enabled)
                    + ", which does not show on " + hex(ground));
        }
        int chosen = onTop(ground);
        Logger.printDebug(() -> "fab: drawing the icons in " + hex(chosen)
                + ", on a ground of " + hex(ground));
        return ColorStateList.valueOf(chosen);
    }

    /**
     * @return Whether an icon of this colour would be seen on this ground. Something faint, or
     *         something as dark as what it sits on, is drawn in what does show instead.
     */
    private static boolean shows(int icon, int ground) {
        return Color.alpha(icon) >= 200 && Math.abs(lightness(icon) - lightness(ground)) >= 0.35;
    }

    private static double lightness(int colour) {
        return (0.299 * Color.red(colour)
                + 0.587 * Color.green(colour)
                + 0.114 * Color.blue(colour)) / 255d;
    }

    /** @return Black or white, whichever shows on this colour. */
    private static int onTop(int ground) {
        return lightness(ground) > 0.6 ? Color.BLACK : Color.WHITE;
    }

    private static String hex(int colour) {
        return String.format("#%08X", colour);
    }

    private static int colourOfTheButton(View fab) {
        try {
            ColorStateList tint = fab.getBackgroundTintList();
            if (tint != null) {
                // The state it is in while it can be tapped, for the same reason the icons are
                // asked for that one: the list's own default is the greyed out entry.
                int said = tint.getColorForState(
                        new int[]{ android.R.attr.state_enabled }, tint.getDefaultColor());
                Logger.printDebug(() -> "fab: the button is drawn on " + hex(said)
                        + ", which it said itself");
                return said;
            }
            Logger.printDebug(() -> "fab: the button says nothing about its ground; its "
                    + "background is " + (fab.getBackground() == null ? "nothing"
                    : fab.getBackground().getClass().getName()));
        } catch (Throwable ignored) {
            // Asked below instead.
        }
        try {
            android.util.TypedValue found = new android.util.TypedValue();
            if (fab.getContext().getTheme()
                    .resolveAttribute(android.R.attr.colorAccent, found, true)) {
                return found.data;
            }
        } catch (Throwable ignored) {
            // Fallen back on below.
        }
        return Color.parseColor("#333333");
    }

    private static View separator(Context context, int size, boolean vertical, int ground) {
        View line = new View(context);
        int thickness = (int) fromDp(context, SEPARATOR_DP);
        int length = (int) (size * 0.5f);
        line.setLayoutParams(vertical
                ? new LinearLayout.LayoutParams(length, thickness)
                : new LinearLayout.LayoutParams(thickness, length));
        // Drawn in what the icons are drawn in, so it shows on a light ground as well as a
        // dark one rather than being the white line that only a dark button ever showed.
        line.setBackgroundColor(Color.argb(60,
                Color.red(onTop(ground)), Color.green(onTop(ground)), Color.blue(onTop(ground))));
        return line;
    }

    private static void carryOut(View view, int action) {
        Context context = view.getContext();
        try {
            BaseActivity activity = t7.j.a(context);
            String about = t7.j.b(context);
            Logger.printDebug(() -> "fab: carrying out action " + action + " for r/" + about);
            ActionsBottomSheetFragment.w4(activity, t7.j.g(context), about, action, null);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "fab: action " + action + " failed: " + ex);
        }
    }

    /** Gives the button back what it draws with, and takes the surface away. */
    private static void giveBack(View fab) {
        try {
            Its its = of(fab);
            fab.setAlpha(1f);
            fab.setClickable(true);
            fab.setLongClickable(true);
            if (its.icon != null && fab instanceof ImageView) {
                ((ImageView) fab).setImageDrawable(its.icon);
            }
            if (its.background != null) {
                fab.setBackground(its.background);
            }
        } catch (Throwable ex) {
            Logger.printDebug(() -> "fab: could not give the button back what it draws: " + ex);
        }
    }

    /** Whether the button is already being watched, so it is only watched once. */
    private static final java.util.Set<View> watched =
            java.util.Collections.newSetFromMap(new java.util.WeakHashMap<View, Boolean>());

    private static int frames;

    /**
     * Lays the surface over the button, every frame.
     *
     * <p>Its position already carries whatever is being done to hide it — what slides or scales
     * the button slides or scales where it is — so taking that is what makes the surface go with
     * it rather than pop.
     */
    private static void watch(View fab) {
        if (!watched.add(fab)) {
            return;
        }
        ViewTreeObserver.OnPreDrawListener each = () -> {
            try {
                over(fab);
            } catch (Throwable ex) {
                Logger.printDebug(() -> "fab: could not lay the surface over: " + ex);
            }
            return true;
        };
        fab.getViewTreeObserver().addOnPreDrawListener(each);
        Logger.printDebug(() -> "fab: watching the button");
    }

    private static void over(View fab) {
        ViewGroup parent = fab.getParent() instanceof ViewGroup
                ? (ViewGroup) fab.getParent() : null;
        if (parent == null) {
            return;
        }

        // Settings can change while the feed is up, and nothing else would notice.
        if (++frames % LOOK_AGAIN_EVERY == 0) {
            rebuild(fab);
        }

        showItWhereSyncWillNot(fab);

        View surface = parent.findViewWithTag(TAG);
        if (surface == null || surface.getWidth() == 0 || fab.getWidth() == 0) {
            return;
        }

        // The button keeps deciding and keeps hiding; it simply draws nothing while the
        // surface is standing in for it. Made see-through as well as emptied: taking its
        // drawing away a frame at a time left it showing through in between, which is the
        // blank circle over the surface and the flicker beside it.
        Its its = of(fab);
        if (fab.getAlpha() != 0f) {
            fab.setAlpha(0f);
        }
        // The button draws nothing while the surface stands in for it, but it is still there
        // and still takes taps, and it sits exactly where the part standing for it sits. A tap
        // on that part reached the button underneath and opened what the button opens, so the
        // action chosen for it never ran. The parts beside it never overlap the button, which
        // is why they always worked and only its own action did not.
        if (fab.isClickable() || fab.isLongClickable()) {
            if (!toldWhoTakesIt) {
                toldWhoTakesIt = true;
                Logger.printDebug(() -> "fab: the button sits under the surface at z "
                        + fab.getZ() + " against the surface's " + surface.getZ()
                        + "; taking its taps away while it draws nothing");
            }
            fab.setClickable(false);
            fab.setLongClickable(false);
        }
        // Kept above it as well, so the part standing for it is what a tap lands on wherever
        // the two are ordered.
        if (surface.getZ() <= fab.getZ()) {
            surface.setZ(fab.getZ() + 1f);
        }
        if (fab.getBackground() != null) {
            its.background = fab.getBackground();
            fab.setBackground(null);
        }
        if (fab instanceof ImageView && ((ImageView) fab).getDrawable() != null) {
            its.icon = ((ImageView) fab).getDrawable();
            ((ImageView) fab).setImageDrawable(null);
            // Sync draws its button after the surface is first laid over it, so the part
            // standing where it stands had nothing in it until now.
            fillIn(fab, surface);
        }

        boolean vertical = SyncUpSettings.number(ORIENTATION, VERTICAL) == VERTICAL;
        float x = vertical
                ? fab.getX() + (fab.getWidth() - surface.getWidth()) / 2f
                : fab.getX() + fab.getWidth() - surface.getWidth();
        float y = vertical
                ? fab.getY() + fab.getHeight() - surface.getHeight()
                : fab.getY() + (fab.getHeight() - surface.getHeight()) / 2f;

        surface.setX(x);
        // A step of about the button's own size or less is followed at once: that is the button
        // sliding or growing, and being late to it would be a stutter. A jump further than that
        // has to stay where it jumped to for a few frames running before the surface goes with
        // it, which is what tells a move apart from the app throwing the button somewhere and
        // taking it straight back.
        //
        // Both directions, and that matters: an earlier go at this followed a jump upwards at
        // once and only made a drop wait, and a button laid out high for a moment while a screen
        // changed took the surface with it and then would not let it come back down for several
        // frames — which looks, reasonably enough, like the button having vanished.
        // Where the button is put over a bottom bar that is plainly still there, it is not
        // somewhere to follow it to at all. Sync moves its button down to where it sits with
        // the bar away while the bar is still shown — for a frame or two on a refresh, and for
        // as long as a finger keeps moving on a pull to refresh — and a surface that followed
        // would sit across the bar for all of it. Staying put is right until the button is
        // somewhere it could sensibly be.
        //
        // Nothing is assumed about when the bar is up: it is read. A bar sliding away carries
        // its own position with it, so the room reappears as it goes and the surface follows
        // the button down exactly as it should.
        float noLowerThan = roomAboveTheBar(parent, fab, surface);
        boolean wouldCoverTheBar = !Float.isNaN(noLowerThan) && y > noLowerThan;

        boolean keyboard = keyboardIsUp(fab);

        float reach = Math.max(1f, fab.getHeight());
        if ((wouldCoverTheBar || keyboard) && !Float.isNaN(its.restingY)) {
            // Stay exactly where it is. The button is somewhere it cannot sensibly be drawn —
            // over a bar that is plainly still up, or pushed most of the way up the screen by a
            // keyboard — and whatever put it there is covering the surface anyway.
            //
            // What was being considered is left alone rather than forgotten. Sync throws its
            // button down to the bar's place on alternating frames while a screen is changing,
            // so clearing the count here means a real move can never finish where those
            // excursions are dense: every other frame puts the count back to nothing. An
            // excursion is simply not counted.
        } else if (Float.isNaN(its.restingY) || Math.abs(y - its.restingY) <= reach) {
            its.restingY = wouldCoverTheBar ? noLowerThan : y;
            its.settlingAt = Float.NaN;
            its.settling = 0;
        } else {
            if (Float.isNaN(its.settlingAt) || Math.abs(y - its.settlingAt) > reach) {
                its.settlingAt = y;
                its.settling = 1;
            } else {
                its.settling++;
            }
            if (its.settling >= SETTLE_FRAMES) {
                its.restingY = y;
                its.settlingAt = Float.NaN;
                its.settling = 0;
            }
        }
        surface.setY(its.restingY);
        // Scaled about the part standing for the button, so what grows and shrinks is the
        // button itself rather than the middle of a row.
        surface.setPivotX(vertical ? surface.getWidth() / 2f : surface.getWidth());
        surface.setPivotY(vertical ? surface.getHeight() : surface.getHeight() / 2f);
        surface.setScaleX(fab.getScaleX());
        surface.setScaleY(fab.getScaleY());
        // Not the button's own fade: it is held at nothing so that it never shows through, so
        // what is left to follow is how big it is and whether it is there at all.
        surface.setAlpha(Math.min(1f, Math.abs(fab.getScaleX())));
        surface.setVisibility(fab.getVisibility());
    }

    /** Puts the button's own icon into the part standing for it, once there is one to put. */
    private static void fillIn(View fab, View surface) {
        Its its = of(fab);
        if (mainAction() != NOTHING || its.icon == null || !(surface instanceof ViewGroup)) {
            return;
        }
        ViewGroup parts = (ViewGroup) surface;
        for (int at = 0; at < parts.getChildCount(); at++) {
            View part = parts.getChildAt(at);
            if (!Boolean.TRUE.equals(part.getTag(ITS_OWN)) || !(part instanceof ImageView)) {
                continue;
            }
            if (((ImageView) part).getDrawable() != null) {
                return;
            }
            ((ImageView) part).setImageDrawable(its.icon.getConstantState() == null
                    ? its.icon : its.icon.getConstantState().newDrawable().mutate());
            // Drawn in what the rest of them are drawn in. The button's own icon arrives after
            // the surface was built, so it misses the colour chosen there, and the part
            // standing for the button was the one icon still in the button's own colour.
            ((ImageView) part).setImageTintList(tintForTheIcons(fab, colourOfTheButton(fab)));
            if (part.getContentDescription() == null) {
                part.setContentDescription(fab.getContentDescription());
            }
            Logger.printDebug(() -> "fab: the button's own icon has arrived, drawing it");
            return;
        }
    }



    /**
     * @return Whether a soft keyboard is up over the window the button is in.
     *
     * <p>Sync lays its button out against the room that is left, so a keyboard moves it most of
     * the way up the screen: measured on a 2400 tall screen as the button going from where it
     * rests at 1917 to 1097 the moment the search sheet's keyboard arrived, and back again when
     * it went. A surface that follows it there is a surface stranded in the middle of the feed,
     * and the thing that raised the keyboard is covering all of it anyway, so there is nothing
     * to be gained by going and everything to lose on the way back.
     *
     * <p>Read from the insets rather than from the window's own height, which does not move: the
     * parent stayed 2400 tall across the whole of that measurement while the button inside it
     * went up and down. What answers is the difference between the room the system is taking now
     * and the room it always takes — the bars are tens of pixels and a keyboard is hundreds —
     * since {@code WindowInsets.Type.ime()} arrived in API 30 and this is offered from 23.
     */
    private static boolean keyboardIsUp(View fab) {
        try {
            android.view.WindowInsets insets = fab.getRootWindowInsets();
            if (insets == null) {
                return false;
            }
            int now = insets.getSystemWindowInsetBottom();
            int always = insets.getStableInsetBottom();
            return now - always > Math.max(1, fab.getHeight());
        } catch (Throwable ex) {
            Logger.printDebug(() -> "fab: could not tell whether a keyboard is up: " + ex);
            return false;
        }
    }

    /**
     * @return The lowest the surface may sit without covering a bottom bar that is up, or
     *         nothing where there is no such bar to keep clear of.
     *
     * <p>The bar is found rather than named: the one thing beside the button that is showing,
     * as wide as its parent, sitting against the bottom of it and not reaching up into the
     * screen. That holds whatever the app calls it.
     */
    private static float roomAboveTheBar(ViewGroup parent, View fab, View surface) {
        float top = Float.NaN;
        int tall = parent.getHeight();
        int wide = parent.getWidth();
        if (tall <= 0 || wide <= 0) {
            return Float.NaN;
        }
        for (int at = 0; at < parent.getChildCount(); at++) {
            View child = parent.getChildAt(at);
            if (child == null || child == fab || child == surface
                    || child.getVisibility() != View.VISIBLE
                    || child.getHeight() <= 0
                    || child.getWidth() * 5 < wide * 4) {
                continue;
            }
            float childTop = child.getY();
            float childBottom = childTop + child.getHeight();
            // Against the bottom, and not something that merely reaches it from far above.
            if (childTop * 2 < tall || Math.abs(childBottom - tall) * 2 > child.getHeight()) {
                continue;
            }
            if (Float.isNaN(top) || childTop < top) {
                top = childTop;
            }
        }
        return Float.isNaN(top) ? Float.NaN : top - surface.getHeight();
    }

    /**
     * Puts the button back on the screen where Sync has asked for one and then not shown it.
     *
     * <p>With <i>Autohide FAB</i> turned off the app never runs the path that shows its button,
     * so the button is left at {@code INVISIBLE} for good and there is no floating button at
     * all. That is the app's own — it happens with none of this running — but it is the button
     * this patch is built on, and a surface standing in for something invisible is invisible
     * too, so it is put right here rather than worked around.
     *
     * <p>Only where the reader has asked for a button that never hides. Where autohide is on,
     * being invisible is the app doing exactly what it was told and nothing is touched.
     */
    private static void showItWhereSyncWillNot(View fab) {
        try {
            SettingsSingleton.Settings settings = SettingsSingleton.x();
            if (settings == null || !settings.mainFab || settings.mainFabAutohide) {
                return;
            }
            if (fab.getVisibility() != View.VISIBLE) {
                fab.setVisibility(View.VISIBLE);
                Logger.printDebug(() -> "fab: shown, since it is set never to hide");
            }
        } catch (Throwable ex) {
            Logger.printDebug(() -> "fab: could not tell whether it should be shown: " + ex);
        }
    }

    private static float fromDp(Context context, float dp) {
        return dp * context.getResources().getDisplayMetrics().density;
    }
}
