package sf;

import java.util.regex.Pattern;
import wf.v;

/* loaded from: classes3.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f87413a = 0;

    static {
        Pattern.compile("^NOTE([ \t].*)?$");
    }

    public static float a(String str) {
        if (str.endsWith("%")) {
            return Float.parseFloat(str.substring(0, str.length() - 1)) / 100.0f;
        }
        throw new NumberFormatException("Percentages must end with %");
    }

    public static long b(String str) {
        int i5 = v.f94376a;
        String[] strArrSplit = str.split("\\.", 2);
        long j11 = 0;
        for (String str2 : strArrSplit[0].split(":", -1)) {
            j11 = (j11 * 60) + Long.parseLong(str2);
        }
        long j12 = j11 * 1000;
        if (strArrSplit.length == 2) {
            j12 += Long.parseLong(strArrSplit[1]);
        }
        return j12 * 1000;
    }
}
