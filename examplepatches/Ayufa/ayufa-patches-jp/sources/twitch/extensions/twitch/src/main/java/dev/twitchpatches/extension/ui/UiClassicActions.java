package dev.twitchpatches.extension.ui;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.function.Predicate;

public final class UiClassicActions {
    public static List<?> filter(List<?> buttons) {
        return filter(buttons, UiComposeBridge::classicButtonId, UiSettings::enabled);
    }

    public static ArrayList<?> filterMetadata(ArrayList<?> buttons) {
        List<?> filtered = filter(buttons, UiComposeBridge::metadataButtonId, UiSettings::enabled);
        return filtered == buttons ? buttons : new ArrayList<>(filtered);
    }

    static <T> List<T> filter(List<T> buttons, Function<T, String> identity, Predicate<String> hidden) {
        List<T> result = null;
        for (int index = 0; index < buttons.size(); index++) {
            T button = buttons.get(index);
            String key = preference(identity.apply(button));
            if (key != null && hidden.test(key)) {
                if (result == null) result = new ArrayList<>(buttons.subList(0, index));
            } else if (result != null) result.add(button);
        }
        return result == null ? buttons : result;
    }

    private static String preference(String id) {
        if ("bits_button_chat".equals(id)) return "classic_support_hide_bits";
        if ("subscribe_button".equals(id) || "subscribe_button_chat".equals(id) || "upgrade_sub_button".equals(id))
            return "classic_support_hide_subscribe";
        if ("gift_button_chat".equals(id) || "gift_button".equals(id)) return "classic_support_hide_gift";
        return null;
    }
}
