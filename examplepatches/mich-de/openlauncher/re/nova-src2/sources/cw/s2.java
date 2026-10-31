package cw;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class s2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48295a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f48296b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b2.t f48297c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f48298d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f48299e;

    public /* synthetic */ s2(int i5, int i11, b2.t tVar, String str) {
        this.f48295a = 3;
        this.f48297c = tVar;
        this.f48296b = str;
        this.f48298d = i5;
        this.f48299e = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f48295a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                lb0.b.g(p1.a0.l(this.f48298d | 1), this.f48299e, this.f48297c, this.f48296b, oVar);
                break;
            case 1:
                e10.z2.g(p1.a0.l(this.f48298d | 1), this.f48299e, this.f48297c, this.f48296b, oVar);
                break;
            case 2:
                e10.z2.c(p1.a0.l(this.f48298d | 1), this.f48299e, this.f48297c, this.f48296b, oVar);
                break;
            case 3:
                e10.z2.b(p1.a0.l(this.f48298d | 1), this.f48299e, this.f48297c, this.f48296b, oVar);
                break;
            default:
                e10.z2.e(p1.a0.l(this.f48298d | 1), this.f48299e, this.f48297c, this.f48296b, oVar);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ s2(String str, b2.t tVar, int i5, int i11, int i12) {
        this.f48295a = i12;
        this.f48296b = str;
        this.f48297c = tVar;
        this.f48298d = i5;
        this.f48299e = i11;
    }
}
