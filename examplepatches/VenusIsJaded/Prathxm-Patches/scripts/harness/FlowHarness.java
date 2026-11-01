package app.prathxm.chess.extension.stockfish;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Verifies FlowBridge against the app's REAL kotlinx.coroutines Flow runtime.
 *
 * <p>The local review Flow is wrapped in the app's own {@code flow { emitAll(local) }} builder
 * (kotlinx SafeCollector, which enforces the "emit only from the collecting coroutine context"
 * invariant, as used by GameAnalysisRepositoryImpl on 4.10.17). A downstream collector
 * <b>suspends</b> on every value and is resumed later from another thread, like the app's
 * channel / dispatcher hops. The collection has to complete with every value delivered in
 * order. With the old synchronous implementation (fake EmptyCoroutineContext continuation, no
 * resume) this test hangs / fails exactly like the black Game Review screen.
 */
final class FlowHarness {
    interface Checker {
        void check(String name, boolean ok, Object detail);
    }

    private FlowHarness() {}

    static void run(AppTypes t, Class<?> flowCls, Object completedValue, Object depth, Checker c) throws Throwable {
        // A local Flow that emits three values through FlowBridge from a worker thread.
        final Object inProgress = t.inProgressCtor.newInstance(0.5f, depth, t.ceacSource);
        Object local = Proxy.newProxyInstance(flowCls.getClassLoader(), new Class<?>[]{flowCls}, (p, m, a) -> {
            if (m.getName().equals("collect") && a != null && a.length == 2) {
                return FlowBridge.collect(t, a[0], a[1], "harness-review", em -> {
                    em.emit(inProgress);
                    Thread.sleep(50);
                    em.emit(inProgress);
                    em.emit(completedValue);
                });
            }
            if (m.getName().equals("hashCode")) return System.identityHashCode(p);
            if (m.getName().equals("equals")) return p == a[0];
            if (m.getName().equals("toString")) return "LocalFlow";
            return null;
        });

        // Wrap it in the app's real flow { emitAll(local) } builder => SafeCollector.
        Object wrapped = wrapInSafeFlow(t, flowCls, local);
        c.check("wrapped in app flow{} builder", wrapped != null, wrapped != null ? wrapped.getClass().getName() : null);
        if (wrapped == null) return;

        // Downstream collector that suspends on every emission, resumed from another thread.
        final List<Object> received = Collections.synchronizedList(new ArrayList<>());
        final Object suspended = FlowBridge.suspended();
        Object collector = Proxy.newProxyInstance(t.collectorClass.getClassLoader(), new Class<?>[]{t.collectorClass}, (p, m, a) -> {
            if (m.getName().equals("emit") && a != null && a.length == 2) {
                received.add(a[0]);
                final Object cont = a[1];
                new Thread(() -> {
                    try { Thread.sleep(20); } catch (InterruptedException ignored) {}
                    try { resumeWith(cont, FlowBridge.unit()); } catch (Throwable e) { e.printStackTrace(System.out); }
                }).start();
                return suspended;
            }
            if (m.getName().equals("hashCode")) return System.identityHashCode(p);
            if (m.getName().equals("equals")) return p == a[0];
            return null;
        });

        // Root continuation (like the review ViewModel's coroutine), with a real Job so
        // FlowBridge's cancellation lookup is exercised too.
        final CountDownLatch done = new CountDownLatch(1);
        final AtomicReference<Object> outcome = new AtomicReference<>();
        Object job = newJob();
        c.check("real kotlinx Job created", job != null, job);
        final Object ctx = job != null ? job : FlowBridge.emptyContext();
        Object root = Proxy.newProxyInstance(t.continuationClass.getClassLoader(), new Class<?>[]{t.continuationClass}, (p, m, a) -> {
            if (m.getName().equals("getContext")) return ctx;
            if (m.getName().equals("resumeWith")) { outcome.set(a[0]); done.countDown(); return null; }
            if (m.getName().equals("hashCode")) return System.identityHashCode(p);
            if (m.getName().equals("equals")) return p == a[0];
            return null;
        });
        c.check("FlowBridge finds the Job in the context", job == null || FlowBridge.findJob(ctx) == job, FlowBridge.findJob(ctx));

        Object ret;
        try {
            ret = t.emitMethod.getDeclaringClass() != null
                    ? flowCls.getMethod("collect", t.collectorClass, t.continuationClass).invoke(wrapped, collector, root)
                    : null;
        } catch (java.lang.reflect.InvocationTargetException e) {
            c.check("collect() did not throw", false, e.getCause());
            return;
        }
        if (ret != suspended) {
            outcome.set(ret);
            done.countDown();
        }
        boolean finished = done.await(20, TimeUnit.SECONDS);
        c.check("review flow completed (collector resumed)", finished, finished ? outcome.get() : "TIMEOUT - review would stay blank");
        Throwable failure = FlowBridge.failureOf(outcome.get());
        c.check("review flow completed without error", finished && failure == null, failure);
        c.check("all 3 values delivered", received.size() == 3, received.size());
        c.check("last value is the Completed result", received.size() == 3 && received.get(2) == completedValue,
                received.isEmpty() ? null : received.get(received.size() - 1).getClass().getName());
    }

