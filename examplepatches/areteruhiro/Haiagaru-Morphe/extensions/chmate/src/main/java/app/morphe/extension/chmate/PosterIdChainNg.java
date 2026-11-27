package app.morphe.extension.chmate;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.HashSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/** Extends native reply chains to the other posts of an author suppressed by the same WORD rule. */
public final class PosterIdChainNg {
    public static final String PERFORMANCE_KEY = "posterIdChainNgOptimization";
    private static final int CHAIN = 8;
    private static final int ALSO_ID = 256;
    private static final int MAX_RULE_GROUPS = 4;
    private static final Map<Object, Set<String>> AUTHORS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final LinkedHashMap<RuleKey, RuleGroup> RULE_GROUPS =
            new LinkedHashMap<>(8, 0.75f, true);

    private PosterIdChainNg() { }

    /** Legacy adapters are reused when the thread or native NG registrations change. */
    public static void reset(Object owner) {
        AUTHORS.remove(owner);
    }

    /** Runs before the native chain-state write, so native ancestor traversal sees these roots too. */
    public static int merge(Object owner, Object response, int original) {
        if (original != 0 || owner == null || response == null) return original;
        try {
            Profile profile = profile(response.getClass().getSimpleName());
            Set<String> ids = AUTHORS.get(owner);
            if (ids == null) {
                ids = Collections.unmodifiableSet(authors(owner, response.getClass(), profile));
                AUTHORS.put(owner, ids);
            }
            Object id = field(response, profile.id);
            return id instanceof String && ids.contains(id) ? 1 : original;
        } catch (ReflectiveOperationException | RuntimeException error) {
            AUTHORS.put(owner, Collections.emptySet());
            Log.w("Haiagaru", "Poster ID chain NG: " + error.getClass().getSimpleName());
            return original;
        }
    }

    private static Set<String> authors(Object owner, Class<?> rowType, Profile profile)
            throws ReflectiveOperationException {
        return authors(owner, rowType, profile, false);
    }

    private static Set<String> authors(Object owner, Class<?> rowType, Profile profile, boolean hidden)
            throws ReflectiveOperationException {
        if (!Haiagaru.posterIdChainNgOptimizationEnabled())
            return authorsUncached(owner, rowType, profile, hidden);
        try {
            return authorsCached(owner, rowType, profile, hidden);
        } catch (ReflectiveOperationException | RuntimeException cacheFailure) {
            // Keep the original scanner as a safe fallback if a native model differs.
            return authorsUncached(owner, rowType, profile, hidden);
        }
    }

    private static Set<String> authorsUncached(Object owner, Class<?> rowType, Profile profile, boolean hidden)
            throws ReflectiveOperationException {
        Object matcher = field(owner, profile.word);
        List<Pattern> patterns = patterns(matcher, hidden);
        Set<String> ids = new HashSet<>();
        if (patterns.isEmpty()) return ids;
        Object source = field(owner, profile.rows);
        if (!(source instanceof List)) return ids;
        try {
            Object base = field(source, "mBase");
            if (base instanceof List) source = base;
        } catch (NoSuchFieldException ignored) { }
        for (Object row : (List<?>) source) {
            if (!rowType.isInstance(row)) continue;
            Object rawId = field(row, profile.id);
            if (!(rawId instanceof String)) continue;
            String id = (String) rawId;
            if (!usableId(id) || ids.contains(id)) continue;
            Object rawBody = field(row, profile.body);
            if (!(rawBody instanceof String)) continue;
            for (Pattern pattern : patterns) {
                if (pattern.matcher((String) rawBody).find()) {
                    ids.add(id);
                    break;
                }
            }
        }
        return ids;
    }

