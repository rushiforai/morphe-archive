package pu;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.AdaptedFunctionReference;

/* loaded from: classes4.dex */
public final /* synthetic */ class d extends AdaptedFunctionReference implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83018a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(int i5, Object obj, Class cls, String str, String str2, int i11, int i12) {
        super(i5, i11, cls, obj, str, str2);
        this.f83018a = i12;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f83018a) {
            case 0:
                com.stripe.android.paymentsheet.addresselement.e.a((k0) this.receiver);
                break;
            default:
                ((com.stripe.android.paymentsheet.paymentdatacollection.ach.g) this.receiver).j(null);
                break;
        }
        return Unit.f71706a;
    }
}
