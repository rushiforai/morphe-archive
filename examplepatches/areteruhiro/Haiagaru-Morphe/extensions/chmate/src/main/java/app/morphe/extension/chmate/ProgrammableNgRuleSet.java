package app.morphe.extension.chmate;

import java.io.StringReader;
import java.io.StringWriter;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.Set;

/** Immutable, version-independent programmable NG configuration. */
final class ProgrammableNgRuleSet {
    static final int MAX_RULES = 32;

    static final class Rule {
        final String id;
        final String name;
        final String target;
        final boolean enabled;
        final boolean allBoards;
        final String boards;
        final String script;
        final ProgrammableNgScript evaluator;

        Rule(String id, String name, String target, boolean enabled, boolean allBoards,
             String boards, String script) {
            if (id == null || id.trim().isEmpty()) throw new IllegalArgumentException("ルールIDがありません");
            if (name == null || name.trim().isEmpty()) throw new IllegalArgumentException("ルール名を入力してください");
            if (!"title".equals(target) && !"body".equals(target)) {
                throw new IllegalArgumentException("判定対象が不正です");
            }
            if (script == null || script.length() > ProgrammableNgScript.MAX_SOURCE_LENGTH) {
                throw new IllegalArgumentException("JavaScriptが長すぎます");
            }
            String normalizedBoards = boards == null ? "" : boards.trim();
            if (!allBoards && normalizedBoards.isEmpty()) {
                throw new IllegalArgumentException("対象板URLを入力してください");
            }
            if (!allBoards) {
                for (String board : normalizedBoards.split("\\s+")) {
                    if (canonicalBoard(board) == null) {
                        throw new IllegalArgumentException("板URLが不正です: " + board);
                    }
                }
            }
            this.id = id.trim();
            this.name = name.trim();
            this.target = target;
            this.enabled = enabled;
            this.allBoards = allBoards;
            this.boards = normalizedBoards;
            this.script = script;
            this.evaluator = new ProgrammableNgScript(script);
        }

        boolean accepts(ProgrammableNgScript.Input input) {
            if (!enabled || !target.equals(input.values.get("target"))) return false;
            String current = canonicalBoard((String) input.values.get("boardUrl"));
            if (current == null) return false;
            if (allBoards) return true;
            for (String board : boards.split("\\s+")) {
                if (current.equals(canonicalBoard(board))) return true;
            }
            return false;
        }
    }

    final List<Rule> rules;
    volatile String batchError = "";

    ProgrammableNgRuleSet(List<Rule> rules) {
        if (rules.size() > MAX_RULES) throw new IllegalArgumentException("ルールは32件までです");
        Set<String> ids = new HashSet<>();
        for (Rule rule : rules) {
            if (!ids.add(rule.id)) throw new IllegalArgumentException("ルールIDが重複しています");
        }
        this.rules = Collections.unmodifiableList(new ArrayList<>(rules));
    }

    boolean[] evaluate(List<ProgrammableNgScript.Input> inputs) {
        boolean[] result = new boolean[inputs.size()];
        long deadline = System.nanoTime() + 500_000_000L;
        batchError = "";
        for (Rule rule : rules) {
            if (!rule.enabled) continue;
            ArrayList<ProgrammableNgScript.Input> selected = new ArrayList<>();
            ArrayList<Integer> positions = new ArrayList<>();
            for (int index = 0; index < inputs.size(); index++) {
                if (rule.accepts(inputs.get(index))) {
                    selected.add(inputs.get(index));
                    positions.add(index);
                }
            }
            if (selected.isEmpty()) continue;
            if (System.nanoTime() > deadline) {
                batchError = "ルール全体の実行時間を超えたため、この判定ではNGにしません";
                return new boolean[inputs.size()];
            }
            boolean[] matches = rule.evaluator.evaluate(selected);
            for (int index = 0; index < matches.length; index++) {
                result[positions.get(index)] |= matches[index];
            }
        }
        return result;
    }

    String encode() {
        Properties values = new Properties();
        values.setProperty("format", "1");
        values.setProperty("count", Integer.toString(rules.size()));
        for (int index = 0; index < rules.size(); index++) {
            Rule rule = rules.get(index);
            String prefix = index + ".";
            values.setProperty(prefix + "id", rule.id);
            values.setProperty(prefix + "name", rule.name);
            values.setProperty(prefix + "target", rule.target);
            values.setProperty(prefix + "enabled", Boolean.toString(rule.enabled));
            values.setProperty(prefix + "allBoards", Boolean.toString(rule.allBoards));
            values.setProperty(prefix + "boards", rule.boards);
            values.setProperty(prefix + "script", rule.script);
        }
        try {
            StringWriter writer = new StringWriter();
            values.store(writer, null);
            return writer.toString();
        } catch (java.io.IOException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    static ProgrammableNgRuleSet decode(String encoded) {
        if (encoded == null || encoded.trim().isEmpty()) return new ProgrammableNgRuleSet(Collections.emptyList());
        try {
            Properties values = new Properties();
            values.load(new StringReader(encoded));
            if (!"1".equals(values.getProperty("format"))) throw new IllegalArgumentException("未対応の保存形式です");
            int count = Integer.parseInt(values.getProperty("count", "0"));
            if (count < 0 || count > MAX_RULES) throw new IllegalArgumentException("ルール件数が不正です");
            ArrayList<Rule> rules = new ArrayList<>();
            for (int index = 0; index < count; index++) {
                String prefix = index + ".";
                rules.add(new Rule(
                        values.getProperty(prefix + "id"),
                        values.getProperty(prefix + "name"),
                        values.getProperty(prefix + "target"),
                        Boolean.parseBoolean(values.getProperty(prefix + "enabled")),
                        Boolean.parseBoolean(values.getProperty(prefix + "allBoards")),
                        values.getProperty(prefix + "boards"),
                        values.getProperty(prefix + "script")
                ));
            }
            return new ProgrammableNgRuleSet(rules);
        } catch (RuntimeException | java.io.IOException error) {
            throw new IllegalArgumentException("ルール設定を読み込めません: " + error.getMessage(), error);
        }
    }

    static String canonicalBoard(String value) {
        if (value == null) return null;
        try {
            URI uri = new URI(value.trim());
            String scheme = uri.getScheme();
            if (!("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme))
                    || uri.getHost() == null || uri.getUserInfo() != null
                    || uri.getQuery() != null || uri.getFragment() != null) return null;
            String path = uri.getPath();
            if (path == null || !path.matches("/[A-Za-z0-9_.-]+(?:/[A-Za-z0-9_.-]+)*/?")) return null;
            int port = uri.getPort();
            String authority = uri.getHost().toLowerCase(Locale.ROOT)
                    + (port == -1 || port == 80 || port == 443 ? "" : ":" + port);
            return authority + path.replaceAll("/+$", "");
        } catch (Exception ignored) {
            return null;
        }
    }
}
