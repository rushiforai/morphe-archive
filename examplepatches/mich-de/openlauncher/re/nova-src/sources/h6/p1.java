package h6;

/* loaded from: classes2.dex */
public final class p1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59414a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u f59415b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ r1 f59416c;

    public /* synthetic */ p1(u uVar, r1 r1Var, int i5) {
        this.f59414a = i5;
        this.f59415b = uVar;
        this.f59416c = r1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f59414a) {
            case 0:
                this.f59415b.a(this.f59416c);
                break;
            default:
                this.f59415b.c(this.f59416c);
                break;
        }
    }
}
