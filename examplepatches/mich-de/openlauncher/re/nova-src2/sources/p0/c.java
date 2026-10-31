package p0;

import kotlin.jvm.functions.Function0;
import p1.o2;
import p1.s2;

/* loaded from: classes2.dex */
public final /* synthetic */ class c implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81132a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y f81133b;

    public /* synthetic */ c(y yVar, int i5) {
        this.f81132a = i5;
        this.f81133b = yVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int iM;
        switch (this.f81132a) {
            case 0:
                iM = this.f81133b.m();
                break;
            case 1:
                iM = this.f81133b.m();
                break;
            case 2:
                y yVar = this.f81133b;
                return Integer.valueOf(yVar.f81237k.b() ? yVar.f81244t.m() : yVar.k());
            case 3:
                y yVar2 = this.f81133b;
                o2 o2Var = yVar2.f81243s;
                iM = yVar2.j(!yVar2.f81237k.b() ? yVar2.k() : o2Var.m() != -1 ? o2Var.m() : Math.abs(yVar2.f81230d.e()) >= Math.abs(Math.min(yVar2.f81241q.mo102toPx0680j_4(b0.f81129a), ((float) yVar2.n()) / 2.0f) / ((float) yVar2.n())) ? ((Boolean) ((s2) yVar2.G).getValue()).booleanValue() ? yVar2.f81231e + 1 : yVar2.f81231e : yVar2.k());
                break;
            default:
                iM = this.f81133b.k();
                break;
        }
        return Integer.valueOf(iM);
    }
}
