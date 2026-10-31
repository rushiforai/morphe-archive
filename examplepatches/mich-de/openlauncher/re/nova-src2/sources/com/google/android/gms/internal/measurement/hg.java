package com.google.android.gms.internal.measurement;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.UUID;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public abstract class hg {

    /* renamed from: a, reason: collision with root package name */
    public static final WeakHashMap f32614a = new WeakHashMap();

    /* renamed from: b, reason: collision with root package name */
    public static final WeakHashMap f32615b = new WeakHashMap();

    /* JADX WARN: Removed duplicated region for block: B:53:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(Throwable th2) {
        Throwable cause;
        k1 k1Var;
        Closeable closeable;
        int i5;
        WeakHashMap weakHashMap = f32615b;
        synchronized (weakHashMap) {
            cause = th2;
            while (cause != null) {
                try {
                    if (weakHashMap.containsKey(cause)) {
                        break;
                    } else {
                        cause = cause.getCause();
                    }
                } finally {
                }
            }
            weakHashMap.put(th2, Boolean.valueOf(cause != null));
        }
        if (cause != null) {
            return;
        }
        WeakHashMap weakHashMap2 = f32614a;
        synchronized (weakHashMap2) {
            Throwable cause2 = th2;
            while (cause2 != null) {
                try {
                    if (weakHashMap2.containsKey(cause2)) {
                        break;
                    } else {
                        cause2 = cause2.getCause();
                    }
                } finally {
                }
            }
            if (cause2 == null) {
                k1Var = null;
            } else {
                weakHashMap2.put(th2, (eg) weakHashMap2.get(cause2));
                k1Var = new k1(18);
            }
        }
        if (k1Var != null || (closeable = jg.c().f33266b) == null) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (closeable = jg.c().f33266b; closeable != null; closeable = ((dg) closeable).f32473a) {
            arrayList.add(closeable);
        }
        UUID uuid = ((dg) ((zg) arrayList.get(0))).f32474b;
        if (uuid == null) {
            throw new NullPointerException("Null rootTraceId");
        }
        ((zg) arrayList.get(0)).getClass();
        int size = arrayList.size();
        xk.l0 l0Var = xk.v0.f96030b;
        w20.e.e(size, "expectedSize");
        w20.e.e(size, "initialCapacity");
        Object[] objArrCopyOf = new Object[size];
        int size2 = arrayList.size();
        w20.e.e(size2, "expectedSize");
        w20.e.e(size2, "initialCapacity");
        Object[] objArrCopyOf2 = new Object[size2];
        int i11 = 0;
        boolean z11 = false;
        int i12 = 0;
        boolean z12 = false;
        for (zg zgVar : v70.o.k(arrayList)) {
            String str = ((dg) zgVar).f32476d;
            str.getClass();
            int i13 = i12 + 1;
            if (objArrCopyOf2.length < i13) {
                objArrCopyOf2 = Arrays.copyOf(objArrCopyOf2, rg.m.c(objArrCopyOf2.length, i13));
            } else {
                if (z12) {
                    objArrCopyOf2 = (Object[]) objArrCopyOf2.clone();
                }
                int i14 = i12 + 1;
                objArrCopyOf2[i12] = str;
                tg tgVarZzh = zgVar.zzh();
                tgVarZzh.getClass();
                i5 = i11 + 1;
                if (objArrCopyOf.length >= i5) {
                    objArrCopyOf = Arrays.copyOf(objArrCopyOf, rg.m.c(objArrCopyOf.length, i5));
                } else if (z11) {
                    objArrCopyOf = (Object[]) objArrCopyOf.clone();
                } else {
                    objArrCopyOf[i11] = tgVarZzh;
                    i11++;
                    i12 = i14;
                }
                z11 = false;
                objArrCopyOf[i11] = tgVarZzh;
                i11++;
                i12 = i14;
            }
            z12 = false;
            int i142 = i12 + 1;
            objArrCopyOf2[i12] = str;
            tg tgVarZzh2 = zgVar.zzh();
            tgVarZzh2.getClass();
            i5 = i11 + 1;
            if (objArrCopyOf.length >= i5) {
            }
            z11 = false;
            objArrCopyOf[i11] = tgVarZzh2;
            i11++;
            i12 = i142;
        }
        WeakHashMap weakHashMap3 = f32614a;
        synchronized (weakHashMap3) {
            try {
                xk.r2 r2VarK = xk.v0.k(i12, objArrCopyOf2);
                if (r2VarK == null) {
                    throw new NullPointerException("Null spansNames");
                }
                xk.r2 r2VarK2 = xk.v0.k(i11, objArrCopyOf);
                if (r2VarK2 == null) {
                    throw new NullPointerException("Null extras");
                }
                weakHashMap3.put(th2, new eg(r2VarK, r2VarK2, uuid));
            } finally {
            }
        }
    }
}
