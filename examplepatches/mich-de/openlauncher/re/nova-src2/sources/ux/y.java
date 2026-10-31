package ux;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;

/* loaded from: classes4.dex */
public final /* synthetic */ class y implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91675a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f91676b;

    public /* synthetic */ y(l lVar, int i5, int i11) {
        this.f91675a = i11;
        this.f91676b = lVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f91675a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                z.c(this.f91676b, oVar, a0.l(1));
                break;
            default:
                z.e(this.f91676b, oVar, a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
