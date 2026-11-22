package dev.supperelias2.sbs.morphe.features;

import dev.supperelias2.sbs.morphe.MorpheSettings;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Stores a semantic bitrate ceiling; track objects and track indices never leave the current video. */
@SuppressWarnings("unused")
public final class QualityHooks {
    private static final Map<Object, State> STATES = Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Boolean> RESTORING = new ThreadLocal<>();

    private QualityHooks() {
    }

    /** Runs before the app applies a user selection. Recursive restoration is excluded. */
    public static void record(Object controller, Object quality) {
        if (controller == null || quality == null || Boolean.TRUE.equals(RESTORING.get())) return;
        if (!MorpheSettings.enabled("remember_quality", false)) return;
        try {
            int mode = mode();
            int bitrate = ceiling();
            if (mode == 1) {
                bitrate = "Auto".equals(call(quality, "getTrack")) ? 0 : number(call(quality, "getBitrate"), 0);
                if (bitrate < 0) bitrate = 0;
                MorpheSettings.saveInt("quality_last_bitrate", bitrate);
            }
            Snapshot snapshot = snapshot(controller);
            if (snapshot.player == null) return;
            State state = state(controller, snapshot);
            // Updating the stamp first prevents the app's synchronous onTracksChanged callback
            // from restoring over the selection currently being made.
            boolean wasHighest = state.highest;
            state.mark(snapshot, true, mode, bitrate);
            if (wasHighest && mode != 2) setParameters(snapshot.player, false, null, false);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // A missing optional integration leaves the app's original selection untouched.
        }
    }

