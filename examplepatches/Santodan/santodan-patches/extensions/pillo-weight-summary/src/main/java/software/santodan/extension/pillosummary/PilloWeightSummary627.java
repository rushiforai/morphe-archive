package software.santodan.extension.pillosummary;

import java.lang.reflect.*;
import java.text.DecimalFormat;
import java.util.*;
import android.app.DatePickerDialog;
import android.content.Context;

/** Native Compose summaries; all history travels with the filtered list, never across profiles. */
public final class PilloWeightSummary627 {
    public static final int ALL = Integer.MAX_VALUE;
    private static final String ROOT = "xyz.rtrvr.pillo.ui.report.tracker.components.";
    /** Shared app modifier package: not a child of {@link #ROOT}. */
    private static final String COMPOSE = "xyz.rtrvr.pillo.ui.compose.";
    private static final ThreadLocal<Object> rendering = new ThreadLocal<>();
    private PilloWeightSummary627() {}

    public static final class History extends ArrayList<Object> {
        public final List<?> all;
        History(List<?> records, int count) {
            super(records.subList(Math.max(0, records.size() - count), records.size()));
            all = new ArrayList<>(records);
        }
    }
    public static List<?> takeLast(List<?> records, int count) {
        if (count < 0) throw new IllegalArgumentException("Negative record count");
        return new History(records, count);
    }

    public static List<?> takeLast(int count, List<?> records) { return takeLast(records, count); }

    public static Object rememberFilter(Object provider, Object selected, Object changed,
            Object composer, int flags, int defaults) throws Exception {
        Object options = function(1, args -> {
            List<Object> result = new ArrayList<>();
            Class<?> option = Class.forName(ROOT + "filter.TakeLastOption");
            result.add(option.getConstructor(int.class, String.class).newInstance(ALL, "All"));
            Object original = provider == null
                ? invoke(ROOT + "filter.ChooseTakeLastLayoutKt", "rememberChooseTakeLastLayout$lambda$0$0", args[0])
                : call(provider, "invoke", args[0]);
            result.addAll((List<?>) original);
            return result;
        });
        return invoke(ROOT + "filter.ChooseTakeLastLayoutKt", "rememberChooseTakeLastLayout",
            options, selected, changed, composer, 0, defaults & ~1);
    }
    public static void filterButton(Object modifier, boolean active, int count, Object click,
            Object composer, int flags, int defaults) throws Exception {
        if (count == ALL) {
            invoke(ROOT + "filter.FilterBtnKt", "FilterBtn", modifier, "All", click, composer, 0, defaults & 1);
        } else {
            invoke(ROOT + "filter.TakeLastFilterBtnKt", "TakeLastFilterBtn",
                modifier, active, count, click, composer, flags, defaults);
        }
    }

