package software.santodan.extension.pillosummary;

import java.lang.reflect.*;
import java.text.DecimalFormat;
import java.util.*;
import android.app.DatePickerDialog;
import android.content.Context;

/** Native Compose summaries; all history travels with the filtered list, never across profiles. */
public final class PilloWeightSummary {
    public static final int ALL = Integer.MAX_VALUE;
    private static final String ROOT = "xyz.rtrvr.pillo.ui.report.tracker.components.";
    private static final ThreadLocal<Object> rendering = new ThreadLocal<>();
    private PilloWeightSummary() {}

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

    public static Object rememberFilter(Object provider, Object selected, Object changed,
            Object composer, int flags, int defaults) throws Exception {
        Object options = function(1, args -> {
            List<Object> result = new ArrayList<>();
            Class<?> option = Class.forName(ROOT + "filter.TakeLastOption");
            result.add(option.getConstructor(int.class, String.class).newInstance(ALL, "All"));
            Object original = provider == null
                ? invoke(ROOT + "filter.ChooseTakeLastLayoutKt", "rememberChooseTakeLastLayout$lambda$2$lambda$1", args[0])
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
    public static void render(Object content, Object composer, int flags) throws Exception {
        Object previous = rendering.get();
        rendering.set(content);
        try { call(content, "invoke", composer, flags); }
        finally { if (previous == null) rendering.remove(); else rendering.set(previous); }
    }
    private static Object field(Object object, String name) throws Exception {
        Field field = object.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(object);
    }
    private static List<?> selected() throws Exception {
        Object state = field(rendering.get(), "$visibleRecords$delegate");
        return (List<?>) call(state, "getValue");
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
        Object now = invoke("org.threeten.bp.LocalDateTime", "now");
        Object start = call(now, "minusDays", (long) days);
        List<Double> weights = new ArrayList<>();
        for (Object record : records) {
            Object time = call(record, "getTime");
            if (!(Boolean) call(time, "isBefore", start) && !(Boolean) call(time, "isAfter", now))
                weights.add(value(record, unit));
        }
        return delta(weights, false);
    }
    private static long dateKey(Object time) throws Exception {
        return ((Number) call(time, "getYear")).longValue() * 10000
            + ((Number) call(time, "getMonthValue")).longValue() * 100
            + ((Number) call(time, "getDayOfMonth")).longValue();
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
        return since(dates, weights, start, dateKey(invoke("org.threeten.bp.LocalDateTime", "now")));
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
        Object weightUnit = field(rendering.get(), "$weightUnit");
        row(modifier, new String[]{label == null ? "Latest" : label, "Total"},
            new String[]{weight, format(total(records, weightUnit))}, unit, composer, true);
    }
    public static void averages(Object modifier, String avg, String min, String max, String unit,
            Object composer, int flags, int defaults) throws Exception {
        List<?> records = selected();
        List<?> all = records instanceof History ? ((History) records).all : records;
        Object weightUnit = field(rendering.get(), "$weightUnit");
        Object localContext = invoke("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt", "getLocalContext");
        Context context = (Context) call(composer, "consume", localContext);
        long saved = context.getSharedPreferences("santodan.weight.summary", Context.MODE_PRIVATE).getLong("sinceDate", 0);
        Object dateState = invoke("xyz.rtrvr.pillo.ui.compose.EffectsKt", "rememberMutableStateOf", saved, composer, 0);
        long chosen = ((Number) call(dateState, "getValue")).longValue();
        String sinceLabel = "Last since";
        if (chosen != 0) {
            Calendar calendar = Calendar.getInstance();
            calendar.set((int) (chosen / 10000), (int) (chosen / 100 % 100) - 1, (int) (chosen % 100));
            sinceLabel += "\n" + new java.text.SimpleDateFormat("dd MMM yyyy", Locale.getDefault()).format(calendar.getTime());
        }
        Object dateClick = function(0, args -> { chooseSince(context, dateState, chosen); return unit(); });
        row(modifier, new String[]{sinceLabel, "Min", "Max"},
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
                    Object base = Class.forName("androidx.compose.ui.Modifier").getField("Companion").get(null);
                    cellModifier = invoke("androidx.compose.foundation.ClickableKt", "clickable-XHw0xAI$default",
                        base, true, "Choose comparison date", null, firstClick, 4, null);
                }
                if (large) invoke(ROOT + "aggregate.LatestValueDisplayKt", "LatestValueDisplay",
                    null, labels[i], values[i], unit, args[0], 0, 1);
                else invoke(ROOT + "aggregate.AvgMinMaxRowKt", "access$ValueDisplay",
                    cellModifier, labels[i], values[i], unit, args[0], 0, cellModifier == null ? 1 : 0);
            }
            return unit();
        });
        Object padding = invoke("androidx.compose.foundation.layout.PaddingKt",
            "PaddingValues-YgX7TsA$default", 8f, 0f, 2, null);
        invoke("xyz.rtrvr.pillo.ui.components.row.DividedRowKt", "DividedRow-Ou1YvPQ",
            modifier, 0f, 0L, padding, content, composer, 0, 6);
    }
    private interface Action { Object run(Object[] args) throws Exception; }
    private static Object function(int arity, Action action) throws Exception {
        Class<?> type = Class.forName("kotlin.jvm.functions.Function" + arity);
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) return action.run(args);
            if (method.getName().equals("toString")) return "PilloWeightSummary";
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            throw new UnsupportedOperationException(method.getName());
        });
    }
    private static Object unit() throws Exception { return Class.forName("kotlin.Unit").getField("INSTANCE").get(null); }
    private static Object invoke(String owner, String name, Object... args) throws Exception {
        return method(Class.forName(owner), name, args).invoke(null, args);
    }
    private static Object call(Object receiver, String name, Object... args) throws Exception {
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
