package e.e.a;

import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Presentation only: retain the native row, view IDs, model and click targets. */
public final class VideoRows191 {
    static final String POSTED = "nicoid_row_posted", TRANSFER = "nicoid_row_transfer", NOTE = "nicoid_row_note";
    private static final Pattern DATE = Pattern.compile("[0-9]{4}(?:[-/][0-9]{2}[-/][0-9]{2}[ T][0-9]{2}:[0-9]{2}(?::[0-9]{2}(?:\\.[0-9]+)?)?(?:Z|[+-][0-9]{2}:?[0-9]{2})?|年[0-9]{2}月[0-9]{2}日 [0-9]{2}(?:時[0-9]{2}分|:[0-9]{2}))");
    private static final Pattern TIMES = Pattern.compile("([0-9][0-9,]*)\\s*(?:回視聴|views|次觀看)", Pattern.CASE_INSENSITIVE);
    private static final java.util.Map<Object,Long> POSTED_TIMES = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<Object,Long>());
    private static final Pattern VIDEO_URL=Pattern.compile("https?://[^/]*nicovideo.jp/(?:watch|shorts)/.*");private VideoRows191() {}

    static long millis(String source) { return RowDates194.millis(source); }
    static String date(long millis, String label) { return RowDates194.format(millis, label); }
    static String date(String source, String label) { return date(millis(source), label); }
    static int type(Object adapter) { try { return adapter.getClass().getField("e").getInt(adapter); } catch (Exception ignored) { return -1; } }
    static String first(String... values) { for (String value : values) if (value != null && !value.isEmpty() && !value.equals("null")) return value; return ""; }
    static String owner(Object row) {
        String field = ""; try { Object value = ListActions.get(row, "y"); if (value != null) field = value.toString(); } catch (Exception ignored) { }
        return first(HistorySupport.owner(row), field);
    }
    static long posted(Object row, boolean ordinary) {
        Long known = POSTED_TIMES.get(row); if (known != null && known > 0) return known;
        long value = HistorySupport.posted(row); if (value > 0) return value;
        for (String key : new String[]{"postedAt", "first_retrieve"}) { value = millis(ListActions.value(row, key)); if (value > 0) return value; }
        return ordinary ? millis(ListActions.value(row, "posttime")) : 0;
    }
    static TextView extra(TextView stats, String tag) {
        ViewGroup parent = (ViewGroup)stats.getParent();
        TextView view = (TextView)parent.findViewWithTag(tag);
        if (view == null) { view = new TextView(stats.getContext()); view.setTag(tag); parent.addView(view, new LinearLayout.LayoutParams(-1, -2)); }
        return view;
    }
    static void label(TextView view, String text) { view.setText(text); view.setContentDescription(null); view.setVisibility(text.isEmpty() ? View.GONE : View.VISIBLE); }
    static int color(View root,String name,int dark,int light){boolean night=ThemeChoice.isNight(root.getContext());int id=root.getResources().getIdentifier(name+(night?"_dark":"_light"),"color",root.getContext().getPackageName());return id==0?(night?dark:light):root.getResources().getColor(id);}
    static void metadata(TextView view, int color) { view.setTextSize(12); view.setTextColor(color); view.setElevation(0); view.setStateListAnimator(null); }
    static TextView transfer(View root) { View view = root.findViewWithTag(TRANSFER); return view instanceof TextView ? (TextView)view : null; }

    public static void bind(View root, Object adapter, Object row) {
        try { bindRow(root, adapter, row); } catch (RuntimeException error) { android.util.Log.w("nicoid-row", "Unable to format video row", error); }
    }
    private static void bindRow(View root, Object adapter, Object row) {
        // Non-video adapters use ListActions too; leave them completely untouched.
        String url = ListActions.value(row, "videourl");
        if (!VIDEO_URL.matcher(url).matches()) return;
        TextView date = (TextView)root.findViewById(0x7f08015e), title = (TextView)root.findViewById(0x7f0801b4), stats = (TextView)root.findViewById(0x7f0801d3);
        if (date == null || title == null || stats == null || !(stats.getParent() instanceof LinearLayout)) return;
        LinearLayout column = (LinearLayout)stats.getParent();
        TextView uploader = (TextView)root.findViewById(0x7f0801e2);
        if (uploader == null) { uploader = new TextView(root.getContext()); uploader.setId(0x7f0801e2); column.addView(uploader, column.indexOfChild(stats), new LinearLayout.LayoutParams(-1, -2)); }
        // A recycled cache row must not leave its owner below the statistics.
        if (column.indexOfChild(uploader) > column.indexOfChild(stats)) { column.removeView(uploader); column.addView(uploader, column.indexOfChild(stats)); }
        int color = color(root, "nicoid_muted", 0xffb7bac3, 0xff666a73);
        metadata(date, color); metadata(uploader, color); metadata(stats, color);
        title.setTextSize(15); title.setTextColor(color(root, "nicoid_ink", 0xffeeeeee, 0xff202124));
        TextView posted = extra(stats, POSTED), transfer = extra(stats, TRANSFER), note = extra(stats, NOTE);
        metadata(posted, color); metadata(transfer, color); metadata(note, color);
        View prior = root.findViewWithTag("nicoid_history_posted"); if (prior != null) prior.setVisibility(View.GONE);
        int type = type(adapter); boolean history = type == 4 || type == 8, playlist = LocalPlaylists.hasAdapter(adapter), added = playlist || type == 5 || type == 9;
        CacheRowInfo cache = CacheListing.INFO.get(row);
        String raw = ListActions.value(row, "posttime"), info = ListActions.value(row, "videoinfo");
        long postedTime = posted(row, !history && !added);
        String header;
        if (history) {
            long watched = HistorySupport.watched(row); if (watched <= 0) watched = millis(raw);
            header = date(watched, "視聴");
            // Account history does not supply a reliable watch count. Preserve local counts only.
            if (type == 8) { long count = HistorySupport.views(row); Matcher times = TIMES.matcher(raw); if (count <= 0 && times.find()) try { count = Long.parseLong(times.group(1).replace(",", "")); } catch (NumberFormatException ignored) { }
                if (count > 0) header += " · " + VideoCountRules.format(count) + UiStrings.translate("回視聴"); }
            if (postedTime <= 0 && info.indexOf('\n') >= 0) postedTime = millis(info.substring(info.indexOf('\n') + 1));
        } else header = date(raw, added ? "登録" : "投稿");
        if (cache != null) header = cache.posted;
        else if (!history && !added && header.isEmpty()) header = date(postedTime, "投稿");
        if (postedTime > 0) POSTED_TIMES.put(row, postedTime);
        label(date, header); label(uploader, cache == null ? owner(row) : cache.owner);
        label(posted, history || added ? date(postedTime, "投稿") : "");
        label(transfer, cache == null ? "" : cache.transfer);
        String tail = info.indexOf('\n') < 0 ? "" : info.substring(info.indexOf('\n') + 1).trim();
        if (history && millis(tail) > 0) { int next = tail.indexOf('\n'); tail = next < 0 ? "" : tail.substring(next + 1).trim(); }
        label(note, cache == null ? tail : "");
        String counts = cache == null ? info.split("\\n", 2)[0] : cache.counts;
        long[] structured = Refresh192.counts(row);
        if(structured==null)structured = cache == null ? HistorySupport.counts(row) : cache.statistics;
        if (structured != null) { VideoCounts.render(stats, structured); stats.setVisibility(stats.length() == 0 ? View.GONE : View.VISIBLE); }
        else { VideoCounts.setText(stats, counts); stats.setVisibility(counts.isEmpty() ? View.GONE : View.VISIBLE); }
        TextView duration = (TextView)root.findViewById(0x7f0800df);
        if (duration != null) { duration.setTextSize(12); duration.setTextColor(0xffeeeeee); }
        View thumbnail = root.findViewById(0x7f0800cd);
        if (thumbnail != null && thumbnail.getLayoutParams() != null) {
            ViewGroup.LayoutParams lp = thumbnail.getLayoutParams(); int width=PanelUi.dp(root.getContext(),124),height=Math.round(width*9f/16);if(lp.width!=width||lp.height!=height){lp.width=width;lp.height=height;thumbnail.setLayoutParams(lp);}
        }
        // Keep the original rank overlay and full-width text, with only a small edge gap.
        if (column.getLayoutParams() instanceof RelativeLayout.LayoutParams) {
            RelativeLayout.LayoutParams text = (RelativeLayout.LayoutParams)column.getLayoutParams();
            int margin=PanelUi.dp(root.getContext(),4);if(text.rightMargin!=margin){text.rightMargin=margin;column.setLayoutParams(text);}
        }
    }
}