    private static Set<String> authorsCached(Object owner, Class<?> rowType, Profile profile, boolean hidden)
            throws ReflectiveOperationException {
        Object matcher = field(owner, profile.word);
        RuleGroup group = ruleGroup(rules(matcher, hidden), hidden);
        Set<String> ids = new HashSet<>();
        if (group.patterns.length == 0) return ids;
        Object source = field(owner, profile.rows);
        if (!(source instanceof List)) return ids;
        try {
            Object base = field(source, "mBase");
            if (base instanceof List) source = base;
        } catch (NoSuchFieldException ignored) { }
        MatchWorker worker = new MatchWorker(group.patterns);
        for (Object row : (List<?>) source) {
            if (!rowType.isInstance(row)) continue;
            Object rawId = field(row, profile.id);
            if (!(rawId instanceof String)) continue;
            String id = (String) rawId;
            if (!usableId(id) || ids.contains(id)) continue;
            Object rawBody = field(row, profile.body);
            if (!(rawBody instanceof String)) continue;
            if (matches(group, worker, (String) rawBody)) ids.add(id);
        }
        return ids;
    }

    private static List<Rule> rules(Object matcher, boolean hidden) throws ReflectiveOperationException {
        List<Rule> result = new ArrayList<>();
        if (matcher == null) return result;
        for (Class<?> type = matcher.getClass(); type != null; type = type.getSuperclass()) {
            for (Field candidate : type.getDeclaredFields()) {
                if (Modifier.isStatic(candidate.getModifiers())
                        || !List.class.isAssignableFrom(candidate.getType())) continue;
                candidate.setAccessible(true);
                Object value = candidate.get(matcher);
                if (!(value instanceof List)) continue;
                for (Object item : (List<?>) value) {
                    if (item == null || !item.getClass().getName().equals("jp.syoboi.a2chMate.ng.NGWord$Item")) continue;
                    int flags = flags(item);
                    if ((flags & (CHAIN | ALSO_ID)) != (CHAIN | ALSO_ID)
                            || (flags & (4 | 64 | 128)) != 0 || (hidden && (flags & 1) == 0)) continue;
                    String word = item.toString();
                    if (!word.isEmpty()) result.add(new Rule(flags, word));
                }
            }
        }
        return result;
    }

    private static RuleGroup ruleGroup(List<Rule> rules, boolean hidden) {
        RuleKey key = new RuleKey(rules, hidden);
        synchronized (RULE_GROUPS) {
            RuleGroup existing = RULE_GROUPS.get(key);
            if (existing != null) return existing;
            RuleGroup created = compile(rules);
            RULE_GROUPS.put(key, created);
            while (RULE_GROUPS.size() > MAX_RULE_GROUPS)
                RULE_GROUPS.remove(RULE_GROUPS.keySet().iterator().next());
            return created;
        }
    }

    private static RuleGroup compile(List<Rule> rules) {
        List<Pattern> result = new ArrayList<>();
        for (Rule rule : rules) {
            int mode = rule.flags & 0x70;
            String expression;
            if (mode == 0x20) expression = rule.word;
            else if (mode == 0 && rule.word.startsWith("/")) {
                expression = rule.word.substring(1);
                try { Pattern.compile(expression); }
                catch (PatternSyntaxException ignored) { expression = Pattern.quote(rule.word); }
            } else expression = Pattern.quote(rule.word);
            try { result.add(Pattern.compile(expression, Pattern.CASE_INSENSITIVE)); }
            catch (PatternSyntaxException ignored) { }
        }
        return new RuleGroup(result.toArray(new Pattern[0]));
    }

    private static boolean matches(RuleGroup group, MatchWorker worker, String body) {
        synchronized (group.bodyMatches) {
            if (group.bodyMatches.containsKey(body)) return Boolean.TRUE.equals(group.bodyMatches.get(body));
        }
        boolean matched = worker.matches(body);
        synchronized (group.bodyMatches) { group.bodyMatches.put(body, matched); }
        return matched;
    }

    private static final class MatchWorker {
        private final Matcher[] matchers;
        MatchWorker(Pattern[] patterns) {
            matchers = new Matcher[patterns.length];
            for (int i = 0; i < patterns.length; i++) matchers[i] = patterns[i].matcher("");
        }
        boolean matches(String body) {
            for (Matcher matcher : matchers) if (matcher.reset(body).find()) return true;
            return false;
        }
    }

