/**
 * Copyright 2026 De-Vanced
 * https://github.com/RookieEnough/De-Vanced/pull/114
 */

package app.morphe.extension.shared.patches;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import android.util.Base64;

import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Universal Google Photos account avatar bridge:
 * 1. Main Toolbar Disc (og_apd_internal_image_view) — reflection & fuzzy name matching on AccountParticleDisc
 * 2. Bento Center Large Disc (og_bento_selected_account_avatar)
 * 3. Bento Collapsed Switch Row Disc (og_bento_header_account_avatar)
 * 4. Expanded Switch Rows & "Choose an account" Bottom Sheet Rows (smooth 60/120fps, pre-warmed RAM cache)
 */
public final class GooglePhotosAccountAvatar {
    private static final String ACCOUNT_TYPE = "app.revanced";
    private static final String PROFILE_TOKEN_TYPE = "oauth2:openid";
    private static final String USER_INFO_URL = "https://www.googleapis.com/oauth2/v3/userinfo";
    public static final String NO_ACCOUNT_SENTINEL = "NO_ACCOUNT";

    private static final String CACHE_FILE_PREFIX = "google_account_profile_avatar_";
    private static final long CACHE_MAX_AGE_MILLIS = 6L * 60L * 60L * 1000L;
    private static final long WINDOW_SCAN_THROTTLE_MILLIS = 100L;

    public static final String MORPHE_ACCOUNT_PREFS = "morphe_account_prefs";
    public static final String KEY_SELECTED_ACCOUNT_INDEX = "selected_account_index";

    private static final Pattern EMAIL_PATTERN = Pattern.compile(
            "[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}",
            Pattern.CASE_INSENSITIVE
    );

    private static final Map<String, Bitmap> MEMORY_AVATARS = new ConcurrentHashMap<>();
    private static final Set<String> FETCHING_ACCOUNTS = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private static final AtomicBoolean WINDOW_SCAN_ERROR_LOGGED = new AtomicBoolean();
    private static final Set<View> OBSERVED_WINDOW_ROOTS = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<View> WATCHED_TOOLBAR_VIEWS = Collections.newSetFromMap(new WeakHashMap<>());

    private static volatile long lastWindowScanUptime;
    private static volatile String activeSelectedEmail = null;
    private static boolean lifecycleRegistered = false;

