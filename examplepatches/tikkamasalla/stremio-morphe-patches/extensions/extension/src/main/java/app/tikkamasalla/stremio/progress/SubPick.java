package app.tikkamasalla.stremio.progress;

import app.tikkamasalla.stremio.subs.SdhLabels;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Pure Java helpers for the addon subtitle hand-off to Vimu: Media3 track id matching and the
 * short filtered list. No Android imports, so plain javac tests can compile it with SdhLabels.
 */
public final class SubPick {
    /** Most entries handed over in total. */
    public static final int MAX_TOTAL = 6;
    /** Most entries in the user's own language. */
    public static final int MAX_USER_LANG = 4;
    /** Most English entries when the user's language is not English. */
    public static final int MAX_ENGLISH = 2;

    private static final Pattern TRACK_PREFIX = Pattern.compile("^\\d+:");

    private SubPick() {
    }

    /** Media3 prefixes a sideloaded format id with "<n>:"; "1:https://x" becomes "https://x". */
    public static String stripTrackPrefix(String id) {
        if (id == null) return "";
        String stripped = TRACK_PREFIX.matcher(id).replaceFirst("");
        // "0:7" style ids stay as they are: only strip when a URL-like remainder follows.
        return stripped.length() > 0 && !stripped.matches("\\d+") ? stripped : id;
    }

    /** True when a Media3 format id refers to the addon subtitle with this origin URL. */
    public static boolean idMatchesOrigin(String formatId, String origin) {
        if (formatId == null || origin == null || formatId.length() == 0 || origin.length() == 0) {
            return false;
        }
        return formatId.equals(origin) || stripTrackPrefix(formatId).equals(origin);
    }

    /**
     * Indices (into the parallel lists) to hand to the player, in order: the selected one first,
     * then the user's language (up to 4), then English (up to 2, when different), max 6 total.
     * SDH/CC/HI labels are dropped. Within a language, full subtitles come before signs/forced
     * ones; the addon's own order breaks ties.
     */
    public static List<Integer> pick(List<String> names, List<String> langs, int selected,
                                     String userLang) {
        List<Integer> out = new ArrayList<>();
        try {
            int n = names == null ? 0 : names.size();
            if (n == 0 || langs == null || langs.size() != n) {
                return out;
            }
            boolean[] ok = new boolean[n];
            int[] kind = new int[n];
            for (int i = 0; i < n; i++) {
                String label = names.get(i);
                ok[i] = !SdhLabels.isSdhLabel(label);
                kind[i] = SdhLabels.kindOf(label, 0, 0);
            }
            if (selected >= 0 && selected < n && ok[selected]) {
                out.add(selected);
            }
            String user = SdhLabels.normLang(userLang);
            String english = "en";
            if (user.length() > 0) {
                addLang(out, ok, kind, langs, user, MAX_USER_LANG);
            }
            if (!english.equals(user)) {
                addLang(out, ok, kind, langs, english, MAX_ENGLISH);
            }
        } catch (Throwable ignored) {
            return new ArrayList<>();
        }
        return out;
    }

    private static void addLang(List<Integer> out, boolean[] ok, int[] kind, List<String> langs,
                                String lang, int limit) {
        int added = 0;
        for (int pass = 0; pass < 2 && added < limit; pass++) {
            for (int i = 0; i < ok.length && added < limit && out.size() < MAX_TOTAL; i++) {
                boolean full = kind[i] == SdhLabels.KIND_FULL;
                if (!ok[i] || out.contains(i) || full != (pass == 0)) continue;
                if (lang.equals(SdhLabels.normLang(langs.get(i)))) {
                    out.add(i);
                    added++;
                }
            }
        }
    }
}
