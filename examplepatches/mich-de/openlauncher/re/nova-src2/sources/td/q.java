package td;

import android.content.Context;
import b.c0;
import c3.a1;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.Executor;
import x7.u;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: e, reason: collision with root package name */
    public static volatile j f89006e;

    /* renamed from: a, reason: collision with root package name */
    public final de.a f89007a;

    /* renamed from: b, reason: collision with root package name */
    public final de.a f89008b;

    /* renamed from: c, reason: collision with root package name */
    public final zd.b f89009c;

    /* renamed from: d, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.d f89010d;

    public q(de.a aVar, de.a aVar2, zd.b bVar, com.google.android.gms.internal.consent_sdk.d dVar, x7.h hVar) {
        this.f89007a = aVar;
        this.f89008b = aVar2;
        this.f89009c = bVar;
        this.f89010d = dVar;
        ((Executor) hVar.f95137b).execute(new ae.m(hVar, 0));
    }

    public static q a() {
        j jVar = f89006e;
        if (jVar != null) {
            return (q) jVar.f88993f.get();
        }
        throw new IllegalStateException("Not initialized!");
    }

    public static void b(Context context) {
        if (f89006e == null) {
            synchronized (q.class) {
                try {
                    if (f89006e == null) {
                        a1 a1Var = new a1();
                        context.getClass();
                        a1Var.f19206a = context;
                        f89006e = a1Var.a();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    public final o c(k kVar) {
        byte[] bytes;
        Set setUnmodifiableSet = kVar != null ? Collections.unmodifiableSet(rd.a.f85795d) : Collections.singleton(new qd.c("proto"));
        u uVarA = i.a();
        kVar.getClass();
        uVarA.f95208a = "cct";
        rd.a aVar = (rd.a) kVar;
        String str = aVar.f85798a;
        String str2 = aVar.f85799b;
        if (str2 == null && str == null) {
            bytes = null;
        } else {
            if (str2 == null) {
                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            bytes = c0.m("1$", str, "\\", str2).getBytes(Charset.forName("UTF-8"));
        }
        uVarA.f95209b = bytes;
        return new o(setUnmodifiableSet, uVarA.d(), this);
    }
}
