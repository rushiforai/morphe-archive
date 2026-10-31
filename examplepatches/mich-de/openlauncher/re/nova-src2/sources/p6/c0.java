package p6;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class c0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f82145j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z f82146k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c0(z zVar, int i5) {
        super(1);
        this.f82145j = i5;
        this.f82146k = zVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f82145j) {
            case 0:
                String key = (String) obj;
                Intrinsics.g(key, "key");
                return Boolean.valueOf(!this.f82146k.c().contains(key));
            default:
                String key2 = (String) obj;
                Intrinsics.g(key2, "key");
                return Boolean.valueOf(!this.f82146k.c().contains(key2));
        }
    }
}
