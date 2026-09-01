package defpackage;

import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class vzf implements x0g {
    public static final Object d = new Object();
    public static final w0g e = new w0g(h1g.class);
    public static final boolean f;
    public static final ur7 g;
    public volatile Object a;
    public volatile nzf b;
    public volatile tzf c;

    static {
        boolean z;
        ur7 rzfVar;
        Throwable th;
        Throwable th2;
        try {
            z = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));
        } catch (SecurityException unused) {
            z = false;
        }
        f = z;
        String property = System.getProperty("java.runtime.name", "");
        Throwable th3 = null;
        if (property == null || property.contains("Android")) {
            try {
                rzfVar = new szf();
            } catch (Error | Exception e2) {
                try {
                    rzfVar = new qzf();
                } catch (Error | Exception e3) {
                    th3 = e3;
                    rzfVar = new rzf();
                }
                th = th3;
                th2 = e2;
            }
        } else {
            try {
                rzfVar = new qzf();
            } catch (NoClassDefFoundError unused2) {
                rzfVar = new rzf();
            }
        }
        th = null;
        th2 = null;
        g = rzfVar;
        if (th != null) {
            w0g w0gVar = e;
            Logger loggerA = w0gVar.a();
            Level level = Level.SEVERE;
            loggerA.logp(level, "com.google.common.util.concurrent.AbstractFutureState", "<clinit>", "UnsafeAtomicHelper is broken!", th2);
            w0gVar.a().logp(level, "com.google.common.util.concurrent.AbstractFutureState", "<clinit>", "AtomicReferenceFieldUpdaterAtomicHelper is broken!", th);
        }
    }

    public final void c(tzf tzfVar) {
        tzfVar.a = null;
        while (true) {
            tzf tzfVar2 = this.c;
            if (tzfVar2 != tzf.c) {
                tzf tzfVar3 = null;
                while (tzfVar2 != null) {
                    tzf tzfVar4 = tzfVar2.b;
                    if (tzfVar2.a != null) {
                        tzfVar3 = tzfVar2;
                    } else if (tzfVar3 != null) {
                        tzfVar3.b = tzfVar4;
                        if (tzfVar3.a == null) {
                            break;
                        }
                    } else if (!g.P(this, tzfVar2, tzfVar4)) {
                        break;
                    }
                    tzfVar2 = tzfVar4;
                }
                return;
            }
            return;
        }
    }

    public abstract Throwable d();
}
