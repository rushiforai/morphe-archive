/*
 * Copyright (C) 2026 dhrubonai
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */
package hx;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Calendar;
import java.util.Locale;
import java.util.Random;

/**
 * MovieBox-only promo hooks added by dhrubonai's bundle (v4 cadence rules):
 * - a Telegram channel card shown on app (re)open, at most POPUP_DAILY_LIMIT
 *   times per calendar day, typeset like a handwritten note: off-white paper,
 *   ink-black serif type;
 * - a floating "Buy me a cup of coffee" pill pinned to the bottom-right of
 *   any screen that is not playback-like (never on the streaming/player
 *   flow), shown for a short 10-15 second window, at most COFFEE_DAILY_LIMIT
 *   times per calendar day.
 *
 * Cadence is tracked per device profile in a private SharedPreferences file.
 * Playback-like screens are excluded purely by activity class-name hints, so
 * the rules survive app updates and obfuscated class names without any
 * home-screen learning.
 *
 * Everything runs best-effort: any failure is logged and swallowed so the host app
 * can never crash because of the promo layer.
 */
public final class Promo {
    private static final String TAG = "hxreborn/moviebox";
    private static final String TELEGRAM_URL = "https://t.me/dhrubo_moira_geche";
    private static final String COFFEE_URL = "https://www.supportkori.com/dhrubomorse";
    private static final String COFFEE_TAG = "hx_promo_coffee";
    private static final long POPUP_DELAY_MS = 1500L;
    private static final long APPLICATION_RETRY_MS = 200L;
    private static final int APPLICATION_RETRY_LIMIT = 100;

    // cadence rules (per device profile)
    private static final String PREFS = "hx_promo";
    private static final String KEY_DAY = "day";
    private static final String KEY_POPUP_COUNT = "popup_count";
    private static final String KEY_COFFEE_COUNT = "coffee_count";
    private static final String KEY_COFFEE_LAST_AT = "coffee_last_at";
    private static final int POPUP_DAILY_LIMIT = 3;
    private static final int COFFEE_DAILY_LIMIT = 5;
    private static final long COFFEE_COOLDOWN_MS = 3 * 60_000L;   // gap between two coffee shows
    private static final long COFFEE_SHOW_MIN_MS = 10_000L;       // pill stays visible 10s...
    private static final long COFFEE_SHOW_JITTER_MS = 5_000L;     // ...up to 15s
    private static final long COFFEE_ATTACH_DELAY_MS = 2500L;     // settle delay before showing
    private static final long COFFEE_TICK_MS = 30_000L;           // home screen re-show poll

    // class-name hints for playback-like screens; the coffee pill never targets them
    private static final String[] PLAYBACK_HINTS = {
        "player", "video", "stream", "watch", "splash", "intro",
        "detail", "advert", "playback", "playact",
    };

    // palette: warm paper + ink
    private static final int PAPER = 0xFFFAF7F1;      // off-white card
    private static final int PAPER_DEEP = 0xFFEFE9DE; // handle pill / pressed tone
    private static final int INK = 0xFF141414;        // near-black
    private static final int INK_SOFT = 0xFF55504A;   // body copy
    private static final int INK_FADE = 0xFF8A8378;   // kicker
    private static final int INK_LATER = 0xFFA29B8F;  // dismiss link
    private static final int HAIRLINE = 0x1A141414;   // 10% ink stroke

    // 144px rounded coffee-cup tile (256-color PNG), embedded to avoid host resources
    private static final String COFFEE_ART = "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";

    private static final Object lock = new Object();
    private static final Random RANDOM = new Random();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean installed;
    private static int started;
    private static Activity top;
    private static Bitmap coffeeBitmap;

    private Promo() {
    }

