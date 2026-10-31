package ai;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class d3 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12893a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f3 f12894b;

    public d3(f3 f3Var, int i5) {
        this.f12893a = i5;
        switch (i5) {
            case 1:
                Objects.requireNonNull(f3Var);
                this.f12894b = f3Var;
                break;
            default:
                Objects.requireNonNull(f3Var);
                this.f12894b = f3Var;
                break;
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f12893a) {
            case 0:
                f3 f3Var = this.f12894b;
                f3Var.f12949e = f3Var.f12954j;
                break;
            default:
                this.f12894b.f12954j = null;
                break;
        }
    }
}
