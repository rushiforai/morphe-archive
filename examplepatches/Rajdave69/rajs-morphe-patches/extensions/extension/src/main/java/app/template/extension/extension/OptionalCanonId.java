/*
 * Copyright (c) 2026 Canon Camera Connect community patch contributors.
 * SPDX-License-Identifier: GPL-3.0-only
 * Unofficial extension for Camera Connect 3.6.11.7 (versionCode 94).
 */
package com.community.canon.extension;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public final class OptionalCanonId {
    private static final String TAG = "CanonOptionalLogin";
    private static final String BUTTON_TAG = "CanonOptionalLogin:skip";
    private static final int LOGIN_PAGE = 5;
    private static final int PAGE_ROOT_ID = 0x7f08077d;
    private static final int BUTTON_GROUP_ID = 0x7f080767;
    // A persisted *user preference*, NOT Canon's real account/login status.
    private static final String PREFS = "canon_community_optional_login";
    private static final String OFFLINE_CHOICE = "continue_without_canon_id";

    // Initialized before Canon checks onboarding in onCreate(Bundle).
    private static volatile Context applicationContext;
    private static WeakReference<Activity> currentWalkthrough = new WeakReference<>(null);
    private static WeakReference<Activity> loginInProgress = new WeakReference<>(null);

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }


    private OptionalCanonId() { }

    // Called before CCTopActivity.O() invokes x(...), including on cold start.
    // Do not associate the top Activity with currentWalkthrough; actual sign-in
    // flow is still tracked by CCWalkThroughActivity.onCreate / y(boolean).
    public static void onTopActivityEntry(Activity activity) {
        if (activity == null) return;
        final Context app = activity.getApplicationContext();
        if (app == null) return;
        applicationContext = app;
    }

    // Hook runs in CCWalkThroughActivity.onCreate(Bundle), immediately AFTER
    // super.onCreate. This supplies a real Activity/Context before x() executes.
    // It replaces the v3 hook which incorrectly treated an obfuscated x()
    // argument (Laa/k;) as android.content.Context.
    public static void onWalkthroughCreated(Activity activity) {
        if (activity == null) return;
        Context app = activity.getApplicationContext();
        if (app == null) {
            Log.w(TAG, "Application context unavailable; preserving Canon's original onboarding");
            return;
        }
        applicationContext = app;
        currentWalkthrough = new WeakReference<>(activity);
        loginInProgress = new WeakReference<>(null);
        Log.i(TAG, "Walkthrough created; offline choice="
                + prefs(applicationContext).getBoolean(OFFLINE_CHOICE, false));
    }

    // Invoked by x(...) only AFTER Canon's original EULA checks.
    // Canon's return value 1 means "no more walkthrough; finish()".
    // This is a UI-navigation preference, not a forged account status.
    public static boolean shouldSkipWalkthrough() {
        final Context context = applicationContext;
        final Activity activity = currentWalkthrough.get();
        if (context == null) return false;
        // x(...) is also invoked by the Top Activity, where there may not be
        // any active WalkThrough Activity yet. The saved preference still
        // applies there. Only a *live* explicit login request suspends it.
        if (activity != null && !activity.isFinishing()
                && loginInProgress.get() == activity) {
            Log.i(TAG, "Explicit Canon ID login in progress; retaining original walkthrough");
            return false;
        }
        if (!prefs(context).getBoolean(OFFLINE_CHOICE, false)) return false;
        Log.i(TAG, "Saved offline preference accepted after EULA; returning walkthrough complete (1)");
        return true;
    }

    // Canon's genuine Log in button should always be able to open official
    // authentication. Do NOT clear the saved offline preference: cancelled
    // login still remains offline on next launch.
    public static void onLoginSelected(Activity activity) {
        loginInProgress = new WeakReference<>(activity);
        Log.i(TAG, "Official Log in selected; remembered offline choice suspended for this walkthrough");
    }

    // Called ONLY from the real Canon sign-in handler y(boolean), immediately
    // after its k9/e.k() check. The real status is never persisted or changed
    // globally. Canon ordinarily calls z() instead of opening the browser
    // when status == 2; for an explicit login tap we take the auth-launch
    // branch even if Canon's cached status says "already authenticated".
    // This prevents a repeat of the same walkthrough screen.
    public static int getCanonLoginLaunchStatus(int original) {
        final Activity activity = currentWalkthrough.get();
        final boolean explicitlyRequested = activity != null
                && loginInProgress.get() == activity;
        if (!explicitlyRequested) return original;
        if (original == 2) {
            Log.i(TAG, "Explicit sign-in selected: replacing cached status=2 "
                    + "inside y(boolean) so Canon launches its auth Activity");
            return 0;
        }
        Log.i(TAG, "Explicit sign-in selected: Canon auth status=" + original
                + "; original login path will launch");
        return original;
    }

    // Called at the RETURN of CCWalkThroughActivity.v(int), AFTER Canon has
    // attached all views, initialized page field P, and configured buttons.
    //
    // IMPORTANT: Do not pass p0 from v(int) into this method! Canon replaces
    // its p0 register near the return with a q0 singleton. v5 did that and
    // Android rejected CCWalkThroughActivity with a VerifyError on startup.
    // We pass only the untouched integer p1 and use the Activity reference
    // saved by onWalkthroughCreated(Activity) at the start of the walkthrough.
    public static void onWalkthroughNavigation(int state) {
        final Activity activity = currentWalkthrough.get();
        if (activity == null || activity.isFinishing()) return;
        Log.i(TAG, "Walkthrough rendered with state=" + state);
        if (state != LOGIN_PAGE) return;
        Log.i(TAG, "Login page (state 5) rendered; locating native offline button");
        installButton(activity);
    }

    private static View findPageRoot(Activity activity) {
        // In this release Canon stores its freshly inflated view in field P;
        // findViewById on the Activity alone can miss its detached view tree.
        Class<?> cursor = activity.getClass();
        while (cursor != null) {
            try {
                Field field = cursor.getDeclaredField("P");
                field.setAccessible(true);
                Object obj = field.get(activity);
                if (obj instanceof View) {
                    View page = (View) obj;
                    if (page.getId() == PAGE_ROOT_ID || page.findViewById(BUTTON_GROUP_ID) != null) {
                        return page;
                    }
                }
            } catch (NoSuchFieldException ignored) {
                // Try superclass.
            } catch (IllegalAccessException | SecurityException ex) {
                Log.w(TAG, "Could not access Canon's page field", ex);
                break;
            }
            cursor = cursor.getSuperclass();
        }
        return activity.findViewById(PAGE_ROOT_ID);
    }

    private static void installButton(final Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        View page = findPageRoot(activity);
        if (page == null) {
            Log.w(TAG, "Login page root (field P) not found after rendering");
            return;
        }
        View group = page.findViewById(BUTTON_GROUP_ID);
        if (!(group instanceof LinearLayout)) {
            Log.w(TAG, "Login controls (0x7f080767) absent or not LinearLayout");
            return;
        }
        View developer = page.findViewById(0x7f080769);
        if (!(developer instanceof Button)) {
            Log.w(TAG, "Native [DEV] offline button (0x7f080769) missing");
            return;
        }

        LinearLayout controls = (LinearLayout) group;
        Button skip = (Button) developer;
        if (BUTTON_TAG.equals(skip.getTag()) && skip.getParent() == controls) {
            skip.setVisibility(View.VISIBLE);
            return;
        }
        // Reuse Canon's native [DEV] 'use without Canon ID' control instead
        // of injecting an unrelated new view into a ConstraintLayout.
        // Canon has finished installing the original listener at this point,
        // and we intentionally replace it with our explicit opt-in handler.
        ViewParent previousParent = skip.getParent();
        if (!(previousParent instanceof ViewGroup)) {
            Log.w(TAG, "Native offline button has no removable parent");
            return;
        }
        ((ViewGroup) previousParent).removeView(skip);
        skip.setTag(BUTTON_TAG);
        skip.setText("Continue without login");
        skip.setContentDescription("Use camera locally without Canon ID sign-in");
        skip.setAllCaps(false);
        skip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        skip.setTextColor(Color.rgb(55, 55, 55));
        skip.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
        skip.setMinHeight(dp(activity, 44));
        skip.setPadding(dp(activity, 16), dp(activity, 8), dp(activity, 16), dp(activity, 8));

        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.WHITE);
        background.setCornerRadius(dp(activity, 8));
        background.setStroke(Math.max(1, dp(activity, 1)), Color.rgb(160, 160, 160));
        skip.setBackground(background);
        skip.setOnClickListener(view -> continueOffline(activity));

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.topMargin = dp(activity, 8);
        lp.bottomMargin = dp(activity, 4);
        controls.addView(skip, lp);
        skip.setVisibility(View.VISIBLE);
        Log.i(TAG, "Reused and displayed Canon's native offline button beneath login controls");
    }

    private static void continueOffline(Activity activity) {
        if (activity == null) return;
        final SharedPreferences preferences = prefs(activity);
        final boolean previousChoice = preferences.getBoolean(OFFLINE_CHOICE, false);

        // commit(), not apply(): z() immediately re-checks x(), and the
        // saved preference must be visible before that synchronous call.
        // In v8, x() returns 1 after Canon's EULA gate, so z() finishes
        // the walkthrough instead of visiting states 4 -> 5 again.
        if (!preferences.edit().putBoolean(OFFLINE_CHOICE, true).commit()) {
            Toast.makeText(activity, "Could not save offline choice", Toast.LENGTH_LONG).show();
            return;
        }

        Activity previouslySuspended = loginInProgress.get();
        loginInProgress = new WeakReference<>(null);
        try {
            Method next = findMethod(activity.getClass(), "z");
            if (next == null) throw new NoSuchMethodException("CCWalkThroughActivity.z()");
            next.setAccessible(true);
            Log.i(TAG, "Continue without login selected; choice saved; invoking Canon continuation");
            next.invoke(activity);
        } catch (NoSuchMethodException | IllegalAccessException |
                 InvocationTargetException | SecurityException ex) {
            // Roll back preference and the session on navigation failure.
            preferences.edit().putBoolean(OFFLINE_CHOICE, previousChoice).commit();
            loginInProgress = new WeakReference<>(previouslySuspended);
            Log.e(TAG, "Could not continue without login", ex);
            Toast.makeText(activity, "Could not continue offline", Toast.LENGTH_LONG).show();
        }
    }

    private static Method findMethod(Class<?> clazz, String name) {
        Class<?> c = clazz;
        while (c != null) {
            try {
                return c.getDeclaredMethod(name);
            } catch (NoSuchMethodException ignored) {
                c = c.getSuperclass();
            }
        }
        return null;
    }

    private static int dp(Context context, float value) {
        return (int) (context.getResources().getDisplayMetrics().density * value + 0.5f);
    }
}
