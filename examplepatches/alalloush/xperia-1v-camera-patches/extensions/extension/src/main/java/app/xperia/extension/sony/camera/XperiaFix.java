package app.xperia.extension.sony.camera;

import android.hardware.camera2.CaptureRequest;

import java.util.Arrays;

/**
 * Xperia 1 V compatibility shims for the Xperia 1 VI camera app (jp.co.sony.mc.cameraapp).
 * Both fixes were derived from the 1 V camera HAL's own validateCaptureSettings log output.
 * Injected into CaptureRequestHolder.setRequest(Builder, Key), the single choke point every request key
 * passes through.
 */
@SuppressWarnings("unused")
public final class XperiaFix {
    private static final String OBJECT_SELECT_TRIGGER_AREA = "com.sonymobile.statistics.objectSelectTriggerArea";
    private static final String SCENE_DETECT_MODE = "com.sonymobile.statistics.sceneDetectMode";
    private static final String CONDITION_DETECT_MODE = "com.sonymobile.statistics.conditionDetectMode";

    private static volatile CaptureRequest.Key<Integer> conditionDetectModeKey;

    private XperiaFix() {
    }

    /**
     * Injection point (before Builder.set).
     * The 1 V HAL defines objectSelectTriggerArea with 4 ints; the 1 VI app sends 5
     * ([left, top, right, bottom, frameNumber]) -> "Getting data count(5) is over". Truncate to 4.
     * Dropping the key is not an option: the HAL requires it present.
     */
    public static Object fixValue(CaptureRequest.Key<?> key, Object value) {
        if (value instanceof int[] && OBJECT_SELECT_TRIGGER_AREA.equals(key.getName())) {
            int[] area = (int[]) value;
            if (area.length > 4) {
                return Arrays.copyOf(area, 4);
            }
        }
        return value;
    }

    /**
     * Injection point (after Builder.set).
     * The 1 V HAL validates sceneDetectMode together with conditionDetectMode ("Fail scene detect mode or
     * condition detect mode"); the 1 VI app never sets the latter. Photo Pro on the 1 V sends 1.
     */
    public static void afterSet(CaptureRequest.Builder builder, CaptureRequest.Key<?> key) {
        if (!SCENE_DETECT_MODE.equals(key.getName())) {
            return;
        }
        try {
            CaptureRequest.Key<Integer> conditionKey = conditionDetectModeKey;
            if (conditionKey == null) {
                conditionKey = new CaptureRequest.Key<>(CONDITION_DETECT_MODE, int.class);
                conditionDetectModeKey = conditionKey;
            }
            builder.set(conditionKey, 1);
        } catch (IllegalArgumentException ignored) {
            // Tag absent on this HAL: nothing to add.
        }
    }
}
