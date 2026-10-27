package software.santodan.extension.monetchannels;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Monet 1.0.97 adapter. Native items keep their real package, intent and stable key. */
public final class MonetCatalogChannels {
    private static final String PREFIX = "santodan-channel:";
    private static final ThreadLocal<Frame> FRAME = new ThreadLocal<>();
    private static volatile Snapshot snapshot = new Snapshot(Collections.emptyMap());
    private static volatile Bridge bridge;
    private static final ThreadLocal<Object> PICKER_ROW = new ThreadLocal<>();
    private static Object revisionFlow;
    private static long revision;

    private MonetCatalogChannels() {}

    private static final class Channel {
        final String id, title, owner;
        final Set<String> keys = new LinkedHashSet<>();
        final List<Object> items = new ArrayList<>();
        Channel(String owner, String provider, String title) {
            this.owner = owner;
            this.id = PREFIX + Base64.getUrlEncoder().withoutPadding().encodeToString(
                (owner + "\n" + provider).getBytes(StandardCharsets.UTF_8));
            this.title = title + " (Nuvio)";
        }
    }
    private static final class Frame {
        final Context context;
        final Map<Long, Channel> channels;
        Frame(Context context, Map<Long, Channel> channels) { this.context = context; this.channels = channels; }
    }
    private static final class Snapshot {
        final Map<String, Channel> channels;
        Snapshot(Map<String, Channel> channels) { this.channels = Collections.unmodifiableMap(channels); }
    }

    /** Runs in the existing preview-program loader, never in composition. */
    public static void reader(Context context, Object uri, int limit, Object channelId) {
        if (CatalogRefresh.active()) return;
        if (channelId != null) return; // Per-channel overflow reads belong to the same full refresh.
        FRAME.remove();
        Map<Long, Channel> channels = new LinkedHashMap<>();
        try (Cursor cursor = context.getContentResolver().query(Uri.parse("content://android.media.tv/channel"),
                new String[]{"_id", "package_name", "internal_provider_id", "display_name", "type"}, null, null, null)) {
            if (cursor == null) return;
            while (cursor.moveToNext() && channels.size() < 256) {
                String owner = cursor.getString(1), provider = cursor.getString(2), title = cursor.getString(3);
                if (owner == null || provider == null || !provider.startsWith("santodan-launcher/")
                        || title == null || title.trim().isEmpty() || !"TYPE_PREVIEW".equals(cursor.getString(4))) continue;
                channels.put(cursor.getLong(0), new Channel(owner, provider, title));
            }
            FRAME.set(new Frame(context.getApplicationContext(), channels));
        } catch (RuntimeException failure) {
            Log.w("SantodanMonet", "Cannot read catalog channel metadata", failure);
        }
    }

    /** Build membership before Monet merges identical titles from different catalogs. */
    public static void programs(List<?> programs) {
        if (CatalogRefresh.active()) return;
        Frame frame = FRAME.get();
        FRAME.remove();
        if (frame == null) return; // A failed read is not an authoritative empty catalog list.
        if (frame.channels.isEmpty()) { snapshot = new Snapshot(Collections.emptyMap()); return; }
        try {
            Bridge nativeApi = api();
            Object labels = nativeApi.labels.newInstance(frame.context);
            Map<String, Channel> channels = new LinkedHashMap<>();
            int processed = 0;
            for (Object program : programs) {
                if (++processed > 1024) break; // Native full scan plus its bounded overflow cache.
                Channel channel = frame.channels.get(nativeApi.channel.getLong(program));
                if (channel == null || !channel.owner.equals(nativeApi.programOwner.get(program))) continue;
                Object item = nativeApi.convert.invoke(null, program, labels, nativeApi.artwork.get(program), 0L);
                channel.keys.add((String) nativeApi.key.get(item));
                channel.items.add(item);
                channels.put(channel.id, channel);
            }
            snapshot = new Snapshot(channels);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.w("SantodanMonet", "Cannot map catalog program membership", failure);
        }
    }