    private GooglePhotosAccountAvatar() {
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Public entry points (called from patched bytecode)
    // ─────────────────────────────────────────────────────────────────────────

    public static void install(Activity activity) {
        Logger.printInfo(() -> "Installing the Google Photos account avatar bridge");

        ensureOneGoogleFlagsConfigured(activity);
        warmUpMemoryCache(activity);
        restoreSelectedAccount(activity);

        if (!lifecycleRegistered && activity.getApplication() != null) {
            activity.getApplication().registerActivityLifecycleCallbacks(
                    new android.app.Application.ActivityLifecycleCallbacks() {
                        @Override public void onActivityCreated(Activity a, Bundle b) {
                            observeWindowRoot(a, a.getWindow().getDecorView());
                        }
                        @Override public void onActivityStarted(Activity a) {
                            observeWindowRoot(a, a.getWindow().getDecorView());
                        }
                        @Override public void onActivityResumed(Activity a) {
                            observeWindowRoot(a, a.getWindow().getDecorView());
                            scanAllWindowRoots(a, true);
                        }
                        @Override public void onActivityPaused(Activity a) {}
                        @Override public void onActivityStopped(Activity a) {}
                        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                        @Override public void onActivityDestroyed(Activity a) {}
                    });
            lifecycleRegistered = true;
        }

        View decorView = activity.getWindow().getDecorView();
        observeWindowRoot(activity, decorView);
        prefetchRegisteredAccounts(activity, decorView);
        scanAllWindowRoots(activity, true);

        Utils.runOnMainThreadDelayed(() -> scanAllWindowRoots(activity, true), 100);
        Utils.runOnMainThreadDelayed(() -> scanAllWindowRoots(activity, true), 300);
        Utils.runOnMainThreadDelayed(() -> scanAllWindowRoots(activity, true), 600);
        Utils.runOnMainThreadDelayed(() -> scanAllWindowRoots(activity, true), 1200);
        Utils.runOnMainThreadDelayed(() -> scanAllWindowRoots(activity, true), 2000);
    }

    public static void restoreSelectedAccount(Activity activity) {
        try {
            SharedPreferences prefs = activity.getSharedPreferences(
                    MORPHE_ACCOUNT_PREFS, Context.MODE_PRIVATE);
            int savedIndex = prefs.getInt(KEY_SELECTED_ACCOUNT_INDEX, -99);
            if (savedIndex == -1) {
                activeSelectedEmail = NO_ACCOUNT_SENTINEL;
                return;
            }
            if (savedIndex >= 0) {
                Account[] accounts = AccountManager.get(activity).getAccountsByType(ACCOUNT_TYPE);
                if (savedIndex < accounts.length) {
                    activeSelectedEmail = accounts[savedIndex].name;
                    Logger.printInfo(() -> "Restored account selection: index "
                            + savedIndex + " (" + activeSelectedEmail + ")");
                }
            }
        } catch (Exception e) {
            Logger.printException(() -> "Could not restore selected account", e);
        }
    }

    private static final String ONEGOOGLE_PB_BASE64 =
            "CqUBIGNvbS5nb29nbGUuYW5kcm9pZC5saWJyYXJpZXMub25lZ29vZ2xlI2NvbS5nb29nbGUuYW5kcm9pZC5hcHBzLnBob3RvcyA1MjMzMTk1NiA2IDE1MzIyMjI3MzEgY29tLmdvb2dsZS5hbmRyb2lkLmxpYnJhcmllcy5vbmVnb29nbGUjY29tLmdvb2dsZS5hbmRyb2lkLmFwcHMucGhvdG9zICAwEhEIAxINDQOmpKU+FQLEz/0/BhoUQ0FNU0NnMFB4TV85UHdiYzNTQT0grLyF1QYqBgoCMTAQASoGCgIxMhgBKggKATIqA01ESSoFCgE0GAEqDAoINDUzNzUzNzcYASoMCgg0NTM3Njk4OBgBKgwKCDQ1Mzc4NTE4GAEqDAoINDUzODM1ODMYASoMCgg0NTM4Mzg5NhgBKigKCDQ1Mzg0ODAzKhxmb290cHJpbnRzLXBhLmdvb2dsZWFwaXMuY29tKgwKCDQ1Mzg2NjcwGAEqDAoINDUzOTAwODkYASoMCgg0NTQwMTQ2MhgBKgwKCDQ1NDE0OTY2GAEqDAoINDU0MTU3NTAYASoMCgg0NTQxODY0MRgBKg0KCDQ1NDE4ODE0ENAPKgwKCDQ1NDIwNDA0GAEqQAoINDU0MjA0MDUqNGh0dHBzOi8vY29uc2VudC5nb29nbGUuY29tL3NpZ25lZGluL2VtYmVkZGVkL2xhbmRpbmcqOwoINDU0MjA5NTEqL2h0dHBzOi8vY29uc2VudC5nb29nbGUuY29tL3NpZ25lZGluL2VtYmVkZGVkL3B3KgwKCDQ1NDIwOTUyGAEqDAoINDU0MjA5NzIYASoOCgg0NTQyNzg1NxDAqQcqDAoINDU0MjgwMTUYACoMCgg0NTQyODA3NBgBKgwKCDQ1NDI4MzI3GAEqDAoINDU0MzAzMjIYASoMCgg0NTQ1OTgyORgBKg8KCDQ1NDYwNzk5EIC4mSkqDQoINDU0NjIwMzEQiCcqDAoINDU0Nzc4MjEYACoMCgg0NTQ3ODI2NhgAKgwKCDQ1NDc4MjY3GAEqDAoINDU1MTc3ODYYACoMCgg0NTUzMTAzMBgAKgwKCDQ1NTMxMDczGAEqDAoINDU1MzE2MjEYASoTCgg0NTUzMTYyMiEAAAAAAAAAQCoTCgg0NTUzMTYyMyEAAAAAAADwPyoTCgg0NTUzMTYyNCEAAAAAAAA+QCoMCgg0NTUzMTYyNRADKkAKCDQ1NjEzNTAxKjRodHRwczovL2NvbnNlbnQuZ29vZ2xlLmNvbS9zaWduZWRpbi9lbWJlZGRlZC9sYW5kaW5nKgwKCDQ1NjEzNTAyMgAqDAoINDU2MTcxNzcYASo5Cgg0NTYxOTg1MSotY29uc2VudHByaW1pdGl2ZWRhdGFzZXJ2aWNlLXBhLmdvb2dsZWFwaXMuY29tKigKCDQ1NjIwODAwMhwKGgoPFBYYHygGOCcpLC8zUjk6RE1OPEBBRU9RKhoKCDQ1NjIwODAxMg4KDA4QFRcZGyEqLjAyRypDCgg0NTYyMDgwMjI3CjUAAQIDBAUGBwgJHjgSJgoLDA0PFBETFhgrLR8oHB0gIyQnKSosLzE1NDM2N0I5OjxHPUBBPyopCgg0NTYyNjkxNDIdChsbHB0JMTU3QkM9PEdBQDpETU5FSEZPUFFTVFUqDAoINDU2Mjk0MTYyACoMCgg0NTYzOTAzNBgBKgwKCDQ1NjQ0Mzg5GAEqDAoINDU2NDY3MjAYASoMCgg0NTY1OTk1MBgAKgwKCDQ1NjY2MDUzGAEqDAoINDU2NjcyMTcYASpYCgg0NTY2OTk1MypMaHR0cHM6Ly93d3cuZ3N0YXRpYy5jb20vbXlhZGNlbnRlci9sb2dvL2EzMmZmYWM0MzdhZDk3NmJlY2Y2NzlhNzFlZmE5ODBmLnBuZypYCgg0NTY2OTk1NCpMaHR0cHM6Ly93d3cuZ3N0YXRpYy5jb20vbXlhZGNlbnRlci9sb2dvL2EzMmZmYWM0MzdhZDk3NmJlY2Y2NzlhNzFlZmE5ODBmLnBuZyoMCgg0NTY3MTIzORgBKgwKCDQ1Njg0NzQ0GAEqDAoINDU2OTM3NjYYASoMCgg0NTY5NjUxMRgBKgwKCDQ1Njk4NjEzEAAqDAoINDU3MDA3ODMYASoMCgg0NTcxOTAyOBgBKgwKCDQ1NzIwNTQ5GAAqDAoINDU3MjI2MDUYASoMCgg0NTcyNzUyMBgBKgwKCDQ1NzI3ODQzGAEqDAoINDU3Mjk1NzgYACpfCgg0NTczMzk5NjJTChpodHRwczovL3Bob3Rvcy5nb29nbGUuY29tLwoaaHR0cHM6Ly93YWxsZXQuZ29vZ2xlLmNvbS8KGWh0dHBzOi8vc2VjdXJlLnBsYWlkLmNvbS8qDAoINDU3Mzc3NzUYASoMCgg0NTc0MDU0MxgAKgwKCDQ1NzQxODg3GAEqDAoINDU3NDMwMzgYACoMCgg0NTc0ODAyNBgAKgwKCDQ1NzQ4ODUzGAEqDAoINDU3NDkzNzEYACoMCgg0NTc0OTM3MhgAKgwKCDQ1NzU5NzcxGAEqDAoINDU3NjIzNTIYACoMCgg0NTc3MDk5MRgBKgwKCDQ1NzczMzUyGAEqDAoINDU3NzM4MzYYASoMCgg0NTc3MzkwMRgBKgwKCDQ1Nzc1NDY3GAAqDAoINDU3ODEyNTEYASoMCgg0NTc4MTMwNxgBKgwKCDQ1NzgyMDI0GAAqDAoINDU3ODM1MjQYASoMCgg0NTc4NDQxOBgBKgwKCDQ1Nzg1NDU0GAEqDAoINDU3OTM2MzgYASoMCgg0NTc5OTg4MhgAKgwKCDQ1ODA0MDU5GAEqDAoINDU4MjMyMTcYACoMCgg0NTgyNTYwMhgAKgwKCDQ1ODMwMTMwGAAqDAoINDU4MzYzNDQYACoFCgE3GAAqBQoBOBgB";

    public static void ensureOneGoogleFlagsConfigured(Context context) {
        try {
            File sharedDir = new File(context.getFilesDir(), "phenotype/shared");
            if (!sharedDir.exists()) {
                sharedDir.mkdirs();
            }

            String pkgName = context.getPackageName();
            String[] targetNames = {
                    "com.google.android.libraries.onegoogle#" + pkgName + ".pb",
                    "com.google.android.libraries.onegoogle#com.google.android.apps.photos.pb"
            };

            byte[] pbBytes = null;

            for (String targetName : targetNames) {
                File pbFile = new File(sharedDir, targetName);
                if (!pbFile.exists() || pbFile.length() < 500) {
                    if (pbBytes == null) {
                        pbBytes = Base64.decode(ONEGOOGLE_PB_BASE64, Base64.DEFAULT);
                    }
                    try (FileOutputStream fos = new FileOutputStream(pbFile)) {
                        fos.write(pbBytes);
                        fos.flush();
                    }
                    pbFile.setReadable(true, false);
                    pbFile.setWritable(true, false);
                    Logger.printInfo(() -> "Seeded OneGoogle phenotype flags to: " + pbFile.getAbsolutePath());
                }
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Could not seed OneGoogle phenotype flags", t);
        }
    }

    private static void warmUpMemoryCache(Activity activity) {
        try {
            Account[] accounts = AccountManager.get(activity).getAccountsByType(ACCOUNT_TYPE);
            for (Account acc : accounts) {
                readCachedAvatar(activity, acc.name);
            }
        } catch (Exception ignored) {}
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Window root management
    // ─────────────────────────────────────────────────────────────────────────

    private static void observeWindowRoot(Activity activity, View root) {
        if (!OBSERVED_WINDOW_ROOTS.add(root)) return;

        ViewTreeObserver observer = root.getViewTreeObserver();
        observer.addOnGlobalLayoutListener(() -> {
            refresh(activity, root);
            scanAllWindowRoots(activity, false);
        });
        observer.addOnWindowFocusChangeListener(hasFocus -> {
            refresh(activity, root);
            scanAllWindowRoots(activity, true);
        });
        refresh(activity, root);
    }

    private static void scanAllWindowRoots(Activity activity, boolean force) {
        if (activity.isFinishing() || activity.isDestroyed()) return;

        long now = SystemClock.uptimeMillis();
        if (!force && now - lastWindowScanUptime < WINDOW_SCAN_THROTTLE_MILLIS) return;
        lastWindowScanUptime = now;

        refresh(activity, activity.getWindow().getDecorView());

        try {
            Class<?> wmgClass = Class.forName("android.view.WindowManagerGlobal");
            Object wmg = wmgClass.getMethod("getInstance").invoke(null);
            java.lang.reflect.Field viewsField = wmgClass.getDeclaredField("mViews");
            viewsField.setAccessible(true);
            Object roots = viewsField.get(wmg);
            if (roots instanceof List<?>) {
                for (Object r : (List<?>) roots) {
                    if (!(r instanceof View)) continue;
                    View windowRoot = (View) r;
                    observeWindowRoot(activity, windowRoot);
                    refresh(activity, windowRoot);
                }
            }
        } catch (Exception exception) {
            if (WINDOW_SCAN_ERROR_LOGGED.compareAndSet(false, true)) {
                Logger.printException(
                        () -> "Could not scan all window roots for avatar injection",
                        exception);
            }
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Refresh dispatcher
    // ─────────────────────────────────────────────────────────────────────────

    private static void refresh(Activity activity, View root) {
        if (activity.isFinishing() || activity.isDestroyed()) return;

        // Surface 1: Gallery Toolbar Disc (with reflection on AccountParticleDisc)
        applyToolbarAvatar(activity, root);

        // Surface 2: Bento Center Large 88x88dp Disc
        applyBentoCenterAvatar(activity, root);

        // Surface 3: Bento Collapsed Switch Row 30x30dp Disc
        applySwitchAccountRowAvatar(activity, root);

        // Surface 4: Bento Expanded Switch Rows & "Choose an account" Bottom Sheet Rows
        findAndApplyAccountRowAvatars(activity, root);
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Per-surface avatar appliers
    // ─────────────────────────────────────────────────────────────────────────

    /** Surface 1: Main Gallery Toolbar Disc (44x44dp og_apd_internal_image_view) */
    private static void applyToolbarAvatar(Activity activity, View root) {
        int id = getResId(activity, "og_apd_internal_image_view");
        if (id == 0) return;
        View v = root.findViewById(id);
        if (v == null) return;

        // If signed out or "Use without an account", do not touch toolbar view
        if (NO_ACCOUNT_SENTINEL.equals(activeSelectedEmail) || isSignedOutToolbar(v)) {
            return;
        }

        String email = findEmailOrAccountNearView(activity, v);
        if (email == null) email = activeSelectedEmail;
        if (email == null) email = resolveActiveEmail(activity);
        if (email == null || NO_ACCOUNT_SENTINEL.equals(email)) return;

        if (activeSelectedEmail == null) {
            activeSelectedEmail = email;
            persistAccountSelection(activity, email);
        }

        Bitmap bmp = getOrFetchAvatar(activity, root, email);
        if (bmp != null) {
            setAvatarOnView(activity, v, bmp);
        }

        attachPersistentToolbarWatcher(activity, root, v);
    }

    private static void attachPersistentToolbarWatcher(Activity activity, View root, View toolbarView) {
        if (!WATCHED_TOOLBAR_VIEWS.add(toolbarView)) return;

        toolbarView.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (NO_ACCOUNT_SENTINEL.equals(activeSelectedEmail) || isSignedOutToolbar(v)) return;
            String curEmail = findEmailOrAccountNearView(activity, v);
            if (curEmail == null) curEmail = activeSelectedEmail;
            if (curEmail == null) curEmail = resolveActiveEmail(activity);
            if (curEmail == null || NO_ACCOUNT_SENTINEL.equals(curEmail)) return;

            Bitmap bmp = getOrFetchAvatar(activity, root, curEmail);
            if (bmp != null) setAvatarOnView(activity, v, bmp);
        });

        ViewParent parent = toolbarView.getParent();
        if (parent instanceof View && WATCHED_TOOLBAR_VIEWS.add((View) parent)) {
            ((View) parent).addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                if (NO_ACCOUNT_SENTINEL.equals(activeSelectedEmail) || isSignedOutToolbar(toolbarView)) return;
                String curEmail = findEmailOrAccountNearView(activity, toolbarView);
                if (curEmail == null) curEmail = activeSelectedEmail;
                if (curEmail == null) curEmail = resolveActiveEmail(activity);
                if (curEmail == null || NO_ACCOUNT_SENTINEL.equals(curEmail)) return;

                Bitmap bmp = getOrFetchAvatar(activity, root, curEmail);
                if (bmp != null) setAvatarOnView(activity, toolbarView, bmp);
            });
        }
    }

    private static boolean isSignedOutToolbar(View view) {
        View cur = view;
        for (int d = 0; cur != null && d < 6; d++) {
            CharSequence desc = cur.getContentDescription();
            if (desc != null) {
                String s = desc.toString().toLowerCase(Locale.ROOT);
                if (s.contains("without an account") || s.contains("signed out") ||
                    s.contains("no account") || s.contains("use without")) {
                    return true;
                }
            }
            ViewParent p = cur.getParent();
            cur = p instanceof View ? (View) p : null;
        }
        return false;
    }

    /** Surface 2: Bento Center Large 88x88dp Disc */
    private static void applyBentoCenterAvatar(Activity activity, View root) {
        int centerId = getResId(activity, "og_bento_selected_account_avatar");
        View centerDisc = centerId != 0 ? root.findViewById(centerId) : null;
        if (centerDisc == null) return;

        String email = readEmailFromBentoHeader(activity, root);
        if (email == null) email = activeSelectedEmail;
        if (email == null) email = resolveActiveEmail(activity);
        if (email == null || NO_ACCOUNT_SENTINEL.equals(email)) return;

        // Synchronize activeSelectedEmail with what Bento header is displaying
        if (!sameEmail(activeSelectedEmail, email)) {
            activeSelectedEmail = email;
            persistAccountSelection(activity, email);
        }

        Bitmap bmp = getOrFetchAvatar(activity, root, email);
        if (bmp != null) setAvatarOnView(activity, centerDisc, bmp);
    }

    /** Surface 3: Bento Collapsed Switch Row 30x30dp Disc */
    private static void applySwitchAccountRowAvatar(Activity activity, View root) {
        if (activity.isFinishing() || activity.isDestroyed()) return;

        int switchDiscId = getResId(activity, "og_bento_header_account_avatar");
        if (switchDiscId == 0) return;
        View switchDisc = root.findViewById(switchDiscId);
        if (switchDisc == null) return;

        Account[] accounts = AccountManager.get(activity).getAccountsByType(ACCOUNT_TYPE);
        if (accounts.length <= 1) return;

        String activeEmail = readEmailFromBentoHeader(activity, root);
        if (activeEmail == null) activeEmail = activeSelectedEmail;
        if (activeEmail == null || NO_ACCOUNT_SENTINEL.equals(activeEmail)) activeEmail = accounts[0].name;

        Account secondary = null;
        for (Account acc : accounts) {
            if (!sameEmail(acc.name, activeEmail)) { secondary = acc; break; }
        }
        if (secondary == null) return;

        Bitmap bmp = getOrFetchAvatar(activity, root, secondary.name);
        if (bmp != null) setAvatarOnView(activity, switchDisc, bmp);
    }

    /** Surface 4: Expanded Switch Rows & "Choose an account" Bottom Sheet Rows */
    private static void findAndApplyAccountRowAvatars(Activity activity, View root) {
        if (activity.isFinishing() || activity.isDestroyed()) return;

        List<TextView> emailViews = new ArrayList<>();
        collectEmailTextViews(root, emailViews);

        for (TextView tv : emailViews) {
            String email = extractEmail(tv.getText());
            if (email == null) email = extractEmail(tv.getContentDescription());
            if (email == null) continue;

            attachAccountSelectionHook(activity, tv, email);

            Bitmap bmp = getOrFetchAvatar(activity, root, email);
            if (bmp == null) continue;

            View disc = findRowAvatarDisc(activity, tv);
            if (disc != null) setAvatarOnView(activity, disc, bmp);
        }

        attachSignedOutRowHook(activity, root);
    }

    private static void attachSignedOutRowHook(Activity activity, View root) {
        List<TextView> allTvs = new ArrayList<>();
        collectAllTextViews(root, allTvs);
        for (TextView tv : allTvs) {
            CharSequence text = tv.getText();
            if (text != null) {
                String s = text.toString().toLowerCase(Locale.ROOT);
                if (s.contains("without an account") || s.contains("use photos without an account")) {
                    ViewParent p = tv.getParent();
                    for (int d = 0; d < 3 && p instanceof ViewGroup; d++) {
                        ((ViewGroup) p).setOnTouchListener((v, event) -> {
                            if (event.getAction() == MotionEvent.ACTION_UP) {
                                activeSelectedEmail = NO_ACCOUNT_SENTINEL;
                                persistAccountSelection(activity, NO_ACCOUNT_SENTINEL);
                                Utils.runOnMainThreadDelayed(() -> scanAllWindowRoots(activity, true), 50);
                            }
                            return false;
                        });
                        p = p.getParent();
                    }
                }
            }
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Touch hook
    // ─────────────────────────────────────────────────────────────────────────

    private static void attachAccountSelectionHook(Activity activity, TextView tv, String email) {
        ViewParent parent = tv.getParent();
        for (int depth = 0; depth < 3 && parent instanceof ViewGroup; depth++) {
            ViewGroup row = (ViewGroup) parent;
            row.setOnTouchListener((v, event) -> {
                int action = event.getAction();
                if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_UP) {
                    activeSelectedEmail = email;
                    persistAccountSelection(activity, email);
                    Utils.runOnMainThreadDelayed(() -> scanAllWindowRoots(activity, true), 50);
                }
                return false;
            });
            parent = parent.getParent();
        }
    }

    private static void persistAccountSelection(Activity activity, String email) {
        try {
            if (NO_ACCOUNT_SENTINEL.equals(email)) {
                activity.getSharedPreferences(MORPHE_ACCOUNT_PREFS, Context.MODE_PRIVATE)
                        .edit()
                        .putInt(KEY_SELECTED_ACCOUNT_INDEX, -1)
                        .apply();
                return;
            }

            Account[] accounts = AccountManager.get(activity).getAccountsByType(ACCOUNT_TYPE);
            for (int i = 0; i < accounts.length; i++) {
                if (sameEmail(accounts[i].name, email)) {
                    activity.getSharedPreferences(MORPHE_ACCOUNT_PREFS, Context.MODE_PRIVATE)
                            .edit()
                            .putInt(KEY_SELECTED_ACCOUNT_INDEX, i)
                            .apply();
                    return;
                }
            }
        } catch (Exception e) {
            Logger.printException(() -> "Could not persist account selection", e);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Avatar resolution helpers
    // ─────────────────────────────────────────────────────────────────────────

    @Nullable
    private static Bitmap getOrFetchAvatar(Activity activity, View root, String email) {
        if (email == null || NO_ACCOUNT_SENTINEL.equals(email)) return null;
        Bitmap cached = readCachedAvatar(activity, email);
        if (cached != null) return cached;
        Account account = findAccount(activity, email);
        if (account != null) fetchProfileToken(activity, root, account);
        return null;
    }

    @Nullable
    private static String readEmailFromBentoHeader(Activity activity, View root) {
        String[] headerIds = {
                "og_bento_account_menu_title_text",
                "og_bento_header_title",
                "og_bento_subtitle_text",
                "og_bento_account_name_text",
                "og_bento_email_text",
        };
        for (String name : headerIds) {
            int id = getResId(activity, name);
            if (id == 0) continue;
            View v = root.findViewById(id);
            if (!(v instanceof TextView)) continue;
            String email = extractEmail(((TextView) v).getText());
            if (email != null) return email;
        }

        List<TextView> tvs = new ArrayList<>();
        collectEmailTextViews(root, tvs);
        if (!tvs.isEmpty()) {
            String e = extractEmail(tvs.get(0).getText());
            if (e != null) return e;
        }

        return null;
    }

    @Nullable
    private static String resolveActiveEmail(Activity activity) {
        if (activeSelectedEmail != null) {
            return NO_ACCOUNT_SENTINEL.equals(activeSelectedEmail) ? null : activeSelectedEmail;
        }
        return null;
    }

    @Nullable
    private static String findEmailOrAccountNearView(Activity activity, @Nullable View view) {
        if (view == null) return null;
        Account[] accounts = AccountManager.get(activity).getAccountsByType(ACCOUNT_TYPE);
        if (accounts.length == 0) return null;

        View cur = view;
        for (int d = 0; cur != null && d < 6; d++) {
            // 1. Check content description for email or display name
            CharSequence desc = cur.getContentDescription();
            if (desc != null) {
                String email = extractEmail(desc);
                if (email != null) return email;

                String sDesc = desc.toString().toLowerCase(Locale.ROOT);
                if (sDesc.contains("without an account") || sDesc.contains("no account") || sDesc.contains("signed out")) {
                    return NO_ACCOUNT_SENTINEL;
                }

                // Match username or clean alphanumeric prefix (e.g. "akashsriram" matches "Akashsriram Ganapathy")
                String cleanDesc = sDesc.replaceAll("[^a-z0-9]", "");
                for (Account acc : accounts) {
                    String namePart = acc.name.toLowerCase(Locale.ROOT);
                    int atIdx = namePart.indexOf('@');
                    String userPart = atIdx > 0 ? namePart.substring(0, atIdx) : namePart;
                    String cleanUser = userPart.replaceAll("[^a-z0-9]", "");

                    if (sDesc.contains(namePart) || cleanDesc.contains(cleanUser)) {
                        return acc.name;
                    }
                    // Strip suffixes like "work" or numbers
                    if (cleanUser.length() > 5 && cleanDesc.contains(cleanUser.substring(0, 5))) {
                        return acc.name;
                    }
                }
            }

            // 2. Check reflection on fields of the AccountParticleDisc ViewGroup
            try {
                Field[] fields = cur.getClass().getDeclaredFields();
                for (Field f : fields) {
                    f.setAccessible(true);
                    Object val = f.get(cur);
                    if (val != null) {
                        String valStr = val.toString().toLowerCase(Locale.ROOT);
                        for (Account acc : accounts) {
                            if (valStr.contains(acc.name.toLowerCase(Locale.ROOT))) {
                                return acc.name;
                            }
                        }
                    }
                }
            } catch (Exception ignored) {}

            ViewParent p = cur.getParent();
            cur = p instanceof View ? (View) p : null;
        }

        return null;
    }

    /** Surface 4 Row Disc Discovery (Recursive search through container ViewGroups) */
    @Nullable
    private static View findRowAvatarDisc(Activity activity, TextView emailTv) {
        int[] discIds = {
                getResId(activity, "og_bento_available_account_avatar"),
                getResId(activity, "account_avatar"),
                getResId(activity, "account_header_avatar"),
                getResId(activity, "account_particle_disc_item"),
                getResId(activity, "og_apd_internal_image_view"),
                android.R.id.icon,
        };

        ViewParent parent = emailTv.getParent();
        for (int depth = 0; depth < 4 && parent instanceof ViewGroup; depth++) {
            ViewGroup row = (ViewGroup) parent;

            for (int discId : discIds) {
                if (discId == 0) continue;
                View disc = row.findViewById(discId);
                if (disc != null && !isExcluded(activity, disc)) return disc;
            }

            View disc = findAvatarLikeChildRecursive(activity, row, emailTv, 0);
            if (disc != null) return disc;

            parent = row.getParent();
        }
        return null;
    }

    @Nullable
    private static View findAvatarLikeChildRecursive(Activity activity, ViewGroup group, View exclude, int depth) {
        if (depth > 3) return null;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child == exclude || isExcluded(activity, child)) continue;

            String cls = child.getClass().getName();
            if (cls.contains("Disc") || cls.contains("Avatar")) return child;

            int id = child.getId();
            if (id != 0 && (id == getResId(activity, "og_bento_available_account_avatar") ||
                            id == getResId(activity, "account_avatar") ||
                            id == getResId(activity, "photos_settings_account_avatar") ||
                            id == getResId(activity, "photos_settings_account_adapter_avatar") ||
                            id == getResId(activity, "og_apd_internal_image_view") ||
                            id == android.R.id.icon)) {
                return child;
            }

            if (child instanceof ImageView) {
                int w = child.getWidth(), h = child.getHeight();
                if (w == 0 || h == 0 || (w <= 150 && h <= 150)) {
                    return child;
                }
            } else if (child instanceof ViewGroup) {
                View nested = findAvatarLikeChildRecursive(activity, (ViewGroup) child, exclude, depth + 1);
                if (nested != null) return nested;
            }
        }
        return null;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // View application
    // ─────────────────────────────────────────────────────────────────────────

    private static void setAvatarOnView(Activity activity, View view, Bitmap bitmap) {
        if (view == null || bitmap == null || isExcluded(activity, view)) return;

        List<ImageView> targets = new ArrayList<>();
        if (view instanceof ImageView) {
            targets.add((ImageView) view);
        } else if (view instanceof ViewGroup) {
            collectAvatarImageViews(activity, (ViewGroup) view, targets);
        }

        for (ImageView target : targets) {
            if (isExcluded(activity, target)) continue;
            int size = Math.min(target.getWidth(), target.getHeight());
            Bitmap scaled = (size > 0 && (bitmap.getWidth() != size || bitmap.getHeight() != size))
                    ? Bitmap.createScaledBitmap(bitmap, size, size, true)
                    : bitmap;
            target.setScaleType(ImageView.ScaleType.FIT_CENTER);
            target.setImageDrawable(new BitmapDrawable(target.getResources(), scaled));
            if (target.getForeground() != null) target.setForeground(null);
            target.setVisibility(View.VISIBLE);
            target.bringToFront();
            target.invalidate();
        }

        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            if (vg.getForeground() != null) vg.setForeground(null);
            vg.invalidate();
        }
        view.invalidate();
    }

    private static void collectAvatarImageViews(Activity activity, ViewGroup group, List<ImageView> out) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (isExcluded(activity, child)) continue;
            if (child instanceof ImageView) out.add((ImageView) child);
            else if (child instanceof ViewGroup) collectAvatarImageViews(activity, (ViewGroup) child, out);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Exclusion guard
    // ─────────────────────────────────────────────────────────────────────────

    private static boolean isExcluded(Activity activity, @Nullable View view) {
        if (view == null) return true;
        int id = view.getId();
        if (id != 0 && id != View.NO_ID) {
            if (id == getResId(activity, "og_bento_toolbar_close_button")) return true;
            if (id == getResId(activity, "og_collapsed_chevron")) return true;
            try {
                String name = activity.getResources().getResourceEntryName(id).toLowerCase(Locale.ROOT);
                if (name.contains("close") || name.contains("chevron") || name.contains("arrow") ||
                        name.contains("toggle") || name.contains("settings_icon") ||
                        name.contains("help_icon") || name.contains("backup_status") ||
                        name.contains("feedback") || name.contains("check_mark") ||
                        name.contains("radio") || name.contains("switch")) return true;
            } catch (Exception ignored) {}
        }
        CharSequence desc = view.getContentDescription();
        if (desc != null) {
            String d = desc.toString().toLowerCase(Locale.ROOT);
            if (d.contains("close") || d.contains("dismiss") || d.contains("collapse") ||
                    d.contains("expand") || d.contains("backup complete") || d.contains("settings"))
                return true;
        }
        return false;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Prefetch + token fetch
    // ─────────────────────────────────────────────────────────────────────────

    private static void prefetchRegisteredAccounts(Activity activity, View root) {
        Utils.runOnBackgroundThread(() -> {
            try {
                Account[] accounts = AccountManager.get(activity).getAccountsByType(ACCOUNT_TYPE);
                boolean anyReady = false;
                for (Account acc : accounts) {
                    if (readCachedAvatar(activity, acc.name) != null) anyReady = true;
                    else fetchProfileToken(activity, root, acc);
                }
                if (anyReady) Utils.runOnMainThread(() -> refresh(activity, root));
            } catch (Exception e) {
                Logger.printException(() -> "Could not prefetch account avatars", e);
            }
        });
    }

    private static void fetchProfileToken(Activity activity, View root, Account account) {
        String key = account.name.toLowerCase(Locale.ROOT);
        if (MEMORY_AVATARS.containsKey(key) || !FETCHING_ACCOUNTS.add(key)) return;

        try {
            Bundle options = new Bundle();
            options.putString("androidPackageName", activity.getPackageName());
            AccountManagerFuture<Bundle> future = AccountManager.get(activity).getAuthToken(
                    account, PROFILE_TOKEN_TYPE, options, false, null, null);

            Utils.runOnBackgroundThread(() -> {
                try {
                    Bundle result = future.getResult();
                    String token = result.getString(AccountManager.KEY_AUTHTOKEN);
                    if (token != null && !token.isEmpty()) {
                        Bitmap avatar = downloadAvatar(token);
                        if (avatar != null) {
                            writeCachedAvatar(activity, account.name, avatar);
                            Utils.runOnMainThread(() -> scanAllWindowRoots(activity, true));
                        }
                    }
                } catch (Exception e) {
                    Logger.printException(() -> "Could not load account avatar", e);
                } finally {
                    FETCHING_ACCOUNTS.remove(key);
                }
            });
        } catch (Exception e) {
            FETCHING_ACCOUNTS.remove(key);
            Logger.printException(() -> "Could not request avatar token", e);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Network
    // ─────────────────────────────────────────────────────────────────────────

    @Nullable
    private static Bitmap downloadAvatar(String token) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(USER_INFO_URL).openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + token);
        conn.setRequestProperty("Accept", "application/json");
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(10000);
        if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) { conn.disconnect(); return null; }

        StringBuilder sb = new StringBuilder();
        try (BufferedReader r = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = r.readLine()) != null) sb.append(line);
        } finally { conn.disconnect(); }

        String pictureUrl = new JSONObject(sb.toString()).optString("picture", null);
        if (pictureUrl == null || pictureUrl.isEmpty()) return null;

        HttpURLConnection imgConn = (HttpURLConnection) new URL(pictureUrl).openConnection();
        imgConn.setConnectTimeout(10000);
        imgConn.setReadTimeout(10000);
        try (InputStream in = imgConn.getInputStream()) {
            return makeCircular(BitmapFactory.decodeStream(in));
        } finally { imgConn.disconnect(); }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Bitmap helpers
    // ─────────────────────────────────────────────────────────────────────────

    @Nullable
    private static Bitmap makeCircular(@Nullable Bitmap src) {
        if (src == null) return null;
        int size = Math.min(src.getWidth(), src.getHeight());
        Bitmap out = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(out);

        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);
        canvas.drawARGB(0, 0, 0, 0);
        p.setColor(0xFF000000);
        canvas.drawCircle(size / 2f, size / 2f, size / 2f, p);

        p.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        int ox = (src.getWidth() - size) / 2, oy = (src.getHeight() - size) / 2;
        canvas.drawBitmap(src, new Rect(ox, oy, ox + size, oy + size), new Rect(0, 0, size, size), p);
        p.setXfermode(null);

        Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        ring.setStyle(Paint.Style.STROKE);
        float stroke = Math.max(2f, size * 0.025f);
        ring.setStrokeWidth(stroke);
        ring.setColor(0x25000000);
        canvas.drawCircle(size / 2f, size / 2f, (size / 2f) - (stroke / 2f), ring);
        return out;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Cache
    // ─────────────────────────────────────────────────────────────────────────

    @Nullable
    private static Bitmap readCachedAvatar(Activity activity, String email) {
        if (email == null || NO_ACCOUNT_SENTINEL.equals(email)) return null;
        String key = email.toLowerCase(Locale.ROOT);
        Bitmap mem = MEMORY_AVATARS.get(key);
        if (mem != null) return mem;

        File f = cacheFile(activity, email);
        if (!f.isFile()) return null;
        if (System.currentTimeMillis() - f.lastModified() > CACHE_MAX_AGE_MILLIS) {
            //noinspection ResultOfMethodCallIgnored
            f.delete();
            return null;
        }
        try (InputStream in = new FileInputStream(f)) {
            Bitmap bmp = makeCircular(BitmapFactory.decodeStream(in));
            if (bmp != null) MEMORY_AVATARS.put(key, bmp);
            return bmp;
        } catch (Exception e) {
            Logger.printException(() -> "Could not read cached avatar", e);
            return null;
        }
    }

    private static void writeCachedAvatar(Activity activity, String email, Bitmap bitmap) {
        if (email == null || bitmap == null || NO_ACCOUNT_SENTINEL.equals(email)) return;
        MEMORY_AVATARS.put(email.toLowerCase(Locale.ROOT), bitmap);
        Utils.runOnBackgroundThread(() -> {
            try (FileOutputStream out = new FileOutputStream(cacheFile(activity, email))) {
                bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
            } catch (Exception e) {
                Logger.printException(() -> "Could not cache avatar", e);
            }
        });
    }

    private static File cacheFile(Activity activity, String email) {
        return new File(activity.getCacheDir(), CACHE_FILE_PREFIX + hashEmail(email) + ".png");
    }

    private static String hashEmail(String email) {
        try {
            MessageDigest d = MessageDigest.getInstance("SHA-256");
            byte[] bytes = d.digest(email.toLowerCase(Locale.ROOT).getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder(bytes.length * 2);
            for (byte b : bytes) hex.append(String.format(Locale.ROOT, "%02x", b & 0xff));
            return hex.toString();
        } catch (Exception e) {
            return Integer.toHexString(email.toLowerCase(Locale.ROOT).hashCode());
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Utilities
    // ─────────────────────────────────────────────────────────────────────────

    private static int getResId(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        if (id != 0) return id;
        return activity.getResources().getIdentifier(name, "id", "com.google.android.apps.photos");
    }

    @Nullable
    private static Account findAccount(Activity activity, String email) {
        for (Account acc : AccountManager.get(activity).getAccountsByType(ACCOUNT_TYPE)) {
            if (sameEmail(acc.name, email)) return acc;
        }
        return null;
    }

    private static void collectEmailTextViews(View view, List<TextView> out) {
        if (view == null) return;
        if (view instanceof TextView) {
            TextView tv = (TextView) view;
            if (extractEmail(tv.getText()) != null || extractEmail(tv.getContentDescription()) != null)
                out.add(tv);
        }
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) collectEmailTextViews(vg.getChildAt(i), out);
        }
    }

    private static void collectAllTextViews(View view, List<TextView> out) {
        if (view == null) return;
        if (view instanceof TextView) out.add((TextView) view);
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) collectAllTextViews(vg.getChildAt(i), out);
        }
    }

    @Nullable
    private static String extractEmail(@Nullable CharSequence text) {
        if (text == null) return null;
        Matcher m = EMAIL_PATTERN.matcher(text);
        return m.find() ? m.group() : null;
    }

    private static boolean sameEmail(@Nullable String a, @Nullable String b) {
        return a != null && b != null && a.equalsIgnoreCase(b);
    }
}
