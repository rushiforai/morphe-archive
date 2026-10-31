package iv;

import kotlin.Function;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionAdapter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements fw.c, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1 f68120a;

    public e(Function1 function) {
        Intrinsics.g(function, "function");
        this.f68120a = function;
    }

    @Override // fw.c
    public final /* synthetic */ void a(ft.b bVar) {
        this.f68120a.invoke(bVar);
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f68120a;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof fw.c) && (obj instanceof FunctionAdapter)) {
            return Intrinsics.b(this.f68120a, ((FunctionAdapter) obj).b());
        }
        return false;
    }

    public final int hashCode() {
        return this.f68120a.hashCode();
    }
}
