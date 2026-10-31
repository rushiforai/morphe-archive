package vq;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p1.o;
import ps.j0;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92885a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f92886b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f92887c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f92888d;

    public /* synthetic */ d(boolean z11, boolean z12, Function0 function0, int i5, int i11) {
        this.f92885a = i11;
        this.f92886b = z11;
        this.f92887c = z12;
        this.f92888d = function0;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f92885a;
        o oVar = (o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                j0.a(this.f92886b, this.f92887c, this.f92888d, oVar, a0.l(7));
                break;
            default:
                xs.g.d(this.f92886b, this.f92887c, this.f92888d, oVar, a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
