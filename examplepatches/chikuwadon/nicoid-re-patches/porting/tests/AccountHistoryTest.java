package e.e.a;
import android.content.Context;
import android.widget.TextView;
import android.widget.RelativeLayout;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Arrays;

public final class AccountHistoryTest {
    public static class Adapter {
        // Fragment copies e0.g into b0.e; b0.f is the tap-action preference.
        public int e = 4, f = 0;
        public ArrayList<Row> b = new ArrayList<>();
    }
    public static class Row {
        public HashMap<String,Object> fields = new HashMap<>();
        public Object a(String key) { return fields.get(key); }
    }
    static void check(boolean ok, String why) { if (!ok) throw new AssertionError(why); }
    public static void main(String[] args) {
        String[][] cases = {
            {"2026年10月05日 10時13分 視聴 0回視聴", "<b>%s</b> 視聴 <font color='red'>%s回視聴</font>", "再生:9,619 コメ:1,334 マイ:37", "2026年10月04日 21時00分 投稿", "2026年10月05日 10時13分"},
            {"2026-10-05 10:13 Watched 0 times", "<b>%s</b> Watched <font color='red'>%s times</font>", "Views:9,619 Comments:1,334 My Lists:37", "2026-10-04 21:00 Posted", "2026-10-05 10:13"},
            {"2026-10-05 10:13 觀看 0 次", "<b>%s</b> 觀看 <font color='red'>%s 次</font>", "觀看:9,619 留言:1,334 播放清單:37", "2026-10-04 21:00 投稿", "2026-10-05 10:13"}
        };
        for (String[] sample : cases) {
            Context context = new Context() { @Override public String getString(int id) { return sample[1]; } };
            RelativeLayout root = new RelativeLayout(context);
            TextView date = new TextView(context), stats = new TextView(context);
            date.setId(0x7f08015e); stats.setId(0x7f0801d3);
            root.addView(date, null); root.addView(stats, null);
            Row row = new Row(); row.fields.put("posttime", sample[0]);
            row.fields.put("videoinfo", sample[2] + "\n" + sample[3]);
            row.fields.put("videourl", "sm123");
            Adapter adapter = new Adapter(); adapter.b.add(row);
            int before = VideoCounts.calls;
            for (int i=0; i<2; i++) {
                PaidVideos.bindAdapter(root, adapter, 0);
                check(date.text.toString().equals(sample[4]), "viewed timestamp retained without unavailable count");
                check(stats.text.toString().equals("icons\n" + sample[3]), "icon renderer used and posted timestamp retained on recycled row");
                check(Arrays.equals(VideoCounts.counts, new long[]{9619,1334,-1,37}), "exact statistics passed to shared renderer");
                check(stats.description.toString().endsWith(sample[3]), "accessible posted timestamp retained");
            }
            check(VideoCounts.calls == before + 2, "account history e=4 recognized while tap preference f=0");
            adapter.f = 4; adapter.e = 0;
            date.setText("7回視聴"); stats.setText("local row");
            PaidVideos.bindAdapter(root, adapter, 0);
            check(date.text.toString().equals("7回視聴") && stats.text.toString().equals("local row"), "other list kinds and genuine local watch counts unchanged");
        }
        System.out.println("Account history: real binder, adapter list kind, exact statistics, dates, recycled rows and three languages verified");
    }
}
