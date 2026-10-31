package ux;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;

/* loaded from: classes4.dex */
public final /* synthetic */ class r implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91641a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f91642b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f91643c;

    public /* synthetic */ r(int i5, int i11, String str, boolean z11) {
        this.f91641a = i11;
        this.f91642b = str;
        this.f91643c = z11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f91641a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                t.g(this.f91642b, this.f91643c, oVar, a0.l(1));
                break;
            default:
                z.d(this.f91642b, this.f91643c, oVar, a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
