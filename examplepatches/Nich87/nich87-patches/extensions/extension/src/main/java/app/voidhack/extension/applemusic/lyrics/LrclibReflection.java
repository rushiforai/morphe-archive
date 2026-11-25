package app.voidhack.extension.applemusic.lyrics;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.view.View;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

public final class LrclibReflection {
    private static final String TAG = "AppleMusicLrclib";

    private static volatile Class<?> cachedPlaybackItemClass;
    private static volatile Class<?> cachedBaseContentItemClass;
    private static volatile Class<?> cachedLyricsViewModelClass;
    private static volatile Class<?> cachedTtmlParserNativeClass;
    private static volatile Class<?> cachedKotlinPairClass;
    private static volatile Method cachedGetMLyricsResult;
    private static volatile Method cachedBuildTimeRangeMap;
    private static volatile Field cachedRootPlaybackItemField;
    private static volatile boolean rootPlaybackItemFieldSearched;
    private static volatile Field cachedLyricsVmField;
    private static volatile boolean lyricsVmFieldSearched;
    private static volatile Field cachedFragmentHandlerField;
    private static volatile boolean fragmentHandlerFieldSearched;
    private static volatile Method cachedSetControlsVisibilityMethod;
    private static volatile boolean setControlsVisibilityMethodSearched;

    private LrclibReflection() {}

    static LrclibModels.TrackQuery extractTrackQuery(Object playbackItem) {
        if (playbackItem == null) return null;
        try {
            if (Boolean.TRUE.equals(callNoArgs(playbackItem, "isLiveRadio"))) {
                return null;
            }
            Object contentTypeObj = callNoArgs(playbackItem, "getContentType");
            if (contentTypeObj instanceof Integer) {
                int ct = (Integer) contentTypeObj;
                // Exclude live radio (9), movies (30), TV episodes (27).
                if (ct == 9 || ct == 27 || ct == 30) {
                    return null;
                }
            }

            String id = asString(callNoArgs(playbackItem, "getId"));
            long persistentId = asLong(callNoArgs(playbackItem, "getPersistentId"), 0L);
            long adamId = parseLongSafe(id, 0L);
            long queueId = asLong(callNoArgs(playbackItem, "getQueueId"), 0L);

            String title = firstNonEmpty(
                    asString(callNoArgs(playbackItem, "getNowPlayingTitle")),
                    asString(callNoArgs(playbackItem, "getTitle")),
                    asString(callNoArgs(playbackItem, "getName"))
            );
            String artist = firstNonEmpty(
                    asString(callNoArgs(playbackItem, "getArtistName")),
                    asString(callNoArgs(playbackItem, "getNowPlayingSubtitle"))
            );
            String album = asString(callNoArgs(playbackItem, "getCollectionName"));

            long rawDur = asLong(callNoArgs(playbackItem, "getPlaybackDuration"), 0L);
            int durationSec = rawDur > 36000L ? (int) (rawDur / 1000L) : (int) rawDur;
            if (durationSec < 0) durationSec = 0;

            boolean hasLyrics = Boolean.TRUE.equals(callNoArgs(playbackItem, "hasLyrics"));
            boolean hasCustom = Boolean.TRUE.equals(callNoArgs(playbackItem, "hasCustomLyrics"));
            boolean hasTimeSynced = Boolean.TRUE.equals(callNoArgs(playbackItem, "hasTimeSyncedLyrics"));

            String trackKey = !id.isEmpty()
                    ? id
                    : (persistentId != 0L ? "pid:" + persistentId : (LrclibMatcher.normalize(title) + "|" + LrclibMatcher.normalize(artist)));

            if (title.isEmpty() && id.isEmpty() && persistentId == 0L) {
                return null;
            }

            return new LrclibModels.TrackQuery(
                    trackKey, adamId, queueId, title, artist, album, durationSec,
                    hasLyrics, hasCustom, hasTimeSynced
            );
        } catch (Throwable t) {
            Log.w(TAG, "Failed extracting TrackQuery", t);
            return null;
        }
    }

    static String getCustomLyrics(Object playbackItem) {
        return asString(callNoArgs(playbackItem, "customLyrics"));
    }