    private static final class RuleGroup {
        final Pattern[] patterns;
        final WeakHashMap<String, Boolean> bodyMatches = new WeakHashMap<>();
        RuleGroup(Pattern[] patterns) { this.patterns = patterns; }
    }

    private static final class Rule {
        final int flags;
        final String word;
        Rule(int flags, String word) { this.flags = flags; this.word = word; }
        @Override public boolean equals(Object other) {
            if (!(other instanceof Rule)) return false;
            Rule value = (Rule) other;
            return flags == value.flags && word.equals(value.word);
        }
        @Override public int hashCode() { return 31 * flags + word.hashCode(); }
    }

    private static final class RuleKey {
        final List<Rule> rules;
        final boolean hidden;
        RuleKey(List<Rule> rules, boolean hidden) {
            this.rules = Collections.unmodifiableList(new ArrayList<>(rules));
            this.hidden = hidden;
        }
        @Override public boolean equals(Object other) {
            if (!(other instanceof RuleKey)) return false;
            RuleKey value = (RuleKey) other;
            return hidden == value.hidden && rules.equals(value.rules);
        }
        @Override public int hashCode() { return 31 * rules.hashCode() + (hidden ? 1 : 0); }
    }

    private static boolean usableId(String id) {
        return !id.isEmpty() && !id.startsWith("?") && !"DELETED".equals(id)
                && !"CAP_USER".equals(id) && !"OVER1000".equals(id);
    }

    /** Uses the board-filtered native WORD matcher, never another thread's board or NGID list. */
    private static List<Pattern> patterns(Object matcher, boolean hidden) throws ReflectiveOperationException {
        List<Pattern> result = new ArrayList<>();
        if (matcher == null) return result;
        for (Class<?> type = matcher.getClass(); type != null; type = type.getSuperclass()) {
            for (Field candidate : type.getDeclaredFields()) {
                if (Modifier.isStatic(candidate.getModifiers()) || !List.class.isAssignableFrom(candidate.getType())) continue;
                candidate.setAccessible(true);
                Object value = candidate.get(matcher);
                if (!(value instanceof List)) continue;
                for (Object item : (List<?>) value) {
                    if (item == null || !item.getClass().getName().equals("jp.syoboi.a2chMate.ng.NGWord$Item")) continue;
                    int flags = flags(item);
                    if ((flags & (CHAIN | ALSO_ID)) != (CHAIN | ALSO_ID)
                            || (flags & (4 | 64 | 128)) != 0 || (hidden && (flags & 1) == 0)) continue;
                    String word = item.toString();
                    if (word.isEmpty()) continue;
                    int mode = flags & 0x70;
                    String expression;
                    if (mode == 0x20) expression = word;
                    else if (mode == 0 && word.startsWith("/")) {
                        expression = word.substring(1);
                        try { Pattern.compile(expression); }
                        catch (PatternSyntaxException ignored) { expression = Pattern.quote(word); }
                    } else expression = Pattern.quote(word);
                    try { result.add(Pattern.compile(expression, Pattern.CASE_INSENSITIVE)); }
                    catch (PatternSyntaxException ignored) { }
                }
            }
        }
        return result;
    }

