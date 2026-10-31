package h00;

import g2.s;
import hv.a3;
import hv.e3;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kw.y2;
import l1.g7;
import p1.a0;
import ps.o0;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58777a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f58778b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f58779c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f58780d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f58781e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f58782f;

    public /* synthetic */ d(Object obj, Object obj2, boolean z11, boolean z12, Object obj3, int i5, int i11) {
        this.f58777a = i11;
        this.f58780d = obj;
        this.f58781e = obj2;
        this.f58778b = z11;
        this.f58779c = z12;
        this.f58782f = obj3;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58777a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = a0.l(24577);
                p.b((e20.d) this.f58780d, (jx.k) this.f58781e, this.f58778b, this.f58779c, (g7) this.f58782f, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = a0.l(1);
                a3.b((String) this.f58780d, (e3) this.f58781e, this.f58778b, this.f58779c, (Function0) this.f58782f, (p1.o) obj, iL2);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL3 = a0.l(24577);
                o0.b(this.f58778b, this.f58779c, (y2) this.f58780d, (vs.g) this.f58781e, (s) this.f58782f, (p1.o) obj, iL3);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ d(boolean z11, boolean z12, y2 y2Var, vs.g gVar, s sVar, int i5) {
        this.f58777a = 2;
        this.f58778b = z11;
        this.f58779c = z12;
        this.f58780d = y2Var;
        this.f58781e = gVar;
        this.f58782f = sVar;
    }
}
