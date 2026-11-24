package app.template.extension.aare;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * The "Settings" row these patches add to AARE's settings home, and the switches behind it.
 *
 * Every patch registers itself here when it is applied (the patches add a call to {@link #register}
 * in {@link #registerAll}), so the screen lists exactly the patches of the installed release: a new
 * release brings its new switches without anything else to update.
 */
public final class PatchSettings {
    private static final String TAG = "AarePatches";
    private static final String PREFS = "aare_patches";

    /** The name of the extra entry of AARE's Page enum. */
    public static final String PAGE_NAME = "AARE_PATCHES";

    public static final String BACKGROUND_LOCATION = "background_location";
    public static final String VOICE_MESSAGES = "voice_messages";
    public static final String VOICE_REPLY = "voice_reply";
    public static final String INTEGRATED_SHIZUKU = "integrated_shizuku";
    public static final String CAR_MICROPHONE = "car_microphone";
    public static final String AARE_ASSISTANT = "aare_assistant";
    public static final String TUNNEL_NAVIGATION = "tunnel_navigation";

    /** One switch of the screen. */
    static final class Feature {
        final String key;
        final String title;
        final String summary;
        /** Shows a permission of the system instead of a stored choice. */
        final boolean permission;
        /** A Material icon, as SVG path data on a 24 x 24 grid. */
        final String icon;

        Feature(String key, String title, String summary, boolean permission, String icon) {
            this.key = key;
            this.title = title;
            this.summary = summary;
            this.permission = permission;
            this.icon = icon;
        }
    }

    private static final Set<String> registered = new LinkedHashSet<>();
    private static volatile boolean loaded;

    private PatchSettings() {
    }

    // region Registration

    /**
     * The patches add a register("key") call here, one per applied patch. They use the parameter's
     * register for the key, so the method needs no locals of its own.
     */
    private static void registerAll(String key) {
        register(key);
    }

    private static void register(String key) {
        if (key != null) registered.add(key);
    }

    private static synchronized void load() {
        if (loaded) return;
        loaded = true;
        try {
            registerAll(null);
        } catch (Throwable t) {
            Log.w(TAG, "registerAll", t);
        }
    }

    /** The patch with this key is part of this build. */
    static boolean isRegistered(String key) {
        load();
        return registered.contains(key);
    }

    /** The applied patches, in the order of {@link #known}. */
    static List<Feature> features() {
        load();
        List<Feature> list = new ArrayList<>();
        for (Feature f : known()) {
            if (registered.contains(f.key)) list.add(f);
        }
        return list;
    }

    // Material icons (Apache License 2.0): location_on, mic, reply.
    private static final String ICON_LOCATION = "M12,2C8.13,2 5,5.13 5,9c0,5.25 7,13 7,13s7,-7.75 7,-13c0,-3.87 -3.13,-7 -7,-7z"
            + "M12,11.5c-1.38,0 -2.5,-1.12 -2.5,-2.5s1.12,-2.5 2.5,-2.5 2.5,1.12 2.5,2.5 -1.12,2.5 -2.5,2.5z";
    private static final String ICON_MIC = "M12,14c1.66,0 2.99,-1.34 2.99,-3L15,5c0,-1.66 -1.34,-3 -3,-3S9,3.34 9,5v6c0,1.66 1.34,3 3,3z"
            + "M17.3,11c0,3 -2.54,5.1 -5.3,5.1S6.7,14 6.7,11L5,11c0,3.41 2.72,6.23 6,6.72L11,21h2v-3.28c3.28,-0.48 6,-3.3 6,-6.72h-1.7z";
    static final String ICON_DEVELOPER = "M7,5h10v2h2L19,3c0,-1.1 -0.9,-1.99 -2,-1.99L7,1c-1.1,0 -2,0.9 -2,2v4h2L7,5z"
            + "M15.41,16.59L20,12l-4.59,-4.59L14,8.83 17.17,12 14,15.17l1.41,1.42z"
            + "M10,15.17L6.83,12 10,8.83 8.59,7.41 4,12l4.59,4.59L10,15.17z"
            + "M17,19L7,19v-2L5,17v4c0,1.1 0.9,2 2,2h10c1.1,0 2,-0.9 2,-2v-4h-2v2z";
    static final String ICON_LINK = "M3.9,12c0,-1.71 1.39,-3.1 3.1,-3.1h4L11,7L7,7c-2.76,0 -5,2.24 -5,5s2.24,5 5,5h4v-1.9L7,15.1"
            + "c-1.71,0 -3.1,-1.39 -3.1,-3.1zM8,13h8v-2L8,11v2zM17,7h-4v1.9h4c1.71,0 3.1,1.39 3.1,3.1s-1.39,3.1 -3.1,3.1h-4V17h4"
            + "c2.76,0 5,-2.24 5,-5s-2.24,-5 -5,-5z";
    static final String ICON_PLAY = "M8,5v14l11,-7z";
    static final String ICON_TUNNEL = "M12,2L4.5,20.29l0.71,0.71L12,18l6.79,3 0.71,-0.71z";
    static final String ICON_CAR = "M18.92,6.01C18.72,5.42 18.16,5 17.5,5h-11c-0.66,0 -1.21,0.42 -1.42,1.01L3,12v8c0,0.55 0.45,1 1,1h1"
            + "c0.55,0 1,-0.45 1,-1v-1h12v1c0,0.55 0.45,1 1,1h1c0.55,0 1,-0.45 1,-1v-8l-2.08,-5.99z"
            + "M6.5,16c-0.83,0 -1.5,-0.67 -1.5,-1.5S5.67,13 6.5,13s1.5,0.67 1.5,1.5S7.33,16 6.5,16z"
            + "M17.5,16c-0.83,0 -1.5,-0.67 -1.5,-1.5s0.67,-1.5 1.5,-1.5 1.5,0.67 1.5,1.5 -0.67,1.5 -1.5,1.5z"
            + "M5,11l1.5,-4.5h11L19,11H5z";
    static final String ICON_ASSISTANT = "M12,2C6.48,2 2,6.48 2,12s4.48,10 10,10 10,-4.48 10,-10S17.52,2 12,2z"
            + "M12,18c-0.83,0 -1.5,-0.67 -1.5,-1.5h3c0,0.83 -0.67,1.5 -1.5,1.5zM16,15.5H8v-1l1,-1v-2.5c0,-1.54 0.82,-2.82 2.25,-3.16V7.5"
            + "c0,-0.41 0.34,-0.75 0.75,-0.75s0.75,0.34 0.75,0.75v0.34C14.18,8.18 15,9.46 15,11v2.5l1,1v1z";
    static final String ICON_STOP = "M6,6h12v12H6z";
    private static final String ICON_REPLY = "M10,9V5l-7,7 7,7v-4.1c5,0 8.5,1.6 11,5.1 -1,-5 -4,-10 -11,-11z";

    private static List<Feature> known() {
        return Arrays.asList(
                new Feature(BACKGROUND_LOCATION,
                        phrase("Background location", "Posizione in background"),
                        phrase("Keeps GPS for the navigation app with the phone locked. Needs \"Allow all the time\" "
                                        + "for AARE: tap to open its location permission.",
                                "Mantiene il GPS per la navigazione a telefono bloccato. Serve «Consenti sempre» per AARE: "
                                        + "tocca per aprire il permesso di posizione."),
                        true, ICON_LOCATION),
                new Feature(TUNNEL_NAVIGATION,
                        phrase("Tunnel navigation", "Navigazione in galleria"),
                        phrase("With the car's GPS for the phone: in tunnels the position keeps moving, estimated from the car's "
                                        + "speed, compass and gyroscope, until the GPS is back.",
                                "Col GPS dell'auto per il telefono: in galleria la posizione continua ad avanzare, stimata da "
                                        + "velocità, bussola e giroscopio dell'auto, finché torna il GPS."),
                        false, ICON_TUNNEL),
                new Feature(VOICE_MESSAGES,
                        phrase("Voice messages", "Messaggi vocali"),
                        phrase("Plays WhatsApp voice messages in the car when AARE reads a message. Needs Shizuku running.",
                                "Riproduce in auto i vocali di WhatsApp quando AARE legge un messaggio. Serve Shizuku attivo."),
                        false, ICON_MIC),
                new Feature(VOICE_REPLY,
                        phrase("Voice reply", "Risposta vocale"),
                        phrase("After reading a message, shows \"Reply\" for 15 seconds and in the notification centre: "
                                        + "dictate the answer, then confirm to send it.",
                                "Dopo la lettura mostra «Rispondi» per 15 secondi e nel centro notifiche: "
                                        + "detti la risposta e confermi l'invio."),
                        false, ICON_REPLY),
                new Feature(AARE_ASSISTANT,
                        phrase("AARE assistant", "Assistente AARE"),
                        phrase("The voice button opens AARE's own assistant on the car screen (Italian, German, English): navigation, music, messages "
                                        + "and replies, calls, the time. For anything else it opens Google on the phone.",
                                "Il tasto vocale apre l'assistente di AARE sullo schermo dell'auto (italiano, tedesco, inglese): navigazione, musica, "
                                        + "messaggi e risposte, chiamate, l'ora. Per il resto apre Google sul telefono."),
                        false, ICON_ASSISTANT),
                new Feature(CAR_MICROPHONE,
                        phrase("Car microphone", "Microfono dell'auto"),
                        phrase("Dictated replies and AARE's assistant listen through the car's microphone (the phone's if the "
                                        + "car has none). Needs Android 13.",
                                "Le risposte dettate e l'assistente di AARE ascoltano dal microfono dell'auto (quello del "
                                        + "telefono se l'auto non ce l'ha). Serve Android 13."),
                        false, ICON_CAR),
                new Feature(INTEGRATED_SHIZUKU,
                        phrase("Integrated Shizuku", "Shizuku integrato"),
                        phrase("Car audio and voice messages without the Shizuku app: AARE pairs with wireless debugging "
                                        + "once and starts by itself after each restart, on Wi-Fi.",
                                "Audio in auto e vocali senza l'app Shizuku: AARE si accoppia una volta col debug wireless "
                                        + "e si riavvia da sola dopo ogni riavvio, col Wi-Fi."),
                        false, ICON_DEVELOPER));
    }

    // endregion

    // region Switches

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** Whether the user left the feature on. Every feature starts on. */
    /**
     * Features off until the user turns them on, as AARE would ship them: they change what other apps
     * get (tunnel navigation's estimated position) or read another app's files (voice messages).
     */
    private static final java.util.Set<String> OFF_BY_DEFAULT = new java.util.HashSet<>(java.util.Arrays.asList(TUNNEL_NAVIGATION, VOICE_MESSAGES));

    public static boolean isEnabled(Context context, String key) {
        try {
            if (context == null) context = application();
            if (context == null) return !OFF_BY_DEFAULT.contains(key);
            return prefs(context).getBoolean(key, !OFF_BY_DEFAULT.contains(key));
        } catch (Throwable t) {
            Log.w(TAG, "isEnabled", t);
            return !OFF_BY_DEFAULT.contains(key);
        }
    }

    static void setEnabled(Context context, String key, boolean enabled) {
        prefs(context).edit().putBoolean(key, enabled).apply();
    }

    // endregion

    /** AARE assistant's language: auto (the phone's), it, de or en. */
    static String assistantLanguage() {
        Context app = application();
        if (app == null) return "auto";
        return prefs(app).getString("assistant_language", "auto");
    }

    static void setAssistantLanguage(Context context, String language) {
        prefs(context).edit().putString("assistant_language", language).apply();
    }

    // endregion

    // region Settings home row (called from AARE's code)

    /** The application, for the code that runs before any context is at hand (the Page enum). */
    @SuppressLint("PrivateApi")
    static Context application() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    private static int string(String name) {
        Context app = application();
        if (app == null) return 0;
        return app.getResources().getIdentifier(name, "string", app.getPackageName());
    }

    /** The title of the row, a string the Settings patch adds to AARE. */
    public static int titleRes() {
        return string("aare_patches_settings_title");
    }

    /** The subtitle of the row. */
    public static int subtitleRes() {
        return string("aare_patches_settings_subtitle");
    }

    /**
     * Called at the end of the Page enum's static initializer: adds the row to the pages of the
     * settings home, unless its strings are missing (stringResource would fail on them).
     */
    public static Object[] withPage(Object[] pages, Object page) {
        if (titleRes() == 0 || subtitleRes() == 0) return pages;
        Object[] all = Arrays.copyOf(pages, pages.length + 1);
        all[pages.length] = page;
        return all;
    }

    private static Object openSettings;

    /**
     * Called at the start of AARE's CategoryRow: the row of this screen opens it, instead of
     * showing a page of AARE's own.
     *
     * @return the click action to use for the row.
     */
    public static Object onCategoryClick(Object page, Object onClick) {
        try {
            if (!(page instanceof Enum) || !PAGE_NAME.equals(((Enum<?>) page).name())) return onClick;
            if (openSettings == null) openSettings = function0(PatchSettings::open);
            return openSettings;
        } catch (Throwable t) {
            Log.w(TAG, "onCategoryClick", t);
            return onClick;
        }
    }

    /** A kotlin.jvm.functions.Function0 that runs the action, made without Kotlin on the classpath. */
    private static Object function0(Runnable action) throws ClassNotFoundException {
        Class<?> type = Class.forName("kotlin.jvm.functions.Function0", false, PatchSettings.class.getClassLoader());
        Object unit = null;
        try {
            unit = Class.forName("kotlin.Unit", true, PatchSettings.class.getClassLoader()).getField("INSTANCE").get(null);
        } catch (Throwable ignored) {
        }
        final Object result = unit;
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
            switch (method.getName()) {
                case "invoke":
                    action.run();
                    return result;
                case "equals":
                    return proxy == args[0];
                case "hashCode":
                    return System.identityHashCode(proxy);
                default:
                    return "AarePatchesSettings";
            }
        });
    }

    private static void open() {
        Context app = application();
        if (app == null) return;
        Intent intent = new Intent(app, PatchSettingsActivity.class);
        // Same task affinity as AARE: the screen opens above AARE's settings, and Back returns to them.
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        app.startActivity(intent);
    }

    // endregion

    public static String phrase(String english, String italian) {
        return "it".equals(Locale.getDefault().getLanguage()) ? italian : english;
    }
}
