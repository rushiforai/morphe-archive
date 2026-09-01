package defpackage;

import java.io.IOException;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class ls5 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ qs5 b;
    public final /* synthetic */ int c;

    public /* synthetic */ ls5(qs5 qs5Var, int i, List list, boolean z) {
        this.a = 2;
        this.b = qs5Var;
        this.c = i;
    }

    private final Object a() {
        qs5 qs5Var = this.b;
        int i = this.c;
        qs5Var.k.getClass();
        try {
            qs5Var.w.L(i, b14.CANCEL);
            synchronized (qs5Var) {
                qs5Var.y.remove(Integer.valueOf(i));
            }
        } catch (IOException unused) {
        }
        return c1e.a;
    }

    private final Object d() {
        qs5 qs5Var = this.b;
        int i = this.c;
        qs5Var.k.getClass();
        synchronized (qs5Var) {
            qs5Var.y.remove(Integer.valueOf(i));
        }
        return c1e.a;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        switch (this.a) {
            case 0:
                return a();
            case 1:
                return d();
            default:
                qs5 qs5Var = this.b;
                int i = this.c;
                qs5Var.k.getClass();
                try {
                    qs5Var.w.L(i, b14.CANCEL);
                    synchronized (qs5Var) {
                        qs5Var.y.remove(Integer.valueOf(i));
                    }
                } catch (IOException unused) {
                }
                return c1e.a;
        }
    }

    public /* synthetic */ ls5(qs5 qs5Var, int i, Object obj, int i2) {
        this.a = i2;
        this.b = qs5Var;
        this.c = i;
    }
}
