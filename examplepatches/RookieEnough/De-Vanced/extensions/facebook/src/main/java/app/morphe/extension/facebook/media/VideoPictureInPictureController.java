/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.app.Activity;
import android.app.Application;
import android.app.PictureInPictureParams;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageManager;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.util.Rational;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.MediaDownloader;
import app.morphe.extension.facebook.settings.DeVancedSettings;

/**
 * Extends Facebook 580's own B3H Reels PiP lifecycle from the common Groot
 * player-binding boundary to Reels, Stories, Feed, Watch and fullscreen
 * video. Android PiP is entered by Facebook's native auto-PiP path on API 31+.
 */
public final class VideoPictureInPictureController {
    private static final String TAG = "DeVancedPiP";
    private static final String FACEBOOK_PIP_CLASS = "X.B3H";
    private static final String REELS_ORIGIN = "fb_shorts_viewer";
    private static final String STORY_ORIGIN = "story_tray";
    private static final String STORY_AUTOPLAY_ORIGIN =
            "story_tray_autoplay";
    private static final long MAX_CAPTURE_AGE_MS = 5L * 60L * 1000L;
    private static final long PIP_TRANSITION_GRACE_MS = 2000L;
    private static final long PIP_ENTER_RESUME_DELAY_MS = 650L;
    private static final long PIP_ENTER_RESUME_RETRY_MS = 1250L;

    private static final AtomicBoolean INITIALIZED = new AtomicBoolean();
    private static final AtomicBoolean ENTERING_PIP = new AtomicBoolean();
    private static final AtomicInteger LOG_BUDGET = new AtomicInteger(320);

    private static volatile WeakReference<Activity> resumedActivity =
            new WeakReference<>(null);
    private static volatile WeakReference<Object> activePlayer =
            new WeakReference<>(null);
    private static volatile WeakReference<View> activeView =
            new WeakReference<>(null);
    private static volatile String activeOrigin = "";
    private static volatile long lastCaptureUptime;
    private static volatile long lastPipModeChangeUptime;
    private static volatile boolean activeWasPlaying;
    private static volatile boolean enabled;

    private VideoPictureInPictureController() {
    }

