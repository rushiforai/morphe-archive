package e.e.a;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class NicoliveCatalog {
    static final ZoneId JAPAN = ZoneId.of("Asia/Tokyo");
    static final DateTimeFormatter DAY = DateTimeFormatter.BASIC_ISO_DATE;
    private static final String BASE = "https://live.nicovideo.jp";
    private static final int PAGE_SIZE = 70;

    enum Sort {
        NEWEST("開始が新しい順", "recentDesc", (a, b) -> Long.compare(b.begin, a.begin)),
        OLDEST("開始が早い順", "recentAsc", (a, b) -> Long.compare(a.begin, b.begin)),
        VIEWS("来場者数が多い順", "viewCountDesc", (a, b) -> Long.compare(b.views, a.views)),
        COMMENTS("コメント数が多い順", "commentCountDesc", (a, b) -> Long.compare(b.comments, a.comments));

        final String label;
        final String parameter;
        final Comparator<NicoliveData.Program> comparator;

        Sort(String label, String parameter, Comparator<NicoliveData.Program> comparator) {
            this.label = label;
            this.parameter = parameter;
            this.comparator = comparator;
        }

        static Sort restore(String name, Sort fallback) {
            try { return valueOf(name); }
            catch (IllegalArgumentException | NullPointerException ignored) { return fallback; }
        }
    }

    static String recentUrl(int page, Sort sort) {
        return BASE + "/front/api/pages/recent/v1/programs?sortOrder=" + sort.parameter + "&offset=" + page;
    }

    static String timetableUrl(LocalDate date) {
        return BASE + "/timetable?date=" + DAY.format(date);
    }

    enum Broadcast {
        LIVE("放送中", "onair", "ON_AIR"),
        UPCOMING("放送予定", "comingsoon", "RELEASED"),
        ENDED("放送終了", "closed", "ENDED");

        final String label;
        final String parameter;
        final String state;

        Broadcast(String label, String parameter, String state) {
            this.label = label;
            this.parameter = parameter;
            this.state = state;
        }

        boolean matches(NicoliveData.Program program) {
            return this == UPCOMING ? program.scheduled() : state.equals(program.status);
        }
    }

    static String rankingUrl(Broadcast state) {
        return BASE + "/ranking?type=" + state.parameter;
    }

    static String followUrl(Broadcast state) {
        return BASE + "/follow" + (state == Broadcast.LIVE ? "" : "?status=" + state.parameter);
    }

    static List<NicoliveData.Program> ranking(String html, Broadcast state, boolean user) throws Exception {
        JSONObject root = NicoliveData.embedded(html, "embedded-data", "data-props").getJSONObject("ranking");
        if (!state.parameter.equals(root.getString("statusCategory"))) throw new JSONException("RANKING_STATUS_MISMATCH");
        JSONArray items = root.getJSONArray(user ? "userPrograms" : "officialAndChannelPrograms");
        LinkedHashMap<String, NicoliveData.Program> ranked = new LinkedHashMap<>();
        for (int index = 0; index < items.length(); index++) {
            JSONObject item = items.optJSONObject(index);
            JSONObject row = item == null ? null : item.optJSONObject("value");
            NicoliveData.Program program = row == null ? null : NicoliveData.Program.listing(row);
            if (program != null && state.matches(program)) ranked.putIfAbsent(program.id, program);
        }
        return new ArrayList<>(ranked.values());
    }

    static List<NicoliveData.Program> followed(String html) throws Exception {
        JSONObject root = accountPage(html);
        if (!root.getJSONObject("user").optBoolean("isLoggedIn")) return null;
        JSONObject view = root.optJSONObject("view");
        boolean home = view != null && view.optJSONObject("favoriteProgramListSectionState") != null;
        LinkedHashMap<String, NicoliveData.Program> programs = new LinkedHashMap<>();
        if (home) {
            for (Iterator<String> keys = view.keys(); keys.hasNext();) {
                String key = keys.next();
                String name = key.toLowerCase(java.util.Locale.ROOT);
                if (name.contains("programlist") && (name.startsWith("favorite") || name.startsWith("followed")))
                    collectAccountPrograms(view.opt(key), programs, 0);
            }
        } else {
            boolean found = collectFollowSections(root, programs);
            JSONObject domain = root.optJSONObject("domain");
            if (domain != null) found |= collectFollowSections(domain, programs);
            if (view != null) found |= collectFollowSections(view, programs);
            if (!found) throw new JSONException("FOLLOW_LIST_MISSING");
        }
        return new ArrayList<>(programs.values());
    }

    private static boolean collectFollowSections(JSONObject container, LinkedHashMap<String,NicoliveData.Program> programs) {
        boolean found = false;
        for (Iterator<String> keys = container.keys(); keys.hasNext();) {
            String key = keys.next();
            String name = key.toLowerCase(java.util.Locale.ROOT);
            if (name.contains("notification") || name.contains("recommend") || name.contains("popular")) continue;
            Object value = container.opt(key);
            if (!(value instanceof JSONObject || value instanceof JSONArray)) continue;
            if (name.contains("follow") || name.contains("favorite") || name.contains("programlist")
                    || name.equals("programs") || name.equals("onair") || name.equals("comingsoon") || name.equals("closed")) {
                collectAccountPrograms(value, programs, 0);
                found = true;
            }
        }
        return found;
    }

    static String reservationsUrl() {
        return BASE + "/embed/timeshift-reservations";
    }

    static List<NicoliveData.Program> reservations(String html) throws Exception {
        JSONObject root = accountPage(html);
        JSONObject wrapper = root.getJSONObject("reservations");
        LinkedHashMap<String,NicoliveData.Program> result = new LinkedHashMap<>();
        collectAccountPrograms(wrapper.getJSONArray("reservations"), result, 0);
        return new ArrayList<>(result.values());
    }

    private static JSONObject accountPage(String html) throws Exception {
        try {
            return NicoliveData.embedded(html, "embedded-data", "data-props");
        } catch (java.io.IOException missing) {
            return NicoliveData.embedded(html, "DAT-csr-data", "data-value").getJSONObject("props");
        }
    }

    private static void collectAccountPrograms(Object node, LinkedHashMap<String,NicoliveData.Program> result, int depth) {
        if (depth > 18) return;
        if (node instanceof JSONArray) {
            JSONArray items = (JSONArray) node;
            for (int i = 0; i < items.length(); i++) collectAccountPrograms(items.opt(i), result, depth + 1);
        } else if (node instanceof JSONObject) {
            JSONObject row = (JSONObject) node;
            NicoliveData.Program program = NicoliveData.Program.listing(row);
            if (program == null || program.title.isEmpty() || program.status.isEmpty()) program = accountProgram(row);
            if (program != null && !program.title.isEmpty() && !program.status.isEmpty()) {
                result.putIfAbsent(program.id, program);
                return;
            }
            for (Iterator<String> keys = row.keys(); keys.hasNext();)
                collectAccountPrograms(row.opt(keys.next()), result, depth + 1);
        }
    }

    private static NicoliveData.Program accountProgram(JSONObject row) {
        JSONObject detail = row.optJSONObject("program");
        if (detail == null) return null;
        String id = row.optString("programId",detail.optString("nicoliveProgramId",detail.optString("id")));
        if (!id.matches("lv[0-9]+")) return null;
        JSONObject schedule = detail.optJSONObject("schedule");
        if (schedule == null) return NicoliveData.Program.listing(detail);
        NicoliveData.Program p = new NicoliveData.Program(id);
        p.title = detail.optString("title");
        p.access = NicoliveData.accessLabel(detail);
        if(p.access.isEmpty())p.access=NicoliveData.accessLabel(row);
        p.status = schedule.optString("status").toUpperCase(java.util.Locale.ROOT).replace('-', '_');
        if ("ON_AIR".equalsIgnoreCase(p.status) || "ONAIR".equals(p.status)) p.status = "ON_AIR";
        if ("CLOSED".equals(p.status)) p.status = "ENDED";
        try { p.begin = java.time.Instant.parse(schedule.optString("beginTime")).getEpochSecond(); }
        catch (java.time.DateTimeException invalid) { p.begin = schedule.optLong("beginTime", 0); }
        JSONObject provider = row.optJSONObject("programProvider");
        p.provider = detail.optString("provider");
        if (provider != null) {
            p.owner = provider.optString("name");
            p.provider = provider.optString("type", p.provider);
        }
        JSONObject social = row.optJSONObject("socialGroup");
        if (p.owner.isEmpty() && social != null) p.owner = social.optString("name");
        JSONObject thumbnail = row.optJSONObject("thumbnail");
        p.thumbnail = NicoliveData.broadcastThumbnail(thumbnail);
        if (p.thumbnail.isEmpty() && thumbnail != null) p.thumbnail = thumbnail.optString("large");
        JSONObject stats = row.optJSONObject("statistics");
        if (stats != null) {
            p.views = stats.optLong("viewers", stats.optLong("watchCount", -1));
            p.comments = stats.optLong("comments", stats.optLong("commentCount", -1));
            p.reservations = stats.optLong("timeshiftReservations", stats.optLong("timeshiftReservationCount", -1));
        }
        return p;
    }

    static final class Page {
        final List<NicoliveData.Program> programs;
        final boolean more;

        Page(List<NicoliveData.Program> programs, boolean more) {
            this.programs = programs;
            this.more = more;
        }
    }

    static Page recent(String json, int page) throws JSONException {
        JSONObject root = new JSONObject(json);
        JSONArray rows = root.getJSONArray("data");
        long total = root.getJSONObject("meta").optLong("totalCount", Long.MAX_VALUE);
        boolean more = rows.length() > 0 && (total == Long.MAX_VALUE
                ? rows.length() >= PAGE_SIZE && page < 99 : (page + 1L) * PAGE_SIZE < total);
        return new Page(programs(rows), more);
    }

    static List<NicoliveData.Program> timetable(String html, LocalDate date) throws Exception {
        JSONObject root = NicoliveData.embedded(html, "embedded-data", "data-props");
        JSONObject view = root.getJSONObject("view");
        long requested = date.atStartOfDay(JAPAN).toInstant().toEpochMilli();
        if (view.getLong("date") != requested) return Collections.emptyList();
        return programs(view.getJSONArray("programs"));
    }

    private static List<NicoliveData.Program> programs(JSONArray rows) {
        List<NicoliveData.Program> programs = new ArrayList<>(rows.length());
        for (int index = 0; index < rows.length(); index++) {
            JSONObject row = rows.optJSONObject(index);
            NicoliveData.Program program = row == null ? null : NicoliveData.Program.listing(row);
            if (program != null) programs.add(program);
        }
        return programs;
    }
}