    /** Runs after native transparent-NG construction and before filtering/reference counts.
     * The display-chain cache is separate: setting it alone only produces a chain-aboon label.
     * These maps are rebuilt by ChMate; no saved NG registrations or DAT are changed.
     */
    public static void applyHidden(Object owner) {
        ProgrammableNgController.applySharedHidden(owner);
        RegisteredImageNg.apply(owner);
        EdgeLevelNg.apply(owner);
        ChainAboneVisibility.apply(owner);
        if (owner == null || !Haiagaru.hideNgWordIdReplies()) return;
        try {
            String rowsField, mapField, numberField, anchorsField;
            switch (owner.getClass().getSimpleName()) {
                case "m9ExternalSyntheticLambda1":
                    rowsField = "K"; mapField = "N"; numberField = "o"; anchorsField = "d"; break;
                case "listener":
                    rowsField = "J"; mapField = "K"; numberField = "l"; anchorsField = "a"; break;
                case "zzaW":
                    rowsField = "a"; mapField = "j"; numberField = "o"; anchorsField = "b"; break;
                default: return;
            }
            Object source = field(owner, rowsField);
            if (!(source instanceof List)) return;
            try {
                Object base = field(source, "mBase");
                if (base instanceof List) source = base;
            } catch (NoSuchFieldException ignored) { }
            List<?> rows = (List<?>) source;
            if (rows.isEmpty()) return;
            Class<?> rowType = rows.get(0).getClass();
            Profile profile = profile(rowType.getSimpleName());
            Set<String> ids = authors(owner, rowType, profile, true);
            if (ids.isEmpty()) return;
            Map<Integer, Integer> additions = new HashMap<>();
            Map<Integer, List<Integer>> replies = new HashMap<>();
            ArrayDeque<Integer> pending = new ArrayDeque<>();
            for (Object row : rows) {
                if (!rowType.isInstance(row)) continue;
                int number = ((Number) field(row, numberField)).intValue();
                if (number <= 0) continue;
                if (ids.contains(field(row, profile.id))) {
                    additions.put(number, 0x4000); // native NGWord-ID, in the transparent map
                    pending.add(number);
                }
                Object anchors = field(row, anchorsField);
                if (!(anchors instanceof int[])) continue;
                for (int parent : (int[]) anchors) {
                    // Match native chain traversal: only earlier response numbers.
                    if (parent > 0 && parent < number)
                        replies.computeIfAbsent(parent, ignored -> new ArrayList<>()).add(number);
                }
            }
            while (!pending.isEmpty()) {
                List<Integer> children = replies.get(pending.removeFirst());
                if (children == null) continue;
                for (int child : children) {
                    if (additions.containsKey(child)) continue;
                    additions.put(child, 0x1000); // native reply chain, in the transparent map
                    pending.add(child);
                }
            }
            Object target = field(owner, mapField);
            if (target instanceof Map) {
                @SuppressWarnings("unchecked") Map<Integer, Integer> map = (Map<Integer, Integer>) target;
                for (Map.Entry<Integer, Integer> entry : additions.entrySet()) {
                    Integer previous = map.get(entry.getKey());
                    map.put(entry.getKey(), (previous == null ? 0 : previous) | entry.getValue());
                }
            } else if (target instanceof android.util.SparseIntArray) {
                android.util.SparseIntArray map = (android.util.SparseIntArray) target;
                for (Map.Entry<Integer, Integer> entry : additions.entrySet())
                    map.put(entry.getKey(), map.get(entry.getKey(), 0) | entry.getValue());
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("Haiagaru", "Poster ID hidden chain NG: " + error.getClass().getSimpleName());
        }
    }

    private static int flags(Object item) throws IllegalAccessException {
        for (Field candidate : item.getClass().getDeclaredFields()) {
            if (!Modifier.isStatic(candidate.getModifiers()) && candidate.getType() == short.class) {
                candidate.setAccessible(true);
                return candidate.getShort(item) & 0xffff;
            }
        }
        throw new IllegalArgumentException("Native NG item flags unavailable");
    }

    private static Object field(Object value, String name) throws ReflectiveOperationException {
        return ResponseArchiveEntry.field(value, name);
    }

    private static Profile profile(String row) {
        switch (row) {
            case "processAdDisplayErrorPostbackForUserError": return new Profile("K", "C", "h", "c");
            case "BouncyCastleSocketAdapterCompanion": return new Profile("J", "A", "j", "d");
            case "setDislikeWidth": return new Profile("e", "b", "i", "g");
            case "KeJ11": return new Profile("a", "c", "g", "h");
            case "zzabv": return new Profile("b", "a", "h", "j");
            default: throw new IllegalArgumentException("Unsupported native NG model: " + row);
        }
    }

    private static final class Profile {
        final String rows, word, id, body;
        Profile(String rows, String word, String id, String body) {
            this.rows = rows; this.word = word; this.id = id; this.body = body;
        }
    }
}
