package w20;

import kotlin.Function;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionAdapter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class k implements j.a, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1 f93685a;

    public k(Function1 function1) {
        this.f93685a = function1;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f93685a;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof j.a) && (obj instanceof FunctionAdapter)) {
            return Intrinsics.b(this.f93685a, ((FunctionAdapter) obj).b());
        }
        return false;
    }

    public final int hashCode() {
        return this.f93685a.hashCode();
    }

    @Override // j.a
    public final /* synthetic */ void onActivityResult(Object obj) {
        this.f93685a.invoke(obj);
    }
}
