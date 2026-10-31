package m3;

import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g implements CharSequence {

    /* renamed from: a, reason: collision with root package name */
    public final List f75879a;

    /* renamed from: b, reason: collision with root package name */
    public final String f75880b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f75881c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f75882d;

    static {
        ab.c0 c0Var = e0.f75856a;
    }

    public g(List list, String str) {
        ArrayList arrayList;
        ArrayList arrayList2;
        this.f75879a = list;
        this.f75880b = str;
        int i5 = 0;
        if (list != null) {
            int size = list.size();
            arrayList = null;
            arrayList2 = null;
            for (int i11 = 0; i11 < size; i11++) {
                e eVar = (e) list.get(i11);
                Object obj = eVar.f75852a;
                if (obj instanceof g0) {
                    arrayList = arrayList == null ? new ArrayList() : arrayList;
                    arrayList.add(eVar);
                } else if (obj instanceof u) {
                    arrayList2 = arrayList2 == null ? new ArrayList() : arrayList2;
                    arrayList2.add(eVar);
                }
            }
        } else {
            arrayList = null;
            arrayList2 = null;
        }
        this.f75881c = arrayList;
        this.f75882d = arrayList2;
        List listD1 = arrayList2 != null ? b70.g.D1(new f(i5), arrayList2) : null;
        List list2 = listD1;
        if (list2 == null || list2.isEmpty()) {
            return;
        }
        int i12 = ((e) b70.g.W0(listD1)).f75854c;
        z.b0 b0Var = z.l.f97786a;
        z.b0 b0Var2 = new z.b0(1);
        b0Var2.c(i12);
        int size2 = listD1.size();
        for (int i13 = 1; i13 < size2; i13++) {
            e eVar2 = (e) listD1.get(i13);
            while (true) {
                if (b0Var2.f97784b != 0) {
                    int iB = b0Var2.b();
                    int i14 = eVar2.f75853b;
                    int i15 = eVar2.f75854c;
                    if (i14 >= iB) {
                        b0Var2.e(b0Var2.f97784b - 1);
                    } else if (i15 > iB) {
                        s3.a.a("Paragraph overlap not allowed, end " + i15 + " should be less than or equal to " + iB);
                    }
                }
            }
            b0Var2.c(eVar2.f75854c);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.util.ArrayList] */
    public final List a(int i5) {
        ?? arrayList;
        List list = this.f75879a;
        if (list != null) {
            arrayList = new ArrayList(list.size());
            int size = list.size();
            for (int i11 = 0; i11 < size; i11++) {
                Object obj = list.get(i11);
                e eVar = (e) obj;
                if ((eVar.f75852a instanceof n) && h.b(0, i5, eVar.f75853b, eVar.f75854c)) {
                    arrayList.add(obj);
                }
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        Intrinsics.e(arrayList, "null cannot be cast to non-null type kotlin.collections.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.LinkAnnotation>>");
        return arrayList;
    }

    public final List b(int i5, int i11) {
        List list = this.f75879a;
        if (list == null) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i12 = 0; i12 < size; i12++) {
            e eVar = (e) list.get(i12);
            if ((eVar.f75852a instanceof i0) && h.b(i5, i11, eVar.f75853b, eVar.f75854c)) {
                arrayList.add(f0.c(eVar));
            }
        }
        return arrayList;
    }

    public final List c(int i5, int i11, String str) {
        List list = this.f75879a;
        if (list == null) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i12 = 0; i12 < size; i12++) {
            e eVar = (e) list.get(i12);
            if ((eVar.f75852a instanceof i0) && str.equals(eVar.f75855d) && h.b(i5, i11, eVar.f75853b, eVar.f75854c)) {
                arrayList.add(f0.c(eVar));
            }
        }
        return arrayList;
    }

    @Override // java.lang.CharSequence
    public final char charAt(int i5) {
        return this.f75880b.charAt(i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00a1  */
    @Override // java.lang.CharSequence
    /* renamed from: d, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final g subSequence(int i5, int i11) {
        ArrayList arrayList;
        if (!(i5 <= i11)) {
            s3.a.a("start (" + i5 + ") should be less or equal to end (" + i11 + ')');
        }
        String str = this.f75880b;
        if (i5 == 0 && i11 == str.length()) {
            return this;
        }
        String strSubstring = str.substring(i5, i11);
        Intrinsics.f(strSubstring, "substring(...)");
        g gVar = h.f75897a;
        if (i5 > i11) {
            s3.a.a("start (" + i5 + ") should be less than or equal to end (" + i11 + ')');
        }
        List list = this.f75879a;
        if (list == null) {
            arrayList = null;
        } else {
            arrayList = new ArrayList(list.size());
            int size = list.size();
            for (int i12 = 0; i12 < size; i12++) {
                e eVar = (e) list.get(i12);
                int i13 = eVar.f75853b;
                int i14 = eVar.f75854c;
                if (h.b(i5, i11, i13, i14)) {
                    arrayList.add(new e(eVar.f75852a, Math.max(i5, eVar.f75853b) - i5, Math.min(i11, i14) - i5, eVar.f75855d));
                }
            }
            if (arrayList.isEmpty()) {
            }
        }
        return new g(arrayList, strSubstring);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f75880b, gVar.f75880b) && Intrinsics.b(this.f75879a, gVar.f75879a);
    }

    public final int hashCode() {
        int iHashCode = this.f75880b.hashCode() * 31;
        List list = this.f75879a;
        return iHashCode + (list != null ? list.hashCode() : 0);
    }

    @Override // java.lang.CharSequence
    public final int length() {
        return this.f75880b.length();
    }

    @Override // java.lang.CharSequence
    public final String toString() {
        return this.f75880b;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public g(int i5, String str, ArrayList arrayList) {
        List list;
        List list2 = (i5 & 2) != 0 ? EmptyList.f71733a : arrayList;
        EmptyList emptyList = EmptyList.f71733a;
        g gVar = h.f75897a;
        if (list2.isEmpty()) {
            emptyList.getClass();
            list = null;
        } else {
            emptyList.getClass();
            list = list2;
        }
        this(list, str);
    }

    public g(String str) {
        this(str, EmptyList.f71733a);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public g(String str, List list) {
        List list2 = list;
        this(list2.isEmpty() ? null : list2, str);
    }
}
