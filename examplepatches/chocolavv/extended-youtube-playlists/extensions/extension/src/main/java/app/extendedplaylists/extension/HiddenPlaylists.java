package app.extendedplaylists.extension;

import android.os.Looper;

import androidx.annotation.Nullable;

import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.Logger;

/**
 * Puts the playlists YouTube builds for a channel first in its Playlists tab, and gives the tab to
 * a channel whose page has none.
 */
@SuppressWarnings("unused")
public final class HiddenPlaylists {
    /** 12 lists in parallel take 444-471 ms on a phone; a channel page opened first prefetches them. */
    private static final long WAIT_MS = 2000;
    /**
     * The app has no string for the channel tab; this one says "Плейлисты" on the downloads page,
     * the only resource in the APK with that word alone.
     */
    private static final String TAB_TITLE = "downloads_page_playlists_menu_item";
    /** Fetches by channel and the prefixes turned on when they started. */
    private static final Map<String, Future<List<InnerTube.Playlist>>> fetches = new ConcurrentHashMap<>();
    private static final ExecutorService pool = Executors.newCachedThreadPool();

    /** Injection point: a browse response, right after the network bytes are parsed. */
    public static Object onBrowseResponse(@Nullable Object message) {
        if (message == null || !Settings.HIDDEN_PLAYLISTS.get()) return message;
        try {
            byte[] out = rewrite((byte[]) message.getClass().getMethod("toByteArray").invoke(message));
            return out == null ? message : parse(message, out);
        } catch (Exception ex) {
            Logger.printException(() -> "onBrowseResponse failure", ex);
            return message;
        }
    }

    /**
     * The response with hidden playlists added, or null when nothing changes. Any page of a channel
     * starts the fetch. A channel page without a Playlists tab gets one; on the Playlists tab the
     * hidden lists come first, cloned from a server card, or built when the server sent none.
     */
    @Nullable static byte[] rewrite(byte[] response) {
        Proto root = Proto.parse(response);
        Map<String, String> page = root == null ? null : params(root);
        String channel = page == null ? null : page.get("browse_id");
        List<String> order = InnerTube.order();
        if (channel == null || !channel.startsWith("UC") || order.isEmpty()) return null;
        Future<List<InnerTube.Playlist>> fetch = fetch(channel, order);
        boolean tabRoute = "channel.playlists".equals(page.get("route"));
        // A switch to a tab answers only its section list (field 10); a page opened on a tab has
        // all tabs (field 9) and only the shown one holds sections.
        Proto browse = root.open(9, 58173949);
        Proto shown = shownTab(browse);
        Proto list = browse == null ? root.open(10, 49399797) : shown == null ? null : Tab.list(shown);
        Proto section = list == null ? null : itemSection(list);
        boolean playlistsShown = browse == null || shown != null && Tab.PLAYLISTS.equals(Tab.name(shown));
        List<Card> cards = cards(playlistsShown ? section : null);
        boolean noTab = browse != null && tab(browse, Tab.PLAYLISTS) == null && Settings.ADD_TAB.get();
        // A link to the Playlists tab of a channel without one shows Home: its list stays unless the tab is added.
        boolean server = tabRoute && !cards.isEmpty();
        boolean own = tabRoute && list != null && cards.isEmpty() && (playlistsShown || noTab);
        if (!noTab && !server && !own) return null;
        List<InnerTube.Playlist> lists = await(fetch);
        if (lists == null || lists.isEmpty()) return null;
        if (server) return fill(section, cards, channel, lists);

        String title = App.string(TAB_TITLE);
        Proto tab = noTab && title != null ? Tab.add(browse, title) : null;
        if (!own) return tab == null ? null : tab.commit();
        if (tab != null) list = Tab.show(browse, tab);
        else if (!playlistsShown) return null;
        Proto items = new Proto();
        for (InnerTube.Playlist p : lists) {
            byte[] item = Card.build(p, response);
            if (item != null) items.fields.add(new Proto.Field(1, item));
        }
        if (list == null || items.fields.isEmpty()) return null;
        // Sections and the continuation that would load more of them: our list is the whole tab.
        list.fields.removeAll(list.all(1));
        list.fields.removeAll(list.all(2));
        list.fields.add(0,new Proto.Field(1, Proto.message(50195462, items.toBytes())));
        Logger.printDebug(() -> "Own playlists tab " + channel + ": +" + items.fields.size());
        return list.commit();
    }

    /** The shown tab of a page response, or null. */
    @Nullable private static Proto shownTab(@Nullable Proto browse) {
        if (browse != null) for (Proto.Field f : browse.all(1)) {
            Proto t = Tab.open(browse, f);
            if (t != null && Tab.shown(t)) return t;
        }
        return null;
    }

    @Nullable private static Proto tab(Proto browse, String name) {
        for (Proto.Field f : browse.all(1)) {
            Proto t = Tab.open(browse, f);
            if (t != null && name.equals(Tab.name(t))) return t;
        }
        return null;
    }

