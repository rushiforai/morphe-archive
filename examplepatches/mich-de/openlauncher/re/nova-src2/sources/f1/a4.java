package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final /* synthetic */ class a4 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53387a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f53388b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f53389c;

    public /* synthetic */ a4(b2.t tVar, int i5, int i11) {
        this.f53387a = 2;
        this.f53388b = tVar;
        this.f53389c = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f53387a;
        int i11 = this.f53389c;
        b2.t tVar = this.f53388b;
        switch (i5) {
            case 0:
                x1.e eVar = z0.f54149a;
                ((Integer) obj2).getClass();
                com.google.android.gms.internal.consent_sdk.e0.d(tVar, (p1.o) obj, p1.a0.l(i11 | 1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                vh.a.e(tVar, (p1.o) obj, p1.a0.l(i11 | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                t0.c.b(tVar, (p1.o) obj, p1.a0.l(1), i11);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ a4(b2.t tVar, int i5, int i11, byte b11) {
        this.f53387a = i11;
        switch (i11) {
            case 1:
                break;
            default:
                x1.e eVar = z0.f54149a;
                break;
        }
        this.f53388b = tVar;
        this.f53389c = i5;
    }
}
