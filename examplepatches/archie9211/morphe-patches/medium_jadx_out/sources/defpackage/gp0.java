package defpackage;

import android.os.Build;
import android.os.Trace;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gp0 {
    public static final sn3 a = new sn3(1, new n7(11));
    public static Boolean b;

    public static final void a(final mx mxVar, final mkd mkdVar, final yy4 yy4Var, final List list, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        Executor executor = (Executor) p65Var.j(a);
        if (executor == null || !b(mxVar.b.length())) {
            p65Var.Y(-517090505);
            p65Var.p(false);
            return;
        }
        p65Var.Y(-518737659);
        final ip6 ip6Var = (ip6) p65Var.j(z22.n);
        final m73 m73Var = (m73) p65Var.j(z22.h);
        try {
            executor.execute(new Runnable() { // from class: fp0
                @Override // java.lang.Runnable
                public final void run() {
                    k78 k78VarD;
                    mkd mkdVar2 = mkdVar;
                    ip6 ip6Var2 = ip6Var;
                    mx mxVar2 = mxVar;
                    m73 m73Var2 = m73Var;
                    yy4 yy4Var2 = yy4Var;
                    Trace.beginSection("BackgroundTextMeasurement");
                    try {
                        oic oicVarH = uic.h();
                        k78 k78Var = oicVarH instanceof k78 ? (k78) oicVarH : null;
                        if (k78Var == null || (k78VarD = k78Var.D(null, null)) == null) {
                            throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot");
                        }
                        try {
                            oic oicVarJ = k78VarD.j();
                            try {
                                mkd mkdVarC = il7.C(mkdVar2, ip6Var2);
                                List list2 = list;
                                if (list2 == null) {
                                    list2 = ey3.a;
                                }
                                iq1 iq1Var = new iq1(mxVar2, mkdVarC, list2, m73Var2, yy4Var2);
                                iq1Var.q();
                                iq1Var.h();
                                oic.q(oicVarJ);
                                k78VarD.w().E();
                                k78VarD.c();
                                Trace.endSection();
                            } catch (Throwable th) {
                                oic.q(oicVarJ);
                                throw th;
                            }
                        } finally {
                        }
                    } catch (Throwable th2) {
                        Trace.endSection();
                        throw th2;
                    }
                }
            });
        } catch (RejectedExecutionException unused) {
        }
        p65Var.p(false);
    }

    public static final boolean b(int i) {
        if (Build.VERSION.SDK_INT >= 28 && i >= 8 && i < 1000) {
            Boolean boolValueOf = b;
            if (boolValueOf == null) {
                boolValueOf = Boolean.valueOf(Runtime.getRuntime().availableProcessors() >= 4);
                b = boolValueOf;
            }
            if (boolValueOf.booleanValue()) {
                return true;
            }
        }
        return false;
    }
}