    static Object parseTtmlToSongInfoPtr(String ttml, long adamId, long queueId, String lyricsId, String script) {
        if (ttml == null || ttml.isEmpty()) return null;
        try {
            Class<?> parserClass = cachedTtmlParserNativeClass;
            if (parserClass == null) {
                parserClass = Class.forName("com.apple.android.music.ttml.javanative.TTMLParser$TTMLParserNative");
                cachedTtmlParserNativeClass = parserClass;
            }
            Object parser = parserClass.getDeclaredConstructor().newInstance();
            Method parseMethod = parserClass.getMethod("songInfoFromTTML", String.class);
            Object songInfoPtr = parseMethod.invoke(parser, ttml);
            if (songInfoPtr == null) return null;

            Object songInfoNative = callNoArgs(songInfoPtr, "get");
            if (songInfoNative == null) return null;

            callOneArg(songInfoNative, "setAdamId", long.class, adamId);
            callOneArg(songInfoNative, "setQueueId", long.class, queueId);
            if (lyricsId != null) {
                callOneArg(songInfoNative, "setLyricsId", String.class, lyricsId);
            }
            if (script != null && !script.isEmpty()) {
                try {
                    callOneArg(songInfoNative, "setScript", String.class, script);
                } catch (Throwable ignored) {
                }
            }
            return songInfoPtr;
        } catch (Throwable t) {
            Log.w(TAG, "TTMLParserNative.songInfoFromTTML failed", t);
            return null;
        }
    }

    public static boolean sameLyricsLanguage(Object songInfoPtr, boolean sameLanguage) {
        if (!sameLanguage || songInfoPtr == null) return sameLanguage;
        Object song = callNoArgs(songInfoPtr, "get");
        return song == null || pronunciationScriptOverride(callNoArgs(song, "getPronunciationLanguages")) == null;
    }

