package nl.johninnl.wuplay;

import android.app.Application;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/** Bind only the verified 0.9.4-beta ABI; keep the app's own auth, caches and filters. */
final class NativeCatalogs {
    static final class Definition {
        final Object nativeValue;
        final String key, name, source, sourceId;
        final int order;
        final boolean showHome;
        Definition(String profile, Object value) throws Exception {
            nativeValue = value;
            key = CatalogPolicy.channelKey(profile, (Integer) field(value, "id"));
            name = (String) field(value, "name");
            source = (String) field(value, "source");
            sourceId = (String) field(value, "sourceId");
            order = (Integer) field(value, "homeOrder");
            showHome = (Boolean) field(value, "showHome");
        }
    }

    static final class Snapshot {
        final String profileId, profileName;
        final List<Definition> definitions;
        Snapshot(String id, String name, List<Definition> definitions) {
            profileId = id; profileName = name; this.definitions = definitions;
        }
    }

    private final Object repository, settings;
    NativeCatalogs(Application application) throws Exception {
        Object container = application.getClass().getMethod("getContainer").invoke(application);
        repository = field(container, "catalogRepository");
        settings = field(container, "userSettingsRepository");
    }

    Snapshot snapshot() throws Exception {
        await(repository.getClass().getMethod("awaitSchemaReady", ContinuationImpl.class), repository);
        List<?> profiles = (List<?>) first(field(settings, "profiles"));
        if (profiles.isEmpty()) throw new IllegalStateException("Open Wuplay and sign in before selecting catalogs.");
        Object profile = profiles.get(0);
        String id = (String) field(profile, "id");
        requireDefault(id);
        List<Definition> definitions = homeDefinitions(id);
        requireDefault(id);
        return new Snapshot(id, (String) field(profile, "name"), definitions);
    }

    /** Match BoardViewModel: explicit Home screen rows override legacy flags, even when empty. */
    private List<Definition> homeDefinitions(String profileId) throws Exception {
        Map<Integer, Definition> available = new LinkedHashMap<>();
        for (Object value : (List<?>) first(field(repository, "definitions")))
            available.put((Integer) field(value, "id"), new Definition(profileId, value));
        List<?> rowIds = null;
        for (Object screen : (List<?>) first(field(repository, "screens"))) {
            if ("home".equals(field(screen, "systemKey"))) {
                rowIds = (List<?>) field(screen, "rowCatalogIds");
                break;
            }
        }
        List<Definition> result = new ArrayList<>();
        if (rowIds != null) {
            Set<Integer> seen = new HashSet<>();
            for (Object rowId : rowIds) {
                Integer id = ((Number) rowId).intValue();
                Definition definition = available.get(id);
                if (seen.add(id) && definition != null && CatalogPolicy.contentSource(definition.source)) result.add(definition);
            }
        } else {
            for (Definition definition : available.values())
                if (CatalogPolicy.homeCatalog(definition.source, definition.showHome)) result.add(definition);
            result.sort(Comparator.comparingInt(d -> d.order));
        }
        return result;
    }

    boolean isHome(String profileId, String key) throws Exception {
        requireDefault(profileId);
        boolean eligible = false;
        for (Definition definition : homeDefinitions(profileId)) if (definition.key.equals(key)) { eligible = true; break; }
        requireDefault(profileId);
        return eligible;
    }

    void requireDefault(String expected) throws Exception {
        if (!expected.equals(first(field(settings, "activeProfileId"))))
            throw new IllegalStateException("Open the default profile in Wuplay, then refresh TV channels.");
    }

    List<?> fetch(Snapshot snapshot, Definition definition) throws Exception {
        requireDefault(snapshot.profileId);
        Method method = repository.getClass().getMethod("fetchContent-BWLJW6A",
            Class.forName("app.wuplay.androidtv.domain.model.CatalogDefinition"), java.util.Map.class,
            String.class, ContinuationImpl.class);
        Object result = await(method, repository, definition.nativeValue, Collections.emptyMap(), null);
        // The suspend method returns Kotlin Result<CatalogContent>, boxed only on some paths.
        if (result != null && result.getClass().getName().equals("kotlin.Result")) result = field(result, "value");
        failure(result);
        if (result == null) throw new IllegalStateException("Catalog returned no result");
        String error = (String) field(result, "error");
        if (error != null) throw new IllegalStateException("Catalog refresh failed");
        requireDefault(snapshot.profileId);
        return (List<?>) field(result, "items");
    }

    private static Object first(Object flow) throws Exception {
        Method method = Class.forName("kotlinx.coroutines.flow.FlowKt").getMethod("first",
            Class.forName("kotlinx.coroutines.flow.Flow"), Continuation.class);
        return await(method, null, flow);
    }

    static Object field(Object object, String name) throws Exception {
        return object.getClass().getField(name).get(object);
    }

    /** Each native suspend call has its own cancellable Job and bounded worker-side wait. */
    private static Object await(Method method, Object receiver, Object... args) throws Exception {
        Object job = Class.forName("kotlinx.coroutines.JobKt").getMethod("SupervisorJob$default").invoke(null);
        CoroutineContext context = (CoroutineContext) job;
        CountDownLatch done = new CountDownLatch(1);
        Object[] value = new Object[1];
        Continuation<Object> completion = new Continuation<Object>() {
            public CoroutineContext getContext() { return context; }
            public void resumeWith(Object result) { value[0] = result; done.countDown(); }
        };
        ContinuationImpl continuation = new ContinuationImpl(completion, context) {
            @Override protected Object invokeSuspend(Object result) { return result; }
        };
        try {
            Object[] parameters = java.util.Arrays.copyOf(args, args.length + 1);
            parameters[args.length] = continuation;
            Object result;
            try { result = method.invoke(receiver, parameters); }
            catch (InvocationTargetException exception) {
                Throwable cause = exception.getCause();
                if (cause instanceof Exception) throw (Exception) cause;
                throw new IllegalStateException("Native catalog call failed", cause);
            }
            if (result == CoroutineSingletons.COROUTINE_SUSPENDED) {
                if (!done.await(45, TimeUnit.SECONDS)) throw new IllegalStateException("Catalog request timed out; try again.");
                result = value[0];
            }
            failure(result);
            return result;
        } finally {
            job.getClass().getMethod("cancel", CancellationException.class).invoke(job, new CancellationException("TV channel request finished"));
        }
    }

    private static void failure(Object value) throws Exception {
        if (value != null && value.getClass().getName().equals("kotlin.Result$Failure")) {
            Throwable cause = (Throwable) field(value, "exception");
            if (cause instanceof Exception) throw (Exception) cause;
            throw new IllegalStateException("Native catalog request failed", cause);
        }
    }
}
