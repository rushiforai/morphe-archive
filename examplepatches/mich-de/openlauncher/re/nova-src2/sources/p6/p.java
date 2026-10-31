package p6;

import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class p extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f82225j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f82226k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ t f82227l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ boolean f82228m;
    public final /* synthetic */ ArrayDeque n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(Ref.BooleanRef booleanRef, Ref.BooleanRef booleanRef2, t tVar, boolean z11, ArrayDeque arrayDeque) {
        super(1);
        this.f82225j = booleanRef;
        this.f82226k = booleanRef2;
        this.f82227l = tVar;
        this.f82228m = z11;
        this.n = arrayDeque;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        n entry = (n) obj;
        Intrinsics.g(entry, "entry");
        this.f82225j.f71859a = true;
        this.f82226k.f71859a = true;
        this.f82227l.q(entry, this.f82228m, this.n);
        return Unit.f71706a;
    }
}
