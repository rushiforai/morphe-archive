package tp;

import b50.d;
import java.util.HashMap;
import sp.r0;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static HashMap f89555a;

    static {
        new d(b.class.getSimpleName());
    }

    public static void a(String str, String str2, long j11, long j12, String str3, long j13, long j14) {
        HashMap map = new HashMap();
        f89555a = map;
        map.put("referrer", str);
        f89555a.put("referrer_source", str2);
        f89555a.put("clickTimestampSeconds", Long.valueOf(j11));
        f89555a.put("installBeginTimestampSeconds", Long.valueOf(j12));
        f89555a.put("current_device_time", Long.valueOf(r0.f87657d.o()));
        f89555a.put("installVersion", str3);
        f89555a.put("clickTimestampServerSeconds", Long.valueOf(j13));
        f89555a.put("installBeginTimestampServerSeconds", Long.valueOf(j14));
    }
}
