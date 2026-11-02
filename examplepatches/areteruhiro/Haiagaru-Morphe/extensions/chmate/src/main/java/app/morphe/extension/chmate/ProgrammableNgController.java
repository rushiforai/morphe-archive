package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.Html;
import android.util.Log;
import android.widget.Button;
import android.widget.LinearLayout;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Runtime bridge shared by every supported ChMate profile. */
public final class ProgrammableNgController {
    static final String PREFS = "haiagaru.programmable-ng";
    static final String RULES_KEY = "rules";
    static final String ENABLED_KEY = "enabled";
    private static final Pattern URL_INFO = Pattern.compile("server:([^,}]+),\\s*name:([^,}]+)");
    private static final Pattern REPORTER = Pattern.compile("\\s+\\[([^\\[\\]\\s]+)★\\]\\s*$");
    private static final String UNKNOWN_BOARD = "https://unknown.invalid/board/";
    private static final Map<Object, Set<Integer>> LEGACY_RESPONSE_MATCHES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Object> PENDING_SUBJECT_LIST = new ThreadLocal<>();
    private static final ThreadLocal<Object> PENDING_RESPONSE_LIST = new ThreadLocal<>();
    private static final Map<Object, Set<Integer>> MODERN_RESPONSE_MATCHES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, String> RESPONSE_BOARDS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<String, ProgrammableNgScript.Input> THREAD_METADATA =
            Collections.synchronizedMap(new LinkedHashMap<String, ProgrammableNgScript.Input>(128, 0.75f, true) {
                @Override protected boolean removeEldestEntry(Map.Entry<String, ProgrammableNgScript.Input> eldest) {
                    return size() > 3000;
                }
            });

    private static volatile Context context;
    private static volatile boolean enabled;
    private static volatile ProgrammableNgRuleSet rules = new ProgrammableNgRuleSet(Collections.emptyList());
    private static volatile List<ProgrammableNgScript.Input> lastTitles = Collections.emptyList();
    private static volatile List<ProgrammableNgScript.Input> lastBodies = Collections.emptyList();
    private static volatile java.lang.ref.WeakReference<Object> previewSource=new java.lang.ref.WeakReference<>(null);
    private static volatile String previewBoard=UNKNOWN_BOARD;
    private static volatile String runtimeError = "";
    private static volatile String lastBoardUrl;

    private ProgrammableNgController() {}

    public static void initialize(Context supplied) {
        if (supplied == null || context != null) return;
        Context application = supplied.getApplicationContext();
        context = application == null ? supplied : application;
        SharedNg.initialize(context);
        try {
            reload();
            F9NgUpdates.maybeUpdate(context);
        } catch (Exception error) {
            report("初期化", error);
        }
    }

    static void reload() {
        Context current = context;
        if (current == null) return;
        SharedPreferences preferences = current.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        try {
            rules = ProgrammableNgRuleSet.decode(preferences.getString(RULES_KEY, ""));
            enabled = preferences.getBoolean(ENABLED_KEY, false);
            runtimeError = "";
        } catch (IllegalArgumentException error) {
            enabled = false;
            report("設定読込", error);
        }
        LEGACY_RESPONSE_MATCHES.clear();
        MODERN_RESPONSE_MATCHES.clear();
    }

    static ProgrammableNgRuleSet currentRules() {
        return rules;
    }

    static boolean isEnabled() {
        return enabled;
    }

    static synchronized void save(boolean newEnabled, List<ProgrammableNgRuleSet.Rule> newRules) {
        Context current = context;
        if (current == null) throw new IllegalStateException("Haiagaruが初期化されていません");
        ProgrammableNgRuleSet checked = new ProgrammableNgRuleSet(newRules);
        if (!current.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putBoolean(ENABLED_KEY, newEnabled)
                .putString(RULES_KEY, checked.encode())
                .commit()) {
            throw new IllegalStateException("設定を保存できませんでした");
        }
        reload();
        PersonalNgSubmissions.changed();
    }

