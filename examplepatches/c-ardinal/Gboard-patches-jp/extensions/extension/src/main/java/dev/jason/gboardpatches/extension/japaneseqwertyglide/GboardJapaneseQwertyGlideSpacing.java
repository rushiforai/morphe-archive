package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.IdentityHashMap;
import java.util.Map;

/** Adds one ASCII separator only when a tracked ABC glide composition commits. */
public final class GboardJapaneseQwertyGlideSpacing {
    private static final ThreadLocal<Delivery> DELIVERY = new ThreadLocal<Delivery>();
    private static final Map<Object, Owner> OWNERS = new IdentityHashMap<Object, Owner>();
    private static long session;

    private GboardJapaneseQwertyGlideSpacing() {
    }

    private static final class Delivery {
        final Object manager;
        final Object keyboard;
        final Object editor;
        final long epoch;

        Delivery(Object manager, Object keyboard, Object editor, long epoch) {
            this.manager = manager;
            this.keyboard = keyboard;
            this.editor = editor;
            this.epoch = epoch;
        }
    }

    private static final class Owner {
        final Delivery delivery;
        final Object ime;
        final Object executor;
        final Object callback;
        final Object renderer;
        final Object connection;
        final Object view;
        final long session;
        final ArrayDeque<Boolean> pending = new ArrayDeque<Boolean>();
        Object lastCommit;

        Owner(Delivery delivery, Object ime) throws ReflectiveOperationException {
            this.delivery = delivery;
            this.ime = ime;
            executor = field(ime, "b");
            callback = field(ime, "h");
            renderer = field(field(ime, "d"), "c");
            connection = field(ime, "E");
            view = field(delivery.manager, "j");
            session = GboardJapaneseQwertyGlideSpacing.session;
        }
    }

    static void beginDelivery(Object manager, Object keyboard, Object editor, long epoch) {
        DELIVERY.set(new Delivery(manager, keyboard, editor, epoch));
    }

    static void endDelivery() {
        DELIVERY.remove();
    }

