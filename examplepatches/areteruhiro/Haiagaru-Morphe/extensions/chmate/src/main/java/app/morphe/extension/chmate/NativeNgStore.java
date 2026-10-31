package app.morphe.extension.chmate;

import android.content.Context;
import java.lang.reflect.*;
import java.util.*;

/** Narrow adapter to native NGWord storage; never reads/writes its files directly. */
final class NativeNgStore {
    final Object store, category;
    final Class<?> itemType;
    private final Method snapshot, save, update;

    NativeNgStore(Context context, String name) throws ReflectiveOperationException {
        ClassLoader loader = context.getClassLoader();
        Class<?> type = Class.forName("jp.syoboi.a2chMate.ng.NGWord", false, loader);
        itemType = Class.forName("jp.syoboi.a2chMate.ng.NGWord$Item", false, loader);
        Object found = null, kind = null;
        for (Method method : context.getApplicationContext().getClass().getDeclaredMethods()) {
            Class<?>[] params = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != type
                    || params.length != 1 || !params[0].isEnum()) continue;
            for (Object value : params[0].getEnumConstants()) {
                if (!name.equals(((Enum<?>) value).name())) continue;
                method.setAccessible(true);
                found = method.invoke(null, value);
                kind = value;
            }
        }
        if (found == null) throw new IllegalStateException("Native NG provider unavailable: " + name);
        store = found;
        category = kind;
        String version;
        try { version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName; }
        catch (Exception error) { throw new IllegalStateException(error); }
        String snapshotName;
        if ("0.8.10.191 dev".equals(version)) snapshotName = "a";
        else if ("0.8.10.226 dev".equals(version) || "0.8.10.241".equals(version)) snapshotName = "d";
        else if ("0.8.10.242 dev".equals(version)) snapshotName = "e";
        else throw new IllegalStateException("Unsupported NG store version: " + version);
        snapshot = type.getMethod(snapshotName);
        if (snapshot.getReturnType() != ArrayList.class) throw new IllegalStateException("NG snapshot changed");
        Method writer = null, updater = null;
        for (Method method : type.getDeclaredMethods()) {
            if (Modifier.isStatic(method.getModifiers())) continue;
            Class<?>[] params = method.getParameterTypes();
            if (method.getReturnType() == void.class && Arrays.equals(params, new Class<?>[]{ArrayList.class})) writer = method;
            if (method.getReturnType() == int.class && Arrays.equals(params, new Class<?>[]{itemType, itemType})) updater = method;
        }
        if (writer == null || updater == null) throw new IllegalStateException("NG writer changed");
        save = writer;
        save.setAccessible(true);
        update = updater;
        update.setAccessible(true);
    }

    List<Entry> entries() throws ReflectiveOperationException {
        List<Entry> result = new ArrayList<>();
        for (Object item : (List<?>) snapshot.invoke(store)) result.add(new Entry(item));
        return result;
    }

    Object item(String pattern, short flags, long timestamp, String board) throws ReflectiveOperationException {
        return itemType.getConstructor(String.class, short.class, long.class, String.class)
                .newInstance(pattern, flags, timestamp, board);
    }

    void update(Object before, Object after) throws ReflectiveOperationException {
        update.invoke(store, before, after);
        WacchoiSuffixNg.notifyLegacyNameChange(store.getClass().getClassLoader(), category, itemType, before, after);
    }

    void replace(List<Entry> before, List<Object> after) throws ReflectiveOperationException {
        // Refuse a stale preview rather than overwrite rules added while it was open.
        List<Entry> current = entries();
        if (before.size() != current.size()) throw new IllegalStateException("NG一覧が変更されました。開き直してください");
        for (int i = 0; i < before.size(); i++) if (!before.get(i).same(current.get(i)))
            throw new IllegalStateException("NG一覧が変更されました。開き直してください");
        if (after.size() > Haiagaru.getNgRegistrationLimit()) throw new IllegalStateException("NG登録上限を超えます");
        save.invoke(store, new ArrayList<>(after));
        for (Entry entry : before) if (!after.contains(entry.nativeItem))
            WacchoiSuffixNg.notifyLegacyNameChange(store.getClass().getClassLoader(), category, itemType, entry.nativeItem, null);
        for (Object item : after) if (before.stream().noneMatch(entry -> entry.nativeItem == item))
            WacchoiSuffixNg.notifyLegacyNameChange(store.getClass().getClassLoader(), category, itemType, null, item);
    }

    static final class Entry {
        final Object nativeItem;
        final String pattern, board;
        final short flags;
        final long timestamp;
        Entry(Object item) throws IllegalAccessException {
            nativeItem = item;
            pattern = item.toString();
            String scope = null;
            short bits = 0;
            long time = 0;
            // Pattern public field is set by the first constructor argument; identify it
            // from toString, retaining the remaining public String as the board key.
            for (Field field : NativeFields.all(item.getClass())) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                if (field.getType() == short.class) bits = field.getShort(item);
                if (field.getType() == long.class) time = field.getLong(item);
                if (Modifier.isPublic(field.getModifiers()) && field.getType() == String.class) {
                    String value = (String) field.get(item);
                    if (value != null && !value.equals(pattern)) scope = value;
                }
            }
            board = scope;
            flags = bits;
            timestamp = time;
        }
        boolean same(Entry other) {
            return pattern.equals(other.pattern) && Objects.equals(board, other.board)
                    && flags == other.flags && timestamp == other.timestamp;
        }
    }
}
