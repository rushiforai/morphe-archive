package dev.sfehhrths.ekispert.extension;

import android.app.BroadcastOptions;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.zip.GZIPOutputStream;

/**
 * Sends tapped data to the companion app as an explicit Broadcast.
 *
 * Wire format (Intent extras):
 * <pre>
 *   EXTRA_KIND         String  one of KIND_*
 *   EXTRA_URL          String  request URL with the API key redacted (KIND_HTTP_RESPONSE only)
 *   EXTRA_HTTP_CODE    int     (KIND_HTTP_RESPONSE only)
 *   EXTRA_CONTENT_TYPE String  (KIND_HTTP_RESPONSE only, may be absent)
 *   EXTRA_BODY_GZIP    byte[]  gzip(UTF-8 body). Route search XML: ~185 KB -> ~12 KB
 *   EXTRA_BODY_LENGTH  int     body length in chars before compression
 *   EXTRA_TIMESTAMP    long    System.currentTimeMillis()
 * </pre>
 * The companion must declare {@link #PERMISSION} (and hold it) to receive these.
 */
final class CompanionBridge {

    private static final String TAG = ResponseTapPatch.TAG;

    /** Package name of the companion (phone) app. Keep in sync with its applicationId. */
    static final String COMPANION_PACKAGE = "dev.sfehhrths.ekispertwear";
    static final String ACTION = COMPANION_PACKAGE + ".action.TAP";
    /** Receiver-held permission: only apps granted it get the broadcast. */
    static final String PERMISSION = COMPANION_PACKAGE + ".permission.RECEIVE_TAP";

    static final String EXTRA_KIND = "kind";
    static final String EXTRA_URL = "url";
    static final String EXTRA_HTTP_CODE = "http_code";
    static final String EXTRA_CONTENT_TYPE = "content_type";
    static final String EXTRA_BODY_GZIP = "body_gzip";
    static final String EXTRA_BODY_LENGTH = "body_length";
    static final String EXTRA_TIMESTAMP = "timestamp";

    /** Raw HTTP response body from a TARGET_HOSTS request (XML). */
    static final String KIND_HTTP_RESPONSE = "http_response";
    /** Single-course ResultSet XML the app saved when the user set a transfer alarm. */
    static final String KIND_TRANSFER_ALARM_COURSE = "transfer_alarm_course";
    /**
     * The user opened / swiped to course #EXTRA_COURSE_INDEX (0-based) in the detail screen.
     * No body. EXTRA_PRESENTER names the concrete presenter class so the companion can tell a
     * normal (Dia) or detour search apart from other screens sharing the same presenter.
     */
    static final String KIND_SELECTED_COURSE = "selected_course";
    static final String EXTRA_COURSE_INDEX = "course_index";
    static final String EXTRA_PRESENTER = "presenter";
    /** Single-course ResultSet XML of a MyClip (お気に入り) course whose detail is opening. */
    static final String KIND_MYCLIP_COURSE = "myclip_course";
    /** A detail screen is opening (precedes myclip_course / selected_course). No body. */
    static final String KIND_DETAIL_OPENED = "detail_opened";

    private CompanionBridge() {
    }

    static void sendHttpResponse(String redactedUrl, int httpCode, String contentType, String body) {
        Intent intent = newIntent(KIND_HTTP_RESPONSE, body);
        if (intent == null) {
            return;
        }
        intent.putExtra(EXTRA_URL, redactedUrl);
        intent.putExtra(EXTRA_HTTP_CODE, httpCode);
        if (contentType != null) {
            intent.putExtra(EXTRA_CONTENT_TYPE, contentType);
        }
        send(intent);
    }

    static void sendTransferAlarmCourse(String courseXml) {
        Intent intent = newIntent(KIND_TRANSFER_ALARM_COURSE, courseXml);
        if (intent != null) {
            send(intent);
        }
    }

    static void sendMyClipCourse(String courseXml) {
        Intent intent = newIntent(KIND_MYCLIP_COURSE, courseXml);
        if (intent != null) {
            send(intent);
        }
    }

    static void sendDetailOpened() {
        send(new Intent(ACTION)
                .setPackage(COMPANION_PACKAGE)
                .putExtra(EXTRA_KIND, KIND_DETAIL_OPENED)
                .putExtra(EXTRA_TIMESTAMP, System.currentTimeMillis()));
    }

    static void sendSelectedCourse(String presenterSimpleName, int courseIndex) {
        Intent intent = new Intent(ACTION)
                .setPackage(COMPANION_PACKAGE)
                .putExtra(EXTRA_KIND, KIND_SELECTED_COURSE)
                .putExtra(EXTRA_PRESENTER, presenterSimpleName)
                .putExtra(EXTRA_COURSE_INDEX, courseIndex)
                .putExtra(EXTRA_TIMESTAMP, System.currentTimeMillis());
        send(intent);
    }

    private static Intent newIntent(String kind, String body) {
        byte[] gz;
        try {
            gz = gzip(body);
        } catch (IOException e) {
            Log.w(TAG, "gzip failed, dropping " + kind, e);
            return null;
        }
        return new Intent(ACTION)
                .setPackage(COMPANION_PACKAGE)
                .putExtra(EXTRA_KIND, kind)
                .putExtra(EXTRA_BODY_GZIP, gz)
                .putExtra(EXTRA_BODY_LENGTH, body.length())
                .putExtra(EXTRA_TIMESTAMP, System.currentTimeMillis());
    }

    private static void send(Intent intent) {
        Context ctx = ContextHolder.get();
        if (ctx == null) {
            Log.w(TAG, "no application context yet; dropping " + intent.getStringExtra(EXTRA_KIND));
            return;
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                // Let the companion verify us via BroadcastReceiver.getSentFromUid() (Android 14+
                // only exposes the sender when it opts in like this).
                Bundle options = BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle();
                ctx.sendBroadcast(intent, PERMISSION, options);
            } else {
                ctx.sendBroadcast(intent, PERMISSION);
            }
            byte[] gz = intent.getByteArrayExtra(EXTRA_BODY_GZIP);
            String detail;
            if (gz != null) {
                detail = "chars=" + intent.getIntExtra(EXTRA_BODY_LENGTH, -1) + " gzip=" + gz.length + "B";
            } else if (intent.hasExtra(EXTRA_COURSE_INDEX)) {
                detail = "index=" + intent.getIntExtra(EXTRA_COURSE_INDEX, -1)
                        + " presenter=" + intent.getStringExtra(EXTRA_PRESENTER);
            } else {
                detail = "";
            }
            Log.i(TAG, "broadcast " + intent.getStringExtra(EXTRA_KIND) + " " + detail
                    + " -> " + COMPANION_PACKAGE);
        } catch (Throwable t) {
            Log.w(TAG, "sendBroadcast failed", t);
        }
    }

    private static byte[] gzip(String text) throws IOException {
        byte[] raw = text.getBytes(StandardCharsets.UTF_8);
        ByteArrayOutputStream bos = new ByteArrayOutputStream(raw.length / 8 + 64);
        try (GZIPOutputStream gz = new GZIPOutputStream(bos)) {
            gz.write(raw);
        }
        return bos.toByteArray();
    }
}
