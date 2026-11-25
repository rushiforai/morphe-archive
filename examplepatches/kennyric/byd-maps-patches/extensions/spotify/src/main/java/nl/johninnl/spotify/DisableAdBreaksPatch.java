package nl.johninnl.spotify;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import nl.johninnl.spotify.shared.Logger;

/**
 * Disables the audio ad slots of the Spotify player.
 * <p>
 * The native player only fills ad slots that are enabled. Spotify enables the slots with the
 * {@code spotify.ads.esperanto.proto.Settings/updateSlotEnabled} esperanto call, so the same call
 * carries an {@code enabled = false} value for every audio ad slot.
 * <p>
 * The request itself is created by the Cosmos transport. Different Spotify builds expose that
 * helper either as a private synthetic accessor or as a public instance method; both shapes are
 * supported here so a new build cannot silently patch the app without disabling anything.
 */
@SuppressWarnings("unused")
public final class DisableAdBreaksPatch {
    private static final String COSMOS_TRANSPORT_CLASS =
            "com.spotify.esperanto.esperantocosmos.CosmosCoroutineTransport";
    private static final String RESOLVE_CALLBACK_CLASS = "com.spotify.cosmos.cosmos.ResolveCallback";

    private static final String SETTINGS_SERVICE = "spotify.ads.esperanto.proto.Settings";
    private static final String UPDATE_SLOT_ENABLED = "updateSlotEnabled";

    /** Ad slots that can interrupt music: between songs and before the first song. */
    private static final String[] AUDIO_AD_SLOTS = {"stream", "preroll"};

    /**
     * The native ads service starts after the application's first network setup. Keep one early
     * attempt and repeat, because Spotify enables slots again after account or network changes.
     */
    private static final long INITIAL_DELAY_SECONDS = 2;
    private static final long PERIOD_SECONDS = 60;

    /** The most recent Cosmos transport; Spotify recreates it after account/network changes. */
    private static volatile Object transport;
    private static volatile ScheduledExecutorService executor;

    private DisableAdBreaksPatch() {
    }

    /**
     * Injection point: constructor of {@code CoroutineClientBase}, the base class of every
     * esperanto client.
     *
     * @param transport The {@code CoroutineTransport} of the client.
     */
    public static void onTransportCreated(Object transport) {
        if (transport == null) return;

        try {
            if (!transport.getClass().getName().equals(COSMOS_TRANSPORT_CLASS)) return;
            DisableAdBreaksPatch.transport = transport;
            startExecutor();
        } catch (Throwable ex) {
            Logger.error("onTransportCreated failure", ex);
        }
    }

    private static void startExecutor() {
        if (executor != null) return;
        synchronized (DisableAdBreaksPatch.class) {
            if (executor != null) return;
            ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor(runnable -> {
                Thread thread = new Thread(runnable, "DisableAdBreaks");
                thread.setDaemon(true);
                return thread;
            });
            service.scheduleWithFixedDelay(
                    DisableAdBreaksPatch::disableAllSlots,
                    INITIAL_DELAY_SECONDS, PERIOD_SECONDS, TimeUnit.SECONDS
            );
            executor = service;
        }
    }

    private static void disableAllSlots() {
        Object current = transport;
        if (current != null) disableSlots(current);
    }

    private static void disableSlots(Object transport) {
        try {
            Class<?> transportClass = transport.getClass();
            ClassLoader classLoader = transportClass.getClassLoader();
            Class<?> callbackClass = Class.forName(RESOLVE_CALLBACK_CLASS, false, classLoader);

            Field routerField = findField(transportClass, "router");
            Object router = routerField.get(transport);
            if (router == null) throw new IllegalStateException("Cosmos transport has no router");
            Method resolve = findResolve(router.getClass());

            for (String slot : AUDIO_AD_SLOTS) {
                Object request = createRequest(transportClass, transport, slot);
                Object callback = loggingCallback(callbackClass, slot);
                resolve.invoke(router, request, callback);
            }
            Logger.info("Requested disabled audio ad slots for " + transport.getClass().getSimpleName()
                    + ": " + String.join(", ", AUDIO_AD_SLOTS));
        } catch (Throwable ex) {
            Logger.error("disableAdBreakSlots failure", ex);
        }
    }

