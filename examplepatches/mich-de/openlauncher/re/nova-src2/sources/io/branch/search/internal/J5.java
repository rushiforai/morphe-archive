package io.branch.search.internal;

import io.branch.search.internal.E5;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class J5 extends Lambda implements Function1<E5, Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Integer f62726a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public J5(Integer num) {
        super(1);
        this.f62726a = num;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001c  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        boolean z11;
        E5 it = (E5) obj;
        Intrinsics.g(it, "it");
        if (it instanceof E5.b) {
            int i5 = ((E5.b) it).f62397a;
            Integer num = this.f62726a;
            z11 = num != null && i5 == num.intValue();
        }
        return Boolean.valueOf(z11);
    }
}
