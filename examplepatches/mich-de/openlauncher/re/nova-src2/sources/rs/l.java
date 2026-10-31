package rs;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p10.y1;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86215a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f86216b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b2.t f86217c;

    public /* synthetic */ l(int i5, int i11, b2.t tVar, String str) {
        this.f86215a = i11;
        this.f86216b = str;
        this.f86217c = tVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f86215a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                o.a(this.f86216b, this.f86217c, oVar, p1.a0.l(49));
                break;
            case 1:
                y1.b(this.f86216b, this.f86217c, oVar, p1.a0.l(1));
                break;
            default:
                com.stripe.android.paymentsheet.paymentdatacollection.ach.f.h(this.f86216b, this.f86217c, oVar, p1.a0.l(49));
                break;
        }
        return Unit.f71706a;
    }
}
