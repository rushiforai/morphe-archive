package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX WARN: Unexpected interfaces in signature: [com.facebook.ads.internal.util.common.Stateful<android.os.Bundle>] */
/* loaded from: assets/audience_network/classes.dex */
public final class JY {
    public static byte[] A03;
    public final C1818gZ A00;
    public final InterfaceC1675eF A01;
    public final List<JX> A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 49);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{126, 121, 108, 121, 100, 126, 121, 100, 110, 126, 106, 123, 109, 106, 109};
    }

    public JY(List<AbstractC1816gX> list, Bundle bundle, InterfaceC1675eF interfaceC1675eF) {
        this.A02 = new ArrayList(list.size());
        this.A01 = interfaceC1675eF;
        ArrayList parcelableArrayList = bundle.getParcelableArrayList(A00(10, 5, 15));
        for (int i5 = 0; i5 < list.size(); i5++) {
            this.A02.add(new JX(list.get(i5), (Bundle) parcelableArrayList.get(i5)));
        }
        this.A00 = (C1818gZ) AbstractC2403qF.A00(bundle.getByteArray(A00(0, 10, 28)));
    }

    public JY(List<AbstractC1816gX> list, InterfaceC1675eF interfaceC1675eF) {
        this.A02 = new ArrayList(list.size());
        this.A01 = interfaceC1675eF;
        Iterator<AbstractC1816gX> it = list.iterator();
        while (it.hasNext()) {
            this.A02.add(new JX(it.next()));
        }
        this.A00 = new C1818gZ();
    }

    public final Bundle A02() {
        Bundle bundle = new Bundle();
        bundle.putByteArray(A00(0, 10, 28), AbstractC2403qF.A01(this.A00));
        ArrayList<? extends Parcelable> arrayList = new ArrayList<>(this.A02.size());
        Iterator<JX> it = this.A02.iterator();
        while (it.hasNext()) {
            Bundle bundle2 = it.next().A05();
            arrayList.add(bundle2);
        }
        bundle.putParcelableArrayList(A00(10, 5, 15), arrayList);
        return bundle;
    }

    public final C1818gZ A03() {
        return this.A00;
    }

    public final void A04() {
        this.A00.A03();
        Iterator<JX> it = this.A02.iterator();
        while (it.hasNext()) {
            it.next().A06();
        }
    }

    public final void A05() {
        this.A00.A02();
    }

    public final void A06(double d5, double d11) {
        if (d11 >= 0.0d) {
            this.A00.A05(d5, d11);
        }
        double dAA9 = this.A01.AA9();
        this.A00.A04(d5, dAA9);
        Iterator<JX> it = this.A02.iterator();
        while (it.hasNext()) {
            it.next().A07(d5, dAA9);
        }
    }
}
