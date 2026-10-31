package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class z0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60703a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f60704b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b2.t f60705c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f60706d;

    public /* synthetic */ z0(int i5, int i11, b2.t tVar, String str) {
        this.f60704b = str;
        this.f60705c = tVar;
        this.f60706d = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f60703a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                a.a.l(this.f60704b, this.f60705c, oVar, p1.a0.l(this.f60706d | 1));
                break;
            default:
                cw.l2.f(p1.a0.l(1), this.f60706d, this.f60705c, this.f60704b, oVar);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ z0(String str, b2.t tVar, int i5) {
        this.f60704b = str;
        this.f60705c = tVar;
        this.f60706d = i5;
    }
}
