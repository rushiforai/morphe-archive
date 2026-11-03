package net.gtvbox.videoplayer;

import android.os.Bundle;
import android.util.Log;
import app.tikkamasalla.stremio.subs.SdhLabels;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Addon subtitles for Vimu: parses the list Stremio passes (subs / subs.name / subs.lang), decides whether to load one
 * automatically (only in the wanted language), names the rows added to Vimu's own subtitle dialog (VimuSubDialog) and defines
 * the secondary cycle ring (addons -> embedded -> off) behind the green / guide remote key. Pure decision logic; VimuTracks
 * owns the state and the restart. Vimu has no other use for those two keys.
 */
final class VimuAddonSubs {
    private static final String TAG = "VimuAddonSubs";

    static final int T_ADDON = 0;
    static final int T_EMBEDDED = 1;
    static final int T_OFF = 2;

    private static final int KEYCODE_GUIDE = 172;
    private static final int KEYCODE_PROG_GREEN = 184;

    private VimuAddonSubs() {}

    static final class Entry {
        final String url;
        final String name;
        final String lang;

        Entry(String url, String name, String lang) {
            this.url = url;
            this.name = name;
            this.lang = lang;
        }
    }

    static List<Entry> parse(Bundle extras) {
        if (extras == null) return Collections.emptyList();
        try {
            Object[] raw = extras.getParcelableArray("subs");
            if (raw == null || raw.length == 0) return Collections.emptyList();

            String[] names = extras.getStringArray("subs.name");
            String[] langs = extras.getStringArray("subs.lang");

            List<Entry> result = new ArrayList<>();
            Set<String> seen = new HashSet<>();

            for (int i = 0; i < raw.length && result.size() < 6; i++) {
                if (raw[i] == null) continue;
                String url = raw[i].toString();
                if (url == null || (!url.startsWith("http://") && !url.startsWith("https://"))) {
                    continue;
                }
                if (!seen.add(url)) continue;

                String nameRaw = (names != null && i < names.length && names[i] != null) ? names[i] : "";
                String name = nameRaw.trim();
                if (name.isEmpty()) {
                    name = "Subtitle " + (i + 1);
                }

                String langRaw = (langs != null && i < langs.length && langs[i] != null) ? langs[i] : "";
                String lang = SdhLabels.normLang(langRaw);
                if (lang == null) lang = "";

                result.add(new Entry(url, name, lang));
            }
            return result;
        } catch (Throwable t) {
            Log.w(TAG, "Failed to parse addon subs", t);
            return Collections.emptyList();
        }
    }

    static String wantLang(String memoryLang, String userSubLang) {
        try {
            String m = SdhLabels.normLang(memoryLang);
            if (m != null && !m.isEmpty()) return m;
            String u = SdhLabels.normLang(userSubLang);
            if (u != null && !u.isEmpty()) return u;
            return "en";
        } catch (Throwable t) {
            Log.w(TAG, "wantLang failed", t);
            return "en";
        }
    }

    static boolean hasGoodEmbedded(List<VimuTracks.Sub> embedded, String wantLang) {
        if (embedded == null || embedded.isEmpty()) return false;
        try {
            for (VimuTracks.Sub t : embedded) {
                if (t != null && VimuTracks.sameLang(t.lang, wantLang) && VimuTracks.subKind(t) == SdhLabels.KIND_FULL) {
                    return true;
                }
            }
            return false;
        } catch (Throwable t) {
            Log.w(TAG, "hasGoodEmbedded failed", t);
            return false;
        }
    }

    /** Best addon subtitle in the wanted language (memory label first, else list order), -1 when none is in that language. */
    static int pickAuto(List<Entry> list, String wantLang, String memoryLabel) {
        if (list == null || list.isEmpty()) return -1;
        try {
            int firstSameLang = -1;
            String normMemLabel = VimuTracks.normLabel(memoryLabel);
            boolean hasMemLabel = normMemLabel != null && !normMemLabel.isEmpty();

            for (int i = 0; i < list.size(); i++) {
                Entry e = list.get(i);
                if (VimuTracks.sameLang(e.lang, wantLang)) {
                    if (firstSameLang == -1) {
                        firstSameLang = i;
                    }
                    if (hasMemLabel) {
                        String entryLabel = VimuTracks.normLabel(e.name);
                        if (normMemLabel.equals(entryLabel)) {
                            return i; // Exact match found
                        }
                    }
                }
            }
            return firstSameLang; // never another language: those stay selectable in the subtitle dialog
        } catch (Throwable t) {
            Log.w(TAG, "pickAuto failed", t);
            return -1;
        }
    }

    static int ringSize(int addons, boolean hasEmbedded) {
        try {
            return addons + (hasEmbedded ? 1 : 0) + 1;
        } catch (Throwable t) {
            Log.w(TAG, "ringSize failed", t);
            return 1;
        }
    }

