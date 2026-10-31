package p6;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class d0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f82147j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ String f82148k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d0(String str, int i5) {
        super(0);
        this.f82147j = i5;
        this.f82148k = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f82147j) {
            case 0:
                return new z(this.f82148k);
            default:
                return b.c0.k("Unknown ad config parameter: ", this.f82148k);
        }
    }
}
