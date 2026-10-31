package iv;

import kotlin.Function;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionAdapter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements fw.e, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function0 f68121a;

    public f(Function0 function) {
        Intrinsics.g(function, "function");
        this.f68121a = function;
    }

    @Override // fw.e
    public final /* synthetic */ void a() {
        this.f68121a.invoke();
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f68121a;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof fw.e) || !(obj instanceof FunctionAdapter)) {
            return false;
        }
        return Intrinsics.b(this.f68121a, ((FunctionAdapter) obj).b());
    }

    public final int hashCode() {
        return this.f68121a.hashCode();
    }
}