    /** Called at SimpleJapaneseIme.p entry while the runtime injects its own PLAIN_TEXT event. */
    public static void observeIme(Object ime, Object event) {
        Delivery delivery = DELIVERY.get();
        if (delivery == null || ime == null || event == null) {
            return;
        }
        try {
            Object[] actions = (Object[]) field(event, "b");
            if (actions == null || actions.length != 1 || actions[0] == null
                    || ((Number) field(actions[0], "c")).intValue() != -10009
                    || normalizedWord(field(actions[0], "e")) == null) return;
            synchronized (OWNERS) {
                Owner owner = OWNERS.get(delivery.manager);
                if (owner == null || owner.ime != ime || owner.delivery.epoch != delivery.epoch
                        || owner.delivery.editor != delivery.editor || !current(owner)) {
                    owner = new Owner(delivery, ime);
                    if (!current(owner)) {
                        return;
                    }
                    OWNERS.put(delivery.manager, owner);
                }
                // Bound deliveries awaiting a renderer callback.
                if (owner.pending.size() >= 8) {
                    OWNERS.remove(delivery.manager);
                    return;
                }
                owner.pending.addLast(Boolean.FALSE);
                Log.i(GboardJapaneseQwertyGlideRuntime.TAG, "spacing: tracked Glide, pending="
                        + owner.pending.size() + ", epoch=" + delivery.epoch);
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            logFailure("spacing track failed", failure);
            cancel(delivery.manager);
        }
    }

    /** Uses Mozc's SUBMIT command, before enqueueing the next glide's PLAIN_TEXT event. */
    static void submitPrevious(Object manager, long epoch) {
        try {
            synchronized (OWNERS) {
                Owner owner = OWNERS.get(manager);
                if (owner == null || owner.delivery.epoch != epoch || owner.pending.isEmpty()
                        || !current(owner)) return;
                if (Boolean.TRUE.equals(owner.pending.peekLast())) {
                    return;
                }
                ClassLoader loader = owner.ime.getClass().getClassLoader();
                invoke(owner.executor, "p", new Class<?>[] {
                        Class.forName("ohe", false, loader), boolean.class, String.class,
                        String.class, Class.forName("ikk", false, loader)},
                        null, true, "", "", owner.callback);
                owner.pending.removeLast();
                owner.pending.addLast(Boolean.TRUE);
                Log.i(GboardJapaneseQwertyGlideRuntime.TAG, "spacing: SUBMIT enqueued, pending="
                        + owner.pending.size() + ", epoch=" + epoch);
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            logFailure("spacing SUBMIT failed", failure);
            cancel(manager);
        }
    }

    /** Copies only the committed mjf payload; candidates and composing segments retain their stock values. */
    public static Object appendCommit(Object renderer, Object command, Object editor) {
        if (renderer == null || command == null || editor == null) {
            return command;
        }
        try {
            synchronized (OWNERS) {
                Owner owner = null;
                for (Owner candidate : OWNERS.values()) {
                    if (candidate.renderer == renderer && candidate.delivery.editor == editor
                            && !candidate.pending.isEmpty() && current(candidate)) {
                        owner = candidate;
                        break;
                    }
                }
                if (owner == null || owner.lastCommit == command) {
                    return command;
                }
                Object result = field(command, "e");
                if (result == null || (((Number) field(command, "b")).intValue() & 8) == 0) {
                    return command;
                }
                Object text = field(result, "c");
                if (!(text instanceof String) || ((String) text).isEmpty()) {
                    return command;
                }
                // Any actual result ends this token; unsupported edits must not arm a later commit.
                owner.pending.removeFirst();
                owner.lastCommit = command;
                if (((Number) field(result, "e")).intValue() != 0) {
                    return command;
                }
                String spaced = normalizedWord(text);
                if (spaced == null) {
                    return command;
                }
                Object resultBuilder = invoke(result, "G", new Class<?>[0]);
                invoke(resultBuilder, "t", new Class<?>[0]);
                Object mutableResult = field(resultBuilder, "b");
                findField(mutableResult.getClass(), "c").set(mutableResult, spaced);
                Object copiedResult = invoke(resultBuilder, "q", new Class<?>[0]);
                Object commandBuilder = invoke(command, "G", new Class<?>[0]);
                invoke(commandBuilder, "t", new Class<?>[0]);
                Object mutableCommand = field(commandBuilder, "b");
                findField(mutableCommand.getClass(), "e").set(mutableCommand, copiedResult);
                Object spacedCommand = invoke(commandBuilder, "q", new Class<?>[0]);
                Log.i(GboardJapaneseQwertyGlideRuntime.TAG, "spacing: ASCII suffix applied, pending="
                        + owner.pending.size() + ", epoch=" + owner.delivery.epoch);
                return spacedCommand;
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            logFailure("spacing commit failed", failure);
            return command;
        }
    }

    private static void logFailure(String context, Throwable failure) {
        Log.w(GboardJapaneseQwertyGlideRuntime.TAG, context + " (" + failure.getClass().getSimpleName() + ")");
    }

    static String normalizedWord(Object value) {
        if (!(value instanceof String)) {
            return null;
        }
        String text = (String) value;
        int end = text.length();
        while (end > 0 && text.charAt(end - 1) == ' ') {
            end--;
        }
        String word = text.substring(0, end);
        return word.length() <= 64 && word.matches("[A-Za-z]+(?:['-][A-Za-z]+)*") ? word + " " : null;
    }

    private static boolean current(Owner owner) throws ReflectiveOperationException {
        Delivery delivery = owner.delivery;
        return owner.session == session && delivery.editor != null && owner.view != null
                && field(owner.ime, "H") == delivery.editor
                && field(owner.ime, "E") == owner.connection
                && field(owner.renderer, "h") == owner.connection
                && field(delivery.keyboard, "H") == delivery.editor
                && Boolean.TRUE.equals(field(delivery.keyboard, "G"))
                && Boolean.TRUE.equals(field(delivery.manager, "m"))
                && field(delivery.manager, "j") == owner.view;
    }

    static void cancel(Object manager) {
        synchronized (OWNERS) {
            OWNERS.remove(manager);
        }
    }

    static void reset() {
        DELIVERY.remove();
        synchronized (OWNERS) {
            session++;
            OWNERS.clear();
        }
    }

    private static Object invoke(Object target, String name, Class<?>[] types, Object... args)
            throws ReflectiveOperationException {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(target, args);
    }

    private static Object field(Object target, String name) throws ReflectiveOperationException {
        return findField(target.getClass(), name).get(target);
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                // IME and generated proto fields can be inherited.
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }
}
