package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class p implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50857a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p6.t f50858b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ cw.r3 f50859c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f50860d;

    public /* synthetic */ p(p6.t tVar, cw.r3 r3Var, String str, int i5, int i11) {
        this.f50857a = i11;
        this.f50858b = tVar;
        this.f50859c = r3Var;
        this.f50860d = str;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f50857a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                t.b(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 1:
                c2.a(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 2:
                f00.b0.b(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 3:
                k00.c.a(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 4:
                p00.q.a(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 5:
                r00.z.c(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 6:
                s00.k.c(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 7:
                v00.f.c(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            case 8:
                w00.t.a(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
            default:
                w00.g0.c(this.f50858b, this.f50859c, this.f50860d, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
