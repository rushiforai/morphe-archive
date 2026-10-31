package c20;

import a1.g;
import b00.g0;
import k30.h0;
import kotlin.jvm.functions.Function1;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19197a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h0 f19198b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f19199c;

    public /* synthetic */ e(h0 h0Var, e1 e1Var, int i5) {
        this.f19197a = i5;
        this.f19198b = h0Var;
        this.f19199c = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19197a) {
            case 0:
                g gVar = new g(this.f19199c, 2);
                h0 h0Var = this.f19198b;
                h0Var.b(gVar);
                return new g0(6, h0Var, gVar);
            default:
                g gVar2 = new g(this.f19199c, 12);
                h0 h0Var2 = this.f19198b;
                h0Var2.b(gVar2);
                return new g0(8, h0Var2, gVar2);
        }
    }
}
