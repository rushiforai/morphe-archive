package io.branch.search.internal;

import io.branch.search.internal.E5;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class G5 extends Lambda implements Function1<E5, Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f62513a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public G5(String str) {
        super(1);
        this.f62513a = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        boolean z11;
        E5 it = (E5) obj;
        Intrinsics.g(it, "it");
        if (it instanceof E5.d) {
            z11 = r70.j.B0(((E5.d) it).f62401a, this.f62513a, true);
        }
        return Boolean.valueOf(z11);
    }
}