    /** Called only for recommendation source options; existing app options remain intact. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List sources(List items, LinkedHashMap apps, Set disabled, Locale locale) {
        try {
            Bridge nativeApi = api();
            List original = (List) nativeApi.sources.invoke(null, items, apps, disabled, locale);
            Snapshot current = snapshot;
            if (current.channels.isEmpty()) return original;
            List result = new ArrayList(original);
            Set<String> owners = new HashSet<>();
            Field optionId = Class.forName("a.sj4").getField("a");
            for (Object option : original) owners.add((String) optionId.get(option));
            Map<String, Set<String>> byOwner = new LinkedHashMap<>();
            for (Channel channel : current.channels.values()) byOwner.computeIfAbsent(channel.owner, ignored -> new HashSet<>()).addAll(channel.keys);
            for (Channel channel : current.channels.values()) {
                if (owners.add(channel.owner)) result.add(nativeApi.option.newInstance(byOwner.get(channel.owner).size(),
                    channel.owner, "NuvioTV", !disabled.contains(channel.owner)));
            }
            return result;
        } catch (InvocationTargetException failure) {
            throw new IllegalStateException("Native Monet source builder failed", failure.getCause());
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Monet catalog source contract changed", failure);
        }
    }

    /** Saved source identity stays stable; all UI/package lookups use its real owner. */
    public static String owner(String selected) {
        if (selected == null || !selected.startsWith(PREFIX)) return selected;
        try {
            String identity = new String(Base64.getUrlDecoder().decode(selected.substring(PREFIX.length())), StandardCharsets.UTF_8);
            int separator = identity.indexOf('\n');
            return separator > 0 ? identity.substring(0, separator) : selected;
        } catch (IllegalArgumentException invalid) { return selected; }
    }

    public static String selection(Object row) {
        try {
            List<?> packages = (List<?>) row.getClass().getField("g").get(row);
            return packages.isEmpty() ? null : (String) packages.get(0);
        } catch (ReflectiveOperationException failure) { throw new IllegalStateException(failure); }
    }

    /** Custom catalog rows bypass Recommendations' disabled packages, hidden items and scan cap. */
    public static ArrayList<?> rowItems(ArrayList<?> original, Object selected) {
        if (!(selected instanceof String) || !((String) selected).startsWith(PREFIX)) return original;
        Channel channel = snapshot.channels.get(selected);
        return new ArrayList<>(channel == null ? Collections.emptyList() : channel.items);
    }

    public static LinkedHashSet<?> hidden(Set<?> original, Object row) {
        try {
            List<?> own = (List<?>) row.getClass().getField("A").get(row);
            LinkedHashSet<Object> result = new LinkedHashSet<>();
            String selected = selection(row);
            if (selected == null || !selected.startsWith(PREFIX)) result.addAll(original);
            result.addAll(own); return result;
        } catch (ReflectiveOperationException failure) { throw new IllegalStateException(failure); }
    }

    public static String contentLabel(String original, Object row) {
        Channel channel = snapshot.channels.get(selection(row));
        return channel == null ? original : channel.title.replaceFirst(" \\(Nuvio\\)$", "");
    }

    public static void preparePicker(Object row) { PICKER_ROW.set(row); }

