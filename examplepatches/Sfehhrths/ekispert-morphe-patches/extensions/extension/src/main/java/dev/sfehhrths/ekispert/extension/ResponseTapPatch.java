package dev.sfehhrths.ekispert.extension;

import android.content.Context;
import android.util.Log;

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
     * Injected at the start of {@code AbsDISRxSearchResultDetailParentFragmentUseCase.f(args)}:
     * a detail screen is about to open (new search result or MyClip). Lets the companion reset
     * any pending MyClip course before the next selection arrives.
     */
    public static void onDetailOpened() {
        try {
            Log.i(TAG, "detail opened");
            CompanionBridge.sendDetailOpened();
        } catch (Throwable t) {
            Log.e(TAG, "failed to handle detail open", t);
        }
    }

    /**
     * Injected at the start of
     * {@code AbsDISRxSearchResultDetailParentFragmentPresenter.bc(int index, boolean)}, which the
     * detail screen's ViewPager2 calls for the initially opened course and on every swipe.
     * {@code presenter} is the concrete presenter instance (Dia / Detour / ...); only its class
     * name is used, no app internals are touched.
     */
    public static void onCourseSelected(Object presenter, int courseIndex) {
        try {
            String name = presenter != null ? presenter.getClass().getSimpleName() : "";
            Log.i(TAG, "course selected index=" + courseIndex + " in " + name);
            CompanionBridge.sendSelectedCourse(name, courseIndex);
        } catch (Throwable t) {
            Log.e(TAG, "failed to handle course selection", t);
        }
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
