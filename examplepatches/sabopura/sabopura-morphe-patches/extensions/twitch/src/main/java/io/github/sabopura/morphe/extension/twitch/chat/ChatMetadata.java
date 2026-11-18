package io.github.sabopura.morphe.extension.twitch.chat;

import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteSupport;

import org.json.*;

import java.util.*;

/** Public badges and opt-in public pronouns. No chat text is sent to these services. */
public final class ChatMetadata {
    private static final Map<String, Entry> CACHE =
            new LinkedHashMap<String, Entry>(128, .75f, true) {
                protected boolean removeEldestEntry(Map.Entry<String, ChatMetadata.Entry> e) {
                    return size() > 1500;
                }
            };
    private static final long TTL = 6 * 60 * 60 * 1000L, RETRY = 5 * 60 * 1000L, REFRESH_DELAY = 500;
    private static final Map<String, String> SOURCE_NAMES = new HashMap<>();

    static {
        SOURCE_NAMES.put("ffz", "FrankerFaceZ");
        SOURCE_NAMES.put("chatterino", "Chatterino");
        SOURCE_NAMES.put("bttv", "BetterTTV");
        SOURCE_NAMES.put("dankchat", "DankChat");
        SOURCE_NAMES.put("chatsen", "Chatsen");
    }
    private static final java.util.regex.Pattern LOGIN = java.util.regex.Pattern.compile("[A-Za-z0-9_]{1,25}");
    private static final Runnable REFRESH = () -> {
        refreshPending = false;
        ChatEnhancements.refresh();
    };
    private static boolean refreshPending;

    /** New metadata arrives in bursts; every row is redone at most twice a second. */
    public static void scheduleRefresh() {
        PublicApi.UI.post(() -> {
            if (refreshPending) return;
            refreshPending = true;
            PublicApi.UI.postDelayed(REFRESH, REFRESH_DELAY);
        });
    }

    private interface Fetch {
        Object get() throws Exception;
    }

    /** Whether a new result can change any row; equal pronoun arrays do not. */
    static boolean changes(Object before, Object after) {
        return !Objects.deepEquals(before, after);
    }

    private static Object cached(String key, boolean pronouns, Fetch work) {
        final Entry entry;
        synchronized (CACHE) {
            Entry e = CACHE.get(key);
            if (e == null) {
                e = new Entry();
                CACHE.put(key, e);
            }
            entry = e;
            if (e.loading || System.currentTimeMillis() < e.next) return e.value;
            e.loading = true;
        }
        Runnable task =
                () -> {
                    boolean changed = false;
                    try {
                        Object v = work.get();
                        synchronized (CACHE) {
                            changed = changes(entry.value, v);
                            entry.value = v;
                            entry.next = System.currentTimeMillis() + TTL;
                        }
                    } catch (Throwable ignored) {
                        synchronized (CACHE) {
                            entry.next = System.currentTimeMillis() + RETRY;
                        }
                    } finally {
                        synchronized (CACHE) {
                            entry.loading = false;
                        }
                        if (changed) scheduleRefresh();
                    }
                };
        if (!(pronouns ? PublicApi.submitPronouns(task) : PublicApi.submit(task)))
            synchronized (CACHE) {
                entry.loading = false;
                entry.next = System.currentTimeMillis() + RETRY;
            }
        return entry.value;
    }

    public static void decorate(
            TextView view, SpannableStringBuilder text, String login, String id, String room, boolean compact) {
        ChatSettings settings = ChatSettings.get(view.getContext());
        if (settings.badges && id != null && !compact) {
            if (settings.badgeEnabled("7tv")) {
                SevenTvBadges.ensure(room);
                Badge badge = SevenTvBadges.badgeOf(id);
                if (badge != null) EmoteSupport.prependBadge(view, text, badge.title, badge.url, "7TV");
            }
            badges(view, text, id, "ffz", "https://api.frankerfacez.com/v1/badges/ids");
            badges(view, text, id, "chatterino", "https://api.chatterino.com/badges");
            badges(view, text, id, "bttv", "https://api.betterttv.net/3/cached/badges");
            badges(view, text, id, "dankchat", "https://flxrs.com/api/badges");
            badges(
                    view,
                    text,
                    id,
                    "chatsen",
                    "https://raw.githubusercontent.com/chatsen/resources/master/assets/data.json");
        }
        if (settings.pronouns && login != null && LOGIN.matcher(login).matches()) {
            @SuppressWarnings("unchecked")
            Map<String, Pronoun> kinds =
                    (Map<String, Pronoun>) cached("pronoun-types", true, ChatMetadata::pronounKinds);
            String user = login.toLowerCase(Locale.ROOT);
            String[] chosen = (String[]) cached("pronoun:" + user, true, () -> pronounsOf(user));
            String label = kinds == null || chosen == null ? null : pronounLabel(kinds, chosen[0], chosen[1]);
            if (label != null && !label.isEmpty()) prefix(text, "[" + label + "] ");
        }
    }

