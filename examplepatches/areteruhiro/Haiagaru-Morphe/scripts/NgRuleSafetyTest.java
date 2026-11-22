package app.morphe.extension.chmate;

public final class NgRuleSafetyTest {
    private static int checks;
    private static void ok(boolean value, String label) {
        if (!value) throw new AssertionError(label);
        checks++;
    }
    public static void main(String[] args) {
        for (String category : new String[]{"ID", "NAME", "WORD"}) {
            ok(NgRuleSafety.rejection(category, "[\\x{E000}-\\x{F8FF}]") == null, "local private-use regex allowed");
        }
        ok(NgRuleSafety.rejection("WORD", "短") == null, "one-character local word allowed");
        ok(NgRuleSafety.rejection("WORD", "😀") == null, "one-emoji local word allowed");
        ok(NgRuleSafety.rejection("WORD", " \t") != null, "blank word rejected");
        for (String kind : new String[]{"id", "name", "keyword"}) {
            for (String regex : new String[]{"[\\x{E000}-\\x{F8FF}]", "[\\x{F0000}-\\x{FFFFD}]",
                    "[\\x{100000}-\\x{10FFFD}]", "[\\uF8FF-\\uE000]"}) {
                ok(!SharedNgRules.shareableCondition(kind, regex, true), "shared private-use regex excluded");
            }
        }
        ok(SharedNgRules.shareableCondition("keyword", "日本語.*対象", true), "ordinary shared regex allowed");
        ok(!SharedNgRules.shareableCondition("keyword", "短", false), "short shared word excluded");
        String unsafe = "[\\x{E000}-\\x{F8FF}]";
        String id = "a".repeat(64);
        SharedNgRules.Rule remote = new SharedNgRules.Rule(id, "*", "name", unsafe, "", 1, false, 1, 0, true);
        ok(!remote.expressionMatches("\uE000"), "legacy remote private-use regex ignored");
        ok(remote.localValue(unsafe, true).expressionMatches("\uE000"), "local edit can use private-use regex");
        System.out.println("PASS " + checks + " NG rule safety checks");
    }
}
