package of;

import android.graphics.PointF;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import wf.v;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f80362a = Pattern.compile("\\{([^}]*)\\}");

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f80363b;

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f80364c;

    /* renamed from: d, reason: collision with root package name */
    public static final Pattern f80365d;

    static {
        int i5 = v.f94376a;
        Locale locale = Locale.US;
        f80363b = Pattern.compile(String.format(locale, "\\\\pos\\((%1$s),(%1$s)\\)", "\\s*\\d+(?:\\.\\d+)?\\s*"));
        f80364c = Pattern.compile(String.format(locale, "\\\\move\\(%1$s,%1$s,(%1$s),(%1$s)(?:,%1$s,%1$s)?\\)", "\\s*\\d+(?:\\.\\d+)?\\s*"));
        f80365d = Pattern.compile("\\\\an(\\d+)");
    }

    public static PointF a(String str) throws NumberFormatException {
        String strGroup;
        String strGroup2;
        Matcher matcher = f80363b.matcher(str);
        Matcher matcher2 = f80364c.matcher(str);
        boolean zFind = matcher.find();
        boolean zFind2 = matcher2.find();
        if (zFind) {
            if (zFind2) {
                wf.a.u("SsaStyle.Overrides", "Override has both \\pos(x,y) and \\move(x1,y1,x2,y2); using \\pos values. override='" + str + "'");
            }
            strGroup = matcher.group(1);
            strGroup2 = matcher.group(2);
        } else {
            if (!zFind2) {
                return null;
            }
            strGroup = matcher2.group(1);
            strGroup2 = matcher2.group(2);
        }
        strGroup.getClass();
        float f11 = Float.parseFloat(strGroup.trim());
        strGroup2.getClass();
        return new PointF(f11, Float.parseFloat(strGroup2.trim()));
    }
}