    static ProgrammableNgRuleSet.Rule newRule() {
        return new ProgrammableNgRuleSet.Rule(
                UUID.randomUUID().toString(), "新しいルール", "title", true, true, "",
                "function (text, options) {\n  return false;\n}"
        );
    }

    static ProgrammableNgRuleSet.Rule templateRule(int template) {
        String id = UUID.randomUUID().toString();
        switch (template) {
            case 0:
                return new ProgrammableNgRuleSet.Rule(id, "スレタイのキーワード", "title",
                        true, true, "", "function (text, options) {\n"
                        + "  return text.includes(\"キーワード\");\n}");
            case 1:
                return new ProgrammableNgRuleSet.Rule(id, "レス本文のキーワード", "body",
                        true, true, "", "function (text, options) {\n"
                        + "  return text.includes(\"キーワード\");\n}");
            case 2:
                return new ProgrammableNgRuleSet.Rule(id, "正規表現", "title",
                        true, true, "", "function (text, options) {\n"
                        + "  return /正規表現/i.test(text);\n}");
            case 3:
                return new ProgrammableNgRuleSet.Rule(id, "エッヂの記者ID", "title",
                        true, true, "", "function (text, options) {\n"
                        + "  return options.posterId === \"記者ID\";\n}");
            case 4:
                return new ProgrammableNgRuleSet.Rule(id, "キーワード・投稿者・返信の連鎖", "body",
                        true, true, "", "function (text, options) {\n"
                        + "  return {\n"
                        + "    match: text.includes(\"NGワード\"),\n"
                        + "    samePoster: true,\n"
                        + "    chainReplies: true\n"
                        + "  };\n}");
            case 5:
                return new ProgrammableNgRuleSet.Rule(id, "F9スクリプトを対策する", "body",
                        true, true, "", context==null?F9NgTemplate.SCRIPT:F9NgUpdates.currentScript(context));
            default:
                return newRule();
        }
    }

    public static void addSettingsButton(LinearLayout parent, Activity activity) {
        if (context == null) return;
        Button button = new Button(activity);
        button.setText("高度なNGルール（条件・スクリプト）");
        button.setOnClickListener(view -> ProgrammableNgDialog.show(activity));
        parent.addView(button);
        F9NgUpdates.addSettings(parent,activity);
        Button shared = new Button(activity);shared.setText("オンライン共有NG（開発中）");
        shared.setOnClickListener(view -> SharedNg.settings(activity));parent.addView(shared);
    }

    /**
     * Filters the raw subject list before version-specific ViewModels transform it.
     * This boundary exists in all four supported APKs and avoids obfuscated UI types.
     */
    public static Object filterSubjectList(Object result, Object urlOrArguments) {
        if (!(result instanceof List) || context == null) return result;
        String board = boardUrl(urlOrArguments);
        if (board == null) return result;
        lastBoardUrl = board;
        List<?> values = (List<?>) result;
        ArrayList<ProgrammableNgScript.Input> inputs = new ArrayList<>(values.size());
        for (Object value : values) inputs.add(threadInput(value, board));
        lastTitles = inputs;
        if ((!enabled && !SharedNg.enabled()) || values.isEmpty()) return result;
        boolean[] matches = evaluateBodies(inputs);
        try {
            for (int index = matches.length - 1; index >= 0; index--) {
                if (matches[index]) ((List<?>) result).remove(index);
            }
        } catch (RuntimeException error) {
            report("スレ一覧", error);
        }
        return result;
    }

    /** Two-step bridge used where the two source registers cannot be encoded in one invoke. */
    public static void pendingSubjectList(Object result) {
        PENDING_SUBJECT_LIST.set(result);
    }

