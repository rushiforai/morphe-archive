package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Y9 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f63750a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List<u40.a> f63751b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ u40.r[] f63752c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public Y9(String str, List<? extends u40.a> list, u40.r[] rVarArr) {
        super(0);
        this.f63750a = str;
        this.f63751b = list;
        this.f63752c = rVarArr;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sb2 = new StringBuilder("Search for ");
        sb2.append(this.f63750a);
        sb2.append(" of type ");
        sb2.append(b70.g.f1(this.f63751b, null, null, null, 0, X9.f63668a, 31));
        sb2.append(" produced ");
        return b.c0.o(sb2, this.f63752c.length, " results");
    }
}
