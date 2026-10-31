package software.santodan.extension.pillosummary;

import android.content.Context;
import android.content.ContextWrapper;
import java.lang.reflect.Proxy;
import static software.santodan.extension.pillosummary.PilloWeightSummary.*;

/** Adds the native weight lazy items to Progress, without a nested scrolling container. */
public final class PilloProgressWeight {
    private static final String READING = "xyz.rtrvr.pillo.ui.tracker.reading.";
    private PilloProgressWeight() {}

    public static void progress(Object modifier, Object listState, Object padding, boolean reverse,
            Object arrangement, Object alignment, Object fling, boolean scroll, Object overscroll,
            Object original, Object composer, int flags, int defaults) throws Exception {
        call(composer, "startReplaceGroup", 0x53475057);
        Object vm;
        Object metric;
        Object state;
        Object chartHeight;
        String profileId;
        Context activity;
        try {
            Object local = invoke("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt", "getLocalContext");
            activity = (Context) call(composer, "consume", local);
            Class<?> activityType = Class.forName("androidx.activity.ComponentActivity");
            while (!activityType.isInstance(activity) && activity instanceof ContextWrapper)
                activity = ((ContextWrapper) activity).getBaseContext();
            if (!activityType.isInstance(activity)) throw new IllegalStateException("Progress has no ComponentActivity");
            Object owner = call(Class.forName("androidx.lifecycle.viewmodel.compose.LocalViewModelStoreOwner")
                .getField("INSTANCE").get(null), "getCurrent", composer, 0);
            Object factory = invoke("androidx.hilt.navigation.compose.HiltViewModelKt",
                "createHiltViewModelFactory", owner, composer, 0);
            Object provider = Class.forName("androidx.lifecycle.ViewModelProvider").getConstructor(
                Class.forName("androidx.lifecycle.ViewModelStoreOwner"),
                Class.forName("androidx.lifecycle.ViewModelProvider$Factory")).newInstance(owner, factory);
            vm = call(provider, "get", "santodan.progress.weight", Class.forName(READING + "ViewTrackerReadingListViewModel"));
            metric = Class.forName("xyz.rtrvr.pillo.models.tracker.chart.TrackerMetricType").getField("WEIGHT").get(null);
            Object effect = observer(vm, activity, metric);
            invoke("androidx.compose.runtime.EffectsKt", "DisposableEffect", vm, effect, composer, 0);
            Object selected = invoke(READING + "ViewTrackerReadingListViewModel",
                "access$get_selectedUserProfile$p", vm);
            Object selection = invoke("androidx.lifecycle.compose.FlowExtKt", "collectAsStateWithLifecycle",
                selected, activity, null, null, composer, 0, 6);
            profileId = chartProfileId(call(selection, "getValue"));
            // Reading this snapshot state in composition keeps the appended lazy items current.
            state = Class.forName(READING + "ViewTrackerReadingListState").getConstructor(metric.getClass(),
                java.util.List.class, Class.forName("xyz.rtrvr.pillo.models.entities.tracker.TrackerType")).newInstance(
                metric, call(vm, "getReadingEntryGroups"), call(vm, "getLoggableTrackerType"));
            chartHeight = invoke("androidx.compose.runtime.SnapshotIntStateKt", "mutableIntStateOf", 0);
        } finally {
            call(composer, "endReplaceGroup");
        }
        final Object model = vm;
        final Object weight = metric;
        final Context host = activity;
        Object chart = function(2, args -> {
            // Do not initialize the chart with the list VM's empty-ID fallback sentinel.
            // The chart interprets it as an actual profile selection and loads no records.
            if (profileId != null) invoke(READING + "ViewTrakcerReadingListScreenKt", "access$TrackerChartContent",
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
            invoke(READING + "ViewTrakcerReadingListScreenKt$ViewTrackerReadingListContent$2",
                "invoke$lambda$6$lambda$4$lambda$3", state, chartHeight, chart, click, args[0]);
            return unit();
        });
        invoke("androidx.compose.foundation.lazy.LazyDslKt", "LazyColumn", modifier, listState, padding,
            reverse, arrangement, alignment, fling, scroll, overscroll, body, composer, 0, defaults);
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
            Class<?> result = Class.forName("androidx.compose.runtime.DisposableEffectResult");
            java.util.concurrent.atomic.AtomicBoolean disposed = new java.util.concurrent.atomic.AtomicBoolean();
            return Proxy.newProxyInstance(result.getClassLoader(), new Class<?>[]{result}, (proxy, method, values) -> {
                if (method.getName().equals("dispose")) {
                    if (disposed.compareAndSet(false, true)) call(job, "cancel", (Object) null);
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
