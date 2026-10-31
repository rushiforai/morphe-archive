package g2;

import kotlin.Function;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionAdapter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class p implements FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1 f56897a;

    public p(Function1 function1) {
        this.f56897a = function1;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f56897a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof p) {
            return Intrinsics.b(this.f56897a, ((FunctionAdapter) obj).b());
        }
        return false;
    }

    public final int hashCode() {
        return this.f56897a.hashCode();
    }
}
