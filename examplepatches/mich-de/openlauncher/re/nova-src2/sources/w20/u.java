package w20;

import android.widget.RemoteViews;
import java.lang.reflect.Field;

/* loaded from: classes4.dex */
public abstract class u {

    /* renamed from: a, reason: collision with root package name */
    public static final Field f93723a = v30.e.i(RemoteViews.class, "mActions");

    static {
        v30.e.i(RemoteViews.class, "mMemoryUsageCounter");
        v30.e.g(v30.e.f("android.widget.RemoteViews$MemoryUsageCounter"), "clear", new Class[0]);
        v30.e.i(RemoteViews.class, "mPortrait");
        if ((v30.a.f92038b ? v30.e.g(RemoteViews.class, "estimateMemoryUsage", new Class[0]) : null) == null) {
            v30.e.j(RemoteViews.class, "estimateBitmapMemoryUsage", new Class[0]);
        }
    }
}
