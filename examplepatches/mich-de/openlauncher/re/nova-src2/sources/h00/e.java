package h00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import n00.x;
import p1.a0;
import p7.u;
import ps.f0;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58783a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f58784b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f58785c;

    public /* synthetic */ e(int i5, Function0 function0, Function1 function1) {
        this.f58783a = 1;
        this.f58784b = function1;
        this.f58785c = function0;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f58783a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                p.a(a0.l(7), this.f58785c, this.f58784b, oVar);
                break;
            case 1:
                u.j(a0.l(1), this.f58785c, this.f58784b, oVar);
                break;
            case 2:
                x.b(a0.l(55), this.f58785c, this.f58784b, oVar);
                break;
            case 3:
                pg.p.b(a0.l(1), this.f58785c, this.f58784b, oVar);
                break;
            case 4:
                f0.e(a0.l(7), this.f58785c, this.f58784b, oVar);
                break;
            default:
                p50.i.a(a0.l(7), this.f58785c, this.f58784b, oVar);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ e(Function0 function0, Function1 function1, int i5, int i11) {
        this.f58783a = i11;
        this.f58785c = function0;
        this.f58784b = function1;
    }
}