    public static void initialize(Application application) {
        if (application == null || !INITIALIZED.compareAndSet(false, true)) {
            return;
        }
        enabled = DeVancedSettings.isPictureInPictureEnabled();
        application.registerActivityLifecycleCallbacks(
                new Application.ActivityLifecycleCallbacks() {
                    @Override
                    public void onActivityCreated(
                            Activity activity,
                            Bundle state
                    ) {
                    }

                    @Override
                    public void onActivityStarted(Activity activity) {
                    }

                    @Override
                    public void onActivityResumed(Activity activity) {
                        resumedActivity = new WeakReference<>(activity);
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N &&
                                !activity.isInPictureInPictureMode()) {
                            ENTERING_PIP.set(false);
                        }
                    }

                    @Override
                    public void onActivityPaused(Activity activity) {
                    }

                    @Override
                    public void onActivityStopped(Activity activity) {
                    }

                    @Override
                    public void onActivitySaveInstanceState(
                            Activity activity,
                            Bundle state
                    ) {
                    }

                    @Override
                    public void onActivityDestroyed(Activity activity) {
                        Activity current = resumedActivity.get();
                        if (current == activity) {
                            resumedActivity = new WeakReference<>(null);
                        }
                    }
                }
        );
        log("initialized enabled=" + enabled);
    }

    public static void setEnabled(boolean value) {
        enabled = value;
        if (!value) {
            ENTERING_PIP.set(false);
            clearFacebookPipState(resumedActivity.get());
        }
        log("setting enabled=" + value);
    }

    public static boolean isNativePipAvailable(Activity activity) {
        return enabled &&
                DeVancedSettings.isPictureInPictureEnabled() &&
                activity != null &&
                Build.VERSION.SDK_INT >= Build.VERSION_CODES.S &&
                activity.getPackageManager().hasSystemFeature(
                        PackageManager.FEATURE_PICTURE_IN_PICTURE
                );
    }

    public static void captureBoundPlayer(
            Object boundView,
            Object bindingMode,
            Object player
    ) {
        capturePlayerView(player, boundView);
    }

    public static void capturePlayerView(
            Object player,
            Object boundView
    ) {
        if (player == null) return;
        View view = boundView instanceof View
                ? (View) boundView
                : findPlayerView(player);
        Activity activity = activityFromView(view);
        if (activity == null) activity = resumedActivity.get();
        if (isActivityInPictureInPicture(activity) ||
                ENTERING_PIP.get()) {
            log(
                    "capture skipped whilePip origin=" + activeOrigin +
                            " player=" + className(player) +
                            " view=" + describeView(view)
            );
            return;
        }
        String origin = playerOrigin580(player);
        Object capturedParams = invokeNoArg(player, "CMN");
        if (capturedParams != null) {
            MediaDownloader.capturePlayerParams(capturedParams);
        }
        Object alternateParams = invokeNoArg(player, "C1N");
        if (alternateParams != null && alternateParams != capturedParams) {
            MediaDownloader.capturePlayerParams(alternateParams);
        }

        Object params580 = invokeNoArg(player, "CM9");
        if (params580 != null) {
            MediaDownloader.capturePlayerParams(params580);
        }

        activePlayer = new WeakReference<>(player);
        activeView = new WeakReference<>(view);
        activeOrigin = origin == null ? "" : origin;
        lastCaptureUptime = SystemClock.uptimeMillis();

        log(
                "capture origin=" + activeOrigin +
                        " enabled=" + enabled +
                        " activity=" + className(activity) +
                        " player=" + className(player) +
                        " params=" + className(capturedParams) +
                        " view=" + describeView(view)
        );

        if (enabled &&
                DeVancedSettings.isPictureInPictureEnabled()) {
            scheduleNativePreparation(activity, player, view);
        }
    }

    public static void onUserLeaveHint(Activity activity) {
        View view = activeView.get();
        Object player = activePlayer.get();
        long age = SystemClock.uptimeMillis() - lastCaptureUptime;
        log(
                "leave enabled=" + enabled +
                        " setting=" +
                        DeVancedSettings.isPictureInPictureEnabled() +
                        " activity=" + className(activity) +
                        " origin=" + activeOrigin +
                        " ageMs=" + age +
                        " player=" + className(player) +
                        " view=" + describeView(view)
        );

        if (!isValidActiveSurface(activity, player, view, age)) {
            return;
        }

        boolean storyVideo = isStoryOrigin(activeOrigin);
        Object playing = invokeNoArg(player, "isPlaying");
        activeWasPlaying =
                !(playing instanceof Boolean) ||
                        Boolean.TRUE.equals(playing);
        if (!storyVideo &&
                playing instanceof Boolean &&
                !((Boolean) playing)) {
            log("skip playerPaused origin=" + activeOrigin);
            disableAutomaticPip(activity);
            return;
        }
        if (!view.isShown() &&
                !Boolean.TRUE.equals(playing) &&
                !storyVideo) {
            log(
                    "skip hiddenUnknownPlayer origin=" + activeOrigin +
                            " playing=" + playing
            );
            return;
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            boolean prepared = hasFacebookPipState(player) ||
                    prepareFacebookPip(activity, player, view);
            if (!prepared) {
                log("skip nativeStateUnavailable origin=" + activeOrigin);
                return;
            }
            ENTERING_PIP.set(true);
            clearEnteringIfPipDidNotStart(activity);
            log(
                    "nativeLeave prepared=true activity=" +
                            className(activity) +
                            " origin=" + activeOrigin +
                            " playing=" + playing
            );
            return;
        }

        enterLegacyPip(activity, view);
    }

    public static void onPictureInPictureModeChanged(
            Activity activity,
            boolean inPictureInPicture
    ) {
        ENTERING_PIP.set(inPictureInPicture);
        lastPipModeChangeUptime = SystemClock.uptimeMillis();
        if (inPictureInPicture) {
            scheduleEnteringPipResume();
        } else if (activeWasPlaying || isStoryOrigin(activeOrigin)) {
            schedulePlayerResume();
        }
        log(
                "mode activity=" + className(activity) +
                        " inPip=" + inPictureInPicture +
                        " origin=" + activeOrigin
        );
    }

    public static boolean shouldIgnorePlayerPause(
            Object player,
            Object reason
    ) {
        String value = reasonValue(reason);
        boolean samePlayer = player != null && activePlayer.get() == player;
        boolean storyVideo = isStoryOrigin(activeOrigin);
        boolean storyHost = isStoryViewerActivity(resumedActivity.get());
        boolean transitioning = isEnteringOrInPictureInPicture();
        boolean currentlyInPip =
                isActivityInPictureInPicture(resumedActivity.get());
        long sincePipModeChange =
                SystemClock.uptimeMillis() - lastPipModeChangeUptime;
        boolean lifecyclePause =
                ("user_initiated".equals(value) &&
                        transitioning &&
                        (!currentlyInPip ||
                                sincePipModeChange <
                                        PIP_TRANSITION_GRACE_MS)) ||
                        "player_initiated".equals(value) ||
                        "android_initiated".equals(value) ||
                        "nf_onpause".equals(value) ||
                        "short_form_video_onpause".equals(value) ||
                        "video_home_pause".equals(value) ||
                        "background_play".equals(value) ||
                        "by_player_activity_manager".equals(value) ||
                        "surface_on_stop".equals(value) ||
                        "audio_focus_loss_pause".equals(value);
        boolean ignore = enabled &&
                DeVancedSettings.isPictureInPictureEnabled() &&
                (samePlayer || (storyVideo && storyHost)) &&
                (storyVideo || storyHost) &&
                transitioning &&
                lifecyclePause;
        if (samePlayer && storyVideo) {
            log(
                    "pause reason=" + value +
                            " transition=" + transitioning +
                            " ignore=" + ignore
            );
        }
        return ignore;
    }

    public static boolean isEnteringOrInPictureInPicture() {
        Activity activity = resumedActivity.get();
        return enabled &&
                (ENTERING_PIP.get() ||
                        (activity != null &&
                                Build.VERSION.SDK_INT >=
                                        Build.VERSION_CODES.N &&
                                activity.isInPictureInPictureMode()));
    }

    private static boolean isValidActiveSurface(
            Activity activity,
            Object player,
            View view,
            long age
    ) {
        if (!enabled ||
                !DeVancedSettings.isPictureInPictureEnabled() ||
                activity == null ||
                player == null ||
                view == null ||
                age < 0 ||
                age > MAX_CAPTURE_AGE_MS ||
                Build.VERSION.SDK_INT < Build.VERSION_CODES.O ||
                activity.isFinishing() ||
                activity.isDestroyed() ||
                activity.isInPictureInPictureMode() ||
                !activity.getPackageManager().hasSystemFeature(
                        PackageManager.FEATURE_PICTURE_IN_PICTURE
                )) {
            return false;
        }
        Activity viewActivity = activityFromView(view);
        if (viewActivity != null && viewActivity != activity) {
            log(
                    "skip activityMismatch view=" + className(viewActivity) +
                            " callback=" + className(activity)
            );
            return false;
        }
        if (!view.isAttachedToWindow() ||
                view.getWidth() <= 0 ||
                view.getHeight() <= 0) {
            log("skip inactiveView " + describeView(view));
            return false;
        }
        if (!isLargeVideoSurface(activity, view)) {
            log("skip smallSurface " + describeView(view));
            return false;
        }
        return true;
    }

    private static void scheduleNativePreparation(
            Activity activity,
            Object player,
            View view
    ) {
        if (activity == null || player == null || view == null) return;
        view.post(() -> {
            if (activePlayer.get() != player ||
                    !enabled ||
                    !DeVancedSettings.isPictureInPictureEnabled()) {
                return;
            }
            prepareFacebookPip(activity, player, view);
        });
    }

    private static boolean prepareFacebookPip(
            Activity activity,
            Object player,
            View view
    ) {
        if (!isNativePipAvailable(activity) ||
                ENTERING_PIP.get() ||
                isActivityInPictureInPicture(activity) ||
                player == null ||
                view == null ||
                !view.isAttachedToWindow() ||
                view.getWidth() <= 0 ||
                view.getHeight() <= 0 ||
                !isLargeVideoSurface(activity, view)) {
            return false;
        }
        if (hasFacebookPipState(player)) {
            return true;
        }

        Object session = fieldValue(player, "A13");
        Object playerParams = invokeNoArg(player, "C0h");
        Object mediaIdValue = invokeNoArg(player, "CLz");
        String mediaId = mediaIdValue instanceof String
                ? (String) mediaIdValue
                : null;
        if (session == null ||
                playerParams == null ||
                mediaId == null ||
                mediaId.isEmpty()) {
            log(
                    "nativePrepare missing session=" +
                            (session != null) +
                            " params=" + (playerParams != null) +
                            " mediaId=" + (mediaId != null)
            );
            return false;
        }

        try {
            Class<?> pip = Class.forName(
                    FACEBOOK_PIP_CLASS,
                    false,
                    player.getClass().getClassLoader()
            );
            Method setup = findStaticMethod(pip, "A06", 11);
            if (setup == null) {
                log("nativePrepare methodMissing");
                return false;
            }
            setup.invoke(
                    null,
                    activity,
                    pictureInPictureSourceRect(view),
                    pictureInPictureAspectRatio(view),
                    session,
                    player,
                    playerParams,
                    null,
                    null,
                    mediaId,
                    Collections.emptyList(),
                    0
            );
            boolean prepared = hasFacebookPipState(player);
            log(
                    "nativePrepare result=" + prepared +
                            " activity=" + className(activity) +
                            " origin=" + activeOrigin +
                            " mediaId=" + mediaId +
                            " view=" + describeView(view)
            );
            return prepared;
        } catch (Throwable throwable) {
            Log.w(TAG, "Facebook native PiP setup failed", throwable);
            return false;
        }
    }

    private static boolean hasFacebookPipState(Object player) {
        if (player == null) return false;
        try {
            Class<?> pip = Class.forName(
                    FACEBOOK_PIP_CLASS,
                    false,
                    player.getClass().getClassLoader()
            );
            Field field = pip.getDeclaredField("A06");
            field.setAccessible(true);
            return field.get(null) == player;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void clearFacebookPipState(Activity activity) {
        disableAutomaticPip(activity);
        try {
            ClassLoader loader = activity == null
                    ? VideoPictureInPictureController.class.getClassLoader()
                    : activity.getClassLoader();
            Class<?> pip = Class.forName(
                    FACEBOOK_PIP_CLASS,
                    false,
                    loader
            );
            Field singletonField = pip.getDeclaredField("A0X");
            singletonField.setAccessible(true);
            Object singleton = singletonField.get(null);
            Method cleanup = findInstanceMethod(pip, "A0K", 1);
            if (singleton != null && cleanup != null && activity != null) {
                cleanup.invoke(singleton, activity);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void clearEnteringIfPipDidNotStart(Activity activity) {
        View decor = activity.getWindow() == null
                ? null
                : activity.getWindow().getDecorView();
        if (decor == null) return;
        decor.postDelayed(() -> {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N ||
                    !activity.isInPictureInPictureMode()) {
                ENTERING_PIP.set(false);
            }
        }, 1500L);
    }

    private static void schedulePlayerResume() {
        View view = activeView.get();
        if (view == null) return;
        view.post(() -> resumeActivePlayer());
        view.postDelayed(() -> resumeActivePlayer(), 350L);
    }

    private static void scheduleEnteringPipResume() {
        View view = activeView.get();
        if (view == null) return;
        view.postDelayed(
                () -> resumeActivePlayer(),
                PIP_ENTER_RESUME_DELAY_MS
        );
        view.postDelayed(
                () -> resumeActivePlayer(),
                PIP_ENTER_RESUME_RETRY_MS
        );
    }

    private static void resumePlayer580(Object player) {
        try {
            Object reason = invokeNoArg(player, "A1G");
            if (reason == null) return;
            Method play = findInstanceMethod(
                    player.getClass(),
                    "EJb",
                    1
            );
            if (play == null) return;
            Object beforePlaying = invokeNoArg(player, "isPlaying");
            if (Boolean.TRUE.equals(beforePlaying)) {
                log(
                        "resume580 skippedAlreadyPlaying origin=" +
                                activeOrigin
                );
                return;
            }
            Object beforePosition = invokeNoArg(player, "A1D");
            play.invoke(player, reason);
            Object afterPlaying = invokeNoArg(player, "isPlaying");
            Object afterPosition = invokeNoArg(player, "A1D");
            log(
                    "resume580 origin=" + activeOrigin +
                            " reason=" + reasonValue(reason) +
                            " beforePlaying=" + beforePlaying +
                            " afterPlaying=" + afterPlaying +
                            " beforePosition=" + beforePosition +
                            " afterPosition=" + afterPosition
            );
        } catch (Throwable throwable) {
            Log.w(TAG, "Player resume failed", throwable);
        }
    }

    private static boolean shouldUsePlayer580(Object player) {
        return player != null &&
                player.getClass().getName().equals("X.5BR");
    }

    private static void resumeActivePlayer() {
        Object player = activePlayer.get();
        if (player == null) return;
        if (shouldUsePlayer580(player)) {
            resumePlayer580(player);
            return;
        }

        try {
            Class<?> reasonClass = Class.forName(
                    "X.29H",
                    false,
                    player.getClass().getClassLoader()
            );
            Object reason = staticField(reasonClass, "A0A");
            Object fallbackReason = staticField(reasonClass, "A2q");
            Method play = null;
            for (Method method : player.getClass().getMethods()) {
                if (method.getName().equals("EIS") &&
                        method.getParameterTypes().length == 1) {
                    play = method;
                    break;
                }
            }
            if (play == null) return;
            Object beforePlaying = invokeNoArg(player, "isPlaying");
            Object beforePosition = invokeNoArg(player, "BFJ");
            play.invoke(player, reason);
            Object afterPlaying = invokeNoArg(player, "isPlaying");
            Object afterPosition = invokeNoArg(player, "BFJ");
            String reasonUsed = "autoplay_initiated";
            if (Boolean.FALSE.equals(afterPlaying) &&
                    fallbackReason != null) {
                play.invoke(player, fallbackReason);
                reasonUsed = "user_initiated";
                afterPlaying = invokeNoArg(player, "isPlaying");
                afterPosition = invokeNoArg(player, "BFJ");
            }
            log(
                    "resume origin=" + activeOrigin +
                            " reason=" + reasonUsed +
                            " beforePlaying=" + beforePlaying +
                            " afterPlaying=" + afterPlaying +
                            " beforePosition=" + beforePosition +
                            " afterPosition=" + afterPosition
            );
        } catch (Throwable throwable) {
            Log.w(TAG, "Player resume failed", throwable);
        }
    }

    private static Object staticField(
            Class<?> owner,
            String name
    ) {
        try {
            Field field = owner.getDeclaredField(name);
            field.setAccessible(true);
            return field.get(null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isActivityInPictureInPicture(Activity activity) {
        return activity != null &&
                Build.VERSION.SDK_INT >= Build.VERSION_CODES.N &&
                activity.isInPictureInPictureMode();
    }

    private static void enterDirectPip(Activity activity, View view) {
        try {
            PictureInPictureParams params = buildParams(
                    pictureInPictureSourceRect(view),
                    pictureInPictureAspectRatio(view),
                    Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
            );
            boolean entered = activity.enterPictureInPictureMode(params);
            ENTERING_PIP.set(entered);
            if (!entered) {
                disableAutomaticPip(activity);
            }
            log(
                    "directEnter result=" + entered +
                            " activity=" + className(activity) +
                            " origin=" + activeOrigin
            );
        } catch (Throwable throwable) {
            ENTERING_PIP.set(false);
            Log.w(TAG, "Direct PiP entry failed", throwable);
        }
    }

    private static void enterLegacyPip(Activity activity, View view) {
        try {
            PictureInPictureParams params = buildParams(
                    sourceRect(view),
                    aspectRatio(view),
                    false
            );
            boolean entered = activity.enterPictureInPictureMode(params);
            ENTERING_PIP.set(entered);
            log(
                    "legacyEnter result=" + entered +
                            " activity=" + className(activity) +
                            " origin=" + activeOrigin
            );
        } catch (Throwable throwable) {
            ENTERING_PIP.set(false);
            Log.w(TAG, "Legacy PiP entry failed", throwable);
        }
    }

    private static View findPlayerView(Object player) {
        try {
            Method exact = player.getClass().getMethod("A1E");
            Object value = exact.invoke(player);
            if (value instanceof View) return (View) value;
        } catch (Throwable ignored) {
        }
        for (Method method : player.getClass().getMethods()) {
            if (Modifier.isStatic(method.getModifiers()) ||
                    method.getParameterTypes().length != 0 ||
                    !View.class.isAssignableFrom(method.getReturnType())) {
                continue;
            }
            try {
                Object value = method.invoke(player);
                if (value instanceof View) return (View) value;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static String playerOrigin580(Object player) {
        Object origin = invokeNoArg(player, "Bs0");
        String category = fieldString(origin, "A00");
        String surface = fieldString(origin, "A01");
        return surface == null || surface.isEmpty()
                ? category
                : surface;
    }

    private static String playerOrigin(Object player) {
        Object origin = invokeNoArg(player, "Bsr");
        Object value = fieldValue(origin, "A01");
        return value instanceof String ? (String) value : "";
    }

    private static String reasonValue(Object reason) {
        Object value = fieldValue(reason, "value");
        if (value instanceof String) return (String) value;
        return reason instanceof Enum<?>
                ? ((Enum<?>) reason).name()
                : String.valueOf(reason);
    }

    private static String fieldString(Object owner, String name) {
        Object value = fieldValue(owner, name);
        return value instanceof String ? (String) value : null;
    }

    private static Object invokeNoArg(Object owner, String name) {
        if (owner == null) return null;
        try {
            return owner.getClass().getMethod(name).invoke(owner);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object fieldValue(Object owner, String name) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass();
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Method findStaticMethod(
            Class<?> owner,
            String name,
            int parameterCount
    ) {
        for (Method method : owner.getDeclaredMethods()) {
            if (method.getName().equals(name) &&
                    Modifier.isStatic(method.getModifiers()) &&
                    method.getParameterTypes().length == parameterCount) {
                method.setAccessible(true);
                return method;
            }
        }
        return null;
    }

    private static Method findInstanceMethod(
            Class<?> owner,
            String name,
            int parameterCount
    ) {
        for (Method method : owner.getDeclaredMethods()) {
            if (method.getName().equals(name) &&
                    !Modifier.isStatic(method.getModifiers()) &&
                    method.getParameterTypes().length == parameterCount) {
                method.setAccessible(true);
                return method;
            }
        }
        return null;
    }

    private static Rect pictureInPictureSourceRect(View view) {
        Rect rect = sourceRect(view);
        String origin = activeOrigin;
        if (rect != null &&
                origin != null &&
                origin.contains("shorts") &&
                rect.width() > 0 &&
                rect.height() > rect.width()) {
            int targetHeight = Math.round(
                    rect.width() * 16.0f / 9.0f
            );
            if (targetHeight < rect.height()) {
                int inset = (rect.height() - targetHeight) / 2;
                rect.inset(0, inset);
            }
        }
        return rect;
    }

    private static Rect sourceRect(View view) {
        Rect rect = new Rect();
        return view != null &&
                view.getGlobalVisibleRect(rect) &&
                !rect.isEmpty()
                ? rect
                : null;
    }

    private static boolean isLargeVideoSurface(
            Activity activity,
            View view
    ) {
        if (activity == null || view == null) return false;
        View decor = activity.getWindow() == null
                ? null
                : activity.getWindow().getDecorView();
        int hostWidth = decor == null ? 0 : decor.getWidth();
        return hostWidth <= 0 || view.getWidth() * 2 >= hostWidth;
    }

    private static boolean isStoryOrigin(String origin) {
        return origin != null &&
                (origin.contains("story") || origin.contains("stori"));
    }

    private static boolean isStoryViewerActivity(Activity activity) {
        return activity != null &&
                activity.getClass().getName().contains("StoryViewerActivity");
    }

    private static Rational pictureInPictureAspectRatio(View view) {
        String origin = activeOrigin;
        if (origin != null &&
                (origin.contains("shorts") ||
                        origin.contains("story") ||
                        origin.contains("stori"))) {
            return new Rational(9, 16);
        }
        return aspectRatio(view);
    }

    private static Rational aspectRatio(View view) {
        int width = view == null ? 0 : view.getWidth();
        int height = view == null ? 0 : view.getHeight();
        if (width <= 0 || height <= 0) {
            return new Rational(9, 16);
        }
        float ratio = width / (float) height;
        if (ratio < 0.41841f) {
            return new Rational(41841, 100000);
        }
        if (ratio > 2.39f) {
            return new Rational(239, 100);
        }
        return new Rational(width, height);
    }

    private static PictureInPictureParams buildParams(
            Rect sourceRect,
            Rational aspectRatio,
            boolean autoEnter
    ) {
        PictureInPictureParams.Builder builder =
                new PictureInPictureParams.Builder()
                        .setAspectRatio(aspectRatio);
        if (sourceRect != null && !sourceRect.isEmpty()) {
            builder.setSourceRectHint(sourceRect);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            builder.setAutoEnterEnabled(autoEnter);
            builder.setSeamlessResizeEnabled(true);
        }
        return builder.build();
    }

    private static void disableAutomaticPip(Activity activity) {
        if (activity == null ||
                Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            return;
        }
        try {
            ClassLoader loader = activity.getClassLoader();
            Class<?> pip = Class.forName(
                    FACEBOOK_PIP_CLASS,
                    false,
                    loader
            );
            Field singletonField = pip.getDeclaredField("A0X");
            singletonField.setAccessible(true);
            Object singleton = singletonField.get(null);
            Method disable = findInstanceMethod(pip, "A0J", 1);
            if (singleton != null && disable != null) {
                disable.invoke(singleton, activity);
                return;
            }
        } catch (Throwable ignored) {
        }
        try {
            activity.setPictureInPictureParams(
                    buildParams(null, new Rational(9, 16), false)
            );
        } catch (Throwable ignored) {
        }
    }

    private static Activity activityFromView(View view) {
        Context context = view == null ? null : view.getContext();
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return context instanceof Activity ? (Activity) context : null;
    }

    private static String describeView(View view) {
        if (view == null) return "null";
        return view.getClass().getName() +
                "[" + view.getWidth() + "x" + view.getHeight() +
                ",shown=" + view.isShown() +
                ",attached=" + view.isAttachedToWindow() + "]";
    }

    private static String className(Object value) {
        return value == null ? "null" : value.getClass().getName();
    }

    private static void log(String message) {
        if (LOG_BUDGET.getAndDecrement() > 0) {
            Log.i(TAG, message);
        }
    }
}
