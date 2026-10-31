package h6;

/* loaded from: classes.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public final n0 f59378a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f59379b;

    /* renamed from: c, reason: collision with root package name */
    public int f59380c = -1;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ j0 f59381d;

    public i0(j0 j0Var, n0 n0Var) {
        this.f59381d = j0Var;
        this.f59378a = n0Var;
    }

    public final void a(boolean z11) {
        if (z11 == this.f59379b) {
            return;
        }
        this.f59379b = z11;
        int i5 = z11 ? 1 : -1;
        j0 j0Var = this.f59381d;
        int i11 = j0Var.f59389c;
        j0Var.f59389c = i5 + i11;
        if (!j0Var.f59390d) {
            j0Var.f59390d = true;
            while (true) {
                try {
                    int i12 = j0Var.f59389c;
                    if (i11 == i12) {
                        break;
                    }
                    boolean z12 = i11 == 0 && i12 > 0;
                    boolean z13 = i11 > 0 && i12 == 0;
                    if (z12) {
                        j0Var.g();
                    } else if (z13) {
                        j0Var.h();
                    }
                    i11 = i12;
                } catch (Throwable th2) {
                    j0Var.f59390d = false;
                    throw th2;
                }
            }
            j0Var.f59390d = false;
        }
        if (this.f59379b) {
            j0Var.c(this);
        }
    }

    public void b() {
    }

    public boolean c(a0 a0Var) {
        return false;
    }

    public abstract boolean e();
}
