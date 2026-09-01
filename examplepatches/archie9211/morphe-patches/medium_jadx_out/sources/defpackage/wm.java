package defpackage;

import sprig.b.g;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class wm implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;

    public /* synthetic */ wm(int i, m45 m45Var) {
        this.a = i;
        this.b = m45Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        m45 m45Var = this.b;
        switch (i) {
            case 0:
                m45Var.invoke();
                break;
            case 1:
                m45Var.invoke();
                break;
            case 2:
                m45Var.invoke();
                break;
            case 3:
                m45Var.invoke();
                break;
            case 4:
                m45Var.invoke();
                break;
            case 5:
                m45Var.invoke();
                break;
            case 6:
                m45Var.invoke();
                break;
            case 7:
                g.b(m45Var);
                break;
            default:
                g.c(m45Var);
                break;
        }
    }
}
