package com.apm.insight.j;

import android.content.Context;
import android.os.Handler;
import com.apm.insight.e;
import com.apm.insight.runtime.m;
import com.apm.insight.runtime.o;
import java.util.Map;

/* loaded from: classes.dex */
public final class b extends a {

    /* renamed from: b, reason: collision with root package name */
    private static Runnable f21655b = new Runnable() { // from class: com.apm.insight.j.b.1
        @Override // java.lang.Runnable
        public final void run() {
            m.a().a().removeCallbacks(this);
            m.a().a(new b(m.a().a(), e.g()));
        }
    };

    /* renamed from: a, reason: collision with root package name */
    private Context f21656a;

    public b(Handler handler, Context context) {
        super(handler, 30000L);
        this.f21656a = context;
    }

    public static void c() {
        m.a().a(f21655b, 100L);
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x001e A[Catch: all -> 0x0029, TRY_LEAVE, TryCatch #0 {all -> 0x0029, blocks: (B:6:0x0010, B:8:0x0016, B:9:0x001e), top: B:13:0x0010 }] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        Map<String, Object> commonParams;
        try {
            commonParams = e.a().c().getCommonParams();
        } catch (Throwable unused) {
            commonParams = null;
        }
        if (commonParams != null) {
            try {
                if (com.apm.insight.nativecrash.b.a(commonParams)) {
                    a(b());
                } else {
                    o.a().a(commonParams, com.apm.insight.entity.b.b());
                }
            } catch (Throwable unused2) {
            }
        }
    }
}
