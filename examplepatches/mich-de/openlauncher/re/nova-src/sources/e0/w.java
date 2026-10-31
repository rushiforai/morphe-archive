package e0;

import b3.u2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final /* synthetic */ class w implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50152a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f50153b;

    public /* synthetic */ w(Ref.BooleanRef booleanRef, int i5) {
        this.f50152a = i5;
        this.f50153b = booleanRef;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0032  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        boolean z11;
        switch (this.f50152a) {
            case 0:
                u2 u2Var = (u2) obj;
                Ref.BooleanRef booleanRef = this.f50153b;
                if (!booleanRef.f71859a) {
                    Intrinsics.e(u2Var, "null cannot be cast to non-null type androidx.compose.foundation.gestures.ScrollableContainerNode");
                    z11 = ((g0.o1) u2Var).f56645b;
                }
                booleanRef.f71859a = z11;
                return Boolean.valueOf(!z11);
            default:
                Ref.BooleanRef booleanRef2 = this.f50153b;
                boolean z12 = true;
                if (!booleanRef2.f71859a && Intrinsics.b(obj, null)) {
                    booleanRef2.f71859a = true;
                    z12 = false;
                }
                return Boolean.valueOf(z12);
        }
    }
}
