package g00;

import android.content.Context;
import f1.o0;
import java.time.DayOfWeek;
import java.time.format.TextStyle;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import kotlin.jvm.internal.StringCompanionObject;

/* loaded from: classes4.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final com.google.firebase.crashlytics.internal.persistence.c f56825a = new com.google.firebase.crashlytics.internal.persistence.c(5);

    public static final String a(long j11) {
        long j12 = j11 / 60;
        long j13 = j11 % 60;
        if (j12 == 0) {
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            return String.format("%d minutes", Arrays.copyOf(new Object[]{Long.valueOf(j13)}, 1));
        }
        if (j13 == 0) {
            StringCompanionObject stringCompanionObject2 = StringCompanionObject.f71868a;
            return String.format("%d hours", Arrays.copyOf(new Object[]{Long.valueOf(j12)}, 1));
        }
        StringCompanionObject stringCompanionObject3 = StringCompanionObject.f71868a;
        return String.format("%d hours and %d minutes", Arrays.copyOf(new Object[]{Long.valueOf(j12), Long.valueOf(j13)}, 2));
    }

    public static final String b(Context context, List list) {
        if (list.isEmpty()) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (list.size() == 1) {
            return ((DayOfWeek) b70.g.y1(list)).getDisplayName(TextStyle.FULL, Locale.getDefault());
        }
        if (list.size() == 7) {
            return context.getString(2132017805);
        }
        if (Calendar.getInstance().getFirstDayOfWeek() == 1) {
            list = b70.g.D1(f56825a, list);
        }
        return b70.g.f1(list, ", ", null, null, 0, new o0(22), 30);
    }
}
