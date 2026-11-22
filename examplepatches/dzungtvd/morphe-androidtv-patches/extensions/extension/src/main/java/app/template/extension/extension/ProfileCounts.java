package app.template.extension.extension;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.List;

/** Fills profile counts from the live profile grid when the profile head is unavailable. */
@SuppressWarnings("unused")
public final class ProfileCounts {

    private static final String TAG = "TikTokTVProfile";
    private static final String USER = "com.ss.android.ugc.aweme.profile.model.User";
    private static final String USER_RESPONSE =
            "com.ss.android.ugc.aweme.tv.profile.fragment.user.UserResponse";
    private static final String QUERY_API =
            "com.ss.android.ugc.aweme.tv.profile.api.QueryAwemeWithIdApi";
    private static final String RETROFIT_FACTORY =
            "com.bytedance.ies.ugc.aweme.network.RetrofitFactory";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private ProfileCounts() {
    }

    /** Entry point from the patched view model: {@code enrich(User, a$b)}. */
    public static void enrich(Object user, Object observer) {
        if (user == null || observer == null) return;
        try {
            if (number(user, "getFollowerCount") > 0
                    || number(user, "getFollowingCount") > 0
                    || number(user, "getTotalFavorited") > 0) {
                return;
            }
            final String secUid = string(user, "getSecUid");
            final String uid = string(user, "getUid");
            if (isEmpty(secUid) && isEmpty(uid)) return;

            new Thread(() -> {
                try {
                    Object author = fetchAuthor(uid, secUid);
                    if (author == null) {
                        Log.i(TAG, "counts -> no author in the grid answer");
                        return;
                    }
                    copy(author, user, "getFollowerCount", "setFollowerCount");
                    copy(author, user, "getFollowingCount", "setFollowingCount");
                    copy(author, user, "getTotalFavorited", "setTotalFavorited");
                    copy(author, user, "getAwemeCount", "setAwemeCount");
                    copyIfEmpty(author, user, "getSignature", "setSignature");
                    Log.i(TAG, "counts -> " + number(user, "getFollowingCount")
                            + "/" + number(user, "getFollowerCount")
                            + "/" + number(user, "getTotalFavorited"));
                    MAIN.post(() -> emit(observer, user));
                } catch (Throwable failure) {
                    Log.i(TAG, "counts -> failed " + failure);
                }
            }, "TikTokTVProfileCounts").start();
        } catch (Throwable failure) {
            Log.i(TAG, "counts -> skipped " + failure.getClass().getSimpleName());
        }
    }

    /** One item from the same grid endpoint the profile screen uses. */
    private static Object fetchAuthor(String uid, String secUid) throws Throwable {
        String origin = Subtitles.origin();
        if (origin == null || origin.isEmpty()) origin = buildOrigin();

        Class<?> factoryClass = Class.forName(RETROFIT_FACTORY);
        Object factory = factoryClass.getMethod("createIRetrofitFactorybyMonsterPlugin")
                .invoke(null);
        Object retrofit = factory.getClass().getMethod("create", String.class)
                .invoke(factory, origin);
        Class<?> apiClass = Class.forName(QUERY_API);
        Object api = retrofit.getClass().getMethod("a", Class.class).invoke(retrofit, apiClass);

        Object call = apiClass.getMethod("getPublishAweme",
                        int.class, String.class, String.class, long.class)
                .invoke(api, 1, emptyToNull(uid), emptyToNull(secUid), 0L);
        Object feed = call.getClass().getMethod("get").invoke(call);
        if (feed == null) return null;

        Object items = feed.getClass().getMethod("getItems").invoke(feed);
        if (!(items instanceof List) || ((List<?>) items).isEmpty()) return null;
        Object aweme = ((List<?>) items).get(0);
        return aweme.getClass().getMethod("getAuthor").invoke(aweme);
    }

    /** The same host the app's BuildConfigDiff points its Retrofit clients at. */
    private static String buildOrigin() {
        try {
            Class<?> buildConfig = Class.forName("com.ss.android.ugc.aweme.buildconfigdiff.a");
            Object host = buildConfig.getMethod("a").invoke(null);
            if (host instanceof String && !((String) host).isEmpty()) {
                return "https://" + host;
            }
        } catch (Throwable ignored) {
        }
        return "https://api-va.tiktokv.com";
    }

    private static void emit(Object observer, Object user) {
        try {
            Class<?> responseClass = Class.forName(USER_RESPONSE);
            Object response = responseClass.getConstructor().newInstance();
            responseClass.getMethod("setUser", Class.forName(USER)).invoke(response, user);
            observer.getClass().getMethod("onNext", Object.class).invoke(observer, response);
        } catch (Throwable failure) {
            Log.i(TAG, "counts -> emit failed " + failure.getClass().getSimpleName());
        }
    }

    private static void copy(Object source, Object target, String getter, String setter)
            throws Throwable {
        Method read = source.getClass().getMethod(getter);
        Object value = read.invoke(source);
        target.getClass().getMethod(setter, read.getReturnType()).invoke(target, value);
    }

    private static void copyIfEmpty(Object source, Object target, String getter, String setter)
            throws Throwable {
        if (!isEmpty(string(target, getter))) return;
        copy(source, target, getter, setter);
    }

    private static int number(Object target, String getter) {
        try {
            Object value = target.getClass().getMethod(getter).invoke(target);
            return value instanceof Number ? ((Number) value).intValue() : 0;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static String string(Object target, String getter) {
        try {
            Object value = target.getClass().getMethod(getter).invoke(target);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isEmpty(String value) {
        return value == null || value.isEmpty();
    }

    private static String emptyToNull(String value) {
        return isEmpty(value) ? null : value;
    }
}
