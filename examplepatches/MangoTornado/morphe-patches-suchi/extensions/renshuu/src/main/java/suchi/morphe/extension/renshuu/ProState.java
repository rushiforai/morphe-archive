package suchi.morphe.extension.renshuu;

import java.util.Map;

public final class ProState {
    private ProState() {}

    public static void overrideLocalState(Map<String, Object> userData) {
        if (userData == null || !userData.containsKey("proEnabled")) return;

        userData.put("proEnabled", "1");
        if (userData.containsKey("readingBuddy")) userData.put("readingBuddy", "yes");
        if (userData.containsKey("textAnaylzer")) userData.put("textAnaylzer", "yes");
    }
}