    /** Delegate rendering/focus to Monet's original generic themed single-choice picker. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void contentPicker(String title, String subtitle, List options, Object selected, Object label,
            boolean enabled, Object secondary, Object first, Object second, Object onSelect, Object dismiss,
            Object composer, int changed, int changed1, int defaults) {
        Object row = PICKER_ROW.get(); PICKER_ROW.remove();
        try {
            Class<?> zq = Class.forName("a.zq1"), kq = Class.forName("a.kq1"), iq = Class.forName("a.iq1");
            List choices = new ArrayList(options);
            String saved = row == null ? null : selection(row), app = owner(saved);
            for (Channel channel : snapshot.channels.values()) if (channel.owner.equals(app)) choices.add(channel.id);
            if (saved != null && saved.startsWith(PREFIX)) selected = saved;
            Object labels = Proxy.newProxyInstance(zq.getClassLoader(), new Class<?>[]{zq}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                if (args[0] instanceof String) {
                    Channel channel = snapshot.channels.get(args[0]);
                    return channel == null ? "Unavailable catalog" : channel.title.replaceFirst(" \\(Nuvio\\)$", "");
                }
                return method.invoke(label, args);
            });
            Object callback = Proxy.newProxyInstance(kq.getClassLoader(), new Class<?>[]{kq}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                Object choice = args[0];
                Object result = method.invoke(onSelect, choice instanceof String
                    ? Class.forName("a.bs0").getField("RECOMMENDATIONS").get(null) : choice);
                if (choice instanceof String || (saved != null && saved.startsWith(PREFIX))) {
                    Object actions = onSelect.getClass().getField("k").get(onSelect);
                    String rowId = (String) onSelect.getClass().getField("l").get(onSelect);
                    Object packages = actions.getClass().getField("L").get(actions);
                    Class.forName("a.yq1").getMethod("f", Object.class, Object.class).invoke(packages,
                        rowId, Collections.singletonList(choice instanceof String ? choice : app));
                }
                return result;
            });
            Class.forName("a.zs3").getMethod("L1", String.class, String.class, List.class, Object.class,
                zq, boolean.class, zq, kq, kq, kq, iq, Class.forName("a.yr1"), int.class, int.class, int.class)
                .invoke(null, title, subtitle, choices, selected, labels, enabled, secondary, first, second,
                    callback, dismiss, composer, 0, 0, defaults);
        } catch (ReflectiveOperationException failure) { throw new IllegalStateException("Monet content picker contract changed", failure); }
    }

    private static Object proxyObject(Object proxy, Method method, Object[] args) {
        if (method.getName().equals("equals")) return proxy == args[0];
        if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
        return "Nuvio catalog content";
    }

    /** Combine native Recommendations with a separate catalog revision using Monet's own Flow API.
     * Native aggregate contents remain unchanged; revisions also invalidate equal-item projections. */
    public static synchronized Object wrap(Object nativeFlow) {
        try {
            Class<?> flow = Class.forName("a.nj1"), transform = Class.forName("a.ar1");
            if (revisionFlow == null) revisionFlow = Class.forName("a.sx").getMethod("a", Object.class).invoke(null, revision);
            Object callback = Proxy.newProxyInstance(transform.getClassLoader(), new Class<?>[]{transform}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                return new CatalogList((List<?>) args[0], Math.max(((Number) args[1]).longValue(), ((Number) args[2]).longValue()));
            });
            return Class.forName("a.yg2").getMethod("o", flow, flow, flow, transform)
                .invoke(null, nativeFlow, revisionFlow, revisionFlow, callback);
        } catch (ReflectiveOperationException failure) { throw new IllegalStateException("Monet catalog flow contract changed", failure); }
    }

    private static final class CatalogList extends AbstractList<Object> {
        final List<?> items; final long revision;
        CatalogList(List<?> items, long revision) { this.items = items; this.revision = revision; }
        @Override public int size() { return items.size(); }
        @Override public Object get(int index) { return items.get(index); }
        @Override public boolean equals(Object other) {
            return other instanceof CatalogList && revision == ((CatalogList) other).revision && items.equals(((CatalogList) other).items);
        }
        @Override public int hashCode() { return 31 * items.hashCode() + Long.hashCode(revision); }
    }

    /** Called on the channel worker. A failed read aborts publication and retains the last good snapshot. */
    static Object channel(Context context, String owner, String provider, String title, long id) throws ReflectiveOperationException {
        Channel channel = new Channel(owner, provider, title);
        Object result = Class.forName("a.fi5").getMethod("k", Context.class, Uri.class, int.class, Long.class)
            .invoke(null, context, Uri.parse("content://android.media.tv/preview_program?channel=" + id), 101, id);
        if (result == null) throw new IllegalStateException("Catalog program query returned null");
        List<?> raw = (List<?>) result.getClass().getField("a").get(result);
        Bridge nativeApi = api(); Object labels = nativeApi.labels.newInstance(context);
        for (Object program : raw) {
            if (channel.items.size() >= 100) break;
            if (nativeApi.channel.getLong(program) != id || !owner.equals(nativeApi.programOwner.get(program))) continue;
            Object item = nativeApi.convert.invoke(null, program, labels, nativeApi.artwork.get(program), 0L);
            if (channel.keys.add((String) nativeApi.key.get(item))) channel.items.add(item);
        }
        return channel;
    }

    static synchronized void publish(Map<String, Object> channels) throws ReflectiveOperationException {
        Map<String, Channel> mapped = new LinkedHashMap<>();
        for (Object value : channels.values()) if (value != null) { Channel channel = (Channel) value; mapped.put(channel.id, channel); }
        boolean same = mapped.size() == snapshot.channels.size();
        for (Channel channel : mapped.values()) {
            Channel old = snapshot.channels.get(channel.id);
            same &= old != null && old.title.equals(channel.title) && old.items.equals(channel.items);
        }
        if (same) return;
        snapshot = new Snapshot(mapped);
        int itemCount = 0;
        for (Channel channel : mapped.values()) itemCount += channel.items.size();
        Log.i("SantodanMonet", "Catalog content v2: published " + mapped.size() + " channels / " + itemCount + " entries");
        if (revisionFlow != null) revisionFlow.getClass().getMethod("k", Object.class).invoke(revisionFlow, ++revision);
    }

    /** Preserve normal app matching; catalog selections use the unmerged membership snapshot. */
    public static boolean matches(Object item, Object selected) {
        if (!(selected instanceof String)) return false;
        try {
            Bridge nativeApi = api();
            if (!((String) selected).startsWith(PREFIX)) return selected.equals(nativeApi.owner.get(item));
            Channel channel = snapshot.channels.get(selected);
            return channel != null && channel.owner.equals(nativeApi.owner.get(item))
                && channel.keys.contains(nativeApi.key.get(item));
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Monet catalog item contract changed", failure);
        }
    }

    /** A shared title remains in the aggregate feed while any of its catalog sources is enabled. */
    public static boolean disabled(Set<?> disabled, Object item) {
        try {
            Bridge nativeApi = api();
            Object owner = nativeApi.owner.get(item);
            if (disabled.contains(owner)) return true;
            Object key = nativeApi.key.get(item);
            boolean catalog = false;
            for (Channel channel : snapshot.channels.values()) {
                if (!channel.owner.equals(owner) || !channel.keys.contains(key)) continue;
                catalog = true;
                if (!disabled.contains(channel.id)) return false;
            }
            return catalog;
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Monet catalog disable contract changed", failure);
        }
    }

    private static Bridge api() throws ReflectiveOperationException {
        Bridge current = bridge;
        if (current != null) return current;
        synchronized (MonetCatalogChannels.class) {
            if (bridge == null) bridge = new Bridge();
            return bridge;
        }
    }
    private static final class Bridge {
        final Constructor<?> labels, option;
        final Method convert, sources;
        final Field channel, artwork, programOwner, key, owner;
        Bridge() throws ReflectiveOperationException {
            Class<?> raw = Class.forName("a.ai5"), label = Class.forName("a.te4"), item = Class.forName("a.zo0");
            labels = label.getConstructor(Context.class);
            option = Class.forName("a.sj4").getConstructor(int.class, String.class, String.class, boolean.class);
            convert = Class.forName("a.fi5").getMethod("l", raw, label, List.class, long.class);
            sources = Class.forName("a.rx3").getMethod("i", List.class, LinkedHashMap.class, Set.class, Locale.class);
            channel = raw.getField("c"); artwork = raw.getField("f"); programOwner = raw.getField("b");
            key = item.getField("k"); owner = item.getField("b");
        }
    }
}