    private static void badges(
            TextView view, SpannableStringBuilder text, String id, String provider, String url) {
        if (!ChatSettings.get(view.getContext()).badgeEnabled(provider)) return;
        @SuppressWarnings("unchecked")
        Map<String, List<Badge>> all =
                (Map<String, List<Badge>>)
                        cached(
                                provider,
                                false,
                                () ->
                                        parseBadges(
                                                provider,
                                                new JSONTokener(PublicApi.get(url)).nextValue()));
        List<Badge> found = all == null ? null : all.get(id);
        if (found != null)
            for (Badge b : found) EmoteSupport.prependBadge(view, text, b.title, b.url, SOURCE_NAMES.get(provider));
    }

    private static void prefix(SpannableStringBuilder t, String value) {
        t.insert(0, value);
        t.setSpan(new RelativeSizeSpan(.8f), 0, value.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        t.setSpan(
                new ForegroundColorSpan(0xffb9a3e3),
                0,
                value.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    /** Whether Alejo's current API says the address is gone, the one case its older API is asked instead. */
    private static boolean retired(java.io.IOException failure) {
        return "HTTP 404".equals(failure.getMessage()) || "HTTP 410".equals(failure.getMessage());
    }

    /** Alejo's current API, or the older one it replaced once that is gone. */
    private static Map<String, Pronoun> pronounKinds() throws Exception {
        try {
            return parsePronounKinds(new JSONObject(PublicApi.get("https://api.pronouns.alejo.io/v1/pronouns")));
        } catch (java.io.IOException current) {
            if (!retired(current)) throw current;
            Map<String, Pronoun> kinds = new HashMap<>();
            for (Map.Entry<String, String> e : parsePronouns(new JSONArray(
                    PublicApi.get("https://pronouns.alejo.io/api/pronouns"))).entrySet())
                kinds.put(e.getKey(), new Pronoun(e.getValue(), "", true));
            return kinds;
        }
    }

    /** {main, alternative, empty when unset}, or null when the user has chosen none, which shows nothing. */
    private static String[] pronounsOf(String login) throws Exception {
        String[] chosen;
        try {
            JSONObject o = new JSONObject(PublicApi.get("https://api.pronouns.alejo.io/v1/users/" + login));
            chosen = new String[] {o.optString("pronoun_id", ""),
                    o.isNull("alt_pronoun_id") ? "" : o.optString("alt_pronoun_id", "")};
        } catch (java.io.IOException e) {
            // A user without pronouns is a 404 here, so only a 410 means the address is gone.
            if ("HTTP 404".equals(e.getMessage())) return null;
            if (!"HTTP 410".equals(e.getMessage())) throw e;
            JSONArray a = new JSONArray(PublicApi.get("https://pronouns.alejo.io/api/users/" + login));
            chosen = new String[] {a.length() == 0 ? "" : a.getJSONObject(0).optString("pronoun_id", ""), ""};
        }
        return chosen[0].isEmpty() ? null : chosen;
    }

    public static Map<String, Pronoun> parsePronounKinds(JSONObject all) {
        Map<String, Pronoun> kinds = new HashMap<>();
        for (Iterator<String> keys = all.keys(); keys.hasNext(); ) {
            JSONObject o = all.optJSONObject(keys.next());
            if (o == null) continue;
            String subject = o.optString("subject"), object = o.optString("object");
            if (subject.isEmpty() || subject.length() > 40 || object.length() > 40) continue;
            kinds.put(o.optString("name"), new Pronoun(subject, object, o.optBoolean("singular")));
        }
        return kinds;
    }

    /** "He/Him", "Any", or "She/They" when a second set is chosen, as Alejo's own extension shows. */
    public static String pronounLabel(Map<String, Pronoun> kinds, String main, String alternative) {
        Pronoun first = main == null ? null : kinds.get(main);
        if (first == null) return null;
        Pronoun second = alternative == null || alternative.isEmpty() ? null : kinds.get(alternative);
        if (second != null) return first.subject + "/" + second.subject;
        return first.singular || first.object.isEmpty() ? first.subject : first.subject + "/" + first.object;
    }

    public static final class Pronoun {
        final String subject, object;
        final boolean singular;

        Pronoun(String subject, String object, boolean singular) {
            this.subject = subject;
            this.object = object;
            this.singular = singular;
        }
    }

    public static Map<String, String> parsePronouns(JSONArray a) {
        Map<String, String> m = new HashMap<>();
        for (int i = 0; i < a.length(); i++) {
            JSONObject o = a.optJSONObject(i);
            if (o != null) {
                String label = o.optString("display");
                if (label.length() <= 80) m.put(o.optString("name"), label);
            }
        }
        return m;
    }

    public static Map<String, List<Badge>> parseBadges(String provider, Object payload) {
        Map<String, List<Badge>> result = new HashMap<>();
        JSONObject root = payload instanceof JSONObject ? (JSONObject) payload : null;
        JSONArray badges =
                payload instanceof JSONArray
                        ? (JSONArray) payload
                        : root == null ? null : root.optJSONArray("badges");
        if (badges == null) return result;
        if ("chatsen".equals(provider) && root != null) {
            Map<String, Badge> definitions = new HashMap<>();
            for (int i = 0; i < badges.length(); i++) {
                JSONObject b = badges.optJSONObject(i);
                if (b != null)
                    definitions.put(
                            b.optString("name"),
                            new Badge(b.optString("title", "Chatsen"), b.optString("image")));
            }
            JSONArray users = root.optJSONArray("users");
            if (users != null)
                for (int i = 0; i < users.length(); i++) {
                    JSONObject u = users.optJSONObject(i);
                    if (u == null || !u.optString("id").matches("[0-9]{1,20}")) continue;
                    JSONArray a = u.optJSONArray("badges");
                    List<Badge> found = new ArrayList<>();
                    if (a != null)
                        for (int j = 0; j < a.length() && found.size() < 6; j++) {
                            JSONObject b = a.optJSONObject(j);
                            Badge match =
                                    b == null ? null : definitions.get(b.optString("badgeName"));
                            if (match != null) found.add(match);
                        }
                    if (!found.isEmpty()) result.put(u.optString("id"), found);
                }
            return result;
        }
        for (int i = 0; i < badges.length(); i++) {
            JSONObject b = badges.optJSONObject(i);
            if (b == null) continue;
            JSONArray users = b.optJSONArray("users");
            String title = provider, url = "";
            if ("ffz".equals(provider)) {
                title = b.optString("title", "FFZ");
                JSONObject urls = b.optJSONObject("urls");
                url =
                        urls == null
                                ? b.optString("image")
                                : urls.optString("2", b.optString("image"));
                JSONObject ids = root.optJSONObject("users");
                users = ids == null ? null : ids.optJSONArray(b.optString("id"));
            } else if ("chatterino".equals(provider)) {
                title = b.optString("tooltip", "Chatterino");
                url = b.optString("image2", b.optString("image1"));
            } else if ("bttv".equals(provider)) {
                JSONObject badge = b.optJSONObject("badge");
                if (badge == null) continue;
                title = badge.optString("description", "BTTV");
                url = badge.optString("svg");
                users = new JSONArray().put(b.optString("providerId"));
            } else if ("dankchat".equals(provider)) {
                title = b.optString("type", "DankChat");
                url = b.optString("url");
            }
            if (url.startsWith("//")) url = "https:" + url;
            if (title.length() > 80) title = title.substring(0, 80);
            Badge badge = new Badge(title, url);
            if (users != null)
                for (int j = 0; j < users.length(); j++) {
                    String user = users.optString(j);
                    if (!user.matches("[0-9]{1,20}")) continue;
                    List<Badge> list = result.computeIfAbsent(user, k -> new ArrayList<>());
                    if (list.size() < 6) list.add(badge);
                }
        }
        return result;
    }

    public static final class Badge {
        public final String title, url;

        Badge(String t, String u) {
            title = t.length() > 80 ? t.substring(0, 80) : t;
            url = u;
        }
    }

    private static final class Entry {
        volatile Object value;
        long next;
        boolean loading;
    }
}
