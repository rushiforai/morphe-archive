package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class k3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60367a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f60368b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f60369c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f60370d;

    public /* synthetic */ k3(boolean z11, int i5, b2.t tVar, int i11) {
        this.f60367a = 1;
        this.f60368b = z11;
        this.f60369c = i5;
        this.f60370d = tVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60367a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f60369c | 1);
                io.sentry.config.a.d(this.f60368b, (x1.e) this.f60370d, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                v3.c(this.f60368b, this.f60369c, (b2.t) this.f60370d, (p1.o) obj, iL2);
                break;
            default:
                ((Integer) obj2).intValue();
                int iL3 = p1.a0.l(this.f60369c | 1);
                jv.p1.a(this.f60368b, (at.a) this.f60370d, (p1.o) obj, iL3);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ k3(boolean z11, Object obj, int i5, int i11) {
        this.f60367a = i11;
        this.f60368b = z11;
        this.f60370d = obj;
        this.f60369c = i5;
    }
}