    static int ringPos(int addons, boolean hasEmbedded, int subCurrent, int loadedAddon) {
        try {
            if (subCurrent == -1) {
                return addons + (hasEmbedded ? 1 : 0); // The "off" slot
            }
            if (subCurrent >= 1) {
                return hasEmbedded ? addons : -1;
            }
            if (subCurrent == 0) {
                return (loadedAddon >= 0 && loadedAddon < addons) ? loadedAddon : -1;
            }
            return -1;
        } catch (Throwable t) {
            Log.w(TAG, "ringPos failed", t);
            return -1;
        }
    }

    static int ringNext(int size, int pos) {
        try {
            if (size <= 0) return -1;
            if (pos < 0) return 0;
            return (pos + 1) % size;
        } catch (Throwable t) {
            Log.w(TAG, "ringNext failed", t);
            return -1;
        }
    }

    static int targetKind(int pos, int addons, boolean hasEmbedded) {
        try {
            if (pos < 0) return T_OFF;
            if (pos < addons) return T_ADDON;
            if (hasEmbedded && pos == addons) return T_EMBEDDED;
            return T_OFF;
        } catch (Throwable t) {
            Log.w(TAG, "targetKind failed", t);
            return T_OFF;
        }
    }

    static String toast(int kind, Entry addon, String embeddedLabel) {
        try {
            if (kind == T_ADDON) {
                if (addon == null) return "Subtitles: addon";
                if (addon.lang == null || addon.lang.isEmpty()) {
                    return "Subtitles: " + addon.name;
                }
                return "Subtitles: " + addon.name + " (" + addon.lang + ")";
            } else if (kind == T_EMBEDDED) {
                if (embeddedLabel != null && !embeddedLabel.isEmpty()) {
                    return "Subtitles: embedded (" + embeddedLabel + ")";
                }
                return "Subtitles: embedded";
            }
            return "Subtitles: off";
        } catch (Throwable t) {
            Log.w(TAG, "toast failed", t);
            return "";
        }
    }

    static boolean isCycleKey(int keyCode) {
        try {
            return keyCode == KEYCODE_PROG_GREEN || keyCode == KEYCODE_GUIDE;
        } catch (Throwable t) {
            Log.w(TAG, "isCycleKey failed", t);
            return false;
        }
    }

    static int embeddedDialog(List<VimuTracks.Sub> embedded, String wantLang, int lastEmbedded) {
        if (embedded == null || embedded.isEmpty()) return -1;
        try {
            int size = embedded.size();
            if (lastEmbedded >= 1 && lastEmbedded <= size) {
                return lastEmbedded;
            }

            int firstFullAnyLang = -1;

            for (int i = 0; i < size; i++) {
                VimuTracks.Sub t = embedded.get(i);
                if (t == null) continue;
                
                int kind = VimuTracks.subKind(t);
                if (kind == SdhLabels.KIND_FULL) {
                    if (firstFullAnyLang == -1) {
                        firstFullAnyLang = i + 1;
                    }
                    if (VimuTracks.sameLang(t.lang, wantLang)) {
                        return i + 1;
                    }
                }
            }

            if (firstFullAnyLang != -1) {
                return firstFullAnyLang;
            }
            
            return 1; // Fallback
        } catch (Throwable t) {
            Log.w(TAG, "embeddedDialog failed", t);
            return -1;
        }
    }

    // ---- rows in Vimu's own subtitle dialog (VimuSubDialog) -------------------------------

    static final int ROW_ID_BASE = -2000;
    static final int ROW_ID_SPAN = 16;

    static int rowId(int addonIndex) {
        return ROW_ID_BASE - addonIndex;
    }

    static boolean isRowId(int id) {
        return (ROW_ID_BASE - ROW_ID_SPAN < id) && (id <= ROW_ID_BASE);
    }

    static int rowIndex(int id) {
        if (!isRowId(id)) {
            return -1;
        }
        return ROW_ID_BASE - id;
    }

    static String rowLabel(Entry e) {
        if (e == null) {
            return "Addon";
        }
        if (e.lang == null || e.lang.isEmpty()) {
            return "Addon: " + e.name;
        }
        return "Addon: " + e.name + " (" + e.lang + ")";
    }

    static int[] rowsToAdd(int addons, int loaded) {
        if (addons <= 0) {
            return new int[0];
        }
        boolean hasLoaded = loaded >= 0 && loaded < addons;
        int count = hasLoaded ? addons - 1 : addons;
        int[] res = new int[count];
        int idx = 0;
        for (int i = 0; i < addons; i++) {
            if (i != loaded) {
                res[idx++] = i;
            }
        }
        return res;
    }
}
