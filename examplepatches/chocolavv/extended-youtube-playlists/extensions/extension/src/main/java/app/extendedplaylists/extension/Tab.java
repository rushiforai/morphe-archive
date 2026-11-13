package app.extendedplaylists.extension;

import androidx.annotation.Nullable;

import java.nio.charset.StandardCharsets;

/**
 * Channel tabs of a page response. A tab names itself in its browse endpoint params (field 2:
 * "videos", "playlists"); field 110 holds that tab's own view settings. The server picks the page
 * route by field 2 alone: params of only "playlists" answer route channel.playlists.
 */
final class Tab {
    static final String PLAYLISTS = "playlists";
    /** On the server the Playlists tab stands right before Posts, when a channel has both. */
    private static final String AFTER = "posts";
    private static final int RENDERER = 58174010, ENDPOINT = 1, TITLE = 2, SELECTED = 3, CONTENT = 4;
    private static final int BROWSE = 48687626, PARAMS = 3, NAME = 2, VIEW = 110;
    private static final int SECTION_LIST = 49399797;

    /** The tab renderer in a tab of the browse renderer (field 1), or null. */
    @Nullable static Proto open(Proto browse, Proto.Field tab) {
        Proto t = browse.open(tab);
        return t == null ? null : t.open(RENDERER);
    }

    @Nullable static String name(Proto tab) {
        Proto params = params(tab);
        return params == null ? null : params.text(NAME);
    }

    static boolean shown(Proto tab) {
        return tab.flag(SELECTED) != null;
    }

    /** The section list of a tab: every tab has one, only the shown tab's holds sections. */
    @Nullable static Proto list(Proto tab) {
        return tab.open(CONTENT, SECTION_LIST);
    }

    /**
     * Adds a Playlists tab cloned from a tab that is not shown, and returns it; null when there is
     * no tab to clone. The clone keeps its empty section list.
     */
    @Nullable static Proto add(Proto browse, String title) {
        Proto.Field template = null;
        int at = -1, end = 0;
        for (Proto.Field f : browse.all(1)) {
            Proto t = open(browse, f);
            if (t == null) continue;
            end = browse.fields.indexOf(f) + 1;
            if (template == null && !shown(t)) template = f;
            if (at < 0 && AFTER.equals(name(t))) at = end - 1;
        }
        String from = template == null ? null : name(open(browse, template));
        if (from == null) return null;
        // The tab names itself twice: in its endpoint and in the continuation of its empty section
        // list, which the app loads when the tab is tapped. Every such params message is renamed.
        byte[] clone = Proto.walk(template.bytes, m -> {
            Proto.Field name = m.first(NAME);
            if (name == null || !from.equals(new String(name.bytes, StandardCharsets.UTF_8))) return;
            name.bytes = PLAYLISTS.getBytes(StandardCharsets.UTF_8);
            m.fields.removeAll(m.all(VIEW));
        }, null);
        Proto.Field slot = new Proto.Field(1, clone);
        browse.fields.add(at < 0 ? end : at, slot);
        Proto tab = open(browse, slot);
        tab.first(TITLE).bytes = title.getBytes(StandardCharsets.UTF_8);
        tab.commit();
        return tab;
    }

    /**
     * Makes the tab the shown one: the shown tab hands over its flag and its sections, and keeps an
     * empty section list like every tab that is not shown. Returns the tab's empty section list.
     */
    @Nullable static Proto show(Proto browse, Proto tab) {
        for (Proto.Field f : browse.all(1)) {
            Proto t = open(browse, f);
            if (t == null || !shown(t)) continue;
            Proto.Field flag = t.flag(SELECTED);
            t.fields.remove(flag);
            t.first(CONTENT).bytes = tab.first(CONTENT).bytes.clone();
            t.commit();
            tab.fields.add(tab.fields.indexOf(tab.first(CONTENT)), flag);
            tab.commit();
            break;
        }
        return list(tab);
    }

    @Nullable private static Proto params(Proto tab) {
        String raw = tab.text(ENDPOINT, BROWSE, PARAMS);
        return raw == null ? null : Proto.parse(Proto.base64(raw));
    }

    private Tab() {}
}
