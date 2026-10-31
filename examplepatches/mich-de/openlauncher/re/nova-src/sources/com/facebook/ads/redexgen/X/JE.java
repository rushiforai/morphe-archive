package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public class JE implements InterfaceC1911i7 {
    public final /* synthetic */ C7T A00;
    public final /* synthetic */ C1906i2 A01;

    public JE(C7T c7t, C1906i2 c1906i2) {
        this.A00 = c7t;
        this.A01 = c1906i2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1911i7
    public final Object A5p(int i5) {
        C1904i0 compatInfo = this.A01.A00(i5);
        if (compatInfo == null) {
            return null;
        }
        return compatInfo.A0M();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1911i7
    public final List<Object> A77(String str, int i5) {
        List<C1904i0> listA03 = this.A01.A03(str, i5);
        if (listA03 == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        int infoCount = listA03.size();
        for (int i11 = 0; i11 < infoCount; i11++) {
            arrayList.add(listA03.get(i11).A0M());
        }
        return arrayList;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1911i7
    public final Object A78(int i5) {
        C1904i0 compatInfo = this.A01.A01(i5);
        if (compatInfo == null) {
            return null;
        }
        return compatInfo.A0M();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1911i7
    public final boolean AI8(int i5, int i11, Bundle bundle) {
        return this.A01.A04(i5, i11, bundle);
    }
}
