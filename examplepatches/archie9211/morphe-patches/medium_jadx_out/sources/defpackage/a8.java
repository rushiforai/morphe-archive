package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a8 implements a75 {
    public final xy1 a;
    public final xy1 b;
    public volatile zm2 c;
    public final Object d = new Object();

    public a8(xy1 xy1Var) {
        this.a = xy1Var;
        this.b = xy1Var;
    }

    public static zg7 a(wue wueVar, Context context) {
        w7 w7Var = new w7(0, context);
        wueVar.getClass();
        return new zg7(wueVar.getViewModelStore(), w7Var, wueVar instanceof pi5 ? ((pi5) wueVar).getDefaultViewModelCreationExtras() : og2.b);
    }

    @Override // defpackage.a75
    public final Object c() {
        if (this.c == null) {
            synchronized (this.d) {
                try {
                    if (this.c == null) {
                        this.c = ((y7) a(this.a, this.b).n0(n1b.a.b(y7.class))).b;
                    }
                } finally {
                }
            }
        }
        return this.c;
    }
}