    /**
     * Resolves the transport's request factory. Older releases used the private
     * {@code access$createRequest} static accessor; this build exposes {@code createRequest} itself.
     */
    private static Object createRequest(Class<?> transportClass, Object transport, String slot) throws Exception {
        byte[] payload = updateSlotEnabledRequest(slot, false);
        for (Class<?> current = transportClass; current != null; current = current.getSuperclass()) {
            for (Method method : current.getDeclaredMethods()) {
                if (!method.getName().equals("access$createRequest") && !method.getName().equals("createRequest")) {
                    continue;
                }
                String[] parameters = parameterNames(method);
                boolean accessor = method.getName().startsWith("access$");
                if (accessor && parameters.length == 5 && parameters[0].equals(transportClass.getName())) {
                    method.setAccessible(true);
                    return method.invoke(null, transport, SETTINGS_SERVICE, UPDATE_SLOT_ENABLED, payload, "POST");
                }
                if (!accessor && parameters.length == 4 && parameters[0].equals("java.lang.String")
                        && parameters[1].equals("java.lang.String")
                        && parameters[2].equals("[B") && parameters[3].equals("java.lang.String")) {
                    method.setAccessible(true);
                    return Modifier.isStatic(method.getModifiers())
                            ? method.invoke(null, SETTINGS_SERVICE, UPDATE_SLOT_ENABLED, payload, "POST")
                            : method.invoke(transport, SETTINGS_SERVICE, UPDATE_SLOT_ENABLED, payload, "POST");
                }
            }
        }
        throw new NoSuchMethodException("No request factory on " + transportClass.getName());
    }

    private static Method findResolve(Class<?> routerClass) throws NoSuchMethodException {
        for (Method method : routerClass.getMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (method.getName().equals("resolve") && types.length == 2) {
                method.setAccessible(true);
                return method;
            }
        }
        throw new NoSuchMethodException("No resolve(Request, callback) on " + routerClass.getName());
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                // Continue with the superclass.
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }

    private static String[] parameterNames(Method method) {
        Class<?>[] types = method.getParameterTypes();
        String[] names = new String[types.length];
        for (int i = 0; i < types.length; i++) {
            names[i] = types[i].isArray() ? types[i].getName() : types[i].getName();
        }
        return names;
    }

    /** @return A {@code ResolveCallback} that only reports failed updates. */
    private static Object loggingCallback(Class<?> callbackClass, String slot) {
        return java.lang.reflect.Proxy.newProxyInstance(callbackClass.getClassLoader(),
                new Class<?>[]{callbackClass}, (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "hashCode":
                            return System.identityHashCode(proxy);
                        case "equals":
                            return args != null && proxy == args[0];
                        case "toString":
                            return "DisableAdBreaksCallback(" + slot + ")";
                    }

                    // Runs on a router thread, so nothing may escape.
                    try {
                        Object argument = args == null ? null : args[0];
                        if (method.getName().equals("onError")) {
                            Logger.error("Failed to disable ad slot: " + slot,
                                    args != null && args[0] instanceof Throwable ? (Throwable) args[0] : null);
                        } else if (method.getName().equals("onResolved") && argument != null) {
                            Object status = args[0].getClass().getMethod("getStatus").invoke(args[0]);
                            if (!Integer.valueOf(200).equals(status)) {
                                Logger.info("Could not disable ad slot " + slot + ": " + args[0]);
                            }
                        }
                    } catch (Throwable ex) {
                        Logger.error("Ad slot callback failure", ex);
                    }
                    return null;
                });
    }

    /** @return The serialized {@code UpdateSlotEnabledRequest} (1: string slot_id, 2: bool enabled). */
    private static byte[] updateSlotEnabledRequest(String slotId, boolean enabled) {
        byte[] slot = slotId.getBytes(StandardCharsets.UTF_8);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(0x0A); // Field 1, length delimited.
        out.write(slot.length); // Slot ids are shorter than 128 bytes.
        out.write(slot, 0, slot.length);
        out.write(0x10); // Field 2, varint.
        out.write(enabled ? 1 : 0);
        return out.toByteArray();
    }
}
