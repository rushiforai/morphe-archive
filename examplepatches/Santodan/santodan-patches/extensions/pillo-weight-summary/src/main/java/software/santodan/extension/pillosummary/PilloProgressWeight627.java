package software.santodan.extension.pillosummary;

import android.content.Context;
import android.content.ContextWrapper;
import java.lang.reflect.Proxy;
import static software.santodan.extension.pillosummary.PilloWeightSummary627.*;

/** Adds the native weight lazy items to Progress, without a nested scrolling container. */
public final class PilloProgressWeight627 {
    private static final String READING = "xyz.rtrvr.pillo.ui.tracker.reading.";
    private PilloProgressWeight627() {}

    public static void progress(Object modifier, Object listState, Object padding,
            Object arrangement, Object alignment, Object fling, boolean scroll, Object overscroll,
            Object original, Object composer, int flags, int defaults) throws Exception {
        call(composer, "d0", 0x53475057);
        Object vm;
        Object metric;
        Object state;
        Object chartHeight;
        String profileId;
        Context activity;
        try {
            activity = context(composer);
            Class<?> activityType = Class.forName("androidx.activity.ComponentActivity");
            while (!activityType.isInstance(activity) && activity instanceof ContextWrapper)
                activity = ((ContextWrapper) activity).getBaseContext();
            if (!activityType.isInstance(activity)) throw new IllegalStateException("Progress has no ComponentActivity");
            vm = viewModel(activity);
            metric = Class.forName("xyz.rtrvr.pillo.models.tracker.chart.TrackerMetricType").getField("WEIGHT").get(null);
            Object effect = observer(vm, activity, metric);
            invoke("g3.q0", "c", vm, effect, composer);
            Object selected = invoke(READING + "ViewTrackerReadingListViewModel",
                "access$get_selectedUserProfile$p", vm);
            Object selection = invoke("kotlin.comparisons.ComparisonsKt", "t", selected, composer, 0);
            profileId = chartProfileId(call(selection, "getValue"));
            // Reading this snapshot state in composition keeps the appended lazy items current.
            state = Class.forName(READING + "ViewTrackerReadingListState").getConstructor(metric.getClass(),
                java.util.List.class, Class.forName("xyz.rtrvr.pillo.models.entities.tracker.TrackerType")).newInstance(
                metric, call(vm, "getReadingEntryGroups"), call(vm, "getLoggableTrackerType"));
            chartHeight = Class.forName("g3.u1").getConstructor(int.class).newInstance(0);
        } finally {
            call(composer, "t");
        }
        final Object model = vm;
        final Object weight = metric;
        final Context host = activity;
        Object chart = function(2, args -> {
            // Do not initialize the chart with the list VM's empty-ID fallback sentinel.
            // The chart interprets it as an actual profile selection and loads no records.
            if (profileId != null) invoke(READING + "ViewTrakcerReadingListScreenKt", "TrackerChartContent",
                null, profileId, weight, model, args[0], 0, 1);
            return unit();
        });
        Object click = function(1, args -> {
            Object companion = Class.forName("xyz.rtrvr.pillo.ui.tracker.log.edit.EditLoggedTrackerEventActivity")
                .getField("Companion").get(null);
            call(companion, "startActivity", host, ((Number) args[0]).longValue());
            return unit();
        });
        Object body = function(1, args -> {
            call(original, "invoke", args[0]);
            invoke(READING + "ViewTrakcerReadingListScreenKt",
                "ViewTrackerReadingListContent$lambda$4$0$1$0", state, chartHeight, chart, click, args[0]);
            return unit();
        });
        invoke("z0.l", "c", modifier, listState, padding,
            arrangement, alignment, fling, scroll, overscroll, body, composer, 0, defaults);
    }

    private static Object viewModel(Context activity) throws Exception {
        Class<?> activityType = Class.forName("androidx.activity.ComponentActivity");
        Class<?> function = Class.forName("kotlin.jvm.functions.Function0");
        String prefix = READING + "ViewTrackerReadingListActivity$special$$inlined$viewModels$default$";
        Object factory = Class.forName(prefix + "1").getConstructor(activityType).newInstance(activity);
        Object store = Class.forName(prefix + "2").getConstructor(activityType).newInstance(activity);
        Object extras = Class.forName(prefix + "3").getConstructor(function, activityType).newInstance(null, activity);
        Object model = invoke("kotlin.jvm.internal.Reflection", "getOrCreateKotlinClass",
            Class.forName(READING + "ViewTrackerReadingListViewModel"));
        Object lazy = Class.forName("androidx.lifecycle.j1").getConstructor(Class.forName("kotlin.reflect.KClass"),
            function, function, function).newInstance(model, store, factory, extras);
        return call(lazy, "getValue");
    }

    static String chartProfileId(Object profile) throws Exception {
        if (profile == null) return null;
        String id = (String) call(profile, "getUserProfileId");
        if (id == null || id.isEmpty()) throw new IllegalStateException("Weight profile has no ID");
        return id;
    }

    static Object observer(Object model, Context host, Object weight) throws Exception {
        return function(1, args -> {
            Object job = call(model, "initialize", host, "", weight);
            Class<?> result = Class.forName("g3.n0");
            java.util.concurrent.atomic.AtomicBoolean disposed = new java.util.concurrent.atomic.AtomicBoolean();
            return Proxy.newProxyInstance(result.getClassLoader(), new Class<?>[]{result}, (proxy, method, values) -> {
                if (method.getName().equals("dispose")) {
                    if (disposed.compareAndSet(false, true)) call(job, "b", (Object) null);
                    return null;
                }
                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (method.getName().equals("equals")) return proxy == values[0];
                if (method.getName().equals("toString")) return "ProgressWeightObserver";
                throw new UnsupportedOperationException(method.getName());
            });
        });
    }
}
