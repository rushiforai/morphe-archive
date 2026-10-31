package kw;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;

/* loaded from: classes4.dex */
public final /* synthetic */ class i1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72411a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f72412b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f72413c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f72414d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f72415e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f72416f;

    public /* synthetic */ i1(String str, g1 g1Var, int i5, p1.e1 e1Var, g2.j jVar) {
        this.f72413c = str;
        this.f72414d = g1Var;
        this.f72412b = i5;
        this.f72415e = e1Var;
        this.f72416f = jVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f72411a) {
            case 0:
                String str = (String) this.f72413c;
                g1 g1Var = (g1) this.f72414d;
                p1.e1 e1Var = (p1.e1) this.f72415e;
                g2.j jVar = (g2.j) this.f72416f;
                String newValue = (String) obj;
                Intrinsics.g(newValue, "newValue");
                boolean zB = Intrinsics.b((String) e1Var.getValue(), newValue);
                e1Var.setValue(newValue);
                if (!zB || newValue.length() == 1) {
                    if (!r70.k.U0(str) && !r70.k.U0(newValue)) {
                        newValue = newValue.substring(1);
                        Intrinsics.f(newValue, "substring(...)");
                    }
                    IntProgressionIterator it = kotlin.ranges.a.m0(0, g1Var.f72380b.a(this.f72412b, newValue)).iterator();
                    while (it.f71911c) {
                        it.nextInt();
                        zg.a.N(jVar, 1);
                    }
                }
                break;
            default:
                z2.i1 i1Var = (z2.i1) this.f72413c;
                z2.i1 i1Var2 = (z2.i1) this.f72414d;
                z2.i1 i1Var3 = (z2.i1) this.f72415e;
                z2.i1 i1Var4 = (z2.i1) this.f72416f;
                z2.h1 layout = (z2.h1) obj;
                Intrinsics.g(layout, "$this$layout");
                int i5 = i1Var.f98082b;
                int i11 = this.f72412b;
                z2.h1.m(layout, i1Var, 0, (i11 - i5) / 2);
                int i12 = i1Var.f98081a;
                z2.h1.m(layout, i1Var2, i12, (i11 - i1Var2.f98082b) / 2);
                z2.h1.m(layout, i1Var3, i12 + i1Var2.f98081a, (i11 - i1Var3.f98082b) / 2);
                if (i1Var4 != null) {
                    z2.h1.m(layout, i1Var4, i1Var.f98081a, i11);
                }
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ i1(z2.i1 i1Var, int i5, z2.i1 i1Var2, z2.i1 i1Var3, z2.i1 i1Var4) {
        this.f72413c = i1Var;
        this.f72412b = i5;
        this.f72414d = i1Var2;
        this.f72415e = i1Var3;
        this.f72416f = i1Var4;
    }
}
