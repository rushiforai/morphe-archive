package gy;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class z1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58629a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f58630b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ hy.h f58631c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f58632d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f58633e;

    public /* synthetic */ z1(b2.t tVar, hy.h hVar, float f11, float f12, int i5, int i11) {
        this.f58629a = i11;
        this.f58630b = tVar;
        this.f58631c = hVar;
        this.f58632d = f11;
        this.f58633e = f12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58629a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                io.sentry.config.a.q(this.f58630b, this.f58631c, this.f58632d, this.f58633e, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                hy.u.e(this.f58630b, this.f58631c, this.f58632d, this.f58633e, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }
}
