package ajstrick81.morphe.extension.primevideo.gmb;

import android.util.Log;

/**
 * GMB send-direction diagnostic extension — temporary, not for production use.
 *
 * Logs every outbound GMB event type and payload passed into
 * GMBMessageSender.sendGMBMessageToClient() — the sole chokepoint for
 * Java→native GMB traffic — to Android logcat under the tag
 * "GMB_SEND_DIAGNOSTIC" using standard android.util.Log.d(), which surfaces
 * in ADB logcat, unlike Amazon's internal logger.
 *
 * This is a pure diagnostic tool. It does not suppress any messages. Every
 * GMB message passes through normally after being logged.
 *
 * Filter ADB logcat with:
 *   adb logcat --pid=<PID> -v time | findstr "GMB_SEND_DIAGNOSTIC"
 *
 * Mirrors the now-removed receive-direction diagnostic (GMBMessageProcessor
 * .processMessage), which confirmed zero ad-related traffic. This tests the
 * opposite direction. Intended to be removed once the send direction has
 * been confirmed ad-relevant or ad-irrelevant.
 */
@SuppressWarnings("unused")
public class SendDiagnosticPatch {

    private static final String TAG = "GMB_SEND_DIAGNOSTIC";

    /**
     * Called at index 0 of GMBMessageSender.sendGMBMessageToClient().
     * Logs the event type and payload to Android logcat.
     *
     * @param eventType The GMB event type string (e.g. "billing.reportPurchaseEvent")
     * @param payload   The JSON payload for this event
     */
    public static void logGMBSend(String eventType, String payload) {
        try {
            Log.d(TAG, "[TYPE] " + eventType);
            // Log payload separately — payloads can be large JSON strings
            // Truncate to 500 chars to keep logcat readable
            if (payload != null && payload.length() > 0) {
                String truncated = payload.length() > 500
                    ? payload.substring(0, 500) + "...[TRUNCATED]"
                    : payload;
                Log.d(TAG, "[PAYLOAD] " + truncated);
            }
        } catch (Exception e) {
            // Silent fail — never interfere with original sendGMBMessageToClient flow
        }
    }
}
