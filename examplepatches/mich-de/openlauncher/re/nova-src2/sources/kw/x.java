package kw;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72728a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f72729b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f72730c;

    public /* synthetic */ x(int i5, long j11, int i11, String str) {
        this.f72728a = i11;
        this.f72729b = str;
        this.f72730c = j11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f72728a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                cl.k0.f(this.f72729b, this.f72730c, oVar, p1.a0.l(1));
                break;
            default:
                ux.z.a(this.f72729b, this.f72730c, oVar, p1.a0.l(49));
                break;
        }
        return Unit.f71706a;
    }
}