    public static String pronunciationScriptOverride(Object languages) {
        if (languages == null) return null;
        try {
            Context context = LrclibController.getAppContext();
            boolean showRomanGuide = context != null && LrclibPrefs.isRomanizationEnabled(context);
            long size = asLong(callNoArgs(languages, "size"), 0L);
            for (long i = 0; i < size; i++) {
                String tag = asString(callOneArg(languages, "get", long.class, i));
                if (LrclibParser.PRONUNCIATION_LANGUAGE.equals(tag)
                        || (showRomanGuide && "Latn".equals(Locale.forLanguageTag(tag).getScript()))) {
                    return tag;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w(TAG, "Could not check pronunciation scripts", e);
        }
        return null;
    }

    static long getSongInfoTiming(Object songInfoPtr) {
        if (songInfoPtr == null) return -1L;
        try {
            Object nativeInfo = callNoArgs(songInfoPtr, "get");
            if (nativeInfo == null) return -1L;
            return asLong(callNoArgs(nativeInfo, "getTiming"), -1L);
        } catch (Throwable t) {
            return -1L;
        }
    }

    static String getSongInfoLyricsId(Object songInfoPtr) {
        if (songInfoPtr == null) return "";
        try {
            Object nativeInfo = callNoArgs(songInfoPtr, "get");
            if (nativeInfo == null) return "";
            return asString(callNoArgs(nativeInfo, "getLyricsId"));
        } catch (Throwable t) {
            return "";
        }
    }

    static long getSongInfoAdamId(Object songInfoPtr) {
        if (songInfoPtr == null) return -1L;
        try {
            Object nativeInfo = callNoArgs(songInfoPtr, "get");
            if (nativeInfo == null) return -1L;
            return asLong(callNoArgs(nativeInfo, "getAdamId"), -1L);
        } catch (Throwable t) {
            return -1L;
        }
    }

    static String getCurrentSystemLyricsLanguage(Object viewModel) {
        if (viewModel == null) return null;
        try {
            return asString(callNoArgs(viewModel, "getCurrentSystemLyricsLanguage"));
        } catch (Throwable t) {
            return null;
        }
    }

    static void emitLyricsToViewModel(Object viewModel, Object songInfoPtr, Throwable error) {
        if (viewModel == null) return;
        try {
            Class<?> vmClass = viewModel.getClass();
            Method getLiveData = cachedGetMLyricsResult;
            if (getLiveData == null) {
                getLiveData = vmClass.getDeclaredMethod("access$getMLyricsResult$p", vmClass);
                getLiveData.setAccessible(true);
                cachedGetMLyricsResult = getLiveData;
            }
            Object liveData = getLiveData.invoke(null, viewModel);

            Class<?> pairClass = cachedKotlinPairClass;
            if (pairClass == null) {
                pairClass = Class.forName("kotlin.Pair");
                cachedKotlinPairClass = pairClass;
            }
            Object pair = pairClass.getConstructor(Object.class, Object.class).newInstance(songInfoPtr, error);

            if (liveData != null) {
                try {
                    Method setValue = findMethod(liveData.getClass(), "setValue", Object.class);
                    if (setValue != null) {
                        setValue.invoke(liveData, pair);
                    } else {
                        Method postValue = findMethod(liveData.getClass(), "postValue", Object.class);
                        if (postValue != null) postValue.invoke(liveData, pair);
                    }
                } catch (Throwable setErr) {
                    Method postValue = findMethod(liveData.getClass(), "postValue", Object.class);
                    if (postValue != null) postValue.invoke(liveData, pair);
                }
            }

            Method buildMap = cachedBuildTimeRangeMap;
            if (buildMap == null) {
                Class<?> ptrClass = Class.forName("com.apple.android.music.ttml.javanative.model.SongInfo$SongInfoPtr");
                buildMap = vmClass.getDeclaredMethod("access$buildTimeRangeToLyricsMap", vmClass, ptrClass);
                buildMap.setAccessible(true);
                cachedBuildTimeRangeMap = buildMap;
            }
            buildMap.invoke(null, viewModel, songInfoPtr);
        } catch (Throwable t) {
            Log.w(TAG, "Failed emitting lyrics result to PlayerLyricsViewModel", t);
        }
    }

    static void callLoadLyrics(Object viewModel, Object playbackItem) {
        if (viewModel == null || playbackItem == null) return;
        try {
            Class<?> piClass = getPlaybackItemClass();
            Method m = viewModel.getClass().getMethod("loadLyrics", piClass);
            m.invoke(viewModel, playbackItem);
        } catch (Throwable t) {
            Log.w(TAG, "Failed invoking PlayerLyricsViewModel.loadLyrics", t);
        }
    }

    static Object getPlaybackItemFromFragment(Object fragment) {
        if (fragment == null) return null;
        try {
            if (!rootPlaybackItemFieldSearched) {
                Class<?> bciClass = getBaseContentItemClass();
                Class<?> piClass = getPlaybackItemClass();
                Field found = null;
                // Walk all the way up to the base player fragment (m / AbstractC3953l) so we pick its primary item field.
                for (Class<?> cls = fragment.getClass(); cls != null && cls != Object.class; cls = cls.getSuperclass()) {
                    if (!cls.getName().startsWith("com.apple.android.music.player.")) continue;
                    for (Field f : cls.getDeclaredFields()) {
                        if (Modifier.isStatic(f.getModifiers())) continue;
                        Class<?> ft = f.getType();
                        if ((bciClass != null && bciClass.isAssignableFrom(ft))
                                || (piClass != null && piClass.isAssignableFrom(ft))) {
                            f.setAccessible(true);
                            found = f;
                        }
                    }
                }
                if (found != null) {
                    cachedRootPlaybackItemField = found;
                    rootPlaybackItemFieldSearched = true;
                }
            }
            if (cachedRootPlaybackItemField != null && cachedRootPlaybackItemField.getDeclaringClass().isInstance(fragment)) {
                Object val = cachedRootPlaybackItemField.get(fragment);
                if (val != null) return val;
            }
            // Fallback scan in case a subclass stores it on another field.
            Class<?> piClass = getPlaybackItemClass();
            for (Class<?> cls = fragment.getClass(); cls != null && cls != Object.class; cls = cls.getSuperclass()) {
                if (!cls.getName().startsWith("com.apple.android.music.player.")) continue;
                for (Field f : cls.getDeclaredFields()) {
                    if (Modifier.isStatic(f.getModifiers())) continue;
                    if (piClass != null && piClass.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        Object val = f.get(fragment);
                        if (val != null) return val;
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed reading PlaybackItem from fragment", t);
        }
        return null;
    }

    static Object getLyricsViewModelFromFragment(Object fragment) {
        if (fragment == null) return null;
        try {
            Class<?> vmClass = getLyricsViewModelClass();
            if (vmClass == null) return null;
            if (!lyricsVmFieldSearched) {
                for (Class<?> cls = fragment.getClass(); cls != null && cls != Object.class; cls = cls.getSuperclass()) {
                    for (Field f : cls.getDeclaredFields()) {
                        if (!Modifier.isStatic(f.getModifiers()) && vmClass.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            cachedLyricsVmField = f;
                            lyricsVmFieldSearched = true;
                            break;
                        }
                    }
                    if (lyricsVmFieldSearched) break;
                }
            }
            if (cachedLyricsVmField != null && cachedLyricsVmField.getDeclaringClass().isInstance(fragment)) {
                return cachedLyricsVmField.get(fragment);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed reading PlayerLyricsViewModel from fragment", t);
        }
        return null;
    }

    static Activity getActivity(Object fragment) {
        if (fragment == null) return null;
        Object act = callNoArgs(fragment, "getActivity");
        return act instanceof Activity ? (Activity) act : null;
    }

    static View getView(Object fragment) {
        if (fragment == null) return null;
        Object v = callNoArgs(fragment, "getView");
        return v instanceof View ? (View) v : null;
    }

    static boolean isHidden(Object fragment) {
        return Boolean.TRUE.equals(callNoArgs(fragment, "isHidden"));
    }

    static boolean isResumed(Object fragment) {
        return Boolean.TRUE.equals(callNoArgs(fragment, "isResumed"));
    }

    static Context getApplicationContext(Object viewModel) {
        if (viewModel == null) return null;
        Object app = callNoArgs(viewModel, "getApplication");
        return app instanceof Context ? ((Context) app).getApplicationContext() : null;
    }

    static void cancelShowLyricsLoadingMessage(Object fragment, Context ctx) {
        removeFragmentHandlerMessage(fragment, ctx, "message_show_lyrics_loading");
    }

    static void cancelControlsFadeTimer(Object fragment, Context ctx) {
        removeFragmentHandlerMessage(fragment, ctx, "message_start_player_controls_fade_timer");
    }

    private static void removeFragmentHandlerMessage(Object fragment, Context ctx, String idName) {
        if (fragment == null || ctx == null) return;
        int msgId = LrclibStrings.id(ctx, "id", idName);
        if (msgId == 0) return;
        try {
            if (!fragmentHandlerFieldSearched) {
                for (Class<?> cls = fragment.getClass(); cls != null && cls != Object.class; cls = cls.getSuperclass()) {
                    if (!cls.getName().startsWith("com.apple.android.music.player.")) continue;
                    for (Field f : cls.getDeclaredFields()) {
                        if (!Modifier.isStatic(f.getModifiers()) && Handler.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            cachedFragmentHandlerField = f;
                        }
                    }
                }
                fragmentHandlerFieldSearched = true;
            }
            if (cachedFragmentHandlerField != null && cachedFragmentHandlerField.getDeclaringClass().isInstance(fragment)) {
                Object h = cachedFragmentHandlerField.get(fragment);
                if (h instanceof Handler) {
                    ((Handler) h).removeMessages(msgId);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    static void showPlayerControls(Object fragment) {
        if (fragment == null) return;
        try {
            if (!setControlsVisibilityMethodSearched) {
                Class<?> superCls = fragment.getClass().getSuperclass();
                if (superCls != null) {
                    for (Method m : superCls.getDeclaredMethods()) {
                        Class<?>[] params = m.getParameterTypes();
                        if (params.length == 2
                                && params[0] == int.class
                                && params[1] == int[].class
                                && m.getReturnType() == void.class) {
                            m.setAccessible(true);
                            cachedSetControlsVisibilityMethod = m;
                            break;
                        }
                    }
                }
                setControlsVisibilityMethodSearched = true;
            }
            if (cachedSetControlsVisibilityMethod != null
                    && cachedSetControlsVisibilityMethod.getDeclaringClass().isInstance(fragment)) {
                cachedSetControlsVisibilityMethod.invoke(fragment, View.VISIBLE, new int[0]);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed showing player controls", t);
        }
    }

    /**
     * Dynamically creates a native Apple Music Settings category + action row
     * without hardcoding obfuscated Kotlin Function0 class names across app versions.
     */
    static Object createSettingsCategory(String categoryTitle, String entryTitle, Runnable onClick)
            throws ReflectiveOperationException {
        Class<?> actionClass = Class.forName("com.apple.android.music.settings2.model.b$b$b");
        Class<?> categoryClass = Class.forName("com.apple.android.music.settings2.model.b$a");

        Constructor<?> actionCtor = null;
        Class<?> function0Interface = null;
        for (Constructor<?> ctor : actionClass.getDeclaredConstructors()) {
            Class<?>[] params = ctor.getParameterTypes();
            if (params.length == 7
                    && params[0] == String.class
                    && params[2] == boolean.class
                    && params[5].isInterface()
                    && params[6] == int.class) {
                actionCtor = ctor;
                function0Interface = params[5];
                break;
            }
        }
        if (actionCtor == null || function0Interface == null) {
            throw new NoSuchMethodException("Could not locate settings2 action constructor");
        }
        actionCtor.setAccessible(true);

        Object unitInstance = getKotlinUnitInstance();
        Object callback = Proxy.newProxyInstance(
                function0Interface.getClassLoader(),
                new Class<?>[]{function0Interface},
                (proxy, method, args) -> {
                    if (method.getDeclaringClass() == Object.class) {
                        if ("toString".equals(method.getName())) return "LrclibSettingsAction";
                        if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
                        if ("equals".equals(method.getName())) return proxy == (args != null && args.length > 0 ? args[0] : null);
                    }
                    onClick.run();
                    return unitInstance;
                }
        );

        Object actionItem = actionCtor.newInstance(entryTitle, null, false, null, null, callback, 382);

        Constructor<?> categoryCtor = null;
        for (Constructor<?> ctor : categoryClass.getDeclaredConstructors()) {
            Class<?>[] params = ctor.getParameterTypes();
            if (params.length == 4
                    && params[0] == String.class
                    && List.class.isAssignableFrom(params[1])
                    && params[3] == int.class) {
                categoryCtor = ctor;
                break;
            }
        }
        if (categoryCtor == null) {
            throw new NoSuchMethodException("Could not locate settings2 category constructor");
        }
        categoryCtor.setAccessible(true);
        return categoryCtor.newInstance(categoryTitle, Collections.singletonList(actionItem), null, 58);
    }

    private static Object getKotlinUnitInstance() throws ReflectiveOperationException {
        Class<?> unitClass = Class.forName("kotlin.Unit");
        for (Field f : unitClass.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers()) && f.getType() == unitClass) {
                f.setAccessible(true);
                Object val = f.get(null);
                if (val != null) return val;
            }
        }
        throw new NoSuchFieldException("kotlin.Unit singleton not found");
    }

    private static Class<?> getPlaybackItemClass() {
        if (cachedPlaybackItemClass == null) {
            try {
                cachedPlaybackItemClass = Class.forName("com.apple.android.music.model.PlaybackItem");
            } catch (ClassNotFoundException ignored) {
            }
        }
        return cachedPlaybackItemClass;
    }

    private static Class<?> getBaseContentItemClass() {
        if (cachedBaseContentItemClass == null) {
            try {
                cachedBaseContentItemClass = Class.forName("com.apple.android.music.model.BaseContentItem");
            } catch (ClassNotFoundException ignored) {
            }
        }
        return cachedBaseContentItemClass;
    }

    private static Class<?> getLyricsViewModelClass() {
        if (cachedLyricsViewModelClass == null) {
            try {
                cachedLyricsViewModelClass = Class.forName("com.apple.android.music.player.viewmodel.PlayerLyricsViewModel");
            } catch (ClassNotFoundException ignored) {
            }
        }
        return cachedLyricsViewModelClass;
    }

    private static Object callNoArgs(Object target, String methodName) {
        if (target == null) return null;
        try {
            Method m = findMethod(target.getClass(), methodName);
            if (m == null) return null;
            return m.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object callOneArg(Object target, String methodName, Class<?> paramType, Object arg)
            throws ReflectiveOperationException {
        Method m = findMethod(target.getClass(), methodName, paramType);
        if (m == null) throw new NoSuchMethodException(target.getClass().getName() + "." + methodName);
        return m.invoke(target, arg);
    }

    private static Method findMethod(Class<?> cls, String name, Class<?>... params) {
        try {
            Method m = cls.getMethod(name, params);
            m.setAccessible(true);
            return m;
        } catch (NoSuchMethodException ignored) {
        }
        for (Class<?> cur = cls; cur != null && cur != Object.class; cur = cur.getSuperclass()) {
            try {
                Method m = cur.getDeclaredMethod(name, params);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    private static String asString(Object obj) {
        return obj == null ? "" : String.valueOf(obj).trim();
    }

    private static long asLong(Object obj, long fallback) {
        if (obj instanceof Number) return ((Number) obj).longValue();
        return fallback;
    }

    private static long parseLongSafe(String s, long fallback) {
        if (s == null || s.isEmpty()) return fallback;
        try {
            return Long.parseLong(s.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }

    private static String firstNonEmpty(String... values) {
        for (String v : values) {
            if (v != null && !v.trim().isEmpty()) return v.trim();
        }
        return "";
    }
}
