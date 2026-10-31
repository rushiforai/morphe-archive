package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class n3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50785a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f50786b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f50787c;

    public /* synthetic */ n3(String str, String str2, int i5, int i11) {
        this.f50785a = i11;
        this.f50786b = str;
        this.f50787c = str2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f50785a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                r3.f(this.f50786b, this.f50787c, oVar, p1.a0.l(55));
                break;
            case 1:
                r3.f(this.f50786b, this.f50787c, oVar, p1.a0.l(55));
                break;
            case 2:
                android.support.v4.media.session.b.o(this.f50786b, this.f50787c, oVar, p1.a0.l(1));
                break;
            default:
                wh.f.j(this.f50786b, this.f50787c, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
