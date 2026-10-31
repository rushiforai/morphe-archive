package oh;

import com.amplitude.core.events.Identify;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.text.SimpleDateFormat;
import java.util.Locale;

/* loaded from: classes3.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final StringBuilder f80428a;

    static {
        Locale locale = Locale.ROOT;
        new SimpleDateFormat("MM-dd HH:mm:ss.SSS", locale);
        new SimpleDateFormat("MM-dd HH:mm:ss", locale);
        f80428a = new StringBuilder(33);
    }

    public static void a(long j11, StringBuilder sb2) {
        if (j11 == 0) {
            sb2.append("0s");
            return;
        }
        sb2.ensureCapacity(sb2.length() + 27);
        boolean z11 = false;
        if (j11 < 0) {
            sb2.append(Identify.UNSET_VALUE);
            if (j11 != Long.MIN_VALUE) {
                j11 = -j11;
            } else {
                j11 = Long.MAX_VALUE;
                z11 = true;
            }
        }
        if (j11 >= 86400000) {
            sb2.append(j11 / 86400000);
            sb2.append("d");
            j11 %= 86400000;
        }
        if (true == z11) {
            j11 = 25975808;
        }
        if (j11 >= 3600000) {
            sb2.append(j11 / 3600000);
            sb2.append("h");
            j11 %= 3600000;
        }
        if (j11 >= 60000) {
            sb2.append(j11 / 60000);
            sb2.append(InneractiveMediationDefs.GENDER_MALE);
            j11 %= 60000;
        }
        if (j11 >= 1000) {
            sb2.append(j11 / 1000);
            sb2.append("s");
            j11 %= 1000;
        }
        if (j11 > 0) {
            sb2.append(j11);
            sb2.append("ms");
        }
    }
}
