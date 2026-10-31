package software.santodan.extension.monetchannels;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Native items keep their real package, intent and stable key; bindings are selected by the patch. */
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
        final String id, title, owner, name;
        final long nativeId;
        final Set<String> keys = new LinkedHashSet<>();
        final List<Object> items = new ArrayList<>();
        Channel(String owner, String provider, String title, long nativeId) {
            this.owner = owner;
            this.nativeId = nativeId;
            this.name = title;
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
                long id = cursor.getLong(0);
                channels.put(id, new Channel(owner, provider, title, id));
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
                Object item = nativeApi.convert(program, labels, channel);
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
            Field optionId = nativeApi.optionId;
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

    /** 1.1.0 adds native channel wrappers, extra picker callbacks, and an independent channel filter. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void contentPicker110(String title, String subtitle, List options, Object selected, Object label,
            boolean enabled, Object secondary, Object first, Object second, Set checked, Set disabled,
            Object predicate, Object onSelect, Object dismiss, Object composer, int changed, int changed1, int defaults) {
        Object row = PICKER_ROW.get(); PICKER_ROW.remove();
        try {
            Class<?> labels = Class.forName("a.lv1"), action = Class.forName("a.wu1"), click = Class.forName("a.uu1");
            Class<?> mode = Class.forName("a.vv0"), wrapper = Class.forName("a.wr4"), channelOption = Class.forName("a.vr4");
            Object recommendations = wrapper.getConstructor(mode).newInstance(mode.getField("RECOMMENDATIONS").get(null));
            String saved = row == null ? null : selection(row), app = owner(saved);
            Snapshot current = snapshot;
            Map<Long,Channel> owned = new HashMap<>();
            for (Channel channel : current.channels.values()) if (channel.owner.equals(app)) owned.put(channel.nativeId,channel);
            List choices = new ArrayList(); Set<String> included = new HashSet<>();
            for (Object option : options) {
                Channel mapped = null;
                if (channelOption.isInstance(option)) {
                    Object nativeChannel = channelOption.getField("a").get(option);
                    long id = nativeChannel.getClass().getField("c").getLong(nativeChannel);
                    mapped = owned.get(id);
                }
                if (mapped == null) choices.add(option);
                else {
                    if (included.add(mapped.id)) choices.add(mapped.id);
                    if (option.equals(selected)) selected = mapped.id;
                }
            }
            // A failed/loading native channel query must not hide the base modes or independent catalogs.
            if (choices.isEmpty() && (!owned.isEmpty() || saved != null && saved.startsWith(PREFIX)))
                for (String name : new String[]{"BOTH","CONTINUE_WATCHING","RECOMMENDATIONS"})
                choices.add(wrapper.getConstructor(mode).newInstance(mode.getField(name).get(null)));
            for (Channel channel : current.channels.values()) if (channel.owner.equals(app) && included.add(channel.id)) choices.add(channel.id);
            if (saved != null && saved.startsWith(PREFIX)) {
                selected = saved;
                if (included.add(saved)) choices.add(saved); // Retain an unavailable saved selection visibly.
            }
            Object primary = Proxy.newProxyInstance(labels.getClassLoader(), new Class<?>[]{labels}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                if (args[0] instanceof String) {
                    Channel channel = current.channels.get(args[0]);
                    return channel == null ? "Unavailable catalog" : channel.name;
                }
                return method.invoke(label, args);
            });
            Object secondaryLabels = secondary == null ? null : Proxy.newProxyInstance(labels.getClassLoader(), new Class<?>[]{labels}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                // B1 compares adjacent section labels, then calls String.length() without a null guard.
                return args[0] instanceof String ? "" : method.invoke(secondary, args);
            });
            Object callback = Proxy.newProxyInstance(action.getClassLoader(), new Class<?>[]{action}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                Object choice = args[0];
                Object result = method.invoke(onSelect, choice instanceof String ? recommendations : choice);
                if (choice instanceof String || saved != null && saved.startsWith(PREFIX)) {
                    Object actions = onSelect.getClass().getField("l").get(onSelect);
                    String rowId = (String)onSelect.getClass().getField("m").get(onSelect);
                    Method update = Class.forName("a.kv1").getMethod("f",Object.class,Object.class);
                    if (choice instanceof String) update.invoke(actions.getClass().getField("F").get(actions),rowId,null);
                    update.invoke(actions.getClass().getField("M").get(actions),rowId,
                        Collections.singletonList(choice instanceof String ? choice : app));
                }
                return result;
            });
            Class.forName("a.f24").getMethod("D1",String.class,String.class,List.class,Object.class,labels,boolean.class,
                labels,action,action,Set.class,Set.class,Class.forName("a.nv1"),action,click,Class.forName("a.jw1"),int.class,int.class,int.class)
                .invoke(null,title,subtitle,choices,selected,primary,enabled,secondaryLabels,
                    pickerAction(first,action,recommendations,true),pickerAction(second,action,recommendations,false),checked,disabled,predicate,
                    callback,dismiss,composer,0,0,defaults);
        } catch (ReflectiveOperationException failure) { throw new IllegalStateException("Monet 1.1.0 content picker contract changed",failure); }
    }

    private static Object pickerAction(Object original, Class<?> action, Object recommendations, boolean key) {
        if (original == null) return null;
        return Proxy.newProxyInstance(action.getClassLoader(),new Class<?>[]{action},(proxy,method,args)->{
            if (method.getDeclaringClass()==Object.class) return proxyObject(proxy,method,args);
            if (args[0] instanceof String) {
                if (key) return args[0]; // Native pw3 discriminator1 is the Lazy picker key extractor.
                args[0]=recommendations;
            }
            return method.invoke(original,args);
        });
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
            boolean modern = NativeLayout.modern;
            Class<?> flow = Class.forName(modern ? "a.in1" : "a.nj1"), transform = Class.forName(modern ? "a.mv1" : "a.ar1");
            if (revisionFlow == null) revisionFlow = Class.forName(modern ? "a.k88" : "a.sx").getMethod(modern ? "g" : "a", Object.class).invoke(null, revision);
            Object callback = Proxy.newProxyInstance(transform.getClassLoader(), new Class<?>[]{transform}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                return new CatalogList((List<?>) args[0], Math.max(((Number) args[1]).longValue(), ((Number) args[2]).longValue()));
            });
            return Class.forName(modern ? "a.p35" : "a.yg2").getMethod(modern ? "s" : "o", flow, flow, flow, transform)
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
        Channel channel = new Channel(owner, provider, title, id);
        boolean modern = NativeLayout.modern;
        Object result = Class.forName(modern ? "a.vt5" : "a.fi5").getMethod(modern ? "l" : "k", Context.class, Uri.class, int.class, Long.class)
            .invoke(null, context, Uri.parse("content://android.media.tv/preview_program?channel=" + id), 101, id);
        if (result == null) throw new IllegalStateException("Catalog program query returned null");
        List<?> raw = (List<?>) result.getClass().getField("a").get(result);
        Bridge nativeApi = api(); Object labels = nativeApi.labels.newInstance(context);
        for (Object program : raw) {
            if (channel.items.size() >= 100) break;
            if (nativeApi.channel.getLong(program) != id || !owner.equals(nativeApi.programOwner.get(program))) continue;
            Object item = nativeApi.convert(program, labels, channel);
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
            same &= old != null && old.nativeId == channel.nativeId && old.title.equals(channel.title) && old.items.equals(channel.items);
        }
        if (same) return;
        snapshot = new Snapshot(mapped);
        int itemCount = 0;
        for (Channel channel : mapped.values()) itemCount += channel.items.size();
        Log.i("SantodanMonet", (NativeLayout.modern ? "Catalog content 1.1.0" : "Catalog content v2") + ": published " + mapped.size() + " channels / " + itemCount + " entries");
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

    /** Preserve 1.1.0's additional native channel filter while resolving only catalog ownership. */
    public static boolean matches110(Object item, String selected, Object filter) {
        try {
            boolean nativeMatch = (boolean)Class.forName("a.yp7").getMethod("M",Class.forName("a.vs0"),String.class,Class.forName("a.ip4"))
                .invoke(null,item,owner(selected),filter);
            return nativeMatch && (!selected.startsWith(PREFIX) || matches(item,selected));
        } catch (ReflectiveOperationException failure) { throw new IllegalStateException("Monet native channel filter contract changed",failure); }
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
        final Field channel, artwork, programOwner, key, owner, optionId;
        Bridge() throws ReflectiveOperationException {
            boolean modern = NativeLayout.modern;
            Class<?> raw = Class.forName(modern ? "a.pt5" : "a.ai5"), label = Class.forName(modern ? "a.do4" : "a.te4"), item = Class.forName(modern ? "a.vs0" : "a.zo0");
            labels = label.getConstructor(Context.class);
            Class<?> optionType = Class.forName(modern ? "a.gt4" : "a.sj4");
            option = optionType.getConstructor(int.class, String.class, String.class, boolean.class);
            optionId = optionType.getField("a");
            convert = modern ? Class.forName("a.vt5").getMethod("m",raw,label,List.class,long.class,Map.class)
                : Class.forName("a.fi5").getMethod("l", raw, label, List.class, long.class);
            sources = Class.forName(modern ? "a.c32" : "a.rx3").getMethod(modern ? "q" : "i", List.class, LinkedHashMap.class, Set.class, Locale.class);
            channel = raw.getField("c"); artwork = raw.getField("f"); programOwner = raw.getField("b");
            key = item.getField(modern ? "n" : "k"); owner = item.getField("b");
        }
        Object convert(Object program, Object labels, Channel source) throws ReflectiveOperationException {
            return NativeLayout.modern ? convert.invoke(null,program,labels,artwork.get(program),0L,
                Collections.singletonMap(channel.getLong(program),source.name))
                : convert.invoke(null,program,labels,artwork.get(program),0L);
        }
    }
}
