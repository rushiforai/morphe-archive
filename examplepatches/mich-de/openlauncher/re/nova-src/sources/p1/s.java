package p1;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81545a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f81546b;

    public /* synthetic */ s(Object obj, int i5) {
        this.f81545a = i5;
        this.f81546b = obj;
    }

    public final void a() {
        switch (this.f81545a) {
            case 0:
                t tVar = (t) this.f81546b;
                tVar.A--;
                break;
            default:
                z1.u uVar = (z1.u) this.f81546b;
                uVar.f97972j--;
                break;
        }
    }

    public final void b() {
        switch (this.f81545a) {
            case 0:
                ((t) this.f81546b).A++;
                break;
            default:
                ((z1.u) this.f81546b).f97972j++;
                break;
        }
    }
}
