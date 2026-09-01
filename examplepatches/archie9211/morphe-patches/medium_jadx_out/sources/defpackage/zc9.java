package defpackage;

import android.view.ViewStructure;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zc9 extends co6 implements d55 {
    public final /* synthetic */ ViewStructure a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zc9(ViewStructure viewStructure) {
        super(4);
        this.a = viewStructure;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int iIntValue = ((Number) obj).intValue();
        int iIntValue2 = ((Number) obj2).intValue();
        int iIntValue3 = ((Number) obj3).intValue();
        int iIntValue4 = ((Number) obj4).intValue() - iIntValue2;
        this.a.setDimens(iIntValue, iIntValue2, 0, 0, iIntValue3 - iIntValue, iIntValue4);
        return c1e.a;
    }
}
