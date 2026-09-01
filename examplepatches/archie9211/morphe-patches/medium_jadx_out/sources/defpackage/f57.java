package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f57 {
    public final kn8 a;
    public boolean b;
    public int c = -1;
    public final /* synthetic */ g57 d;

    public f57(g57 g57Var, kn8 kn8Var) {
        this.d = g57Var;
        this.a = kn8Var;
    }

    public final void a(boolean z) {
        if (z == this.b) {
            return;
        }
        this.b = z;
        int i = z ? 1 : -1;
        g57 g57Var = this.d;
        int i2 = g57Var.c;
        g57Var.c = i + i2;
        if (!g57Var.d) {
            g57Var.d = true;
            while (true) {
                try {
                    int i3 = g57Var.c;
                    if (i2 == i3) {
                        break;
                    }
                    boolean z2 = i2 == 0 && i3 > 0;
                    boolean z3 = i2 > 0 && i3 == 0;
                    if (z2) {
                        g57Var.f();
                    } else if (z3) {
                        g57Var.g();
                    }
                    i2 = i3;
                } catch (Throwable th) {
                    g57Var.d = false;
                    throw th;
                }
            }
            g57Var.d = false;
        }
        if (this.b) {
            g57Var.c(this);
        }
    }

    public boolean c(iy6 iy6Var) {
        return false;
    }

    public abstract boolean d();

    public void b() {
    }
}
