package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yi5 implements Iterable, th6 {
    public static final yi5 b = new yi5(new String[0]);
    public final String[] a;

    public yi5(String[] strArr) {
        strArr.getClass();
        this.a = strArr;
    }

    public final String d(String str) {
        String[] strArr = this.a;
        strArr.getClass();
        int length = strArr.length - 2;
        int iU = hk7.u(length, 0, -2);
        if (iU > length) {
            return null;
        }
        while (!str.equalsIgnoreCase(strArr[length])) {
            if (length == iU) {
                return null;
            }
            length -= 2;
        }
        return strArr[length + 1];
    }

    public final boolean equals(Object obj) {
        if (obj instanceof yi5) {
            return Arrays.equals(this.a, ((yi5) obj).a);
        }
        return false;
    }

    public final List f(String str) {
        str.getClass();
        int size = size();
        List listUnmodifiableList = null;
        ArrayList arrayList = null;
        for (int i = 0; i < size; i++) {
            if (str.equalsIgnoreCase(iq7.D(this, i))) {
                if (arrayList == null) {
                    arrayList = new ArrayList(2);
                }
                arrayList.add(iq7.F(this, i));
            }
        }
        if (arrayList != null) {
            listUnmodifiableList = DesugarCollections.unmodifiableList(arrayList);
            listUnmodifiableList.getClass();
        }
        return listUnmodifiableList == null ? ey3.a : listUnmodifiableList;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.a);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        int size = size();
        f09[] f09VarArr = new f09[size];
        for (int i = 0; i < size; i++) {
            f09VarArr[i] = new f09(iq7.D(this, i), iq7.F(this, i));
        }
        return new h1(f09VarArr);
    }

    public final int size() {
        return this.a.length / 2;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        int size = size();
        for (int i = 0; i < size; i++) {
            String strD = iq7.D(this, i);
            String strF = iq7.F(this, i);
            sb.append(strD);
            sb.append(": ");
            if (egf.m(strD)) {
                strF = "██";
            }
            sb.append(strF);
            sb.append("\n");
        }
        return sb.toString();
    }
}
