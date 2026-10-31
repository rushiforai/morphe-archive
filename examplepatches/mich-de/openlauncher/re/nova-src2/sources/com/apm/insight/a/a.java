package com.apm.insight.a;

import com.apm.insight.CrashType;
import com.apm.insight.ICrashCallback;
import com.apm.insight.b.i;
import com.apm.insight.runtime.m;

/* loaded from: classes2.dex */
public class a implements ICrashCallback {

    /* renamed from: d, reason: collision with root package name */
    private static volatile a f21408d;

    /* renamed from: a, reason: collision with root package name */
    private volatile String f21409a;

    /* renamed from: b, reason: collision with root package name */
    private volatile i.a f21410b;

    /* renamed from: c, reason: collision with root package name */
    private volatile i.a f21411c;

    /* renamed from: e, reason: collision with root package name */
    private volatile boolean f21412e = false;

    private a() {
    }

    public static a a() {
        if (f21408d == null) {
            synchronized (a.class) {
                try {
                    if (f21408d == null) {
                        f21408d = new a();
                    }
                } finally {
                }
            }
        }
        return f21408d;
    }

    @Override // com.apm.insight.ICrashCallback
    public void onCrash(CrashType crashType, String str, Thread thread) {
        crashType.equals(CrashType.NATIVE);
    }

    public final void a(String str, i.a aVar, i.a aVar2) {
        this.f21409a = str;
        this.f21410b = aVar;
        this.f21411c = aVar2;
        if (this.f21412e) {
            return;
        }
        this.f21412e = true;
        m.a().a(new Runnable() { // from class: com.apm.insight.a.a.1
            @Override // java.lang.Runnable
            public final void run() {
            }
        });
    }
}
