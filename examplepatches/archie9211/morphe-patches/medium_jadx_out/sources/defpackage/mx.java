package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mx implements CharSequence {
    public final List a;
    public final String b;
    public final ArrayList c;
    public final ArrayList d;

    static {
        mya myaVar = qpb.a;
    }

    public mx(List list, String str) {
        ArrayList arrayList;
        ArrayList arrayList2;
        this.a = list;
        this.b = str;
        if (list != null) {
            int size = list.size();
            arrayList = null;
            arrayList2 = null;
            for (int i = 0; i < size; i++) {
                lx lxVar = (lx) list.get(i);
                Object obj = lxVar.a;
                if (obj instanceof skc) {
                    arrayList = arrayList == null ? new ArrayList() : arrayList;
                    arrayList.add(lxVar);
                } else if (obj instanceof s29) {
                    arrayList2 = arrayList2 == null ? new ArrayList() : arrayList2;
                    arrayList2.add(lxVar);
                }
            }
        } else {
            arrayList = null;
            arrayList2 = null;
        }
        this.c = arrayList;
        this.d = arrayList2;
        List listF1 = arrayList2 != null ? bu1.f1(arrayList2, new js4(6)) : null;
        if (listF1 == null || listF1.isEmpty()) {
            return;
        }
        int i2 = ((lx) bu1.x0(listF1)).c;
        j68 j68Var = h46.a;
        j68 j68Var2 = new j68(1);
        j68Var2.a(i2);
        int size2 = listF1.size();
        for (int i3 = 1; i3 < size2; i3++) {
            lx lxVar2 = (lx) listF1.get(i3);
            while (true) {
                if (j68Var2.b != 0) {
                    int iD = j68Var2.d();
                    int i4 = lxVar2.b;
                    int i5 = lxVar2.c;
                    if (i4 >= iD) {
                        j68Var2.e(j68Var2.b - 1);
                    } else if (i5 > iD) {
                        c26.a("Paragraph overlap not allowed, end " + i5 + " should be less than or equal to " + iD);
                    }
                }
            }
            j68Var2.a(lxVar2.c);
        }
    }

    public final List a(int i) {
        List list = this.a;
        if (list == null) {
            return ey3.a;
        }
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i2 = 0; i2 < size; i2++) {
            Object obj = list.get(i2);
            lx lxVar = (lx) obj;
            if ((lxVar.a instanceof d07) && ox.b(0, i, lxVar.b, lxVar.c)) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public final mx b(x45 x45Var) {
        kx kxVar = new kx(this);
        ArrayList arrayList = kxVar.c;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            lx lxVar = (lx) x45Var.invoke(((jx) arrayList.get(i)).a(Integer.MIN_VALUE));
            arrayList.set(i, new jx(lxVar.a, lxVar.b, lxVar.c, lxVar.d));
        }
        return kxVar.i();
    }

    @Override // java.lang.CharSequence
    /* JADX INFO: renamed from: c, reason: merged with bridge method [inline-methods] */
    public final mx subSequence(int i, int i2) {
        if (!(i <= i2)) {
            c26.a("start (" + i + ") should be less or equal to end (" + i2 + ')');
        }
        String str = this.b;
        if (i == 0 && i2 == str.length()) {
            return this;
        }
        String strSubstring = str.substring(i, i2);
        mx mxVar = ox.a;
        if (i > i2) {
            c26.a("start (" + i + QFTsJPDEnO.BuSf + i2 + ')');
        }
        List list = this.a;
        ArrayList arrayList = null;
        if (list != null) {
            ArrayList arrayList2 = new ArrayList(list.size());
            int size = list.size();
            for (int i3 = 0; i3 < size; i3++) {
                lx lxVar = (lx) list.get(i3);
                int i4 = lxVar.b;
                int i5 = lxVar.c;
                if (ox.b(i, i2, i4, i5)) {
                    arrayList2.add(new lx(lxVar.a, Math.max(i, lxVar.b) - i, Math.min(i2, i5) - i, lxVar.d));
                }
            }
            if (!arrayList2.isEmpty()) {
                arrayList = arrayList2;
            }
        }
        return new mx(arrayList, strSubstring);
    }

    @Override // java.lang.CharSequence
    public final char charAt(int i) {
        return this.b.charAt(i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mx)) {
            return false;
        }
        mx mxVar = (mx) obj;
        return g76.L(this.b, mxVar.b) && g76.L(this.a, mxVar.a);
    }

    public final int hashCode() {
        int iHashCode = this.b.hashCode() * 31;
        List list = this.a;
        return iHashCode + (list != null ? list.hashCode() : 0);
    }

    @Override // java.lang.CharSequence
    public final int length() {
        return this.b.length();
    }

    @Override // java.lang.CharSequence
    public final String toString() {
        return this.b;
    }

    public /* synthetic */ mx(String str) {
        this(str, ey3.a);
    }

    public mx(String str, List list) {
        this(list.isEmpty() ? null : list, str);
    }
}
