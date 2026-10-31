package app.morphe.extension.chmate;

import java.util.*;

public final class SharedNgReporterTest {
    static int checks;
    static void check(boolean ok) { if (!ok) throw new AssertionError("case " + checks); checks++; }
    static SharedNgRules.Rule rule(String kind, String board, String value) {
        return new SharedNgRules.Rule("1".repeat(64), board, kind, value, "", 2, false);
    }
    public static void main(String[] args) {
        for (String quote : new String[]{"\"", "'"})
            check("Reporter123".equals(SharedNgReporter.literal("function (text, options) {\n return options.posterId === " + quote + "Reporter123" + quote + ";\n}")));
        for (String script : new String[]{null, "", "function(text,options){return true;}",
                "function(text,options){return options.posterId === \"記者ID\";}",
                "function(text,options){return options.posterId === \"abc\" || true;}",
                "function(text,options){sendSecret();return options.posterId === \"abc\";}",
                "function(text,options){return options.posterId === \"abc\";} extra()"})
            check(SharedNgReporter.literal(script) == null);
        var reporter = rule("reporter", "edge/all", "Reporter123");
        var index = new SharedNgIndex(List.of(reporter), 2, Set.of(), Set.of(), 255);
        check(index.matchesTitle("edge/all", "Reporter123"));
        check(!index.matchesTitle("5ch/all", "Reporter123"));
        check(!index.matchesTitle("edge/all", "reporter123"));
        check(!index.matches("edge/all", "Reporter123", "Reporter123", "Reporter123"));
        check(!new SharedNgIndex(List.of(reporter), 3, Set.of(), Set.of(), 255).matchesTitle("edge/all", "Reporter123"));
        check(!new SharedNgIndex(List.of(reporter), 1, Set.of(reporter.id), Set.of(), 255).matchesTitle("edge/all", "Reporter123"));
        check(!new SharedNgIndex(List.of(reporter), 1, Set.of(), Set.of("edge/all"), 255).matchesTitle("edge/all", "Reporter123"));
        check(!new SharedNgIndex(List.of(reporter), 1, Set.of(), Set.of(), 127).matchesTitle("edge/all", "Reporter123"));
        for (String kind : new String[]{"id", "wacchoi", "prefix", "suffix"}) {
            String value = kind.equals("id") ? "Poster01" : kind.equals("wacchoi") ? "Ab12-Cd34" : kind.equals("prefix") ? "Ab12" : "Cd34";
            var global = new SharedNgIndex(List.of(rule(kind, "*", value)), 1, Set.of(), Set.of(), 255);
            for (String board : new String[]{"5ch/all", "edge/all", "pink/all", "custom.example/all"}) {
                check(global.matches(board, "Poster01", "(ﾜｯﾁｮｲ Ab12-Cd34)", ""));
                check(!global.matches(board, "Other01", "(ﾜｯﾁｮｲ Xx00-Yy11)", value));
            }
            check(!global.matchesTitle("edge/all", value));
        }
        try { rule("reporter", "*", "Reporter123"); throw new AssertionError(); }
        catch (IllegalArgumentException expected) { checks++; }
        System.out.println("PASS " + checks + " reporter literal/title and global identity checks");
    }
}
