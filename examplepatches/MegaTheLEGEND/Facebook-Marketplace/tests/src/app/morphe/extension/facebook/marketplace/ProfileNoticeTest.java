package app.morphe.extension.facebook.marketplace;

import java.util.ArrayList;
import java.util.List;

public class ProfileNoticeTest {
    static int failures;
    static void check(String w, boolean ok) { if (!ok) failures++; System.out.println((ok ? "ok: " : "FAIL: ") + w); }
    static class V {
        int vis; String text;
        V(String t) { text = t; }
        public int getVisibility() { return vis; }
        public void setVisibility(int v) { vis = v; }
        public CharSequence getText() { return text; }
        public CharSequence getContentDescription() { return null; }
    }
    static class G extends V {
        List<V> kids = new ArrayList<>();
        G() { super(null); }
        G add(V v) { kids.add(v); return this; }
        public int getChildCount() { return kids.size(); }
        public Object getChildAt(int i) { return kids.get(i); }
    }
    public static void main(String[] a) throws Exception {
        check("paragraph matches", ProfileNotice.matches("Your profile is shown to buyers. Go to settings"));
        check("case/nbsp", ProfileNotice.matches("GO TO\u00a0SETTINGS"));
        check("other text no match", !ProfileNotice.matches("Settings"));
        check("huge text no match", !ProfileNotice.matches("go to settings " + "x".repeat(500)));
        V para = new V("Manage who sees your listings. Go to settings"), keep = new V("Couch - $40");
        G root = new G().add(keep).add(new G().add(para));
        check("one hidden", ProfileNotice.hide(root, 0, new int[]{100}) == 1);
        check("paragraph gone", para.vis == 8);
        check("others kept", keep.vis == 0 && root.vis == 0);
        System.exit(failures == 0 ? 0 : 1);
    }
}
