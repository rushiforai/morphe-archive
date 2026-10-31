package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.util.Log;
import java.io.Serializable;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final /* synthetic */ class eb implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32496a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f32497b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Serializable f32498c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f32499d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f32500e;

    public /* synthetic */ eb(Object obj, Serializable serializable, Object obj2, Object obj3, int i5) {
        this.f32496a = i5;
        this.f32497b = obj;
        this.f32498c = serializable;
        this.f32499d = obj2;
        this.f32500e = obj3;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f32496a) {
            case 0:
                cl.m1 m1Var = (cl.m1) this.f32497b;
                AtomicBoolean atomicBoolean = (AtomicBoolean) this.f32498c;
                Context context = (Context) this.f32499d;
                db dbVar = (db) this.f32500e;
                if ((m1Var.f20073a instanceof cl.d) && atomicBoolean.compareAndSet(false, true)) {
                    try {
                        context.unregisterReceiver(dbVar);
                        break;
                    } catch (IllegalArgumentException e3) {
                        Log.w("DirectBootUtils", "Failed to unregister receiver", e3);
                        return;
                    }
                }
                break;
            default:
                d2 d2Var = wb.f33188a;
                Level level = (Level) this.f32497b;
                c3 c3Var = (c3) d2Var.f32451b;
                boolean zE = c3Var.e(level);
                String str = (String) c3Var.f32423a;
                ((i) d.f32446a).getClass();
                n.f32839b.a(str, level, zE);
                ((ih) ((ih) (!zE ? d2.f32449d : new jh(d2Var, level)).a((Throwable) this.f32498c)).zzn()).b((String) this.f32499d, (Object[]) this.f32500e);
                break;
        }
    }
}
