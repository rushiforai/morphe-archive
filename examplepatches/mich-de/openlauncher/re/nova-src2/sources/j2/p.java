package j2;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class p extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f68705j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ q f68706k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p(q qVar, int i5) {
        super(1);
        this.f68705j = i5;
        this.f68706k = qVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f68705j) {
            case 0:
                double dDoubleValue = ((Number) obj).doubleValue();
                return Double.valueOf(this.f68706k.n.b(kotlin.ranges.a.c0(dDoubleValue, r10.f68709e, r10.f68710f)));
            default:
                return Double.valueOf(kotlin.ranges.a.c0(this.f68706k.f68715k.b(((Number) obj).doubleValue()), r10.f68709e, r10.f68710f));
        }
    }
}
