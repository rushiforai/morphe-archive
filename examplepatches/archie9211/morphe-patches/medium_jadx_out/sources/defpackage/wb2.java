package defpackage;

import kotlinx.coroutines.DispatchException;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wb2 {
    public static final wb2 ATOMIC;
    public static final wb2 DEFAULT;
    public static final wb2 LAZY;
    public static final wb2 UNDISPATCHED;
    public static final /* synthetic */ wb2[] a;
    public static final /* synthetic */ i04 b;

    static {
        wb2 wb2Var = new wb2("DEFAULT", 0);
        DEFAULT = wb2Var;
        wb2 wb2Var2 = new wb2("LAZY", 1);
        LAZY = wb2Var2;
        wb2 wb2Var3 = new wb2("ATOMIC", 2);
        ATOMIC = wb2Var3;
        wb2 wb2Var4 = new wb2("UNDISPATCHED", 3);
        UNDISPATCHED = wb2Var4;
        wb2[] wb2VarArr = {wb2Var, wb2Var2, wb2Var3, wb2Var4};
        a = wb2VarArr;
        b = new i04(wb2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static wb2 valueOf(String str) {
        return (wb2) Enum.valueOf(wb2.class, str);
    }

    public static wb2[] values() {
        return (wb2[]) a.clone();
    }

    public final <R, T> void invoke(b55 b55Var, R r, n92<? super T> n92Var) {
        Object objInvoke;
        int i = vb2.a[ordinal()];
        c1e c1eVar = c1e.a;
        if (i == 1) {
            try {
                op8.k0(pwd.Q(pwd.F(b55Var, r, n92Var)), c1eVar);
                return;
            } finally {
                th = th;
                if (th instanceof DispatchException) {
                    th = ((DispatchException) th).a;
                }
                n92Var.resumeWith(new ajb(th));
            }
        }
        if (i == 2) {
            b55Var.getClass();
            n92Var.getClass();
            pwd.Q(pwd.F(b55Var, r, n92Var)).resumeWith(c1eVar);
            return;
        }
        if (i != 3) {
            if (i == 4) {
                return;
            }
            ygf.a();
            return;
        }
        n92Var.getClass();
        try {
            ib2 context = n92Var.getContext();
            Object objF0 = gx1.f0(context, null);
            try {
                if (b55Var instanceof kn0) {
                    pwd.B(2, b55Var);
                    objInvoke = b55Var.invoke(r, n92Var);
                } else {
                    objInvoke = pwd.f0(b55Var, r, n92Var);
                }
                gx1.Z(context, objF0);
                if (objInvoke != tb2.COROUTINE_SUSPENDED) {
                    n92Var.resumeWith(objInvoke);
                }
            } catch (Throwable th) {
                gx1.Z(context, objF0);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public final boolean isLazy() {
        return this == LAZY;
    }

    public static /* synthetic */ void isLazy$annotations() {
    }
}
