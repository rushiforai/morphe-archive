package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Wf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1320Wf {
    public static String[] A00 = {"jsVhdVkaQoCpk9KqdUAiZca4HdZ2VVO0", "D9A5ubdEJQxBxuviQtQcaIh1QCjphQXE", "t3y8COzLe6b7c3W4fCOR2xqoMo7h91TQ", "250QQQYDlpiJvnAVvgjaLcARF5fQeBWe", "4NgAlkrALB1AimkMTk2", "8PyrEemzYI2i9iihWWfG6VVolxMAEh9s", "D9D38dcf2ayuNZnqNBbJQDMXQAgSRVHD", "tcAsi5BxMJnV5APEnVOV6WmreK2eaHE7"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1266Tx A01(C1316Wa c1316Wa, List<? extends InterfaceC1318Wc>[] listArr) {
        int i5;
        C06344e c06344e = new C06344e();
        int i11 = 0;
        while (true) {
            int iA02 = c1316Wa.A02();
            boolean z11 = false;
            if (A00[0].charAt(10) != 'C') {
                throw new RuntimeException();
            }
            String[] strArr = A00;
            strArr[1] = "brWzkEokkFcQw4vyUvC8JO4cJLMTqZBM";
            strArr[5] = "v1B965bQbGNWWFTrgvUnhF0h5u0jOZNM";
            if (i11 >= iA02) {
                RY ryA06 = c1316Wa.A06();
                for (int i12 = 0; i12 < ryA06.A01; i12++) {
                    U8 u8A05 = ryA06.A05(i12);
                    int[] iArr = new int[u8A05.A01];
                    Arrays.fill(iArr, 0);
                    c06344e.A04(new C1267Ty(u8A05, false, iArr, new boolean[u8A05.A01]));
                }
                return new C1266Tx(c06344e.A05());
            }
            RY ryA07 = c1316Wa.A07(i11);
            List<? extends InterfaceC1318Wc> list = listArr[i11];
            if (A00[0].charAt(10) != 'C') {
                i5 = 0;
            } else {
                A00[0] = "6BWgFNJJitCY6EVz4s0Yvv4BaRAgKqgK";
                i5 = 0;
            }
            while (i5 < ryA07.A01) {
                U8 u8A052 = ryA07.A05(i5);
                int iA05 = c1316Wa.A05(i11, i5, z11);
                String[] strArr2 = A00;
                if (strArr2[1].charAt(15) == strArr2[5].charAt(15)) {
                    throw new RuntimeException();
                }
                A00[3] = "y8ieqpQvb32JVrwa5hE6uK92vPBw6tqw";
                boolean z12 = iA05 != 0;
                int[] iArr2 = new int[u8A052.A01];
                boolean[] zArr = new boolean[u8A052.A01];
                for (int i13 = 0; i13 < u8A052.A01; i13++) {
                    iArr2[i13] = c1316Wa.A04(i11, i5, i13);
                    boolean z13 = false;
                    int i14 = 0;
                    while (true) {
                        if (i14 < list.size()) {
                            InterfaceC1318Wc interfaceC1318Wc = list.get(i14);
                            if (interfaceC1318Wc.A9y().equals(u8A052) && interfaceC1318Wc.AAk(i13) != -1) {
                                z13 = true;
                                break;
                            }
                            i14++;
                        }
                    }
                    zArr[i13] = z13;
                }
                c06344e.A04(new C1267Ty(u8A052, z12, iArr2, zArr));
                i5++;
                z11 = false;
            }
            i11++;
        }
    }

    public static C1266Tx A00(C1316Wa c1316Wa, InterfaceC1318Wc[] interfaceC1318WcArr) {
        List listA01;
        List[] listArr = new List[interfaceC1318WcArr.length];
        for (int i5 = 0; i5 < interfaceC1318WcArr.length; i5++) {
            InterfaceC1318Wc interfaceC1318Wc = interfaceC1318WcArr[i5];
            if (interfaceC1318Wc != null) {
                listA01 = AbstractC07549l.A04(interfaceC1318Wc);
            } else {
                listA01 = XR.A01();
            }
            listArr[i5] = listA01;
        }
        return A01(c1316Wa, listArr);
    }
}