    /** kotlinx.coroutines.flow.FlowKt__BuildersKt.flow(block) with block = { emitAll(local) }. */
    private static Object wrapInSafeFlow(AppTypes t, Class<?> flowCls, Object local) throws Throwable {
        Class<?> builders = Class.forName("kotlinx.coroutines.flow.FlowKt__BuildersKt");
        Method flowBuilder = null;
        Class<?> f2 = Class.forName("kotlin.jvm.functions.Function2");
        for (Method m : builders.getDeclaredMethods()) {
            Class<?>[] p = m.getParameterTypes();
            if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) && p.length == 1 && p[0] == f2
                    && m.getReturnType() == flowCls) {
                // flow{} returns SafeFlow (an AbstractFlow); channelFlow/callbackFlow return a
                // ChannelFlow subclass. Pick the one whose result has no ChannelFlow ancestor.
                Object probe = null;
                try { m.setAccessible(true); probe = m.invoke(null, (Object) null); } catch (Throwable ignored) {}
                if (probe == null) continue;
                boolean channel = false;
                for (Class<?> k = probe.getClass(); k != null; k = k.getSuperclass()) {
                    if (k.getName().contains("Channel")) channel = true;
                }
                if (!channel) {
                    flowBuilder = m;
                    break;
                }
            }
        }
        if (flowBuilder == null) return null;
        // The block: suspend FlowCollector.() -> Unit, i.e. invoke(collector, continuation).
        // emitAll(local) == local.collect(collector, continuation).
        Object block = Proxy.newProxyInstance(f2.getClassLoader(), new Class<?>[]{f2}, (p, m, a) -> {
            if (m.getName().equals("invoke") && a != null && a.length == 2) {
                Method collect = flowCls.getMethod("collect", t.collectorClass, t.continuationClass);
                return collect.invoke(local, a[0], a[1]);
            }
            if (m.getName().equals("hashCode")) return System.identityHashCode(p);
            if (m.getName().equals("equals")) return p == a[0];
            return null;
        });
        flowBuilder.setAccessible(true);
        return flowBuilder.invoke(null, block);
    }

    /** A real kotlinx.coroutines Job (JobSupport(active=true)). */
    private static Object newJob() {
        try {
            Class<?> js = Class.forName("kotlinx.coroutines.JobSupport");
            java.lang.reflect.Constructor<?> k = js.getConstructor(boolean.class);
            return k.newInstance(true);
        } catch (Throwable e) {
            System.out.println("    (JobSupport not constructible: " + e + ")");
            return null;
        }
    }

    private static void resumeWith(Object cont, Object value) throws Exception {
        for (Method m : cont.getClass().getMethods()) {
            if (m.getName().equals("resumeWith") && m.getParameterTypes().length == 1) {
                m.setAccessible(true);
                m.invoke(cont, value);
                return;
            }
        }
        throw new NoSuchMethodException("resumeWith");
    }
}
