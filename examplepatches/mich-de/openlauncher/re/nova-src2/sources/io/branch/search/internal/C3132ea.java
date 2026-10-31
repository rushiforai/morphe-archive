package io.branch.search.internal;

import java.util.Set;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.ea, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3132ea extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Set<u40.a> f64391a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u40.r[] f64392b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public C3132ea(Set<? extends u40.a> set, u40.r[] rVarArr) {
        super(0);
        this.f64391a = set;
        this.f64392b = rVarArr;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sb2 = new StringBuilder("ZeroState of type ");
        sb2.append(b70.g.f1(this.f64391a, null, null, null, 0, C3115da.f64291a, 31));
        sb2.append(" produced ");
        return b.c0.o(sb2, this.f64392b.length, " results");
    }
}
