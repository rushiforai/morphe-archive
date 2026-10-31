package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53405a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f53406b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f53407c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f53408d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f53409e;

    public /* synthetic */ c(int i5, z2.i1 i1Var, int i11, z2.i1 i1Var2) {
        this.f53406b = i5;
        this.f53407c = i1Var;
        this.f53408d = i11;
        this.f53409e = i1Var2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1 layout = (z2.h1) obj;
        switch (this.f53405a) {
            case 0:
                z2.i1 i1Var = this.f53407c;
                if (i1Var != null) {
                    layout.i(i1Var, 0, this.f53406b, 0.0f);
                }
                z2.i1 i1Var2 = this.f53409e;
                if (i1Var2 != null) {
                    layout.i(i1Var2, 0, this.f53408d, 0.0f);
                }
                break;
            default:
                Intrinsics.g(layout, "$this$layout");
                z2.i1 i1Var3 = this.f53407c;
                int i5 = i1Var3.f98082b;
                int i11 = this.f53406b;
                int i12 = this.f53408d;
                z2.i1 i1Var4 = this.f53409e;
                if (i11 > i5) {
                    layout.i(i1Var3, 0, i12, 0.0f);
                    layout.i(i1Var4, i1Var3.f98081a, 0, 0.0f);
                } else {
                    layout.i(i1Var3, 0, 0, 0.0f);
                    layout.i(i1Var4, i1Var3.f98081a, i12, 0.0f);
                }
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ c(z2.i1 i1Var, int i5, z2.i1 i1Var2, int i11) {
        this.f53407c = i1Var;
        this.f53406b = i5;
        this.f53409e = i1Var2;
        this.f53408d = i11;
    }
}