    public static void filterPendingSubjectList(Object urlOrArguments) {
        Object result = PENDING_SUBJECT_LIST.get();
        PENDING_SUBJECT_LIST.remove();
        // filterSubjectList mutates ChMate's original list in place.  Do not
        // return it as Object: newer ChMate versions keep this value in a
        // precisely typed register and ART rejects an Object move-result.
        filterSubjectList(result, urlOrArguments);
    }

    /** 191 dev keeps its native hidden-list behavior, so excluded rows remain revealable. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static ArrayList filterLegacyThreadRows(Object fragment, ArrayList candidates, ArrayList hidden) {
        if (candidates == null || context == null) return candidates;
        try {
            Object urlInfo = field(fragment, "e");
            String board = boardUrl(urlInfo);
            if (board == null) return candidates;
            lastBoardUrl = board;
            ArrayList<ProgrammableNgScript.Input> inputs = new ArrayList<>();
            for (Object row : candidates) {
                Object data = field(row, "a");
                inputs.add(threadInput(data, board));
            }
            lastTitles = inputs;
            if (!enabled && !SharedNg.enabled()) return candidates;
            boolean[] matches = evaluateBodies(inputs);
            ArrayList kept = new ArrayList();
            ArrayList excluded = new ArrayList();
            for (int index = 0; index < candidates.size(); index++) {
                (matches[index] ? excluded : kept).add(candidates.get(index));
            }
            if (hidden != null) hidden.addAll(excluded);
            return excluded.isEmpty() ? candidates : kept;
        } catch (Exception error) {
            report("191スレ一覧", error);
            return candidates;
        }
    }

    /** Range-friendly overload: the matcher parameter is intentionally left to ChMate. */
    @SuppressWarnings("rawtypes")
    public static ArrayList filterLegacyThreadRows(
            Object fragment, ArrayList candidates, Object matcher, ArrayList hidden
    ) {
        return filterLegacyThreadRows(fragment, candidates, hidden);
    }

    /** Index body-rule matches once per 191 adapter rebuild. */
    public static void prepareLegacyResponses(Object adapter) {
        EdgeLevelNg.bindLegacy(adapter,false);
        HiddenNgUnread.begin(adapter);
        HiddenIdNg.prepare(adapter);
        try{previewSource=new java.lang.ref.WeakReference<>(field(adapter,"K"));previewBoard=boardUrl(field(field(adapter,"M"),"f"));}catch(Exception ignored){}
        LEGACY_RESPONSE_MATCHES.put(adapter, Collections.emptySet());
        if (context == null || !bodyRulesEnabled()) return;
        try {
            Object state = field(adapter, "M");
            String board = boardUrl(field(state, "f"));
            if (board == null) return;
            lastBoardUrl = board;
            Object responseList = field(adapter, "K");
            List<?> responses = originalResponses(responseList);
            ArrayList<ProgrammableNgScript.Input> inputs = new ArrayList<>();
            ArrayList<Integer> numbers = new ArrayList<>();
            String title = null;
            try { title = stringField(responseList, "title"); } catch (NoSuchFieldException ignored) { }
            for (Object response : responses) {
                int number = ((Number) field(response, "o")).intValue();
                Map<String, Object> values = baseValues("body", board);
                values.put("responseNumber", number);
                values.put("responseId", field(response, "h"));
                values.put("threadTitle", title == null ? "" : title);
                values.put("name", plain(stringField(response, "n")));
                values.put("mail", field(response, "j"));
                values.put("dateText", field(response, "q"));
                inputs.add(new ProgrammableNgScript.Input(plain(stringField(response, "c")), values));
                numbers.add(number);
            }
            lastBodies = inputs;
            if (!enabled && !SharedNg.enabled()) return;
            ProgrammableNgRuleSet active = rules;
            boolean[] matches = evaluateBodies(inputs);
            HashSet<Integer> matched = new HashSet<>();
            for (int index = 0; index < matches.length; index++) if (matches[index]) matched.add(numbers.get(index));
            synchronized (LEGACY_RESPONSE_MATCHES) {
                if ((enabled || SharedNg.enabled()) && active == rules) LEGACY_RESPONSE_MATCHES.put(adapter, matched);
            }
        } catch (Exception error) {
            report("191レス一覧", error);
        }
    }

