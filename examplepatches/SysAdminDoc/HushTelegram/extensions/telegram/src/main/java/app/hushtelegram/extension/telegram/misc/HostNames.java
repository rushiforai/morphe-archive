/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Telegram's own names for what the extension reaches by reflection.
 *
 * <p>From 13.2, R8 renames most of Telegram's {@code org.telegram.messenger} classes along with
 * their fields and methods, and drops the R classes for literal ids. The patch rewrites each of
 * those class names the extension spells out to the build's, and fills {@link #table()} with the
 * build's name of every renamed member and every resource the extension names. A lookup here takes
 * the source name and finds the build's on the class or the nearest supertype that has one. An
 * unpatched build and the unit tests have no table, so there every name stands for itself.
 */
public final class HostNames {
    private HostNames() {}

    private static final String MESSENGER_R = "org.telegram.messenger.R$";

    private static volatile Names names;

    /**
     * The build's names, one per line: {@code m <owner> <name> (<parameters>) <build name>},
     * {@code f <owner> <name> <build name>} and {@code r <type> <name> <hex id>}, owners as
     * {@link Class#getName()} gives them. The patch replaces this body; unpatched it is empty.
     */
    static String table() {
        return "";
    }

    /** {@link Class#getMethod} by the source name. */
    public static Method method(Class<?> type, String name, Class<?>... parameters) throws NoSuchMethodException {
        return type.getMethod(methodName(type, name, parameters), parameters);
    }

    /** {@link Class#getDeclaredMethod} by the source name. */
    public static Method declaredMethod(Class<?> type, String name, Class<?>... parameters) throws NoSuchMethodException {
        return type.getDeclaredMethod(methodName(type, name, parameters), parameters);
    }

    /** {@link Class#getField} by the source name. */
    public static Field field(Class<?> type, String name) throws NoSuchFieldException {
        return type.getField(fieldName(type, name));
    }

    /** {@link Class#getDeclaredField} by the source name. */
    public static Field declaredField(Class<?> type, String name) throws NoSuchFieldException {
        return type.getDeclaredField(fieldName(type, name));
    }

    /**
     * The id of Telegram's resource {@code type/name}: the build's literal when R8 inlined it, or
     * else the field of its R class.
     */
    public static int resource(ClassLoader loader, String type, String name) throws ReflectiveOperationException {
        Integer id = names().resources.get(type + '/' + name);
        if (id != null) return id;
        return Class.forName(MESSENGER_R + type, true, loader).getField(name).getInt(null);
    }

    /** Whether {@code method} is the one the source calls {@code name}, for a scan over a class's methods. */
    public static boolean named(Method method, String name) {
        return method.getName().equals(methodName(method.getDeclaringClass(), name, method.getParameterTypes()));
    }

    /** The build's name of the method, or {@code name} when the build kept it. */
    public static String methodName(Class<?> type, String name, Class<?>... parameters) {
        Names table = names();
        if (table.methods.isEmpty()) return name;
        String wanted = parameterDescriptor(parameters);
        for (Class<?> owner : supertypes(type)) {
            List<String[]> overloads = table.methods.get(owner.getName() + ' ' + name);
            if (overloads == null) continue;
            for (String[] overload : overloads) {
                if (overload[0].equals(wanted)) return overload[1];
            }
        }
        return name;
    }

    /** The build's name of the field, or {@code name} when the build kept it. */
    public static String fieldName(Class<?> type, String name) {
        Names table = names();
        if (table.fields.isEmpty()) return name;
        for (Class<?> owner : supertypes(type)) {
            String renamed = table.fields.get(owner.getName() + ' ' + name);
            if (renamed != null) return renamed;
        }
        return name;
    }

    /** The class, then its superclasses and interfaces, nearest first. */
    private static List<Class<?>> supertypes(Class<?> type) {
        List<Class<?>> out = new ArrayList<>();
        Set<Class<?>> seen = new HashSet<>();
        ArrayDeque<Class<?>> queue = new ArrayDeque<>();
        queue.add(type);
        while (!queue.isEmpty()) {
            Class<?> next = queue.poll();
            if (!seen.add(next)) continue;
            out.add(next);
            if (next.getSuperclass() != null) queue.add(next.getSuperclass());
            Collections.addAll(queue, next.getInterfaces());
        }
        return out;
    }

    static String parameterDescriptor(Class<?>... parameters) {
        StringBuilder out = new StringBuilder("(");
        for (Class<?> parameter : parameters) out.append(descriptor(parameter));
        return out.append(')').toString();
    }

    private static String descriptor(Class<?> type) {
        if (type.isArray()) return type.getName().replace('.', '/');
        if (type == int.class) return "I";
        if (type == long.class) return "J";
        if (type == boolean.class) return "Z";
        if (type == byte.class) return "B";
        if (type == char.class) return "C";
        if (type == short.class) return "S";
        if (type == float.class) return "F";
        if (type == double.class) return "D";
        if (type == void.class) return "V";
        return 'L' + type.getName().replace('.', '/') + ';';
    }

    private static Names names() {
        Names loaded = names;
        if (loaded == null) {
            synchronized (HostNames.class) {
                loaded = names;
                if (loaded == null) names = loaded = Names.parse(table());
            }
        }
        return loaded;
    }

    /** Reads {@code table} in place of the patched one, for the unit tests. Null goes back to the build's. */
    static void useTable(String table) {
        synchronized (HostNames.class) {
            names = table == null ? null : Names.parse(table);
        }
    }

    private static final class Names {
        final Map<String, List<String[]>> methods = new HashMap<>();
        final Map<String, String> fields = new HashMap<>();
        final Map<String, Integer> resources = new HashMap<>();

        static Names parse(String table) {
            Names out = new Names();
            if (table == null) return out;
            for (String line : table.split("\n")) {
                String[] p = line.split(" ");
                if (p.length < 4) continue;
                switch (p[0]) {
                    case "m":
                        if (p.length < 5) break;
                        List<String[]> overloads = out.methods.get(p[1] + ' ' + p[2]);
                        if (overloads == null) out.methods.put(p[1] + ' ' + p[2], overloads = new ArrayList<>(1));
                        overloads.add(new String[] {p[3], p[4]});
                        break;
                    case "f":
                        out.fields.put(p[1] + ' ' + p[2], p[3]);
                        break;
                    case "r":
                        try {
                            out.resources.put(p[1] + '/' + p[2], (int) Long.parseLong(p[3], 16));
                        } catch (NumberFormatException ignored) {
                            // A malformed row names nothing; the R class lookup still runs.
                        }
                        break;
                    default:
                        break;
                }
            }
            return out;
        }
    }
}
