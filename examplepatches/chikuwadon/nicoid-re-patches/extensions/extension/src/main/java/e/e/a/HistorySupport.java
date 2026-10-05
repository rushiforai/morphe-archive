package e.e.a;

import android.content.Context;
import org.json.JSONArray;

public final class HistorySupport {
    private HistorySupport() { }
    public static String format(String ignored, Object[] values) {
        return String.format(UiStrings.translate("<b>%s</b> <font color='red'>%s回視聴</font>"), values);
    }
    public static void bindAccount(android.view.View root, Object adapter, Object row) throws ReflectiveOperationException {
        // Fragment assigns the loader kind g to adapter.e after loading; f is tap behavior.
        // The loader stores viewedAt in posttime, statistics + registeredAt in videoinfo.
        if (adapter.getClass().getField("e").getInt(adapter) != 4) return;
        java.lang.reflect.Method get = row.getClass().getMethod("a", String.class);
        Object watched = get.invoke(row, "posttime"), info = get.invoke(row, "videoinfo");
        android.widget.TextView date = (android.widget.TextView) root.findViewById(0x7f08015e);
        android.widget.TextView statistics = (android.widget.TextView) root.findViewById(0x7f0801d3);
        if (date != null && watched != null) {
            String template = UiStrings.translate(root.getContext().getString(0x7f0f0215));
            date.setText(HistoryRules.accountViewedAt(watched.toString(), template));
            date.setContentDescription(null);
        }
        if (statistics == null || info == null) return;
        String source = info.toString();
        int newline = source.indexOf('\n');
        String counts = newline < 0 ? source : source.substring(0, newline);
        if (VideoCountRules.parse(counts) == null) return;
        VideoCounts.setText(statistics, counts);
        if (newline >= 0) {
            CharSequence description = statistics.getContentDescription();
            statistics.append(source.substring(newline));
            statistics.setContentDescription(description + source.substring(newline));
        }
    }
    public static int write(int type, JSONArray data, Context context) throws Exception {
        int result = (Integer) Class.forName("e.e.a.v0").getMethod("a", int.class, JSONArray.class, Context.class)
            .invoke(null, type, data, context);
        if (result != 1) {
            android.widget.Toast.makeText(context, UiStrings.translate("履歴を削除できませんでした。再試行してください。"), android.widget.Toast.LENGTH_LONG).show();
            throw new java.io.IOException("History could not be saved");
        }
        return result;
    }
}