    /** Adds the standard NGWord bit while preserving every flag ChMate already produced. */
    public static int mergeLegacyResponseFlags(Object adapter, Object response, int original) {
        original = RedIdAutoNg.merge(response, HiddenIdNg.merge(adapter, response, original));
        if (!enabled && !SharedNg.enabled()) return HiddenNgUnread.observe(adapter,response,original);
        try {
            if (!LEGACY_RESPONSE_MATCHES.containsKey(adapter)) prepareLegacyResponses(adapter);
            Set<Integer> matches = LEGACY_RESPONSE_MATCHES.get(adapter);
            if (matches != null && matches.contains(((Number) field(response, "o")).intValue())) {
                return HiddenNgUnread.observe(adapter,response,original | 0x10);
            }
        } catch (Exception error) {
            report("191レスフラグ", error);
        }
        return HiddenNgUnread.observe(adapter,response,original);
    }

    /** Keeps the response list in a range-encodable register for modern renderers. */
    public static void pendingModernResponses(Object responses) {
        HiddenIdNg.pending(responses);
        PosterHighlight.observeResponses(responses);
        PENDING_RESPONSE_LIST.set(responses);
    }

    /** Use the full DAT source even when the current UI list is filtered. */
    private static List<?> originalResponses(Object source) throws ReflectiveOperationException {
        if (!(source instanceof List)) return Collections.emptyList();
        try {
            Object base = field(source, "mBase");
            if (base instanceof List) return (List<?>) base;
        } catch (NoSuchFieldException ignored) { }
        return (List<?>) source;
    }

    /** 242's DAT result supplies the exact board; never borrow another open tab's board. */
    public static void bindModernResponses(Object result) {
        try{EdgeLevelNg.bind(field(result,"a"),field(result,"d"));}catch(Exception ignored){}
        try {
            List<?> responses = originalResponses(field(result, "a"));
            if (responses.isEmpty()) return;
            RESPONSE_BOARDS.remove(responses.get(0));
            String board = boardUrl(field(result, "d"));
            previewSource=new java.lang.ref.WeakReference<>(field(result,"a"));previewBoard=board;
            if (board != null) RESPONSE_BOARDS.put(responses.get(0), board);
        } catch (ReflectiveOperationException | RuntimeException error) { report("レスの板情報", error); }
    }

