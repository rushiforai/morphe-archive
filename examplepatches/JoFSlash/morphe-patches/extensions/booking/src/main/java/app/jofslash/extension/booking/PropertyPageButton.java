package app.jofslash.extension.booking;

import android.app.Activity;
import android.app.Application;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Adds the buttons that open the {@link Panel} to the property page
 * (com.booking.property.detail.PropertyPageActivity): "Compare prices" (or "Price watch") and
 * "Contact". The page is Compose, so the buttons are plain Views put on top of it, in the
 * activity's content frame, above the "Select rooms" bar at the bottom.
 */
final class PropertyPageButton {
    private PropertyPageButton() {
    }

    private static final String BUTTON_TAG = "jofslash_compare_button";
    /** Room left for the page's bottom bar ("Select rooms"). */
    private static final int BOTTOM_BAR_DP = 96;

    private static final class State {
        boolean compare;
        boolean watch;
        boolean contact;
        /** Save the prices the page shows (Check crossed-out prices is on). */
        boolean record;
        /** The hotel loaded again by the page (for example for new dates) and its stay. */
        Object refreshedHotel;
        Stay refreshedStay;
    }

    private static final Map<Activity, State> STATES = new WeakHashMap<>();
    private static WeakReference<Activity> resumed = new WeakReference<>(null);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Called from the property page's constructor by each patch that's on. */
    static synchronized void attach(Activity activity, boolean compare, boolean watch, boolean contact) {
        State state = STATES.get(activity);
        boolean first = state == null;
        if (first) {
            state = new State();
            STATES.put(activity, state);
        }
        state.compare |= compare;
        state.watch |= watch;
        state.contact |= contact;
        if (first) listen(activity);
    }

    /** Called from the property page's constructor when a patch that needs saved prices is on. */
    static synchronized void attachRecorder(Activity activity) {
        attach(activity, false, false, false);
        STATES.get(activity).record = true;
    }

    private static void listen(final Activity activity) {
        Application.ActivityLifecycleCallbacks callbacks = new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity a, Bundle b) {
            }

            @Override
            public void onActivityStarted(Activity a) {
            }

            @Override
            public void onActivityResumed(Activity a) {
                if (a == activity) onResume(a);
            }

            @Override
            public void onActivityPaused(Activity a) {
            }

