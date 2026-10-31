package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public abstract class n0 {
    protected transient int zza;

    public static void d(Iterable iterable, List list) {
        iterable.getClass();
        if (iterable instanceof a2) {
            List listZza = ((a2) iterable).zza();
            a2 a2Var = (a2) list;
            int size = list.size();
            for (Object obj : listZza) {
                if (obj == null) {
                    int size2 = a2Var.size() - size;
                    StringBuilder sb2 = new StringBuilder(String.valueOf(size2).length() + 26);
                    sb2.append("Element at index ");
                    sb2.append(size2);
                    sb2.append(" is null.");
                    String string = sb2.toString();
                    int size3 = a2Var.size();
                    while (true) {
                        size3--;
                        if (size3 < size) {
                            throw new NullPointerException(string);
                        }
                        a2Var.remove(size3);
                    }
                } else if (obj instanceof v0) {
                    a2Var.zzb();
                } else if (obj instanceof byte[]) {
                    byte[] bArr = (byte[]) obj;
                    v0.k(0, bArr.length, bArr);
                    a2Var.zzb();
                } else {
                    a2Var.add((String) obj);
                }
            }
            return;
        }
        if (iterable instanceof p2) {
            list.addAll((Collection) iterable);
            return;
        }
        if (iterable instanceof Collection) {
            int size4 = ((Collection) iterable).size();
            if (list instanceof ArrayList) {
                ((ArrayList) list).ensureCapacity(list.size() + size4);
            } else if (list instanceof r2) {
                r2 r2Var = (r2) list;
                int i5 = r2Var.f33025c + size4;
                int length = r2Var.f33024b.length;
                if (i5 > length) {
                    if (length != 0) {
                        while (length < i5) {
                            length = a80.m.e(length, 3, 2, 1, 10);
                        }
                        r2Var.f33024b = Arrays.copyOf(r2Var.f33024b, length);
                    } else {
                        r2Var.f33024b = new Object[Math.max(i5, 10)];
                    }
                }
            }
        }
        int size5 = list.size();
        if (!(iterable instanceof List) || !(iterable instanceof RandomAccess)) {
            for (Object obj2 : iterable) {
                if (obj2 == null) {
                    l1.a(size5, list);
                    throw null;
                }
                list.add(obj2);
            }
            return;
        }
        List list2 = (List) iterable;
        int size6 = list2.size();
        for (int i11 = 0; i11 < size6; i11++) {
            Object obj3 = list2.get(i11);
            if (obj3 == null) {
                l1.a(size5, list);
                throw null;
            }
            list.add(obj3);
        }
    }

    public final byte[] a() {
        try {
            o1 o1Var = (o1) this;
            int iN = o1Var.n();
            byte[] bArr = new byte[iN];
            boolean z11 = c1.f32417d;
            z0 z0Var = new z0(bArr, iN);
            o1Var.f(z0Var);
            if (z0Var.L() > 0) {
                throw new IllegalStateException("Did not write as much data as expected.");
            }
            if (z0Var.L() >= 0) {
                return bArr;
            }
            throw new IllegalStateException("Wrote more data than expected.");
        } catch (IOException e3) {
            String name = getClass().getName();
            throw new RuntimeException(b.c0.r(new StringBuilder(name.length() + 72), "Serializing ", name, " to a byte array threw an IOException (should never happen)."), e3);
        }
    }

    public final void b(OutputStream outputStream) {
        o1 o1Var = (o1) this;
        int iN = o1Var.n();
        boolean z11 = c1.f32417d;
        if (iN > 4096) {
            iN = 4096;
        }
        a1 a1Var = new a1(outputStream, iN);
        o1Var.f(a1Var);
        if (a1Var.f32366g > 0) {
            a1Var.P();
        }
    }

    public abstract int c(t2 t2Var);
}