    /** Adds standard NGWord flags to the map consumed by 241/243 row composition. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Map applyPendingModernResponseFlags(Object flags) {
        Object pending = PENDING_RESPONSE_LIST.get();
        PENDING_RESPONSE_LIST.remove();
        Map originalMap = RedIdAutoNg.modernFlags(pending, flags instanceof Map ? (Map) flags : null);
        if (!(pending instanceof List) || originalMap == null || context == null || !bodyRulesEnabled()) return originalMap;
        try {
            List<?> responses = originalResponses(pending);
            String board = responses.isEmpty() ? null : RESPONSE_BOARDS.get(responses.get(0));
            if (board == null) board = UNKNOWN_BOARD;
            ArrayList<ProgrammableNgScript.Input> inputs = new ArrayList<>(responses.size());
            ArrayList<Integer> numbers = new ArrayList<>(responses.size());
            for (Object response : responses) {
                ResponseData data = responseData(response);
                inputs.add(data.input(board, ""));
                numbers.add(data.number);
            }
            lastBodies = inputs;
            if ((!enabled && !SharedNg.enabled()) || inputs.isEmpty()) return originalMap;
            ProgrammableNgRuleSet active = rules;
            boolean[] matches = evaluateBodies(inputs);
            Map map = null;
            for (int index = 0; index < matches.length; index++) {
                if (!matches[index]) continue;
                if (map == null) map = new LinkedHashMap(originalMap);
                Integer number = numbers.get(index);
                Object previous = map.get(number);
                int original = previous instanceof Number ? ((Number) previous).intValue() : 0;
                map.put(number, original | 0x10);
            }
            return (!enabled && !SharedNg.enabled()) || active != rules || map == null ? originalMap : map;
        } catch (Exception error) {
            report("レス一覧", error);
            return originalMap;
        }
    }

    /** 226 needs the whole source list to expand authors/replies and to refresh cached decisions. */
    public static void prepareModernResponses(Object owner) {
        EdgeLevelNg.bindLegacy(owner,true);
        HiddenNgUnread.begin(owner);
        HiddenIdNg.prepare(owner);
        try{previewSource=new java.lang.ref.WeakReference<>(field(owner,"J"));previewBoard=boardUrl(field(field(owner,"E"),"j"));}catch(Exception ignored){}
        MODERN_RESPONSE_MATCHES.put(owner, Collections.emptySet());
        if (context == null || !bodyRulesEnabled()) return;
        try {
            String board = boardUrl(field(field(owner, "E"), "j"));
            if (board == null) return;
            List<?> responses = originalResponses(field(owner, "J"));
            ArrayList<ProgrammableNgScript.Input> inputs = new ArrayList<>(responses.size());
            ArrayList<Integer> numbers = new ArrayList<>(responses.size());
            for (Object response : responses) {
                ResponseData data = responseData(response);
                inputs.add(data.input(board, "")); numbers.add(data.number);
            }
            lastBodies = inputs;
            if (!enabled && !SharedNg.enabled()) return;
            ProgrammableNgRuleSet active = rules;
            boolean[] matches = evaluateBodies(inputs);
            Set<Integer> matched = new HashSet<>();
            for (int i = 0; i < matches.length; i++) if (matches[i]) matched.add(numbers.get(i));
            synchronized (MODERN_RESPONSE_MATCHES) {
                if ((enabled || SharedNg.enabled()) && active == rules) MODERN_RESPONSE_MATCHES.put(owner, matched);
            }
        } catch (Exception error) { report("226レス一覧", error); }
    }

    /** Adds the same NGWord bit at the per-response boundary used by 226 dev. */
    public static int mergeModernResponseFlags(Object owner, Object response, int original) {
        original = RedIdAutoNg.merge(response, HiddenIdNg.merge(owner, response, original));
        if ((!enabled && !SharedNg.enabled()) || context == null || response == null) return HiddenNgUnread.observe(owner,response,original);
        try {
            if (!MODERN_RESPONSE_MATCHES.containsKey(owner)) prepareModernResponses(owner);
            Set<Integer> matches = MODERN_RESPONSE_MATCHES.get(owner);
            return HiddenNgUnread.observe(owner,response,matches != null && matches.contains(responseData(response).number) ? original | 0x10 : original);
        } catch (Exception error) {
            report("226レスフラグ", error);
            return original;
        }
    }

    private static ResponseData responseData(Object response) throws ReflectiveOperationException {
        String name = response.getClass().getSimpleName();
        if ("BouncyCastleSocketAdapterCompanion".equals(name)) {
            return new ResponseData(response, "l", "j", "m", "g", "t", "d");
        }
        if ("setDislikeWidth".equals(name)) {
            return new ResponseData(response, "e", "i", "d", "b", "c", "a");
        }
        if ("zzabv".equals(name)) {
            return new ResponseData(response, "n", "h", "o", "g", "p", "j");
        }
        if ("KeJ11".equals(name)) {
            return new ResponseData(response, "o", "g", "n", "j", "p", "h");
        }
        throw new IllegalArgumentException("未対応のレス型: " + name);
    }