            @Override
            public void onActivityStopped(Activity a) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity a, Bundle b) {
            }

            @Override
            public void onActivityDestroyed(Activity a) {
                if (a == activity) {
                    synchronized (PropertyPageButton.class) {
                        STATES.remove(a);
                    }
                }
            }
        };
        if (Build.VERSION.SDK_INT >= 29) {
            // The activity's own list exists already while it is being constructed.
            activity.registerActivityLifecycleCallbacks(callbacks);
        } else {
            // Older Android: wait until the activity has its application.
            MAIN.post(() -> {
                Application app = activity.getApplication();
                if (app != null) app.registerActivityLifecycleCallbacks(callbacks);
            });
        }
    }

    private static void onResume(final Activity activity) {
        try {
            resumed = new WeakReference<>(activity);
            PriceRecorder.setContext(activity);
            addButton(activity);
            State state = state(activity);
            if (state != null && state.record) {
                recordNow(activity);
                // The hotel's price can arrive a moment after the page opens.
                MAIN.postDelayed(() -> recordNow(activity), 2500);
            }
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "onResume", t);
        }
    }

    private static synchronized State state(Activity activity) {
        return STATES.get(activity);
    }

    /** The page loaded the hotel again. Remember it with the stay it was loaded for. */
    static void onHotelUpdate(Object hotel) {
        final Activity activity = resumed.get();
        if (activity == null) return;
        final State state = state(activity);
        if (state == null) return;
        HotelInfo info = HotelInfo.of(hotel);
        if (info == null || info.id != pageHotelId(activity)) return;
        Stay stay = Stay.ofSearchQuery(queryOf(activity));
        Log.i(HotelInfo.TAG, "Hotel " + info.id + " reloaded for " + stay + ", price " + info.price + " "
                + info.currency);
        synchronized (PropertyPageButton.class) {
            state.refreshedHotel = hotel;
            state.refreshedStay = stay;
        }
        if (state.record && stay != null && info.hasPrice()) {
            PriceRecorder.record(info, stay, PriceDb.SOURCE_PROPERTY);
        }
    }

    private static void recordNow(Activity activity) {
        if (activity.isFinishing()) return;
        Current c = current(activity);
        if (c.hotel != null && c.stay != null && c.hotel.hasPrice()) {
            PriceRecorder.record(c.hotel, c.stay, PriceDb.SOURCE_PROPERTY);
        }
    }

    /** The hotel and stay the page shows now. */
    static final class Current {
        HotelInfo hotel;
        Stay stay;
    }

    static Current current(Activity activity) {
        Current c = new Current();
        State state = state(activity);
        if (state != null && state.refreshedHotel != null) {
            c.hotel = HotelInfo.of(state.refreshedHotel);
            c.stay = state.refreshedStay;
        }
        if (c.hotel == null || !c.hotel.hasPrice()) {
            // The hotel the page was opened with, for the dates it was opened with.
            HotelInfo opened = HotelInfo.of(HotelInfo.field(activity, "hotel"));
            if (opened != null) {
                if (c.hotel == null || opened.hasPrice()) {
                    c.hotel = merge(opened, c.hotel);
                    Stay fromIntent = Stay.ofIntent(activity);
                    c.stay = fromIntent != null ? fromIntent : Stay.ofSearchQuery(queryOf(activity));
                }
            }
        }
        if (c.hotel != null && c.stay == null) c.stay = Stay.ofSearchQuery(queryOf(activity));
        return c;
    }

    /** Fills the name and city from another read of the same hotel when one lacks them. */
    private static HotelInfo merge(HotelInfo main, HotelInfo other) {
        if (other == null) return main;
        if (main.name == null) main.name = other.name;
        if (main.city == null) main.city = other.city;
        return main;
    }

    private static Object queryOf(Activity activity) {
        return HotelInfo.call(HotelInfo.call(activity, "getSearchContextRepository"), "getQueryValue");
    }

    static int pageHotelId(Activity activity) {
        Object id = HotelInfo.call(HotelInfo.field(activity, "propertyId"), "getValue");
        if (id instanceof Integer) return (Integer) id;
        HotelInfo opened = HotelInfo.of(HotelInfo.field(activity, "hotel"));
        return opened == null ? -1 : opened.id;
    }

    private static void addButton(final Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return;
        FrameLayout frame = (FrameLayout) content;
        if (frame.findViewWithTag(BUTTON_TAG) != null) return;
        State state = state(activity);
        if (state == null || !(state.compare || state.watch || state.contact)) return;

        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout buttons = new LinearLayout(activity);
        buttons.setTag(BUTTON_TAG);
        buttons.setOrientation(LinearLayout.VERTICAL);
        buttons.setGravity(Gravity.END);
        // The buttons' shadows reach outside them.
        buttons.setClipChildren(false);
        buttons.setClipToPadding(false);
        int shadow = Math.round(8 * density);
        buttons.setPadding(shadow, shadow, shadow, shadow);
        if (state.contact) {
            buttons.addView(pill(activity, Strings.BUTTON_CONTACT, Panel.TAB_CONTACT), new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        if (state.compare || state.watch) {
            TextView main = pill(activity, state.compare ? Strings.BUTTON_COMPARE : Strings.BUTTON_WATCH,
                    state.watch ? Panel.TAB_WATCH : Panel.TAB_OFFICIAL);
            if (buttons.getChildCount() > 0) {
                LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                gap.topMargin = Math.round(10 * density);
                main.setLayoutParams(gap);
            }
            buttons.addView(main);
        }

        final FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
        // Less the padding that leaves room for the shadows.
        lp.rightMargin = Math.round(16 * density) - shadow;
        lp.bottomMargin = Math.round(BOTTOM_BAR_DP * density) - shadow;
        buttons.setOnApplyWindowInsetsListener((v, insets) -> {
            int bottom = insets.getSystemWindowInsetBottom();
            FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) v.getLayoutParams();
            int want = bottom + Math.round(BOTTOM_BAR_DP * density) - shadow;
            if (p.bottomMargin != want) {
                p.bottomMargin = want;
                v.setLayoutParams(p);
            }
            return insets;
        });
        frame.addView(buttons, lp);
        buttons.requestApplyInsets();
    }

    /** One round button that opens the panel on [tab]. */
    private static TextView pill(final Activity activity, String text, final int tab) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView button = new TextView(activity);
        button.setText(text);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        button.setTextColor(0xFFFFFFFF);
        button.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        button.setGravity(Gravity.CENTER);
        int padH = Math.round(16 * density), padV = Math.round(10 * density);
        button.setPadding(padH, padV, padH, padV);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xFF006CE4);
        bg.setCornerRadius(24 * density);
        bg.setStroke(Math.round(density), 0xFFFFFFFF);
        button.setBackground(bg);
        button.setElevation(6 * density);
        button.setContentDescription(text);
        button.setOnClickListener(v -> open(activity, tab));
        return button;
    }

    private static void open(Activity activity, int tab) {
        try {
            State state = state(activity);
            if (state == null) return;
            Current c = current(activity);
            if (c.hotel == null) {
                Toast.makeText(activity, Strings.LOADING, Toast.LENGTH_SHORT).show();
                return;
            }
            if (state.record && c.stay != null && c.hotel.hasPrice()) {
                PriceRecorder.record(c.hotel, c.stay, PriceDb.SOURCE_PROPERTY);
            }
            new Panel(activity, c.hotel, c.stay, state.watch, state.compare, state.contact, tab).show();
        } catch (Throwable t) {
            Log.e(HotelInfo.TAG, "Couldn't open the panel", t);
        }
    }
}
