package app.morphe.extension.chmate;

import java.net.URI;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Literal poster identities only. Never searches the body or evaluates a regular expression supplied by users. */
final class PosterHighlightRules {
    static final String[] KINDS = {"スレ主", "ID", "ﾜｯﾁｮｲ", "ﾜｯﾁｮｲ下4桁", "トリップ"};
    static final String[] SCOPES = {"このスレ", "この板", "すべての板"};
    static final String[] COLOR_NAMES = {"黄", "青", "緑", "赤", "オレンジ", "ピンク", "紫", "水色", "青緑", "黄緑", "茶", "グレー"};
    static final int[] COLORS = {0x55ffc107,0x5542a5f5,0x5566bb6a,0x55ef5350,0x55ff9800,0x55ec407a,
            0x55ab47bc,0x5526c6da,0x5526a69a,0x55cddc39,0x55a1887f,0x559e9e9e};
    private static final Pattern SLIP = Pattern.compile("(?<![^\\s()（）\\[\\]<>])([^\\s()（）\\[\\]<>]{4}-[^\\s()（）\\[\\]<>]{4})(?=$|[\\s()（）\\[\\]<>])");
    private static final Pattern TRIP = Pattern.compile("◆[\\s\\p{Z}\\p{Cf}\\p{Cc}]*([^\\s\\p{Z}\\p{Cf}\\p{Cc}◆◇()（）<>]+)");
    private static final Pattern EDGE_SPACE = Pattern.compile("^[\\s\\p{Z}\\p{Cf}\\p{Cc}]+|[\\s\\p{Z}\\p{Cf}\\p{Cc}]+$");

    static String tripValue(String value) {
        if (value == null) return "";
        value = EDGE_SPACE.matcher(value).replaceAll("");
        if (value.startsWith("◆")) value = EDGE_SPACE.matcher(value.substring(1)).replaceAll("");
        return value;
    }

    static final class Poster {
        final String id, slip, suffix, trip;
        Poster(String id, String name, String date) {
            String candidate = id == null ? "" : id.trim();
            if (candidate.startsWith("ID:")) candidate = candidate.substring(3);
            this.id = candidate.isEmpty() || candidate.matches("[?？!！*＊\\-]+") ? "" : candidate;
            String header = (name == null ? "" : name) + " " + (date == null ? "" : date);
            Matcher matcher = SLIP.matcher(header);
            slip = matcher.find() ? matcher.group(1) : "";
            suffix = slip.isEmpty() ? "" : slip.substring(5);
            matcher = TRIP.matcher(name == null ? "" : name);
            // ◇ can be typed by anyone; only the native solid trip marker is accepted.
            trip = matcher.find() ? matcher.group(1) : "";
        }
        String value(int kind) {
            switch (kind) {
                case 1: return id;
                case 2: return slip;
                case 3: return suffix;
                case 4: return trip;
                default: return "";
            }
        }
        boolean sameAsStarter(Poster first) {
            if (first == null) return false;
            if (!first.id.isEmpty()) return first.id.equals(id);
            if (!first.trip.isEmpty()) return first.trip.equals(trip);
            return !first.slip.isEmpty() && first.slip.equals(slip);
        }
    }

    static final class Rule {
        final int kind, scope, colorIndex;
        final String target, value;
        final boolean enabled;
        Rule(int kind, int scope, String target, String value, boolean enabled) {
            this(kind,scope,target,value,enabled,-1);
        }
        Rule(int kind, int scope, String target, String value, boolean enabled, int colorIndex) {
            if (kind == 4) value = tripValue(value);
            if (kind < 0 || kind >= KINDS.length || scope < 0 || scope >= SCOPES.length
                    || target == null || value == null || value.length() > 256
                    || (scope != 2 && target.isEmpty()) || (kind != 0 && value.isEmpty())
                    || kind == 3 && value.length() != 4)
                throw new IllegalArgumentException("Invalid poster highlight rule");
            this.kind=kind; this.scope=scope; this.target=target; this.value=value; this.enabled=enabled;
            this.colorIndex=colorIndex>=0 && colorIndex<COLORS.length?colorIndex:-1;
        }
        int color(int fallback) { return colorIndex<0?fallback:COLORS[colorIndex]; }
        boolean matches(Poster poster, Poster first, String thread, String board) {
            if (!enabled || scope == 0 && !target.equals(thread) || scope == 1 && !target.equals(board)) return false;
            return kind == 0 ? poster.sameAsStarter(first) : value.equals(poster.value(kind));
        }
        String label() {
            return KINDS[kind] + (kind == 0 ? "" : "：" + (kind == 3 ? "-" : kind == 4 ? "◆" : "") + value)
                    + "\n" + SCOPES[scope] + (scope == 2 ? "" : " " + target);
        }
    }

    /** Ignore the scheme/response number, but keep host, board and thread boundaries distinct. */
    static String thread(String url) {
        try {
            URI uri = URI.create(url);
            if (uri.getHost() == null || uri.getRawUserInfo() != null) return "";
            String path=uri.getPath();
            Matcher read=Pattern.compile("^/(?:test|bbs)/read\\.cgi/([^/]+)/([0-9]+)(?:/(?:[0-9]+|l[0-9]+)?)?/?$").matcher(path);
            if (read.matches()) return uri.getHost().toLowerCase(java.util.Locale.ROOT) + "/" + read.group(1) + "/" + read.group(2);
            Matcher talk=Pattern.compile("^/boards/([^/]+)/([0-9]+)(?:/.*)?$").matcher(path);
            if (talk.matches()) return uri.getHost().toLowerCase(java.util.Locale.ROOT) + "/" + talk.group(1) + "/" + talk.group(2);
            // External boards may use their own canonical response URL. Strip only its last response number.
            return uri.getHost().toLowerCase(java.util.Locale.ROOT) + path.replaceFirst("/[0-9]+/?$", "").replaceFirst("/$", "");
        } catch (RuntimeException error) { return ""; }
    }
    static String board(String thread) {
        int slash=thread.lastIndexOf('/');
        return slash > 0 ? thread.substring(0,slash) : "";
    }
}