    private static final class ResponseData {
        final int number;
        final Object responseId;
        final String name;
        final Object mail;
        final Object date;
        final String body;

        ResponseData(Object response, String numberField, String idField, String nameField,
                     String mailField, String dateField, String bodyField)
                throws ReflectiveOperationException {
            number = ((Number) field(response, numberField)).intValue();
            responseId = field(response, idField);
            name = plain(stringField(response, nameField));
            mail = field(response, mailField);
            date = field(response, dateField);
            body = plain(stringField(response, bodyField));
        }

        ProgrammableNgScript.Input input(String board, String title) {
            Map<String, Object> values = baseValues("body", board);
            values.put("responseNumber", number);
            values.put("responseId", responseId);
            values.put("threadTitle", title);
            values.put("name", name);
            values.put("mail", mail);
            values.put("dateText", date);
            return new ProgrammableNgScript.Input(body, values);
        }
    }

    private static ProgrammableNgScript.Input threadInput(Object item, String board) {
        long threadId = 0;
        int responseCount = -1;
        String title = "";
        try {
            Object target = unwrapThreadItem(item);
            for (Field field : allFields(target.getClass())) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                Object value = field.get(target);
                if (field.getType() == long.class || value instanceof Long) {
                    long candidate = ((Number) value).longValue();
                    if (candidate > 100_000_000L && candidate < 10_000_000_000L) threadId = candidate;
                } else if ((field.getType() == int.class || value instanceof Integer) && responseCount < 0) {
                    int candidate = ((Number) value).intValue();
                    if (candidate >= 0) responseCount = candidate;
                } else if (value instanceof String) {
                    String candidate = (String) value;
                    if (!candidate.startsWith("http") && candidate.length() > title.length()) title = candidate;
                }
            }
        } catch (Exception error) {
            report("スレ情報", error);
        }
        Matcher reporter = REPORTER.matcher(title);
        String reporterId = null;
        if (reporter.find()) {
            reporterId = reporter.group(1);
            title = title.substring(0, reporter.start());
        }
        long now = System.currentTimeMillis();
        Long createdAt = threadId > 0 && threadId < 9_240_000_000L ? threadId * 1000L : null;
        Map<String, Object> values = baseValues("title", board);
        values.put("threadId", threadId > 0 ? threadId : null);
        values.put("createdAtMs", createdAt);
        values.put("resCount", responseCount >= 0 ? responseCount : null);
        values.put("speed", createdAt != null && now > createdAt && responseCount >= 0
                ? responseCount * 86_400_000.0 / (now - createdAt) : null);
        values.put("posterId", reporterId);
        ProgrammableNgScript.Input input = new ProgrammableNgScript.Input(title, values);
        if (threadId > 0) THREAD_METADATA.put(board + "#" + threadId, input);
        return input;
    }

    private static Object unwrapThreadItem(Object item) throws ReflectiveOperationException {
        if (item == null) throw new IllegalArgumentException("thread item is null");
        for (Field field : allFields(item.getClass())) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()
                    || field.getType() == String.class) continue;
            field.setAccessible(true);
            Object nested = field.get(item);
            if (nested == null) continue;
            boolean hasLong = false;
            boolean hasString = false;
            for (Field candidate : allFields(nested.getClass())) {
                hasLong |= candidate.getType() == long.class;
                hasString |= candidate.getType() == String.class;
            }
            if (hasLong && hasString) return nested;
        }
        return item;
    }

    private static Map<String, Object> baseValues(String target, String board) {
        Map<String, Object> values = new LinkedHashMap<>();
        values.put("apiVersion", 2);
        values.put("target", target);
        values.put("boardUrl", board);
        values.put("threadId", null);
        values.put("createdAtMs", null);
        values.put("resCount", null);
        values.put("speed", null);
        values.put("posterId", null);
        values.put("responseNumber", null);
        values.put("responseId", null);
        return values;
    }

    private static String boardUrl(Object value) {
        if (value instanceof Object[]) {
            for (Object item : (Object[]) value) {
                String found = boardUrl(item);
                if (found != null) return found;
            }
            return null;
        }
        if (value == null) return null;
        String text = value.toString();
        if (ProgrammableNgRuleSet.canonicalBoard(text) != null) return text;
        Matcher matcher = URL_INFO.matcher(text);
        if (!matcher.find()) return null;
        String result = "https://" + matcher.group(1).trim() + "/" + matcher.group(2).trim() + "/";
        return ProgrammableNgRuleSet.canonicalBoard(result) == null ? null : result;
    }

    private static String findBoardUrl(Object value, int depth, java.util.IdentityHashMap<Object, Boolean> seen) {
        if (value == null || depth < 0 || seen.put(value, Boolean.TRUE) != null) return null;
        String direct = boardUrl(value);
        if (direct != null) return direct;
        Class<?> type = value.getClass();
        String packageName = type.getName();
        if (packageName.startsWith("java.") || packageName.startsWith("android.")) return null;
        for (Field candidate : allFields(type)) {
            if (Modifier.isStatic(candidate.getModifiers()) || candidate.getType().isPrimitive()) continue;
            try {
                candidate.setAccessible(true);
                String found = findBoardUrl(candidate.get(value), depth - 1, seen);
                if (found != null) return found;
            } catch (Exception ignored) {
                // Obfuscated optional state is best-effort; the last opened board remains the fallback.
            }
        }
        return null;
    }

    private static Object field(Object owner, String name) throws ReflectiveOperationException {
        return NativeFields.find(owner.getClass(),name).get(owner);
    }

    private static String stringField(Object owner, String name) throws ReflectiveOperationException {
        Object value = field(owner, name);
        return value instanceof String ? (String) value : null;
    }

    private static List<Field> allFields(Class<?> type) {
        return NativeFields.all(type);
    }

    @SuppressWarnings("deprecation")
    static List<ProgrammableNgScript.Input> sharedReportInputs(){
        return sharedReportInputs(previewSource.get(),previewBoard);
    }
    static Object[] captureSharedReportSource(Activity activity)throws Exception{
        Object fragment=ExtraQuickFilters.visibleFragment(activity);if(fragment==null)throw new IllegalStateException("表示中のスレがありません");
        String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
        Object source,board=NativeThreadContext.board(fragment,version);
        if("0.8.10.191 dev".equals(version)){source=field(field(fragment,"c"),"K");}
        else{Object model=QuickFilterToolbar.findResponseViewModel(fragment);
            if("0.8.10.226 dev".equals(version)){source=reportFlow(model,"y","c");}
            else{source=field(reportFlow(model,"l","d"),"c");}}
        String url=boardUrl(board);if(url==null||UNKNOWN_BOARD.equals(url))throw new IllegalStateException("板情報を取得できません");
        return new Object[]{new ArrayList<>(originalResponses(source)),url};
    }
    private static Object reportFlow(Object model,String name,String getter)throws Exception{
        Object value=field(model,name);java.lang.reflect.Method method=value.getClass().getMethod(getter);method.setAccessible(true);return method.invoke(value);
    }
    @SuppressWarnings("deprecation")
    static List<ProgrammableNgScript.Input> sharedReportInputs(Object source,String board){
        if(source==null||board==null||board.equals(UNKNOWN_BOARD))return Collections.emptyList();
        ArrayList<ProgrammableNgScript.Input> inputs=new ArrayList<>();
        try{for(Object response:originalResponses(source)){
            if(response.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError")){
                Map<String,Object> values=baseValues("body",board);
                values.put("responseNumber",field(response,"o"));values.put("responseId",field(response,"h"));values.put("name",plain(stringField(response,"n")));values.put("mail",field(response,"j"));values.put("dateText",field(response,"q"));
                inputs.add(new ProgrammableNgScript.Input(plain(stringField(response,"c")),values));
            }else inputs.add(responseData(response).input(board,""));
        }}catch(Exception error){report("共有NGの投稿選択",error);return Collections.emptyList();}
        return inputs;
    }
    static void sharedNgChanged(){LEGACY_RESPONSE_MATCHES.clear();MODERN_RESPONSE_MATCHES.clear();}
    private static boolean[] evaluateBodies(List<ProgrammableNgScript.Input> inputs){
        boolean[] result=enabled?rules.evaluate(inputs):new boolean[inputs.size()];
        boolean[] shared=SharedNg.match(inputs);for(int i=0;i<result.length;i++)result[i]|=shared[i];return result;
    }
    private static boolean bodyRulesEnabled(){if(SharedNg.enabled())return true;if(!enabled)return false;for(ProgrammableNgRuleSet.Rule rule:rules.rules)if(rule.enabled&&"body".equals(rule.target))return true;return false;}
    private static String plain(String html) {
        return html == null ? "" : Html.fromHtml(html).toString();
    }

    static String status() {
        StringBuilder value = new StringBuilder();
        if (lastTitles.isEmpty() && lastBodies.isEmpty()) {
            value.append("確認用データ: まだ読み込まれていません\n");
        } else {
            value.append("確認用データ: スレ ").append(lastTitles.size())
                    .append("件 / レス ").append(lastBodies.size()).append("件\n");
        }
        for (ProgrammableNgRuleSet.Rule rule : rules.rules) {
            value.append(rule.name).append(rule.enabled ? ": ON" : ": OFF");
            if (rule.evaluator.error() != null) value.append(" / エラー: ").append(rule.evaluator.error());
            value.append('\n');
        }
        if (!rules.batchError.isEmpty()) value.append(rules.batchError).append('\n');
        if (!runtimeError.isEmpty()) value.append(runtimeError);
        return value.toString();
    }


    static String preview(ProgrammableNgRuleSet.Rule rule) {
        if("body".equals(rule.target)&&!bodyRulesEnabled()){
            try{
                List<?> responses=originalResponses(previewSource.get());List<ProgrammableNgScript.Input> inputs=new ArrayList<>();
                for(Object response:responses){
                    if(response.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError")){
                        Map<String,Object> values=baseValues("body",previewBoard==null?UNKNOWN_BOARD:previewBoard);
                        values.put("responseNumber",field(response,"o"));values.put("responseId",field(response,"h"));values.put("name",plain(stringField(response,"n")));values.put("mail",field(response,"j"));values.put("dateText",field(response,"q"));
                        inputs.add(new ProgrammableNgScript.Input(plain(stringField(response,"c")),values));
                    }else inputs.add(responseData(response).input(previewBoard==null?UNKNOWN_BOARD:previewBoard,""));
                }lastBodies=inputs;
            }catch(Exception error){report("プレビュー準備",error);}
        }
        List<ProgrammableNgScript.Input> inputs = "body".equals(rule.target) ? lastBodies : lastTitles;
        if (inputs.isEmpty()) return "判定対象がまだありません。先にスレ一覧またはスレを開いてください。";
        ProgrammableNgRuleSet preview = new ProgrammableNgRuleSet(Collections.singletonList(rule));
        boolean[] matches = preview.evaluate(inputs);
        int count = 0;
        for (boolean match : matches) if (match) count++;
        String error = rule.evaluator.error();
        if (!preview.batchError.isEmpty()) return preview.batchError;
        return error == null
                ? inputs.size() + "件中 " + count + "件がNGになります。"
                : "JavaScriptエラー: " + error;
    }

    private static void report(String stage, Exception error) {
        runtimeError = stage + ": " + error.getClass().getSimpleName()
                + (error.getMessage() == null ? "" : " - " + error.getMessage());
        Log.w("HaiagaruProgrammableNG", runtimeError, error);
    }
}