    /** Runs after each extractTracks return; stamps stop parameter-change feedback loops. */
    public static void restore(Object controller) {
        if (controller == null || Boolean.TRUE.equals(RESTORING.get())) return;
        boolean enabled = MorpheSettings.enabled("remember_quality", false);
        if (!enabled && !STATES.containsKey(controller)) return;
        try {
            Snapshot snapshot = snapshot(controller);
            if (snapshot.player == null) return;
            List<?> tracks = tracks(controller);
            if (tracks.isEmpty()) return;
            int mode = mode();
            int bitrate = ceiling();
            State state = state(controller, snapshot);
            if (state.matches(snapshot, enabled, mode, bitrate)) return;
            boolean hadApplied = state.applied;
            state.mark(snapshot, enabled, mode, bitrate);
            if (!enabled) {
                if (hadApplied) setParameters(snapshot.player, false, state.originalCeiling, false);
                return;
            }
            RESTORING.set(Boolean.TRUE);
            try {
                Object selection = mode == 1 && bitrate > 0 ? nearestTrack(tracks, bitrate) : automatic(controller, tracks);
                if (selection != null) call(controller, "videoQualitySelected", selection);
                // forceHighestSupportedBitrate is a real Media3 selection policy, rather than
                // assuming the first manifest rendition is playable on this device.
                int limit = mode == 1 && bitrate > 0 ? bitrate : Integer.MAX_VALUE;
                setParameters(snapshot.player, mode == 2, limit, mode == 2);
            } finally {
                RESTORING.remove();
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // No logging of stream addresses, identifiers, or account state.
        }
    }

    private static int mode() {
        int mode = MorpheSettings.getInt("quality_mode", 1);
        return mode >= 0 && mode <= 2 ? mode : 1;
    }

    private static int ceiling() {
        int bitrate = MorpheSettings.getInt("quality_last_bitrate", 0);
        return bitrate > 0 ? bitrate : 0;
    }

    private static State state(Object controller, Snapshot snapshot) throws ReflectiveOperationException {
        synchronized (STATES) {
            State state = STATES.get(controller);
            if (state == null || state.player.get() != snapshot.player) {
                Object selector = call(snapshot.player, "getTrackSelector");
                Object parameters = call(selector, "getParameters");
                state = new State(snapshot.player, number(field(parameters, "maxVideoBitrate"), Integer.MAX_VALUE));
                STATES.put(controller, state);
            }
            return state;
        }
    }

    private static Snapshot snapshot(Object controller) throws ReflectiveOperationException {
        Object parent = field(controller, "parentViewModel");
        Object player = parent == null ? null : call(parent, "getPlayer");
        String content = "";
        if (parent != null) {
            for (Method method : parent.getClass().getMethods()) {
                if ((method.getName().equals("getContentId") || method.getName().startsWith("getContentId$"))
                        && method.getParameterTypes().length == 0 && method.getReturnType() == String.class) {
                    method.setAccessible(true);
                    Object value = method.invoke(parent);
                    if (value instanceof String) content = (String) value;
                    break;
                }
            }
        }
        Object mediaItem = player == null ? null : call(player, "getCurrentMediaItem");
        return new Snapshot(player, content, mediaItem);
    }

    private static List<?> tracks(Object controller) throws ReflectiveOperationException {
        Object value = call(call(controller, "getVideoQualityList"), "getValue");
        return value instanceof List ? (List<?>) value : Collections.emptyList();
    }

    private static Object nearestTrack(List<?> tracks, int ceiling) throws ReflectiveOperationException {
        Object best = null;
        Object lowest = null;
        int bestBitrate = 0;
        int lowestBitrate = Integer.MAX_VALUE;
        for (Object track : tracks) {
            if (track == null) continue;
            int bitrate = number(call(track, "getBitrate"), 0);
            if (bitrate <= 0) continue;
            if (bitrate < lowestBitrate) {
                lowest = track;
                lowestBitrate = bitrate;
            }
            if (bitrate <= ceiling && bitrate > bestBitrate) {
                best = track;
                bestBitrate = bitrate;
            }
        }
        return best != null ? best : lowest;
    }

    private static Object automatic(Object controller, List<?> tracks) throws ReflectiveOperationException {
        Object selected = call(call(controller, "getSelectedVideoQuality"), "getValue");
        if (selected != null && "Auto".equals(call(selected, "getTrack"))) return selected;
        Class<?> type = selected != null ? selected.getClass() : tracks.get(0).getClass();
        for (Constructor<?> constructor : type.getConstructors()) {
            Class<?>[] parameters = constructor.getParameterTypes();
            if (parameters.length == 6 && parameters[0] == String.class && parameters[1] == int.class
                    && parameters[3] == int.class && parameters[4] == String.class && parameters[5] == int.class) {
                return constructor.newInstance("Auto", -1, null, 0, null, 0);
            }
        }
        return null;
    }

    private static void setParameters(Object player, boolean highest, Integer maxBitrate, boolean clearOverrides)
            throws ReflectiveOperationException {
        Object selector = call(player, "getTrackSelector");
        Object builder = call(call(selector, "getParameters"), "buildUpon");
        call(builder, "setForceHighestSupportedBitrate", highest);
        if (maxBitrate != null) call(builder, "setMaxVideoBitrate", maxBitrate);
        if (clearOverrides) call(builder, "clearOverridesOfType", 2);
        call(selector, "setParameters", call(builder, "build"));
    }

    private static Object call(Object target, String name, Object... arguments) throws ReflectiveOperationException {
        if (target == null) throw new NoSuchMethodException(name);
        Method found = null;
        for (Method method : target.getClass().getMethods()) {
            if (!method.getName().equals(name) || method.isBridge() || method.isSynthetic()) continue;
            Class<?>[] types = method.getParameterTypes();
            if (types.length != arguments.length) continue;
            boolean compatible = true;
            for (int i = 0; i < types.length; i++) {
                Class<?> type = types[i];
                Object value = arguments[i];
                if (type.isPrimitive()) {
                    if (!(type == int.class && value instanceof Integer) && !(type == boolean.class && value instanceof Boolean)) compatible = false;
                } else if (value != null && !type.isInstance(value)) compatible = false;
            }
            if (!compatible) continue;
            if (found == null) {
                found = method;
            } else {
                Class<?>[] previous = found.getParameterTypes();
                boolean narrower = true;
                boolean broader = true;
                for (int i = 0; i < types.length; i++) {
                    narrower &= previous[i].isAssignableFrom(types[i]);
                    broader &= types[i].isAssignableFrom(previous[i]);
                }
                if (narrower && !broader) found = method;
                else if (!narrower && !broader) throw new NoSuchMethodException("Ambiguous " + name);
            }
        }
        if (found == null) throw new NoSuchMethodException(name);
        found.setAccessible(true);
        return found.invoke(target, arguments);
    }

    private static Object field(Object target, String name) throws ReflectiveOperationException {
        if (target == null) return null;
        Class<?> type = target.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                type = type.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static int number(Object value, int fallback) {
        return value instanceof Number ? ((Number) value).intValue() : fallback;
    }

    private static final class Snapshot {
        final Object player;
        final String content;
        final Object mediaItem;

        Snapshot(Object player, String content, Object mediaItem) {
            this.player = player;
            this.content = content;
            this.mediaItem = mediaItem;
        }
    }

    private static final class State {
        final WeakReference<Object> player;
        final int originalCeiling;
        WeakReference<Object> mediaItem = new WeakReference<>(null);
        String content;
        boolean configured;
        boolean applied;
        boolean enabled;
        boolean highest;
        int mode;
        int bitrate;

        State(Object player, int originalCeiling) {
            this.player = new WeakReference<>(player);
            this.originalCeiling = originalCeiling;
        }

        boolean matches(Snapshot snapshot, boolean enabled, int mode, int bitrate) {
            return configured && player.get() == snapshot.player && this.enabled == enabled
                    && this.mode == mode && this.bitrate == bitrate && snapshot.content.equals(content)
                    && (!snapshot.content.isEmpty() || mediaItem.get() == snapshot.mediaItem);
        }

        void mark(Snapshot snapshot, boolean enabled, int mode, int bitrate) {
            content = snapshot.content;
            mediaItem = new WeakReference<>(snapshot.mediaItem);
            configured = true;
            this.enabled = enabled;
            this.mode = mode;
            this.bitrate = bitrate;
            applied = enabled;
            highest = enabled && mode == 2;
        }
    }
}
