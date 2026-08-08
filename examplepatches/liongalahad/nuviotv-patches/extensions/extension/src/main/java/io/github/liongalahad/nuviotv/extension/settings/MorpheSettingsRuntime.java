package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Process-local bridge used by injected bytecode and Nuvio's native settings pane. */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class MorpheSettingsRuntime {
    public static final String PREFERENCES_NAME = "morphe_patches";
    public static final String SDH_CLEANUP_MODE_KEY = "subtitles.sdh_cleanup_mode";
    public static final String REMOVE_SDH_KEY = "subtitles.remove_sdh_annotations";
    public static final String SDH_MARKING_KEY = "subtitles.mark_sdh";
    public static final String OVERALL_RATINGS_KEY = "ratings.overall_visibility";
    public static final String EPISODE_RATINGS_KEY = "ratings.episode_visibility";

    public static final int SDH_MODE_OFF = 0;
    public static final int SDH_MODE_KEEP_LYRICS = 1;
    public static final int SDH_MODE_REMOVE_LYRICS = 2;
    public static final int EPISODE_RATINGS_SHOW = 0;
    public static final int EPISODE_RATINGS_HIDE = 1;
    public static final int EPISODE_RATINGS_HIDE_UNWATCHED = 2;

    private static final String CATEGORY_PROVIDER_PREFIX =
            "io.github.liongalahad.nuviotv.settings.provider.";

    private static volatile Application application;
    private static volatile WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private static volatile boolean activityCallbacksRegistered;
    private static volatile SharedPreferences preferences;
    private static volatile int sdhCleanupMode = SDH_MODE_OFF;
    private static volatile boolean sdhMarkingEnabled;
    private static volatile boolean overallRatingsShown = true;
    private static volatile int episodeRatingsMode = EPISODE_RATINGS_SHOW;
    private static volatile List<MorpheSettingsCategory> patchCategories = Collections.emptyList();

    private MorpheSettingsRuntime() {}

    public static int mapVisibilityOrdinal(int ordinal) {
        return ordinal == 0 ? 4 : ordinal;
    }

    public static void initialize(Context context) {
        Context appContext = context.getApplicationContext();
        if (appContext instanceof Application) {
            application = (Application) appContext;
            registerActivityCallbacks(application);
        }
        readEnabledCategories(appContext);
        if (preferences != null) return;
        synchronized (MorpheSettingsRuntime.class) {
            if (preferences != null) return;
            SharedPreferences prefs = appContext.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
            sdhCleanupMode = readSdhCleanupMode(prefs);
            sdhMarkingEnabled = readSdhMarkingEnabled(prefs);
            overallRatingsShown = readOverallRatingsShown(prefs);
            episodeRatingsMode = readEpisodeRatingsMode(prefs);
            if (!prefs.contains(SDH_CLEANUP_MODE_KEY) && prefs.getBoolean(REMOVE_SDH_KEY, false)) {
                prefs.edit().putString(SDH_CLEANUP_MODE_KEY, "KEEP_LYRICS").commit();
            }
            prefs.registerOnSharedPreferenceChangeListener((sharedPreferences, key) -> {
                if (SDH_CLEANUP_MODE_KEY.equals(key)) {
                    sdhCleanupMode = readSdhCleanupMode(sharedPreferences);
                } else if (SDH_MARKING_KEY.equals(key)) {
                    sdhMarkingEnabled = readSdhMarkingEnabled(sharedPreferences);
                } else if (OVERALL_RATINGS_KEY.equals(key)) {
                    overallRatingsShown = readOverallRatingsShown(sharedPreferences);
                } else if (EPISODE_RATINGS_KEY.equals(key)) {
                    episodeRatingsMode = readEpisodeRatingsMode(sharedPreferences);
                }
            });
            preferences = prefs;
        }
    }

    public static String ratingsCategoryTitle() { return "Ratings"; }
    public static String ratingsCategoryDescription() {
        return "Configure rating visibility";
    }
    public static String subtitlesCategoryTitle() { return "Subtitles"; }
    public static String subtitlesCategoryDescription() {
        return "Configure subtitle patch settings";
    }
    public static String overallRatingsTitle() { return "Overall Ratings"; }
    public static String overallRatingsDescription() {
        return isOverallRatingsShown()
                ? "Standard and TMDB ratings are shown."
                : "Standard and TMDB ratings hidden; MDBList takes priority.";
    }
    public static String episodeRatingsTitle() { return "Episode Ratings"; }
    public static List<MorpheSettingsCategory> enabledCategories() {
        ensureInitialized();
        Map<String, List<MorpheSettingsCategory>> groups = new LinkedHashMap<>();
        for (MorpheSettingsCategory category : patchCategories) {
            groups.computeIfAbsent(category.id(), ignored -> new ArrayList<>()).add(category);
        }
        List<MorpheSettingsCategory> categories = new ArrayList<>(groups.size());
        for (List<MorpheSettingsCategory> group : groups.values()) {
            categories.add(group.size() == 1 ? group.get(0) : new GroupedCategory(group));
        }
        return Collections.unmodifiableList(categories);
    }

    public static boolean isOverallRatingsShown() {
        ensureInitialized();
        return overallRatingsShown;
    }

    public static String currentOverallRatingsTitle() {
        return isOverallRatingsShown() ? "Show" : "Hide";
    }

    public static boolean toggleOverallRatings() {
        ensureInitialized();
        if (preferences == null) throw new IllegalStateException("Morphe settings were not initialized");
        overallRatingsShown = !overallRatingsShown;
        preferences.edit().putBoolean(OVERALL_RATINGS_KEY, overallRatingsShown).commit();
        return overallRatingsShown;
    }

    public static void setOverallRatingsShown(boolean shown) {
        ensureInitialized();
        if (preferences == null) throw new IllegalStateException("Morphe settings were not initialized");
        overallRatingsShown = shown;
        preferences.edit().putBoolean(OVERALL_RATINGS_KEY, shown).commit();
    }

    public static int episodeRatingsModeOrdinal() {
        ensureInitialized();
        return episodeRatingsMode;
    }

    public static boolean isEpisodeRatingsModeSelected(int mode) {
        return episodeRatingsModeOrdinal() == sanitizeEpisodeMode(mode);
    }

    public static void setEpisodeRatingsMode(int mode) {
        ensureInitialized();
        if (preferences == null) throw new IllegalStateException("Morphe settings were not initialized");
        int sanitized = sanitizeEpisodeMode(mode);
        episodeRatingsMode = sanitized;
        preferences.edit().putString(EPISODE_RATINGS_KEY, storedEpisodeModeName(sanitized)).commit();
    }

    public static String episodeRatingsModeTitle(int mode) {
        switch (sanitizeEpisodeMode(mode)) {
            case EPISODE_RATINGS_HIDE: return "Hide";
            case EPISODE_RATINGS_HIDE_UNWATCHED: return "Hide Unwatched";
            default: return "Show";
        }
    }

    public static String episodeRatingsModeDescription(int mode) {
        switch (sanitizeEpisodeMode(mode)) {
            case EPISODE_RATINGS_HIDE: return "Do not show ratings on episodes or in the Ratings tab.";
            case EPISODE_RATINGS_HIDE_UNWATCHED: return "Show ratings only for episodes marked as watched.";
            default: return "Show all available episode ratings.";
        }
    }

    public static String currentEpisodeRatingsTitle() {
        return episodeRatingsModeTitle(episodeRatingsModeOrdinal());
    }

    public static boolean shouldHideOverallRating(boolean alreadyHidden) {
        return alreadyHidden || !isOverallRatingsShown();
    }

    public static Float filterOverallRating(Float rating) {
        return isOverallRatingsShown() ? rating : null;
    }

    public static Double filterEpisodeRating(Double rating, boolean watched) {
        int mode = episodeRatingsModeOrdinal();
        if (mode == EPISODE_RATINGS_HIDE) return null;
        if (mode == EPISODE_RATINGS_HIDE_UNWATCHED && !watched) return null;
        return rating;
    }

    public static Double filterEpisodeRating(Object watchProgress, Double rating, boolean markedWatched) {
        return filterEpisodeRating(rating, markedWatched || isCompletedWatchProgress(watchProgress));
    }

    public static boolean shouldShowEpisodeRatingsSection() {
        return episodeRatingsModeOrdinal() != EPISODE_RATINGS_HIDE;
    }

    public static boolean shouldShowEpisodeRatingsTab(boolean isTvShow) {
        return isTvShow && shouldShowEpisodeRatingsSection();
    }

    public static List filterEpisodeRatingTabs(List tabs) {
        if (tabs == null || episodeRatingsModeOrdinal() != EPISODE_RATINGS_HIDE) return tabs;
        List visible = new ArrayList(tabs.size());
        for (Object tab : tabs) {
            if (!String.valueOf(tab).startsWith("PeopleTabItem(tab=RATINGS,")) visible.add(tab);
        }
        return visible;
    }

    /** Applies the PR's watched-episode policy to the data shared by the Ratings tab. */
    public static Map filterEpisodeRatingsMap(Map ratings, Map progressByEpisode, Set watchedEpisodes) {
        if (ratings == null || ratings.isEmpty()) return ratings;
        int mode = episodeRatingsModeOrdinal();
        if (mode == EPISODE_RATINGS_SHOW) return ratings;
        if (mode == EPISODE_RATINGS_HIDE) return Collections.emptyMap();

        Map visible = new LinkedHashMap();
        for (Object entryObject : ratings.entrySet()) {
            Map.Entry entry = (Map.Entry) entryObject;
            Object episodeKey = entry.getKey();
            boolean manuallyWatched = watchedEpisodes != null && watchedEpisodes.contains(episodeKey);
            Object progress = progressByEpisode == null ? null : progressByEpisode.get(episodeKey);
            if (manuallyWatched || isCompletedWatchProgress(progress)) {
                visible.put(episodeKey, entry.getValue());
            }
        }
        return visible;
    }

    public static boolean isRemoveSdhEnabled() {
        ensureInitialized();
        return sdhCleanupMode != SDH_MODE_OFF;
    }

    public static void setRemoveSdhEnabled(Context context, boolean enabled) {
        initialize(context);
        persistSdhCleanupMode(enabled ? SDH_MODE_KEEP_LYRICS : SDH_MODE_OFF);
    }

    public static boolean toggleRemoveSdhEnabled() {
        ensureInitialized();
        boolean enabled = sdhCleanupMode == SDH_MODE_OFF;
        persistSdhCleanupMode(enabled ? SDH_MODE_KEEP_LYRICS : SDH_MODE_OFF);
        return enabled;
    }

    public static int sdhCleanupModeOrdinal() {
        ensureInitialized();
        return sdhCleanupMode;
    }

    public static boolean isSdhModeSelected(int mode) {
        return sdhCleanupModeOrdinal() == sanitizeSdhMode(mode);
    }

    public static void setSdhCleanupMode(Context context, int mode) {
        initialize(context);
        persistSdhCleanupMode(mode);
    }

    public static void setSdhCleanupMode(int mode) {
        ensureInitialized();
        persistSdhCleanupMode(mode);
    }

    public static String sdhModeTitle(int mode) {
        switch (sanitizeSdhMode(mode)) {
            case SDH_MODE_KEEP_LYRICS: return "Remove SDH, keep lyrics";
            case SDH_MODE_REMOVE_LYRICS: return "Full cleanup";
            default: return "Off";
        }
    }

    public static String sdhModeDescription(int mode) {
        switch (sanitizeSdhMode(mode)) {
            case SDH_MODE_KEEP_LYRICS:
                return "Remove annotations, sound descriptions and speaker labels while preserving likely song lyrics.";
            case SDH_MODE_REMOVE_LYRICS:
                return "Also remove all text enclosed by normal or misdecoded music-note markers.";
            default: return "Do not remove any subtitle text.";
        }
    }

    public static String sdhDialogTitle() { return "Remove SDH annotations"; }
    public static String currentSdhModeTitle() { return sdhModeTitle(sdhCleanupModeOrdinal()); }

    public static String sdhMarkingTitle() { return "Mark SDH subtitles"; }
    public static String sdhMarkingDescription() {
        return "Add SDH to English subtitle titles using metadata and repeated annotation patterns.";
    }

    public static boolean isSdhMarkingEnabled() {
        ensureInitialized();
        return sdhMarkingEnabled;
    }

    public static boolean toggleSdhMarkingEnabled() {
        ensureInitialized();
        if (preferences == null) throw new IllegalStateException("Morphe settings were not initialized");
        sdhMarkingEnabled = !sdhMarkingEnabled;
        preferences.edit().putBoolean(SDH_MARKING_KEY, sdhMarkingEnabled).commit();
        return sdhMarkingEnabled;
    }

    public static void setSdhMarkingEnabled(Context context, boolean enabled) {
        initialize(context);
        sdhMarkingEnabled = enabled;
        preferences.edit().putBoolean(SDH_MARKING_KEY, enabled).commit();
    }

    static Activity resumedActivity() {
        Activity activity = resumedActivity.get();
        return activity != null && !activity.isFinishing() && !activity.isDestroyed() ? activity : null;
    }

    public static Context applicationContext() {
        ensureInitialized();
        Application current = currentApplication();
        return current == null ? null : current.getApplicationContext();
    }

    private static void persistSdhCleanupMode(int mode) {
        int sanitized = sanitizeSdhMode(mode);
        sdhCleanupMode = sanitized;
        if (preferences == null) throw new IllegalStateException("Morphe settings were not initialized");
        preferences.edit().putString(SDH_CLEANUP_MODE_KEY, storedSdhModeName(sanitized)).commit();
    }

    private static int readSdhCleanupMode(SharedPreferences prefs) {
        String stored = prefs.getString(SDH_CLEANUP_MODE_KEY, null);
        if ("KEEP_LYRICS".equals(stored) || "FULL".equals(stored)) return SDH_MODE_KEEP_LYRICS;
        if ("REMOVE_LYRICS".equals(stored)) return SDH_MODE_REMOVE_LYRICS;
        if (stored == null && prefs.getBoolean(REMOVE_SDH_KEY, false)) return SDH_MODE_KEEP_LYRICS;
        return SDH_MODE_OFF;
    }

    private static boolean readOverallRatingsShown(SharedPreferences prefs) {
        if (!prefs.contains(OVERALL_RATINGS_KEY)) return true;
        try { return prefs.getBoolean(OVERALL_RATINGS_KEY, true); }
        catch (ClassCastException ignored) { return "SHOW".equals(prefs.getString(OVERALL_RATINGS_KEY, "SHOW")); }
    }

    private static boolean readSdhMarkingEnabled(SharedPreferences prefs) {
        try { return prefs.getBoolean(SDH_MARKING_KEY, false); }
        catch (ClassCastException ignored) { return false; }
    }

    private static int readEpisodeRatingsMode(SharedPreferences prefs) {
        String stored;
        try { stored = prefs.getString(EPISODE_RATINGS_KEY, null); }
        catch (ClassCastException ignored) { return EPISODE_RATINGS_SHOW; }
        if ("HIDE".equals(stored) || "HIDE_EPISODES".equals(stored) || "HIDE_ALL".equals(stored)) {
            return EPISODE_RATINGS_HIDE;
        }
        if ("HIDE_UNWATCHED".equals(stored) || "HIDE_UNWATCHED_EPISODES".equals(stored)) {
            return EPISODE_RATINGS_HIDE_UNWATCHED;
        }
        return EPISODE_RATINGS_SHOW;
    }

    private static int sanitizeSdhMode(int mode) {
        return mode >= SDH_MODE_OFF && mode <= SDH_MODE_REMOVE_LYRICS ? mode : SDH_MODE_OFF;
    }

    private static int sanitizeEpisodeMode(int mode) {
        return mode >= EPISODE_RATINGS_SHOW && mode <= EPISODE_RATINGS_HIDE_UNWATCHED
                ? mode : EPISODE_RATINGS_SHOW;
    }

    private static String storedSdhModeName(int mode) {
        switch (sanitizeSdhMode(mode)) {
            case SDH_MODE_KEEP_LYRICS: return "KEEP_LYRICS";
            case SDH_MODE_REMOVE_LYRICS: return "REMOVE_LYRICS";
            default: return "OFF";
        }
    }

    private static String storedEpisodeModeName(int mode) {
        switch (sanitizeEpisodeMode(mode)) {
            case EPISODE_RATINGS_HIDE: return "HIDE";
            case EPISODE_RATINGS_HIDE_UNWATCHED: return "HIDE_UNWATCHED";
            default: return "SHOW";
        }
    }

    private static boolean isCompletedWatchProgress(Object watchProgress) {
        if (watchProgress == null) return false;
        try {
            Method sourceGetter = watchProgress.getClass().getMethod("getSource");
            String source = String.valueOf(sourceGetter.invoke(watchProgress));
            float threshold = "simkl_playback".equals(source) ? 0.80f : 0.90f;
            Method completion = watchProgress.getClass().getMethod("isCompleted", float.class);
            return Boolean.TRUE.equals(completion.invoke(watchProgress, threshold));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void ensureInitialized() {
        if (preferences != null) return;
        Application current = currentApplication();
        if (current != null) initialize(current);
    }

    private static void readEnabledCategories(Context context) {
        try {
            ApplicationInfo info = context.getPackageManager().getApplicationInfo(
                    context.getPackageName(), PackageManager.GET_META_DATA);
            Bundle metadata = info.metaData;
            List<MorpheSettingsCategory> discovered = new ArrayList<>();
            if (metadata != null) {
                for (String key : metadata.keySet()) {
                    if (!key.startsWith(CATEGORY_PROVIDER_PREFIX)) continue;
                    Object providerName = metadata.get(key);
                    if (!(providerName instanceof String)) continue;
                    Class<?> providerClass = Class.forName(
                            (String) providerName, true, context.getClassLoader());
                    Object provider = providerClass.getDeclaredConstructor().newInstance();
                    if (!(provider instanceof MorpheSettingsCategory)) {
                        throw new IllegalStateException("Invalid Morphe settings provider: " + providerName);
                    }
                    discovered.add((MorpheSettingsCategory) provider);
                }
            }
            discovered.sort((left, right) -> {
                int order = Integer.compare(left.order(), right.order());
                if (order != 0) return order;
                int id = left.id().compareTo(right.id());
                return id != 0 ? id : Integer.compare(left.contentOrder(), right.contentOrder());
            });
            patchCategories = Collections.unmodifiableList(discovered);
        } catch (Throwable ignored) {
            patchCategories = Collections.emptyList();
        }
    }

    private static final class GroupedCategory implements MorpheSettingsCategory {
        private final List<MorpheSettingsCategory> contributions;

        GroupedCategory(List<MorpheSettingsCategory> contributions) {
            this.contributions = Collections.unmodifiableList(new ArrayList<>(contributions));
        }

        private MorpheSettingsCategory first() { return contributions.get(0); }
        @Override public String id() { return first().id(); }
        @Override public int order() { return first().order(); }
        @Override public String title() { return first().title(); }
        @Override public String description() { return first().description(); }
        @Override public kotlin.jvm.functions.Function3<Object, Object, Object, kotlin.Unit> content(
                Object modifier
        ) {
            return (scope, composer, flags) -> {
                for (MorpheSettingsCategory contribution : contributions) {
                    contribution.content(modifier).invoke(scope, composer, flags);
                }
                return kotlin.Unit.INSTANCE;
            };
        }
    }

    private static Application currentApplication() {
        Application cached = application;
        if (cached != null) return cached;
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method method = activityThread.getDeclaredMethod("currentApplication");
            Application reflected = (Application) method.invoke(null);
            application = reflected;
            return reflected;
        } catch (Throwable ignored) { return null; }
    }

    private static void registerActivityCallbacks(Application app) {
        if (activityCallbacksRegistered) return;
        synchronized (MorpheSettingsRuntime.class) {
            if (activityCallbacksRegistered) return;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityCreated(Activity activity, Bundle state) {}
                @Override public void onActivityStarted(Activity activity) {}
                @Override public void onActivityResumed(Activity activity) { resumedActivity = new WeakReference<>(activity); }
                @Override public void onActivityPaused(Activity activity) {
                    if (resumedActivity.get() == activity) resumedActivity = new WeakReference<>(null);
                }
                @Override public void onActivityStopped(Activity activity) {}
                @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
                @Override public void onActivityDestroyed(Activity activity) {}
            });
            activityCallbacksRegistered = true;
        }
    }
}
