package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pr6 {
    public final /* synthetic */ int a;
    public final h49 b;
    public final h49 c;
    public boolean d;
    public Object e;
    public final au6 f;

    public pr6(int i, int i2, int i3) {
        this.a = i3;
        switch (i3) {
            case 1:
                this.b = new h49(i);
                this.c = new h49(i2);
                this.f = new au6(i, 30, 100);
                break;
            default:
                this.b = new h49(i);
                this.c = new h49(i2);
                this.f = new au6(i, 90, 200);
                break;
        }
    }

    public final void a(int i, int i2) {
        int i3 = this.a;
        h49 h49Var = this.c;
        au6 au6Var = this.f;
        h49 h49Var2 = this.b;
        switch (i3) {
            case 0:
                if (i < 0.0f) {
                    e26.a("Index should be non-negative");
                }
                h49Var2.h(i);
                au6Var.c(i);
                h49Var.h(i2);
                break;
            default:
                if (i < 0.0f) {
                    e26.a("Index should be non-negative (" + i + ')');
                }
                h49Var2.h(i);
                au6Var.c(i);
                h49Var.h(i2);
                break;
        }
    }
}
