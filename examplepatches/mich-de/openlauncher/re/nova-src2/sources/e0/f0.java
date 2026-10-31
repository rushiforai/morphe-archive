package e0;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class f0 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f49972a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f49973b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f49974c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ h0 f49975d;

    public f0(Ref.IntRef intRef, Ref.IntRef intRef2, Ref.IntRef intRef3, h0 h0Var) {
        this.f49972a = intRef;
        this.f49973b = intRef2;
        this.f49974c = intRef3;
        this.f49975d = h0Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        i0.h hVar = (i0.h) obj;
        boolean z11 = hVar instanceof i0.k;
        Ref.IntRef intRef = this.f49974c;
        Ref.IntRef intRef2 = this.f49973b;
        Ref.IntRef intRef3 = this.f49972a;
        boolean z12 = true;
        if (z11) {
            intRef3.f71861a++;
        } else if ((hVar instanceof i0.l) || (hVar instanceof i0.j)) {
            intRef3.f71861a--;
        } else if (hVar instanceof i0.f) {
            intRef2.f71861a++;
        } else if (hVar instanceof i0.g) {
            intRef2.f71861a--;
        } else if (hVar instanceof i0.d) {
            intRef.f71861a++;
        } else if (hVar instanceof i0.e) {
            intRef.f71861a--;
        }
        boolean z13 = false;
        boolean z14 = intRef3.f71861a > 0;
        boolean z15 = intRef2.f71861a > 0;
        boolean z16 = intRef.f71861a > 0;
        h0 h0Var = this.f49975d;
        if (h0Var.f50006b != z14) {
            h0Var.f50006b = z14;
            z13 = true;
        }
        if (h0Var.f50007c != z15) {
            h0Var.f50007c = z15;
            z13 = true;
        }
        if (h0Var.f50008d != z16) {
            h0Var.f50008d = z16;
        } else {
            z12 = z13;
        }
        if (z12) {
            b3.g.d(h0Var);
        }
        return Unit.f71706a;
    }
}
