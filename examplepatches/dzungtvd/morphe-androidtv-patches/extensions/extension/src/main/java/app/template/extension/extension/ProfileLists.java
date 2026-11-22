package app.template.extension.extension;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;
import java.util.zip.GZIPInputStream;

/** Reshapes TikTok Lite relation lists into the {user: ...} rows the TV adapter reads. */
@SuppressWarnings("unused")
public final class ProfileLists {

    private static final String TAG = "TikTokTVProfile";
    private static final String TYPED_INPUT = "com.bytedance.retrofit2.mime.TypedInput";
    private static final String FOLLOWER = "/lite/v2/relation/follower/list/";
    private static final String FOLLOWING = "/lite/v2/relation/following/list/";
    private static final String LIKE_ITEMS = "/lite/v1/relation/like-items";
    /** Same four-column table the app's own Posts/Liked grids use. */
    private static final int GRID_COLUMNS = 4;

    private ProfileLists() {
    }

    /** Current request's grid kind, set from the view model's `awemeQueryId` before it calls. */
    private static volatile String gridKind;

    /** The MyProfile grid view model calls this at instruction 0 of its request method. */
    public static void noteGridKind(Object viewModel) {
        try {
            Field kind = viewModel.getClass().getDeclaredField("l");
            kind.setAccessible(true);
            Object value = kind.get(viewModel);
            gridKind = value == null ? null : String.valueOf(value);
            Log.i(TAG, "grid kind -> " + gridKind);
        } catch (Throwable ignored) {
            gridKind = null;
        }
    }

    public static boolean isRepostGrid() {
        return "personal_repost".equals(gridKind);
    }

