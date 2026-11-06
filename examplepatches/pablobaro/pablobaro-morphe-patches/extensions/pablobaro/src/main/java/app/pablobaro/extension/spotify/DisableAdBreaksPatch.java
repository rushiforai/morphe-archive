package app.pablobaro.extension.spotify;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import app.pablobaro.extension.shared.Logger;

/**
 * Disables the ad slots that play ads between songs.
 * <p>
 * The native player only fills ad slots that are enabled. The app enables slots with the
 * {@code spotify.ads.esperanto.proto.Settings/updateSlotEnabled} esperanto call,
 * so the same call is used to disable the ad break slots.
 */
@SuppressWarnings("unused")
public final class DisableAdBreaksPatch {
    /**
     * The ads esperanto services are served by the Cosmos router, not by the native transport.
     */
    private static final String COSMOS_TRANSPORT_CLASS = "com.spotify.esperanto.esperantocosmos.CosmosCoroutineTransport";
    private static final String RESOLVE_CALLBACK_CLASS = "com.spotify.cosmos.cosmos.ResolveCallback";

    private static final String SETTINGS_SERVICE = "spotify.ads.esperanto.proto.Settings";
    private static final String UPDATE_SLOT_ENABLED = "updateSlotEnabled";

    /**
     * Ad slots that play between songs: "stream" (ad breaks) and "preroll" (ad before the first song).
     */
    private static final String[] AD_BREAK_SLOTS = {"stream", "preroll"};

    /**
     * Delay before the first update, so the native ads service is running.
     */
    private static final long INITIAL_DELAY_SECONDS = 10;

    /**
     * The slots are disabled again periodically, in case the app or the server enables them again.
     */
    private static final long PERIOD_SECONDS = 120;

    private static volatile boolean scheduled;

    /**
     * The most recently created Cosmos transport, in case the app recreates it (e.g. after logging in again).
     */
    private static volatile Object cosmosTransport;


    private DisableAdBreaksPatch() {
    }

    /**
     * Injection point: constructor of {@code CoroutineClientBase}, the base class of all esperanto clients.
     *
     * @param transport The {@code CoroutineTransport} of the client.
     */
    public static void onTransportCreated(Object transport) {
        if (transport == null) return;

        try {
            if (!transport.getClass().getName().equals(COSMOS_TRANSPORT_CLASS)) return;
            cosmosTransport = transport;
            if (scheduled) return;

            synchronized (DisableAdBreaksPatch.class) {
                if (scheduled) return;
                scheduled = true;
            }

            ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor(runnable -> {
                Thread thread = new Thread(runnable, "DisableAdBreaks");
                thread.setDaemon(true);
                return thread;
            });
            executor.scheduleWithFixedDelay(
                    () -> disableAdBreakSlots(cosmosTransport),
                    INITIAL_DELAY_SECONDS, PERIOD_SECONDS, TimeUnit.SECONDS
            );
        } catch (Throwable ex) {
            Logger.error("onTransportCreated failure", ex);
        }
    }

    private static void disableAdBreakSlots(Object cosmosTransport) {
        if (cosmosTransport == null) return;

        try {
            Class<?> transportClass = cosmosTransport.getClass();
            ClassLoader classLoader = transportClass.getClassLoader();
            Class<?> callbackClass = Class.forName(RESOLVE_CALLBACK_CLASS, false, classLoader);

            Method createRequest = transportClass.getDeclaredMethod(
                    "access$createRequest", transportClass, String.class, String.class, byte[].class, String.class
            );
            createRequest.setAccessible(true);

            Field routerField = transportClass.getDeclaredField("router");
            routerField.setAccessible(true);
            Object router = routerField.get(cosmosTransport);
            Method resolve = null;
            for (Method method : router.getClass().getMethods()) {
                if (method.getName().equals("resolve") && method.getParameterTypes().length == 2) {
                    method.setAccessible(true);
                    resolve = method;
                    break;
                }
            }
            if (resolve == null) throw new NoSuchMethodException("resolve not found in " + router.getClass());

            for (String slot : AD_BREAK_SLOTS) {
                Object request = createRequest.invoke(null, cosmosTransport, SETTINGS_SERVICE, UPDATE_SLOT_ENABLED,
                        updateSlotEnabledRequest(slot, false), "POST");
                resolve.invoke(router, request, loggingCallback(callbackClass, slot));
            }
        } catch (Throwable ex) {
            Logger.error("disableAdBreakSlots failure", ex);
        }
    }

    /**
     * @return A {@code ResolveCallback} that logs failed updates.
     */
    private static Object loggingCallback(Class<?> callbackClass, String slot) {
        return Proxy.newProxyInstance(callbackClass.getClassLoader(), new Class<?>[]{callbackClass},
                (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "hashCode":
                            return System.identityHashCode(proxy);
                        case "equals":
                            return args != null && proxy == args[0];
                        case "toString":
                            return "DisableAdBreaksCallback(" + slot + ")";
                    }

                    // Runs on a thread of the router, so nothing may be thrown from here.
                    try {
                        Object argument = args == null ? null : args[0];
                        if (method.getName().equals("onError")) {
                            Logger.error("Failed to disable ad slot: " + slot,
                                    argument instanceof Throwable ? (Throwable) argument : null);
                        } else if (method.getName().equals("onResolved") && argument != null) {
                            Object status = argument.getClass().getMethod("getStatus").invoke(argument);
                            if (!Integer.valueOf(200).equals(status)) {
                                Logger.info("Could not disable ad slot " + slot + ": " + argument);
                            }
                        }
                    } catch (Throwable ex) {
                        Logger.error("Ad slot callback failure", ex);
                    }
                    return null;
                });
    }

    /**
     * @return The serialized {@code UpdateSlotEnabledRequest} (1: string slot_id, 2: bool enabled).
     */
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
