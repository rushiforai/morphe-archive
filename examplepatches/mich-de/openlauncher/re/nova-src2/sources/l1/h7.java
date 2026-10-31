package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class h7 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f73394j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f73395k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f73396l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f73397m;
    public final /* synthetic */ int n;
    public final /* synthetic */ z2.i1 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ int f73398p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ int f73399q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h7(z2.i1 i1Var, int i5, z2.i1 i1Var2, int i11, int i12, z2.i1 i1Var3, int i13, int i14) {
        super(1);
        this.f73394j = i1Var;
        this.f73395k = i5;
        this.f73396l = i1Var2;
        this.f73397m = i11;
        this.n = i12;
        this.o = i1Var3;
        this.f73398p = i13;
        this.f73399q = i14;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1 h1Var = (z2.h1) obj;
        z2.h1.m(h1Var, this.f73394j, 0, this.f73395k);
        z2.i1 i1Var = this.f73396l;
        if (i1Var != null) {
            z2.h1.m(h1Var, i1Var, this.f73397m, this.n);
        }
        z2.i1 i1Var2 = this.o;
        if (i1Var2 != null) {
            z2.h1.m(h1Var, i1Var2, this.f73398p, this.f73399q);
        }
        return Unit.f71706a;
    }
}