    /**
     * Insert the two new My-profile grid tabs after Posts: `Posts, Đăng lại, Video đã lưu, Liked
     * videos, Following, Followers`.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void addMyProfileTabs(Object listObject) {
        if (!(listObject instanceof List)) return;
        List list = (List) listObject;
        try {
            Object user = currentUser();
            if (user == null) return;

            removeTab(list, "favorite_videos");
            removeTab(list, "my_repost");
            removeTab(list, "my_saved");

            Object repost = gridFragment(user, "LIKED_VIDEOS", "personal_repost");
            Object saved = gridFragment(user, "FAVORITE_VIDEOS", "personal_saved");
            Object repostTab = tab(stringId("forward", 0), "my_repost", repost,
                    drawableId("ic_profile_my_posts"));
            // `saved` is present in public.xml/strings.xml but the resource shrinker removed its
            // R field in 12.3.x; the public id is stable across 12.3.4.1 and 12.3.7.1.
            Object savedTab = tab(stringId("saved", 0x7f111a30), "my_saved", saved,
                    drawableId("ic_favorites_icon"));

            if (repostTab != null) list.add(Math.min(1, list.size()), repostTab);
            if (savedTab != null) list.add(Math.min(2, list.size()), savedTab);
            Log.i(TAG, "my profile tabs -> " + list.size());
        } catch (Throwable failure) {
            Log.i(TAG, "my profile tabs skipped " + failure.getClass().getSimpleName());
        }
    }

    private static Object currentUser() {
        try {
            Class<?> account = Class.forName("com.ss.android.ugc.aweme.account.a");
            Object service = account.getMethod("e").invoke(null);
            return service.getClass().getMethod("getCurUser").invoke(service);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void removeTab(List list, String key) {
        try {
            Iterator iterator = list.iterator();
            while (iterator.hasNext()) {
                Object tab = iterator.next();
                Object value = tab.getClass().getMethod("b").invoke(tab);
                if (key.equals(value)) iterator.remove();
            }
        } catch (Throwable ignored) {
            // Keep the original list on an unexpected model change.
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object gridFragment(Object user, String queryTypeName, String queryId)
            throws Exception {
        Class<?> queryTypeClass = Class.forName("com.ss.android.ugc.aweme.tv.b.b");
        Object queryType = Enum.valueOf((Class<Enum>) queryTypeClass, queryTypeName);

        Class<?> queryClass = Class.forName(
                "com.ss.android.ugc.aweme.tv.profilev2.ui.videogrid.c$a");
        Object query = queryClass.getConstructor(queryTypeClass).newInstance(queryType);
        Class<?> queryBase = Class.forName(
                "com.ss.android.ugc.aweme.tv.profilev2.ui.videogrid.c");

        Class<?> companion = Class.forName(
                "com.ss.android.ugc.aweme.tv.profilev2.ui.videogrid.ProfileVideoGridFragmentV2$a");
        Class<?> fragmentType = Class.forName(
                "com.ss.android.ugc.aweme.tv.profilev2.ui.videogrid.ProfileVideoGridFragmentV2");
        Class<?> gridType = Class.forName(
                "com.ss.android.ugc.aweme.tv.profilev2.ui.videogrid.ProfileVideoGridFragmentV2$b");
        Object post = Enum.valueOf((Class<Enum>) gridType, "POST");
        Class<?> listener = Class.forName(
                "com.ss.android.ugc.aweme.tv.profilev2.ui.otherprofile.ProfileTabBarView$a");
        Class<?> otherProfile = Class.forName(
                "com.ss.android.ugc.aweme.tv.profilev2.ui.otherprofile.a");
        Class<?> userClass = Class.forName("com.ss.android.ugc.aweme.profile.model.User");

        Method factory = companion.getDeclaredMethod("a", userClass, boolean.class,
                queryTypeClass, queryBase, String.class, boolean.class, int.class, String.class,
                listener, boolean.class, gridType, otherProfile);
        factory.setAccessible(true);
        // This int is `numVideoColumns`, not a default-argument mask. The app's own calls go
        // through the synthetic bridge with 4064, which fills in 4; passing 0 here made
        // VerticalGridView render one full-width column instead of the Posts/Liked table.
        return factory.invoke(null, user, true, queryType, query, queryId, false, GRID_COLUMNS,
                queryId, null, false, post, null);
    }

    private static Object tab(int titleRes, String key, Object fragment, int iconRes)
            throws Exception {
        if (fragment == null || titleRes == 0) return null;
        Class<?> tabClass = Class.forName("com.ss.android.ugc.aweme.tv.profilev2.a.d");
        Constructor<?> constructor = null;
        for (Constructor<?> candidate : tabClass.getDeclaredConstructors()) {
            Class<?>[] types = candidate.getParameterTypes();
            if (types.length == 4 && types[0] == int.class && types[1] == String.class
                    && types[3] == Integer.class) {
                constructor = candidate;
                break;
            }
        }
        if (constructor == null) return null;
        constructor.setAccessible(true);
        return constructor.newInstance(titleRes, key, fragment,
                iconRes == 0 ? null : Integer.valueOf(iconRes));
    }

    private static int stringId(String name, int fallback) {
        try {
            return Class.forName("com.ss.android.ugc.aweme.homepage.lite.R$string")
                    .getField(name).getInt(null);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static int drawableId(String name) {
        try {
            return Class.forName("com.ss.android.ugc.aweme.homepage.lite.R$drawable")
                    .getField(name).getInt(null);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    public static Object shapeBody(Object rawResponse, Object input) {
        if (rawResponse == null || input == null) return input;
        byte[] body = null;
        try {
            String url = String.valueOf(rawResponse.getClass().getMethod("a").invoke(rawResponse));
            boolean follower = url.contains(FOLLOWER);
            boolean following = url.contains(FOLLOWING);
            boolean liked = url.contains(LIKE_ITEMS);
            boolean repost = url.contains("/tiktok/v1/upvote/item/list");
            if (!follower && !following && !liked && !repost) return input;

            body = readAll((InputStream) input.getClass().getMethod("in").invoke(input));
            if (body.length == 0) {
                Log.i(TAG, "profile list empty body " + url.split("\\?")[0]);
                return input;
            }
            if (isGzip(body)) body = gunzip(body);
            if (repost) return preserve(input, body);
            if (isZstd(body)) {
                // TTNet normally hands Retrofit a decompressed body; if this build did not,
                // leave the bytes untouched rather than corrupting the response.
                Log.i(TAG, "profile list ttzip body left untouched " + body.length);
                return preserve(input, body);
            }

            JSONObject page = new JSONObject(new String(body, StandardCharsets.UTF_8));
            if (liked) {
                long cursor = page.optLong("cursor", 0L);
                if (cursor > 0L && page.optLong("max_cursor", 0L) == 0L) {
                    page.put("max_cursor", cursor);
                }
                Log.i(TAG, "like-items list=" + count(page, "aweme_list")
                        + " max_cursor=" + page.optLong("max_cursor", 0L)
                        + " has_more=" + page.optInt("has_more", -1));
            } else {
                String key = follower ? "followers" : "followings";
                JSONArray users = page.optJSONArray(key);
                if (users == null) {
                    Log.i(TAG, "relation list missing " + key + " keys=" + keys(page));
                    return preserve(input, body);
                }
                JSONArray wrapped = new JSONArray();
                for (int i = 0; i < users.length(); i++) {
                    Object item = users.opt(i);
                    if (item instanceof JSONObject && ((JSONObject) item).has("user")) {
                        wrapped.put(item);
                    } else {
                        JSONObject cover = new JSONObject();
                        cover.put("user", item);
                        wrapped.put(cover);
                    }
                }
                page.put(key, wrapped);
                // The TV pager reads min_time; Lite's relation answer may only carry
                // max_time/offset. Mirror whichever one the page returned.
                if (!page.has("min_time")) {
                    long next = page.optLong("max_time",
                            page.optLong("offset", page.optLong("cursor", 0L)));
                    page.put("min_time", next);
                }
                if (!page.has("has_more")) {
                    page.put("has_more", page.optInt("has_more_up", 0) != 0);
                }
                Log.i(TAG, "relation list " + key + " items=" + wrapped.length()
                        + " has_more=" + page.optInt("has_more", -1)
                        + " min_time=" + page.optLong("min_time", 0L));
            }

            return preserve(input, page.toString().getBytes(StandardCharsets.UTF_8));
        } catch (Throwable failure) {
            Log.i(TAG, "profile list reshape skipped " + failure.getClass().getSimpleName());
            // After readAll() the original stream is consumed; give the converter the bytes
            // back so a skipped reshape cannot turn a valid page into an empty body.
            return body != null ? preserve(input, body) : input;
        }
    }

    private static Object preserve(Object input, byte[] body) {
        Object replacement = typedInput(input, body);
        return replacement != null ? replacement : input;
    }

    private static int count(JSONObject page, String key) {
        JSONArray array = page.optJSONArray(key);
        return array == null ? -1 : array.length();
    }

    private static String keys(JSONObject page) {
        StringBuilder names = new StringBuilder();
        Iterator<String> iterator = page.keys();
        while (iterator.hasNext()) {
            if (names.length() > 0) names.append(',');
            names.append(iterator.next());
        }
        return names.toString();
    }

    private static Object typedInput(final Object original, final byte[] body) {
        try {
            final Class<?> type = Class.forName(TYPED_INPUT);
            final String mime =
                    String.valueOf(original.getClass().getMethod("mimeType").invoke(original));
            return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) {
                            String name = method.getName();
                            if ("mimeType".equals(name)) return mime;
                            if ("length".equals(name)) return (long) body.length;
                            if ("in".equals(name)) return new ByteArrayInputStream(body);
                            if ("toString".equals(name)) return "ProfileListBody(" + body.length + ")";
                            if ("hashCode".equals(name)) return System.identityHashCode(proxy);
                            if ("equals".equals(name)) return proxy == args[0];
                            return null;
                        }
                    });
        } catch (Throwable failure) {
            return null;
        }
    }

    private static byte[] readAll(InputStream input) throws Exception {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int count;
            while ((count = input.read(buffer)) >= 0) {
                out.write(buffer, 0, count);
            }
            return out.toByteArray();
        } finally {
            input.close();
        }
    }

    private static boolean isGzip(byte[] body) {
        return body.length > 1 && (body[0] & 0xff) == 0x1f && (body[1] & 0xff) == 0x8b;
    }

    private static boolean isZstd(byte[] body) {
        return body.length > 3
                && (body[0] & 0xff) == 0x28
                && (body[1] & 0xff) == 0xb5
                && (body[2] & 0xff) == 0x2f
                && (body[3] & 0xff) == 0xfd;
    }

    private static byte[] gunzip(byte[] body) throws Exception {
        InputStream input = new GZIPInputStream(new ByteArrayInputStream(body));
        try {
            return readAll(input);
        } finally {
            input.close();
        }
    }
}