    public static void install() {
        synchronized (lock) {
            if (installed) return;
            installed = true;
        }
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            private int attempts;

            @Override
            public void run() {
                Object application = currentApplication();
                if (application == null) {
                    if (++attempts < APPLICATION_RETRY_LIMIT) {
                        new Handler(Looper.getMainLooper()).postDelayed(this, APPLICATION_RETRY_MS);
                    } else {
                        Log.e(TAG, "promo: no application instance");
                    }
                    return;
                }
                try {
                    ((Application) application).registerActivityLifecycleCallbacks(new Lifecycle());
                    startCoffeeTicker();
                    Log.i(TAG, "promo: installed");
                } catch (Throwable t) {
                    Log.e(TAG, "promo: registration failed", t);
                }
            }
        });
    }

    private static Object currentApplication() {
        try {
            return Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    /* ------------------------------------------------------------------ */
    /* Cadence rules                                                       */
    /* ------------------------------------------------------------------ */

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String today() {
        Calendar calendar = Calendar.getInstance();
        return String.format(Locale.US, "%04d-%02d-%02d", calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH));
    }

    /** Rolls both daily counters over at midnight; returns today's count for {@code key}. */
    private static int dailyCount(SharedPreferences store, String key) {
        String day = store.getString(KEY_DAY, null);
        if (!today().equals(day)) {
            store.edit().putString(KEY_DAY, today())
                    .putInt(KEY_POPUP_COUNT, 0)
                    .putInt(KEY_COFFEE_COUNT, 0)
                    .apply();
            return 0;
        }
        return store.getInt(key, 0);
    }

    /** Consumes one of the POPUP_DAILY_LIMIT Telegram slots for today. */
    private static boolean consumePopupQuota(Context context) {
        try {
            SharedPreferences store = prefs(context);
            int count = dailyCount(store, KEY_POPUP_COUNT);
            if (count >= POPUP_DAILY_LIMIT) return false;
            store.edit().putInt(KEY_POPUP_COUNT, count + 1).apply();
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "promo: popup quota unavailable", t);
            return false;
        }
    }

    private static boolean playbackLike(String className) {
        if (className == null) return false;
        String lower = className.toLowerCase(Locale.US);
        for (String hint : PLAYBACK_HINTS) {
            if (lower.contains(hint)) return true;
        }
        return false;
    }

    private static void startCoffeeTicker() {
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                Activity activity = current();
                if (activity != null
                        && !playbackLike(activity.getClass().getName())) {
                    attemptCoffeeShow(activity);
                }
                MAIN.postDelayed(this, COFFEE_TICK_MS);
            }
        }, COFFEE_TICK_MS);
    }

    private static void attemptCoffeeShow(final Activity activity) {
        try {
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            if (current() != activity) return; // another screen took over meanwhile
            removeCoffee(activity);
            if (playbackLike(activity.getClass().getName())) return; // never on the player flow
            SharedPreferences store = prefs(activity);
            int count = dailyCount(store, KEY_COFFEE_COUNT);
            if (count >= COFFEE_DAILY_LIMIT) return;
            long last = store.getLong(KEY_COFFEE_LAST_AT, 0L);
            long now = System.currentTimeMillis();
            if (last != 0L && now - last < COFFEE_COOLDOWN_MS) return;
            store.edit().putInt(KEY_COFFEE_COUNT, count + 1).putLong(KEY_COFFEE_LAST_AT, now).apply();
            attachCoffee(activity);
            long showFor = COFFEE_SHOW_MIN_MS + RANDOM.nextInt((int) COFFEE_SHOW_JITTER_MS + 1);
            MAIN.postDelayed(new Runnable() {
                @Override
                public void run() {
                    if (current() == activity) removeCoffee(activity);
                }
            }, showFor);
        } catch (Throwable t) {
            Log.w(TAG, "promo: coffee show skipped", t);
        }
    }

    private static void removeCoffee(Activity activity) {
        try {
            if (activity == null || activity.getWindow() == null) return;
            View pill = activity.getWindow().getDecorView().findViewWithTag(COFFEE_TAG);
            if (pill == null) return;
            ViewManager parent = (ViewManager) pill.getParent();
            if (parent != null) parent.removeView(pill);
        } catch (Throwable t) {
            Log.w(TAG, "promo: coffee removal skipped", t);
        }
    }

    private static void open(final Activity activity, final String url, final String thanks) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
            if (thanks != null) {
                Toast.makeText(activity, thanks, Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
            Log.w(TAG, "promo: cannot open " + url, t);
        }
    }

    private static Typeface serif() {
        return Typeface.create("serif", Typeface.NORMAL);
    }

    private static Typeface serifItalic() {
        return Typeface.create("serif", Typeface.ITALIC);
    }

    private static int dp(Activity activity, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                activity.getResources().getDisplayMetrics()));
    }

    private static GradientDrawable rounded(int color, float radiusPx) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radiusPx);
        return d;
    }

    private static TextView text(Activity activity, String message, float sp, int color,
                                 Typeface face, float letterSpacingSp) {
        TextView tv = new TextView(activity);
        tv.setText(message);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        tv.setTextColor(color);
        tv.setTypeface(face);
        if (letterSpacingSp > 0f) {
            // TextView letter spacing is expressed in em units: spacing_px / text_px
            tv.setLetterSpacing(letterSpacingSp / sp);
        }
        return tv;
    }

    /* ------------------------------------------------------------------ */
    /* Telegram card                                                       */
    /* ------------------------------------------------------------------ */

    private static void showDialog(final Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        try {
            LinearLayout card = new LinearLayout(activity);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setBackground(rounded(PAPER, dp(activity, 28)));
            int pad = dp(activity, 28);
            card.setPadding(pad, pad + dp(activity, 6), pad, pad);

            // kicker
            TextView kicker = text(activity, "A NOTE FROM DHRUBO", 11, INK_FADE,
                    Typeface.create("sans-serif-medium", Typeface.NORMAL), 0.9f);
            LinearLayout.LayoutParams kickerLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            card.addView(kicker, kickerLp);

            // headline
            TextView title = text(activity, "Hey, I'm dhrubo.", 27, INK, serif(), 0f);
            title.setPadding(0, dp(activity, 14), 0, 0);
            card.addView(title, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT));

            // body copy
            TextView body = text(activity,
                    "I keep MovieBox running without ads, with the premium stuff unlocked. "
                            + "New releases, fixes and requests land in my Telegram channel first.",
                    15, INK_SOFT, Typeface.create("sans-serif-light", Typeface.NORMAL), 0f);
            body.setLineSpacing(dp(activity, 5), 1f);
            body.setPadding(0, dp(activity, 12), 0, 0);
            card.addView(body, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

            // channel handle pill
            TextView handle = text(activity, "@dhrubo_moira_geche", 15, INK, serif(), 0.4f);
            handle.setBackground(rounded(PAPER_DEEP, dp(activity, 14)));
            handle.setPadding(dp(activity, 16), dp(activity, 9), dp(activity, 16), dp(activity, 9));
            handle.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    open(activity, TELEGRAM_URL, "Opening Telegram…");
                }
            });
            LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            handleLp.topMargin = dp(activity, 18);
            card.addView(handle, handleLp);

            // call to action
            TextView join = text(activity, "Join the channel", 16, 0xFFFFFFFF, serif(), 0.3f);
            join.setBackground(rounded(INK, dp(activity, 18)));
            join.setGravity(Gravity.CENTER);
            join.setPadding(0, dp(activity, 15), 0, dp(activity, 15));
            join.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    open(activity, TELEGRAM_URL, "Opening Telegram…");
                }
            });
            LinearLayout.LayoutParams joinLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            joinLp.topMargin = dp(activity, 14);
            card.addView(join, joinLp);

            // dismiss link
            TextView later = text(activity, "maybe later", 13, INK_LATER, serifItalic(), 0f);
            later.setGravity(Gravity.CENTER);
            later.setPadding(0, dp(activity, 12), 0, 0);
            later.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // dismiss handled by dialog below
                }
            });
            card.addView(later, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setView(card)
                    .setCancelable(true)
                    .create();
            later.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    try {
                        dialog.dismiss();
                    } catch (Throwable ignored) {
                    }
                }
            });
            dialog.show();
            try {
                android.view.Window window = dialog.getWindow();
                window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
                android.util.DisplayMetrics metrics = new android.util.DisplayMetrics();
                activity.getWindowManager().getDefaultDisplay().getMetrics(metrics);
                window.setLayout((int) (metrics.widthPixels * 0.86f),
                        android.view.WindowManager.LayoutParams.WRAP_CONTENT);
            } catch (Throwable t) {
                Log.w(TAG, "promo: dialog layout tweak skipped", t);
            }
        } catch (Throwable t) {
            Log.w(TAG, "promo: dialog skipped", t);
        }
    }

    /* ------------------------------------------------------------------ */
    /* Floating coffee pill                                                */
    /* ------------------------------------------------------------------ */

    private static Bitmap coffeeArt() {
        synchronized (lock) {
            if (coffeeBitmap != null) return coffeeBitmap;
            try {
                byte[] raw = Base64.decode(COFFEE_ART, Base64.NO_WRAP);
                coffeeBitmap = BitmapFactory.decodeByteArray(raw, 0, raw.length);
            } catch (Throwable t) {
                Log.w(TAG, "promo: coffee art decode failed", t);
                coffeeBitmap = null;
            }
            return coffeeBitmap;
        }
    }

    private static void attachCoffee(final Activity activity) {
        try {
            View decor = activity.getWindow().getDecorView();
            if (decor.findViewWithTag(COFFEE_TAG) != null) return;

            LinearLayout pill = new LinearLayout(activity);
            pill.setOrientation(LinearLayout.HORIZONTAL);
            pill.setGravity(Gravity.CENTER_VERTICAL);
            GradientDrawable background = rounded(PAPER, dp(activity, 27));
            background.setStroke(dp(activity, 1), HAIRLINE);
            pill.setBackground(background);
            pill.setElevation(dp(activity, 10));
            pill.setTag(COFFEE_TAG);
            pill.setClipToOutline(false);
            pill.setPadding(dp(activity, 9), dp(activity, 7), dp(activity, 18), dp(activity, 7));

            Bitmap art = coffeeArt();
            if (art != null) {
                ImageView cup = new ImageView(activity);
                cup.setImageBitmap(art);
                LinearLayout.LayoutParams cupLp = new LinearLayout.LayoutParams(
                        dp(activity, 40), dp(activity, 40));
                pill.addView(cup, cupLp);
            }

            TextView label = text(activity, "Buy me a cup of coffee", 13, INK, serif(), 0.2f);
            LinearLayout.LayoutParams labelLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            labelLp.leftMargin = dp(activity, 10);
            pill.addView(label, labelLp);

            pill.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    open(activity, COFFEE_URL, "Thanks for the coffee!");
                }
            });

            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT);
            params.gravity = Gravity.BOTTOM | Gravity.END;
            params.rightMargin = dp(activity, 16);
            params.bottomMargin = dp(activity, 96);
            activity.addContentView(pill, params);
        } catch (Throwable t) {
            Log.w(TAG, "promo: coffee button skipped", t);
        }
    }

    /* ------------------------------------------------------------------ */
    /* Lifecycle wiring (cadence rules applied)                            */
    /* ------------------------------------------------------------------ */

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
            started++;
            if (started == 1) {
                MAIN.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        Activity top = current();
                        if (top != null && started > 0 && consumePopupQuota(top)) showDialog(top);
                    }
                }, POPUP_DELAY_MS);
            }
        }

        @Override
        public void onActivityResumed(Activity activity) {
            synchronized (lock) {
                top = activity;
            }
            removeCoffee(activity);
            if (!playbackLike(activity.getClass().getName())) {
                MAIN.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        attemptCoffeeShow(activity);
                    }
                }, COFFEE_ATTACH_DELAY_MS);
            }
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
            if (started > 0) started--;
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            synchronized (lock) {
                if (top == activity) top = null;
            }
        }
    }

    private static Activity current() {
        synchronized (lock) {
            return top;
        }
    }
}
