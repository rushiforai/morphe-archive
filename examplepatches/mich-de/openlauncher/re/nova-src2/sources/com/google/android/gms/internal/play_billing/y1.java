package com.google.android.gms.internal.play_billing;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes3.dex */
public final class y1 extends x2 {
    private static final y1 zzb;
    private c3 zzd = v3.f33566e;

    static {
        y1 y1Var = new y1();
        zzb = y1Var;
        x2.f(y1.class, y1Var);
    }

    public static x1 q() {
        return (x1) zzb.k();
    }

    public static void r(y1 y1Var, ArrayList arrayList) {
        c3 c3Var = y1Var.zzd;
        if (!((h2) c3Var).f33414a) {
            int size = c3Var.size();
            y1Var.zzd = c3Var.zzd(size + size);
        }
        List list = y1Var.zzd;
        Charset charset = e3.f33385a;
        int size2 = arrayList.size();
        if (list instanceof ArrayList) {
            ((ArrayList) list).ensureCapacity(list.size() + size2);
        } else if (list instanceof v3) {
            v3 v3Var = (v3) list;
            int i5 = v3Var.f33568c + size2;
            int length = v3Var.f33567b.length;
            if (i5 > length) {
                if (length != 0) {
                    while (length < i5) {
                        length = a80.m.e(length, 3, 2, 1, 10);
                    }
                    v3Var.f33567b = Arrays.copyOf(v3Var.f33567b, length);
                } else {
                    v3Var.f33567b = new Object[Math.max(i5, 10)];
                }
            }
        }
        int size3 = list.size();
        int size4 = arrayList.size();
        for (int i11 = 0; i11 < size4; i11++) {
            Object obj = arrayList.get(i11);
            if (obj == null) {
                String strI = b.c0.i(list.size() - size3, "Element at index ", " is null.");
                int size5 = list.size();
                while (true) {
                    size5--;
                    if (size5 < size3) {
                        throw new NullPointerException(strI);
                    }
                    list.remove(size5);
                }
            } else {
                list.add(obj);
            }
        }
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"zzd", w1.class});
        }
        if (i11 == 3) {
            return new y1();
        }
        if (i11 == 4) {
            return new x1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
