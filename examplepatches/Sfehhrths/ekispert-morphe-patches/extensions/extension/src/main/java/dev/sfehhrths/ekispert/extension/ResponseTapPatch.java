package dev.sfehhrths.ekispert.extension;

import android.content.Context;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;

import okhttp3.OkHttpClient;

/**
 * Entry points invoked from the patched app bytecode.
 * Method names/signatures here are referenced verbatim from the Kotlin patch
 * (see patches/.../responsetap/ResponseTapPatch.kt), so keep them stable.
 */
@SuppressWarnings("unused")
public final class ResponseTapPatch {

    static final String TAG = "EkispertTap";

    private ResponseTapPatch() {
    }

    /**
     * Injected into {@code AbsDownloader.d()} right after {@code new OkHttpClient.Builder()}.
     * Adds an application-level interceptor (not a network interceptor, so the body is
     * already gunzipped when we see it).
     */
    public static void addInterceptor(OkHttpClient.Builder builder) {
        try {
            builder.addInterceptor(new ResponseTapInterceptor());
            Log.i(TAG, "ResponseTapInterceptor installed");
        } catch (Throwable t) {
            // Never let the hook break the app's networking.
            Log.e(TAG, "failed to install interceptor", t);
        }
    }

    /**
     * Injected at the start of {@code TransferAlarmCourseDAO.b(Class, AioSearchCondition, String, long, long, MyClipDataType)}.
     * The String is the ResultSet XML reduced to the single course the user set the alarm for
     * (produced by the app's own {@code WebApiSearchRouteResultUtils.a(xml, index)}).
     */
    public static void onTransferAlarmCourse(String courseXml) {
        try {
            if (courseXml != null) {
                ResponseSink.deliverTransferAlarmCourse(courseXml);
            }
        } catch (Throwable t) {
            Log.e(TAG, "failed to handle transfer alarm course", t);
        }
    }

    /**
     * Injected into {@code SearchRouteMyClipEntity.g()} right before the stored single-course
     * XML is parsed, i.e. when a MyClip (お気に入り) course's detail screen opens.
     */
    public static void onMyClipCourse(String courseXml) {
        try {
            if (courseXml != null) {
                ResponseSink.deliverMyClipCourse(courseXml);
            }
        } catch (Throwable t) {
            Log.e(TAG, "failed to handle MyClip course", t);
        }
    }

    /**
     * Injected into
     * {@code AbsDISRxSearchResultDetailParentFragmentPresenter.bc(int index, boolean)}, which the
     * detail screen's ViewPager2 calls for the initially opened course and on every swipe,
     * right before the shown {@code AioCourse} is passed to {@code HistorySelectRouteUseCase}.
     * <p>
     * {@code course} is that {@code AioCourse}. Its members are obfuscated, so instead of
     * calling a getter we collect every non-static {@code String} field (one of them is the
     * {@code SerializeData} of the course; the app itself uses it as the key for "前後のダイヤ")
     * and let the companion match them against the {@code Course/SerializeData} values of the
     * responses it has already received. {@code presenter} is only used for its class name.
     */
    public static void onCourseSelected(Object presenter, Object course) {
        try {
            String name = presenter != null ? presenter.getClass().getSimpleName() : "";
            String[] keys = stringFieldValues(course);
            if (keys.length == 0) {
                Log.w(TAG, "course selected in " + name + " but "
                        + (course != null ? course.getClass().getName() : "null")
                        + " has no String field; the companion cannot identify it");
            } else {
                Log.i(TAG, "course selected in " + name + " keys=" + keys.length);
            }
            CompanionBridge.sendSelectedCourse(name, keys);
        } catch (Throwable t) {
            Log.e(TAG, "failed to handle course selection", t);
        }
    }

    /**
     * Values of all non-static, non-empty {@code String} fields declared on the object's class
     * and its superclasses (excluding {@code Object}). Field names are obfuscated and may change
     * between app releases; field types are not.
     */
    private static String[] stringFieldValues(Object o) {
        if (o == null) {
            return new String[0];
        }
        ArrayList<String> out = new ArrayList<>();
        for (Class<?> c = o.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) || f.getType() != String.class) {
                    continue;
                }
                try {
                    f.setAccessible(true);
                    Object v = f.get(o);
                    if (v instanceof String && !((String) v).isEmpty()) {
                        out.add((String) v);
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "cannot read field " + f, t);
                }
            }
        }
        return out.toArray(new String[0]);
    }

    /**
     * Injected into {@code AioApplication.onCreate()} right after {@code super.onCreate()}.
     */
    public static void onApplicationCreate(Context context) {
        try {
            ContextHolder.set(context);
            Log.i(TAG, "application context captured");
        } catch (Throwable t) {
            Log.e(TAG, "failed to capture application context", t);
        }
    }
}
