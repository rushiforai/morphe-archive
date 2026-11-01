package nl.johninnl.monetwuplay;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Dedicated Wuplay catalog rows for the verified Monet 1.1.0 ABI.
 * Derived from Santodan/santodan-patches under GPL-3.0; see NOTICE. */
public final class MonetWuplayCatalogs {
    private static final String PREFIX = "johninnl-wuplay-channel:";
    private static volatile Snapshot snapshot = new Snapshot(Collections.emptyMap());
    private static volatile Bridge bridge;
    private static final ThreadLocal<Object> PICKER_ROW = new ThreadLocal<>();
    private static Object revisionFlow;
    private static long revision;

    private MonetWuplayCatalogs() {}

    private static final class Channel {
        final String id, owner, name;
        final long nativeId;
        final Set<String> keys = new LinkedHashSet<>();
        final List<Object> items = new ArrayList<>();
        Channel(String owner, String provider, String title, long nativeId) {
            this.owner = owner;
            this.nativeId = nativeId;
            this.name = title;
            this.id = PREFIX + Base64.getUrlEncoder().withoutPadding().encodeToString(
                (owner + "\n" + provider).getBytes(StandardCharsets.UTF_8));
        }
    }
    private static final class Snapshot {
        final Map<String, Channel> channels;
        Snapshot(Map<String, Channel> channels) { this.channels = Collections.unmodifiableMap(channels); }
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
                    channel.owner, "Wuplay", !disabled.contains(channel.owner)));
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
        return channel == null ? original : channel.name;
    }

    public static void preparePicker(Object row) { PICKER_ROW.set(row); }

    /** 1.1.0 adds native channel wrappers, extra picker callbacks, and an independent channel filter. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void contentPicker(String title, String subtitle, List options, Object selected, Object label,
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
        return "Wuplay catalog content";
    }

    /** Combine native Recommendations with a separate catalog revision using Monet's own Flow API.
     * Native aggregate contents remain unchanged; revisions also invalidate equal-item projections. */
    public static synchronized Object wrap(Object nativeFlow) {
        try {
            Class<?> flow = Class.forName("a.in1"), transform = Class.forName("a.mv1");
            if (revisionFlow == null) revisionFlow = Class.forName("a.k88").getMethod("g", Object.class).invoke(null, revision);
            Object callback = Proxy.newProxyInstance(transform.getClassLoader(), new Class<?>[]{transform}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return proxyObject(proxy, method, args);
                return new CatalogList((List<?>) args[0], Math.max(((Number) args[1]).longValue(), ((Number) args[2]).longValue()));
            });
            return Class.forName("a.p35").getMethod("s", flow, flow, flow, transform)
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
        Object result = Class.forName("a.vt5").getMethod("l", Context.class, Uri.class, int.class, Long.class)
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
            same &= old != null && old.nativeId == channel.nativeId && old.name.equals(channel.name) && old.items.equals(channel.items);
        }
        if (same) return;
        snapshot = new Snapshot(mapped);
        int itemCount = 0;
        for (Channel channel : mapped.values()) itemCount += channel.items.size();
        Log.i("MonetWuplay", ("Wuplay catalog rows 1.1.0") + ": published " + mapped.size() + " channels / " + itemCount + " entries");
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
    public static boolean matchesChannel(Object item, String selected, Object filter) {
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
        synchronized (MonetWuplayCatalogs.class) {
            if (bridge == null) bridge = new Bridge();
            return bridge;
        }
    }
    private static final class Bridge {
        final Constructor<?> labels, option;
        final Method convert, sources;
        final Field channel, artwork, programOwner, key, owner, optionId;
        Bridge() throws ReflectiveOperationException {
            Class<?> raw = Class.forName("a.pt5"), label = Class.forName("a.do4"), item = Class.forName("a.vs0");
            labels = label.getConstructor(Context.class);
            Class<?> optionType = Class.forName("a.gt4");
            option = optionType.getConstructor(int.class, String.class, String.class, boolean.class);
            optionId = optionType.getField("a");
            convert = Class.forName("a.vt5").getMethod("m",raw,label,List.class,long.class,Map.class);
            sources = Class.forName("a.c32").getMethod("q", List.class, LinkedHashMap.class, Set.class, Locale.class);
            channel = raw.getField("c"); artwork = raw.getField("f"); programOwner = raw.getField("b");
            key = item.getField("n"); owner = item.getField("b");
        }
        Object convert(Object program, Object labels, Channel source) throws ReflectiveOperationException {
            return convert.invoke(null,program,labels,artwork.get(program),0L,
                Collections.singletonMap(channel.getLong(program),source.name));
        }
    }
}
