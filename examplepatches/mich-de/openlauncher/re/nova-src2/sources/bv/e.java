package bv;

import b2.t;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18621a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f18622b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t f18623c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f18624d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f18625e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f18626f;

    public /* synthetic */ e(String str, t tVar, boolean z11, int i5, int i11, int i12) {
        this.f18621a = i12;
        this.f18622b = str;
        this.f18623c = tVar;
        this.f18624d = z11;
        this.f18625e = i5;
        this.f18626f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f18621a) {
            case 0:
                ((Integer) obj2).getClass();
                ic.b.e(this.f18622b, this.f18623c, this.f18624d, (p1.o) obj, a0.l(this.f18625e | 1), this.f18626f);
                break;
            case 1:
                ((Integer) obj2).getClass();
                ex.i.e(this.f18622b, this.f18623c, this.f18624d, (p1.o) obj, a0.l(this.f18625e | 1), this.f18626f);
                break;
            default:
                ((Integer) obj2).getClass();
                ic.b.r(this.f18622b, this.f18623c, this.f18624d, (p1.o) obj, a0.l(this.f18625e | 1), this.f18626f);
                break;
        }
        return Unit.f71706a;
    }
}
