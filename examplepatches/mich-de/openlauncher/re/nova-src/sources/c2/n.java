package c2;

import android.view.ViewStructure;
import kotlin.Unit;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class n extends Lambda implements Function4 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ ViewStructure f19182j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(ViewStructure viewStructure) {
        super(4);
        this.f19182j = viewStructure;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        int iIntValue = ((Number) obj).intValue();
        int iIntValue2 = ((Number) obj2).intValue();
        int iIntValue3 = ((Number) obj3).intValue();
        int iIntValue4 = ((Number) obj4).intValue() - iIntValue2;
        this.f19182j.setDimens(iIntValue, iIntValue2, 0, 0, iIntValue3 - iIntValue, iIntValue4);
        return Unit.f71706a;
    }
}
