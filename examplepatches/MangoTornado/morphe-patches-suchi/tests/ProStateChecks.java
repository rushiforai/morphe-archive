import java.util.HashMap;
import java.util.Map;

import suchi.morphe.extension.renshuu.ProState;

public final class ProStateChecks {
    public static void main(String[] args) {
        Map<String, Object> schedules = new HashMap<>();
        schedules.put("review", 5);
        Map<String, Object> data = new HashMap<>();
        data.put("proEnabled", "0");
        data.put("readingBuddy", "no");
        data.put("textAnaylzer", "no");
        data.put("id", "test-account");
        data.put("schedules", schedules);
        ProState.overrideLocalState(data);
        check("1".equals(data.get("proEnabled")), "Pro enabled");
        check("yes".equals(data.get("readingBuddy")), "Reading Buddy enabled");
        check("yes".equals(data.get("textAnaylzer")), "Text Analyzer enabled");
        check("test-account".equals(data.get("id")), "Account identity preserved");
        check(data.get("schedules") == schedules, "Schedule object preserved");
        check(data.size() == 5, "No extra keys");
        ProState.overrideLocalState(data);
        check(data.size() == 5, "Repeat call is stable");

        Map<String, Object> sparse = new HashMap<>();
        sparse.put("proEnabled", "0");
        ProState.overrideLocalState(sparse);
        check(sparse.size() == 1, "Missing feature keys preserved");

        Map<String, Object> guest = new HashMap<>();
        guest.put("displayName", "guest");
        Map<String, Object> before = new HashMap<>(guest);
        ProState.overrideLocalState(guest);
        check(guest.equals(before), "No Pro flag added to guest data");
        ProState.overrideLocalState(null);

        System.out.println("Pro state checks passed");
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
