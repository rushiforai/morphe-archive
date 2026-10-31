/*
 * Reddit NSFW Only - derivative work based on Reddit NSFW Blocker by warleysr.
 * Modern home-feed filtering adapted from GPLv3 work in variablenine/morphe-patches.
 * See NOTICE and LICENSE.
 */
package io.github.redditnsfwonly.extension;

import android.util.Log;
import com.reddit.domain.model.Link;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/** Always-on patch that keeps mature Reddit content and removes non-NSFW feed posts. */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class BlockNsfwContentPatch {
    private static final String TAG = "RedditNsfwOnly";

    private static final String SET_OVER_18_LAMBDA_CLASS =
            "com.reddit.account.repository.RedditPreferenceRepository$setOver18$2";
    private static final long ACCOUNT_SYNC_DELAY_MILLISECONDS = 5000;

    private static volatile Object preferenceRepository;
    private static volatile boolean accountOver18ObservedOff;
    private static final AtomicBoolean accountSyncStarted = new AtomicBoolean();

    public static void setPreferenceRepository(Object repository) {
        if (repository == null || preferenceRepository == repository) return;
        preferenceRepository = repository;
        if (accountOver18ObservedOff) turnOnAccountOver18();
    }

    public static boolean getAccountOver18(boolean over18) {
        if (!over18 && !accountOver18ObservedOff) {
            accountOver18ObservedOff = true;
            turnOnAccountOver18();
        }
        return true;
    }

    private static void turnOnAccountOver18() {
        Object repository = preferenceRepository;
        if (repository == null) return;
        if (!accountSyncStarted.compareAndSet(false, true)) return;

        Thread thread = new Thread(() -> {
            try {
                Thread.sleep(ACCOUNT_SYNC_DELAY_MILLISECONDS);
                Log.i(TAG, "Turning on account 'Show mature content'");
                runSetOver18(repository);
            } catch (Exception ex) {
                Log.e(TAG, "Could not turn on account 'Show mature content'", ex);
            }
        }, "reddit-nsfw-only");
        thread.setDaemon(true);
        thread.start();
    }

    private static void runSetOver18(Object repository) throws Exception {
        ClassLoader classLoader = repository.getClass().getClassLoader();
        Class<?> lambdaClass = Class.forName(SET_OVER_18_LAMBDA_CLASS, true, classLoader);

        Constructor<?> constructor = null;
        for (Constructor<?> c : lambdaClass.getDeclaredConstructors()) {
            Class<?>[] types = c.getParameterTypes();
            if (types.length == 3 && types[0].isInstance(repository) && types[1] == boolean.class) {
                constructor = c;
                break;
            }
        }
        if (constructor == null) {
            throw new IllegalStateException("Could not find constructor of " + SET_OVER_18_LAMBDA_CLASS);
        }
        constructor.setAccessible(true);

        Class<?> continuationClass = constructor.getParameterTypes()[2];
        Class<?> coroutineContextClass = Class.forName("kotlin.coroutines.CoroutineContext", true, classLoader);
        Object emptyCoroutineContext = Class.forName("kotlin.coroutines.EmptyCoroutineContext", true, classLoader)
                .getField("INSTANCE").get(null);

        Object completion = Proxy.newProxyInstance(classLoader, new Class<?>[]{continuationClass},
                (proxy, method, args) -> {
                    if (method.getReturnType() == coroutineContextClass) return emptyCoroutineContext;
                    switch (method.getName()) {
                        case "equals": return proxy == args[0];
                        case "hashCode": return System.identityHashCode(proxy);
                        case "toString": return "BlockNsfwContentPatch continuation";
                    }
                    if (args != null && args.length == 1) {
                        Log.i(TAG, "Account 'Show mature content' update finished: " + args[0]);
                    }
                    return null;
                });

        Object lambda = constructor.newInstance(repository, true, null);
        Method invoke = lambdaClass.getMethod("invoke", Object.class);
        invoke.setAccessible(true);
        invoke.invoke(lambda, completion);
    }

    /** Legacy listing path: only explicit over18 Links survive; non-Link furniture is preserved. */
    public static List<?> filterLinks(List<?> list) {
        if (list == null || list.isEmpty()) return list;
        try {
            List<Object> filtered = null;
            final int size = list.size();
            for (int i = 0; i < size; i++) {
                Object item = list.get(i);
                if (item instanceof Link link && !link.getOver18()) {
                    if (filtered == null) filtered = new ArrayList<>(list.subList(0, i));
                    Log.d(TAG, "Removing SFW legacy link");
                } else if (filtered != null) {
                    filtered.add(item);
                }
            }
            return filtered == null ? list : filtered;
        } catch (Exception ex) {
            Log.e(TAG, "filterLinks failure", ex);
            return list;
        }
    }

    /**
     * Modern Home path. Reddit's mapped feed elements no longer carry an NSFW bit, so this is
     * injected into the page builder while the GraphQL cell response still contains post
     * indicator enums. Strict policy: only edges positively identified as NSFW posts survive.
     * SFW posts, non-post units and unreadable/unknown edges are dropped.
     */
    public static void filterHomeFeedResponse(Object response) {
        if (response == null) return;

        List<Object> firstNonEmptyList = null;
        try {
            for (Field field : response.getClass().getDeclaredFields()) {
                if (!List.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                Object value = field.get(response);
                if (!(value instanceof List<?> raw) || raw.isEmpty()) continue;

                List<Object> edges = (List<Object>) raw;
                if (firstNonEmptyList == null) firstNonEmptyList = edges;

                List<Object> keep = new ArrayList<>(edges.size());
                int posts = 0;
                for (Object edge : edges) {
                    NsfwCellScanner.Scan scan = NsfwCellScanner.scan(edge);
                    if (scan == null) continue;
                    posts++;
                    if (scan.nsfw) keep.add(edge);
                }

                if (posts == 0) continue;

                int before = edges.size();
                edges.clear();
                edges.addAll(keep);
                Log.d(TAG, "Strict home filter kept " + keep.size() + " NSFW posts from "
                        + posts + " readable posts (" + before + " total edges)");
                return;
            }

            // A non-empty response with no readable post ids is an unknown model shape. v0.1
            // failed open here. v0.2 deliberately fails closed: an empty feed is preferable to
            // allowing an unclassified SFW post through.
            if (firstNonEmptyList != null) {
                int before = firstNonEmptyList.size();
                firstNonEmptyList.clear();
                Log.d(TAG, "Strict home filter cleared " + before + " unclassified edges");
            }
        } catch (Throwable ex) {
            Log.e(TAG, "filterHomeFeedResponse failure; clearing readable list fields", ex);
            clearListFields(response);
        }
    }

    private static void clearListFields(Object response) {
        try {
            for (Field field : response.getClass().getDeclaredFields()) {
                if (!List.class.isAssignableFrom(field.getType())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(response);
                    if (value instanceof List<?> list) list.clear();
                } catch (Throwable ignored) {
                    // Best effort. The primary GraphQL edge list is mutable in the supported app.
                }
            }
        } catch (Throwable ignored) {
            // Nothing else to do without knowing the new response shape.
        }
    }
}