    /**
     * The tracking params of responseContext (field 1) name the page: groups in field 6, key and
     * value pairs in field 2 of each, e.g. browse_id "UC..." and route "channel.playlists".
     */
    private static Map<String, String> params(Proto root) {
        Map<String, String> out = new HashMap<>();
        Proto context = root.open(1);
        if (context == null) return out;
        for (Proto.Field g : context.all(6)) {
            Proto group = context.open(g);
            if (group == null) continue;
            for (Proto.Field p : group.all(2)) {
                Proto pair = group.open(p);
                String key = pair == null ? null : pair.text(1);
                String value = key == null ? null : pair.text(2);
                if (key != null && !out.containsKey(key)) out.put(key, value == null ? "" : value);
            }
        }
        return out;
    }

    /** The first item section of a section list, or null. */
    @Nullable private static Proto itemSection(Proto list) {
        for (Proto.Field f : list.all(1)) {
            Proto s = list.open(f);
            if (s != null && (s = s.open(50195462)) != null) return s;
        }
        return null;
    }

    /** The server playlist cards of an item section; empty for null. */
    private static List<Card> cards(@Nullable Proto section) {
        List<Card> out = new ArrayList<>();
        if (section != null) for (Proto.Field item : section.all(1)) {
            Card c = Card.of(item.bytes);
            if (c != null) out.add(c);
        }
        return out;
    }

    private static byte[] fill(Proto section, List<Card> cards, String channel, List<InnerTube.Playlist> lists) {
        List<Proto.Field> items = section.all(1);
        String base = channel.substring(2);
        for (Proto.Field item : items)
            if (Proto.contains(item.bytes, ("VLUU" + base).getBytes(StandardCharsets.UTF_8))
                    || Proto.contains(item.bytes, ("VLPU" + base).getBytes(StandardCharsets.UTF_8))) return null;
        Map<String, Integer> subtitles = new HashMap<>();
        for (Card c : cards) {
            Integer n = subtitles.get(c.subtitle);
            subtitles.put(c.subtitle, n == null ? 1 : n + 1);
        }
        // Shows and series sit among plain playlists with another subtitle and icon; the most
        // common subtitle is the plain playlist. Its longest title is the least likely to also be
        // part of another string of the card.
        Card template = null;
        for (Card c : cards) {
            int n = subtitles.get(c.subtitle);
            int best = template == null ? 0 : subtitles.get(template.subtitle);
            if (n > best || (n == best && c.title.length() > template.title.length())) template = c;
        }
        int at = section.fields.indexOf(items.get(0));
        for (int i = lists.size() - 1; i >= 0; i--) {
            section.fields.add(at, new Proto.Field(1, template.clone(lists.get(i))));
        }
        Logger.printDebug(() -> "Playlists tab " + channel + ": +" + lists.size());
        return section.commit();
    }

    /**
     * One fetch per channel and set of lists; an empty or failed answer is dropped, so the next
     * visit asks again.
     */
    private static Future<List<InnerTube.Playlist>> fetch(String channel, List<String> order) {
        String key = channel + order;
        return fetches.computeIfAbsent(key, k -> pool.submit(() -> {
            List<InnerTube.Playlist> lists = Collections.emptyList();
            try {
                return lists = InnerTube.hidden(channel, order);
            } finally {
                if (lists.isEmpty()) fetches.remove(key);
            }
        }));
    }

    /** The main thread never waits: there only a finished fetch counts. */
    @Nullable private static List<InnerTube.Playlist> await(Future<List<InnerTube.Playlist>> fetch) {
        try {
            if (Looper.myLooper() == Looper.getMainLooper())
                return fetch.isDone() ? fetch.get() : null;
            return fetch.get(WAIT_MS, TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            Logger.printDebug(() -> "Playlists not ready", e);
            return null;
        }
    }

    /**
     * Response fields are protobuf extensions: parsed without the generated registry they stay
     * unknown fields, the bytes still match, and the app draws nothing from them. The parser has one
     * public (byte[], ExtensionRegistryLite) -> Object method; its name is obfuscated.
     */
    private static Object parse(Object message, byte[] bytes) throws Exception {
        Class<?> registryClass = Class.forName("com.google.protobuf.ExtensionRegistryLite");
        Method generated = registryClass.getDeclaredMethod("getGeneratedRegistry");
        generated.setAccessible(true);
        Object registry = generated.invoke(null);
        Object parser = message.getClass().getMethod("getParserForType").invoke(message);
        for (Method m : parser.getClass().getMethods()) {
            Class<?>[] t = m.getParameterTypes();
            if (t.length != 2 || t[0] != byte[].class || t[1] != registryClass) continue;
            Object back = m.invoke(parser, bytes, registry);
            if (message.getClass().isInstance(back)) return back;
        }
        throw new IllegalStateException("no parse method in " + parser.getClass().getName());
    }

    private HiddenPlaylists() {}
}
