package y5;

import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import w70.m;

/* loaded from: classes.dex */
public final class d implements t5.g {

    /* renamed from: a, reason: collision with root package name */
    public final t5.g f96726a;

    public d(t5.g delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f96726a = delegate;
    }

    @Override // t5.g
    public final Object a(Function2 function2, Continuation continuation) {
        return this.f96726a.a(new c(function2, null, 0), continuation);
    }

    @Override // t5.g
    public final m getData() {
        return this.f96726a.getData();
    }
}