    /** The bridge delegates here; the typed native invoke retains its own Compose skip logic. */
    public static Object render(Object record, Object unit, Object average, Object min, Object max,
            float height, Object brush, float x, float y, float z, boolean premium,
            Object recordsState, Object composer, int flags) throws Exception {
        Object previous = rendering.get();
        rendering.set(new Object[]{recordsState, unit});
        try {
            return invoke("xyz.rtrvr.pillo.ui.tracker.common.components.weight.WeightLineChartKt",
                "WeightLineChart_TN_CM5M$lambda$12$0", record, unit, average, min, max, height,
                brush, x, y, z, premium, recordsState, composer, flags);
        } finally { if (previous == null) rendering.remove(); else rendering.set(previous); }
    }
    private static List<?> selected() throws Exception {
        return (List<?>) call(((Object[])rendering.get())[0], "getValue");
    }
    private static double value(Object record, Object unit) throws Exception {
        Object weight = call(record, "getWeight");
        return ((Number) call(call(weight, "changeUnit", unit), "getValueWithPrecision", 3)).doubleValue();
    }
    public static String format(Double change) {
        if (change == null) return "—";
        double rounded = Math.round(change * 10d) / 10d;
        return (rounded > 0 ? "+" : "") + new DecimalFormat("0.#").format(rounded == 0 ? 0 : rounded);
    }
    public static Double delta(List<Double> weights, boolean loss) {
        if (weights.size() < 2) return null;
        double change = weights.get(weights.size() - 1) - weights.get(0);
        return loss ? -change : change;
    }
    private static Double total(List<?> records, Object unit) throws Exception {
        if (records.size() < 2) return null;
        return value(records.get(records.size() - 1), unit) - value(records.get(0), unit);
    }
    private static Double period(List<?> records, Object unit, int days) throws Exception {
        Calendar calendar = Calendar.getInstance();
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.ROOT);
        String now = format.format(calendar.getTime());
        calendar.add(Calendar.DAY_OF_YEAR, -days);
        String start = format.format(calendar.getTime());
        List<Double> weights = new ArrayList<>();
        for (Object record : records) {
            String time = call(record, "getTime").toString();
            if (time.compareTo(start) >= 0 && time.compareTo(now) <= 0) weights.add(value(record, unit));
        }
        return delta(weights, false);
    }
    private static long dateKey(Object time) {
        String date = time.toString().substring(0, 10).replace("-", "");
        return Long.parseLong(date);
    }
    private static long today() {
        Calendar c = Calendar.getInstance();
        return c.get(Calendar.YEAR) * 10000L + (c.get(Calendar.MONTH) + 1) * 100L + c.get(Calendar.DAY_OF_MONTH);
    }
    /** Render a yyyyMMdd key; labels never soft-wrap, so callers break the line themselves. */
    private static String date(long key) {
        Calendar calendar = Calendar.getInstance();
        calendar.set((int) (key / 10000), (int) (key / 100 % 100) - 1, (int) (key % 100));
        return new java.text.SimpleDateFormat("dd MMM yyyy", Locale.getDefault()).format(calendar.getTime());
    }
    public static Double since(List<Long> dates, List<Double> weights, long start, long today) {
        if (dates.size() != weights.size()) throw new IllegalArgumentException("Mismatched dates and weights");
        List<Double> selected = new ArrayList<>();
        for (int i = 0; i < dates.size(); i++)
            if (dates.get(i) >= start && dates.get(i) <= today) selected.add(weights.get(i));
        return delta(selected, false);
    }
    private static Double since(List<?> records, Object unit, long start) throws Exception {
        if (start == 0) return null;
        List<Long> dates = new ArrayList<>();
        List<Double> weights = new ArrayList<>();
        for (Object record : records) {
            dates.add(dateKey(call(record, "getTime")));
            weights.add(value(record, unit));
        }
        return since(dates, weights, start, today());
    }
    private static void chooseSince(Context context, Object state, long selected) {
        Calendar date = Calendar.getInstance();
        if (selected != 0) date.set((int) (selected / 10000), (int) (selected / 100 % 100) - 1, (int) (selected % 100));
        DatePickerDialog dialog = new DatePickerDialog(context, (picker, year, month, day) -> {
            long chosen = year * 10000L + (month + 1) * 100L + day;
            context.getSharedPreferences("santodan.weight.summary", Context.MODE_PRIVATE)
                .edit().putLong("sinceDate", chosen).apply();
            try { call(state, "setValue", chosen); }
            catch (Exception error) { throw new IllegalStateException("Cannot update weight comparison date", error); }
        }, date.get(Calendar.YEAR), date.get(Calendar.MONTH), date.get(Calendar.DAY_OF_MONTH));
        dialog.setTitle("Weight change since");
        dialog.getDatePicker().setMaxDate(System.currentTimeMillis());
        dialog.show();
    }
    public static void latest(Object modifier, String label, String weight, String unit,
            Object composer, int flags, int defaults) throws Exception {
        List<?> records = selected();
        Object weightUnit = ((Object[])rendering.get())[1];
        row(modifier, new String[]{label == null ? "Latest" : label, "Total"},
            new String[]{weight, format(total(records, weightUnit))}, unit, composer, true);
    }
    public static void averages(Object modifier, String avg, String min, String max, String unit,
            Object composer, int flags, int defaults) throws Exception {
        List<?> records = selected();
        List<?> all = records instanceof History ? ((History) records).all : records;
        Object weightUnit = ((Object[])rendering.get())[1];
        Context context = context(composer);
        long saved = context.getSharedPreferences("santodan.weight.summary", Context.MODE_PRIVATE).getLong("sinceDate", 0);
        Object dateState = invoke("xyz.rtrvr.pillo.ui.compose.EffectsKt", "rememberMutableStateOf", saved, composer, 0);
        long chosen = ((Number) call(dateState, "getValue")).longValue();
        String sinceLabel = "Since\n" + (chosen == 0 ? "all time" : date(chosen));
        Object dateClick = function(0, args -> { chooseSince(context, dateState, chosen); return unit(); });
        // The date needs a second label line, so its two neighbours get one empty line each:
        // every cell then keeps the same height and all three values stay aligned.
        row(modifier, new String[]{sinceLabel, "Min\n", "Max\n"},
            new String[]{format(since(all, weightUnit, chosen)), min, max}, unit, composer, false, dateClick);
        Double change = all.size() < 2 ? null : value(all.get(all.size() - 1), weightUnit)
            - value(all.get(all.size() - 2), weightUnit);
        row(modifier, new String[]{"Last 30 days", "Last 15 days", "Change"},
            new String[]{format(period(all, weightUnit, 30)), format(period(all, weightUnit, 15)), format(change)},
            unit, composer, false);
    }
    private static void row(Object modifier, String[] labels, String[] values, String unit,
            Object composer, boolean large) throws Exception {
        row(modifier, labels, values, unit, composer, large, null);
    }
    private static void row(Object modifier, String[] labels, String[] values, String unit,
            Object composer, boolean large, Object firstClick) throws Exception {
        Object content = function(2, args -> {
            for (int i = 0; i < labels.length; i++) {
                Object cellModifier = null;
                if (i == 0 && firstClick != null) {
                    // ValueDisplay fills its parent width, so the date cell only keeps its share of
                    // the row when the click is applied to that same modifier. A ClickableNoRipple
                    // wrapper measured its content unbounded and pushed the text into "Min".
                    cellModifier = invoke(COMPOSE + "ModifierExtensionKt", "clickableNoRipple",
                        defaultModifier(), firstClick);
                }
                if (large) invoke(ROOT + "aggregate.LatestValueDisplayKt", "LatestValueDisplay",
                    null, labels[i], values[i], unit, args[0], 0, 1);
                else invoke(ROOT + "aggregate.AvgMinMaxRowKt", "ValueDisplay",
                    cellModifier, labels[i], values[i], unit, args[0], 0, cellModifier == null ? 1 : 0);
            }
            return unit();
        });
        invoke("xyz.rtrvr.pillo.ui.components.row.DividedRowKt", "DividedRow-Ou1YvPQ",
            modifier, 0f, 0L, null, content, composer, 0, 14);
    }
    static Context context(Object composer) throws Exception {
        Object local = Class.forName("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt").getField("b").get(null);
        return (Context) call(composer, "k", local);
    }
    interface Action { Object run(Object[] args) throws Exception; }
    static Object function(int arity, Action action) throws Exception {
        Class<?> type = Class.forName("kotlin.jvm.functions.Function" + arity);
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) return action.run(args);
            if (method.getName().equals("toString")) return "PilloWeightSummary627";
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            throw new UnsupportedOperationException(method.getName());
        });
    }
    static Object unit() throws Exception { return Class.forName("kotlin.Unit").getField("a").get(null); }
    /** Empty Compose modifier: the companion instance of the obfuscated Modifier interface. */
    static Object defaultModifier() throws Exception {
        return Class.forName("s3.p").getField("a").get(null);
    }
    static Object invoke(String owner, String name, Object... args) throws Exception {
        return method(Class.forName(owner), name, args).invoke(null, args);
    }
    static Object call(Object receiver, String name, Object... args) throws Exception {
        return method(receiver.getClass(), name, args).invoke(receiver, args);
    }
    private static Method method(Class<?> owner, String name, Object[] args) throws Exception {
        for (Class<?> current = owner; current != null; current = current.getSuperclass()) {
            Method[] methods = current.getDeclaredMethods();
            Arrays.sort(methods, Comparator.comparingInt(m -> {
                int generic = 0;
                for (Class<?> type : m.getParameterTypes()) if (type == Object.class) generic++;
                return generic;
            }));
            for (Method method : methods) {
                if (!method.getName().equals(name) || method.getParameterCount() != args.length) continue;
                Class<?>[] types = method.getParameterTypes();
                boolean matches = true;
                for (int i = 0; i < types.length; i++) {
                    Class<?> type = types[i];
                    if (type == int.class) type = Integer.class;
                    else if (type == long.class) type = Long.class;
                    else if (type == float.class) type = Float.class;
                    else if (type == boolean.class) type = Boolean.class;
                    if (args[i] != null && !type.isInstance(args[i])) { matches = false; break; }
                }
                if (matches) { method.setAccessible(true); return method; }
            }
        }
        throw new NoSuchMethodException(owner.getName() + "->" + name);
    }
}
