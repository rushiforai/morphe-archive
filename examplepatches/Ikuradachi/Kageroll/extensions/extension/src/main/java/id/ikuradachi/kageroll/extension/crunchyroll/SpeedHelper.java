package id.ikuradachi.kageroll.extension.crunchyroll;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class SpeedHelper {

    private static final List<Float> ALL_SPEEDS = Arrays.asList(
        4.0f, 3.5f, 3.0f, 2.5f, 2.25f, 2.0f, 1.75f, 1.5f, 1.25f, 1.0f, 0.75f, 0.5f
    );

    /**
     * Maximum playback speed included in the menu. Patched at build time by PlaybackSpeedPatch.
     */
    public static float getMaxSpeed() {
        return 4.0f;
    }

    private static List<Float> buildSpeeds() {
        float maxSpeed = getMaxSpeed();
        List<Float> filtered = new ArrayList<>();
        for (Float speed : ALL_SPEEDS) {
            if (speed <= maxSpeed) {
                filtered.add(speed);
            }
        }
        return filtered.isEmpty() ? ALL_SPEEDS : filtered;
    }

    public static void replaceSpeedList(Object viewModel) {
        try {
            List<Float> speeds = buildSpeeds();
            for (Field field : viewModel.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(viewModel);
                if (value == null) continue;
                try {
                    for (String name : new String[]{"getValue", "a", "b", "c", "d", "e", "f", "g"}) {
                        try {
                            java.lang.reflect.Method getter = value.getClass().getMethod(name);
                            Object result = getter.invoke(value);
                            if (result instanceof List) {
                                List<?> list = (List<?>) result;
                                if (list.size() == 3 && list.get(0) instanceof Float
                                        && ((Float) list.get(0)) == 1.0f) {
                                    for (Field f : value.getClass().getSuperclass().getDeclaredFields()) {
                                        f.setAccessible(true);
                                        Object inner = f.get(value);
                                        if (inner instanceof List) {
                                            f.set(value, speeds);
                                            return;
                                        }
                                    }
                                }
                                break;
                            }
                        } catch (Exception ignored) {}
                    }
                } catch (Exception ignored) {}
            }
        } catch (Exception ignored) {}
    }
}
