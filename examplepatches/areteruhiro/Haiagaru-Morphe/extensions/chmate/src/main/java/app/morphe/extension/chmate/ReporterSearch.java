package app.morphe.extension.chmate;

import java.io.*;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

/** Streaming reader for the public, append-only reporter log. No preference writes. */
final class ReporterSearch {
    static final long DAY = 86400000L, WEEK = 7 * DAY, JST = 9 * 3600000L;
    static final String SOURCE = "https://docs.google.com/spreadsheets/d/1KK6880IjRAwt0jB44oA1bS5a3r36p_3XoNNMDNG4kOk/export?format=csv&gid=1962854723";
    /** Inclusive Japanese calendar days, returned as a half-open millisecond interval. */
    static long[] dateRange(String first, String last) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT);
        format.setTimeZone(TimeZone.getTimeZone("Asia/Tokyo"));
        format.setLenient(false);
        Date start = parseDay(format, first), finish = parseDay(format, last);
        if (start.after(finish)) throw new IllegalArgumentException("開始日は終了日以前にしてください");
        Calendar end = Calendar.getInstance(format.getTimeZone(), Locale.ROOT);
        end.setTime(finish);
        end.add(Calendar.DAY_OF_MONTH, 1);
        return new long[]{start.getTime(), end.getTimeInMillis()};
    }
    private static Date parseDay(SimpleDateFormat format, String value) {
        if (value == null || !value.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}"))
            throw new IllegalArgumentException("日付を選んでください");
        ParsePosition position = new ParsePosition(0);
        Date result = format.parse(value, position);
        if (result == null || position.getIndex() != value.length())
            throw new IllegalArgumentException("日付を確認してください");
        return result;
    }
    static long[] period(int mode, long anchor) {
        long daily = Math.floorDiv(anchor + JST, DAY) * DAY - JST;
        long weekly = Math.floorDiv(anchor, WEEK) * WEEK; // Epoch = Thursday 09:00 JST.
        if (mode == 1) return new long[]{weekly, weekly + WEEK};
        if (mode == 2) return new long[]{daily, daily + DAY};
        return new long[]{Math.max(daily, weekly), Math.min(daily + DAY, weekly + WEEK)};
    }
    /** Switch the displayed query to the requested part of a complete reporter ID. */
    static String queryForMode(String id, int mode) {
        if (id == null || !id.matches("[A-Za-z0-9+/.]{8}"))
            throw new IllegalArgumentException("8文字の記者IDが必要です");
        if (mode == 0) return id;
        if (mode == 1) return id.substring(0, 4);
        if (mode == 2) return id.substring(4);
        throw new IllegalArgumentException("記者IDの検索モードが不正です");
    }
    static String pattern(String suffix, int mode) {
        String id = suffix.substring(1, suffix.length() - 2);
        if (!id.matches("[A-Za-z0-9+/.]{8}")) throw new IllegalArgumentException("8文字の記者IDが必要です");
        if (mode == 0) return Pattern.quote(suffix);
        return "\\[" + (mode == 1 ? Pattern.quote(id.substring(0,4)) + "[A-Za-z0-9+/.]{4}"
                : "[A-Za-z0-9+/.]{4}" + Pattern.quote(id.substring(4))) + "★\\]$";
    }
    static final class Row {
        final String id, title, url;
        final long created;
        Row(String id, String title, String thread) {
            this.id = id; this.title = title;
            created = Long.parseLong(thread) * 1000L;
            url = "https://bbs.eddibb.cc/test/read.cgi/liveedge/" + thread + "/";
        }
    }
    static final class Result {
        final List<Row> rows = new ArrayList<>();
        int matches;
    }
    static Result search(Reader source, int mode, String query, long from, long until) throws IOException {
        query = query.trim();
        if (mode < 0 || mode > 3 || query.isEmpty() || query.length() > 200 || from >= until)
            throw new IllegalArgumentException("検索語と期間を確認してください");
        if (mode < 3 && !query.matches(mode == 0 ? "[A-Za-z0-9+/.]{8}" : "[A-Za-z0-9+/.]{4}"))
            throw new IllegalArgumentException(mode == 0 ? "記者IDは8文字です" : "記者IDは4文字です");
        PushbackReader reader = new PushbackReader(new BufferedReader(source), 1);
        List<String> header = record(reader);
        if (header == null || header.size() < 6 || !"記者ID".equals(header.get(1)) || !"スレID".equals(header.get(4)))
            throw new IOException("検索ログの形式が変わっています");
        Result result = new Result();
        List<String> fields;
        while ((fields = record(reader)) != null) {
            if (Thread.currentThread().isInterrupted()) throw new InterruptedIOException();
            if (fields.size() < 6 || !fields.get(1).matches("[A-Za-z0-9+/.]{8}") || !fields.get(4).matches("[0-9]{9,10}")) continue;
            Row row = new Row(fields.get(1), fields.get(2), fields.get(4));
            if (row.created < from || row.created >= until) continue;
            boolean match = mode == 3 ? row.title.toLowerCase(Locale.ROOT).contains(query.toLowerCase(Locale.ROOT))
                    : (mode == 0 ? row.id : mode == 1 ? row.id.substring(0,4) : row.id.substring(4)).equals(query);
            if (match) {
                result.matches++;
                if (result.rows.size() < 200) result.rows.add(row);
                else {
                    int oldest = 0;
                    for (int i=1;i<result.rows.size();i++) if(result.rows.get(i).created<result.rows.get(oldest).created)oldest=i;
                    if(row.created>result.rows.get(oldest).created)result.rows.set(oldest,row);
                }
            }
        }
        result.rows.sort((a,b) -> Long.compare(b.created,a.created));
        return result;
    }
    private static List<String> record(PushbackReader reader) throws IOException {
        List<String> fields = new ArrayList<>(); StringBuilder value = new StringBuilder();
        boolean quoted = false, any = false; int count = 0, c;
        while ((c = reader.read()) != -1) {
            any = true;
            if (++count > 100000) throw new IOException("検索ログの1行が大きすぎます");
            if (c == '"') {
                if (quoted) { int next = reader.read(); if (next == '"') value.append('"'); else { quoted = false; if (next != -1) reader.unread(next); } }
                else if (value.length() == 0) quoted = true;
                else value.append('"');
            } else if (c == ',' && !quoted) { fields.add(value.toString()); value.setLength(0); }
            else if ((c == '\n' || c == '\r') && !quoted) {
                if (c == '\r') { int next = reader.read(); if (next != '\n' && next != -1) reader.unread(next); }
                fields.add(value.toString()); return fields;
            } else value.append((char)c);
        }
        if (quoted) throw new IOException("検索ログの受信が途中で終了しました");
        if (!any) return null;
        fields.add(value.toString()); return fields;
    }
    private ReporterSearch() {}
}
