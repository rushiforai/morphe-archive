package m6;

import b.i8;
import h6.c1;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final i8 f76015a = new i8(27);

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f76016b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashSet f76017c = new LinkedHashSet();

    /* renamed from: d, reason: collision with root package name */
    public volatile boolean f76018d;

    public static void b(AutoCloseable autoCloseable) {
        if (autoCloseable != null) {
            try {
                c1.z(autoCloseable);
            } catch (Exception e3) {
                throw new RuntimeException(e3);
            }
        }
    }

    public final void a(AutoCloseable closeable) {
        Intrinsics.g(closeable, "closeable");
        if (this.f76018d) {
            b(closeable);
            return;
        }
        synchronized (this.f76015a) {
            this.f76017c.add(closeable);
            Unit unit = Unit.f71706a;
        }
    }
}
