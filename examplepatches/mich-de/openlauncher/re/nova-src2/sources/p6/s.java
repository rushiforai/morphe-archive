package p6;

import android.os.Bundle;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class s extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f82247j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ t f82248k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ e0 f82249l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Bundle f82250m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(Ref.BooleanRef booleanRef, t tVar, e0 e0Var, Bundle bundle) {
        super(1);
        this.f82247j = booleanRef;
        this.f82248k = tVar;
        this.f82249l = e0Var;
        this.f82250m = bundle;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        n it = (n) obj;
        Intrinsics.g(it, "it");
        this.f82247j.f71859a = true;
        this.f82248k.a(this.f82249l, this.f82250m, it, EmptyList.f71733a);
        return Unit.f71706a;
    }
}
