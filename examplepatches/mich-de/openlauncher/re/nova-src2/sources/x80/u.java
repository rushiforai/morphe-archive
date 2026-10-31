package x80;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public final class u implements Iterable, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final String[] f95615a;

    public u(String[] strArr) {
        this.f95615a = strArr;
    }

    public final String b(String name) {
        Intrinsics.g(name, "name");
        String[] strArr = this.f95615a;
        int length = strArr.length - 2;
        int iA = ProgressionUtilKt.a(length, 0, -2);
        if (iA > length) {
            return null;
        }
        while (!r70.j.B0(name, strArr[length], true)) {
            if (length == iA) {
                return null;
            }
            length -= 2;
        }
        return strArr[length + 1];
    }

    public final String c(int i5) {
        return this.f95615a[i5 * 2];
    }

    public final o2.h d() {
        o2.h hVar = new o2.h(1);
        b70.d.A0(hVar.f79265a, this.f95615a);
        return hVar;
    }

    public final String e(int i5) {
        return this.f95615a[(i5 * 2) + 1];
    }

    public final boolean equals(Object obj) {
        if (obj instanceof u) {
            return Arrays.equals(this.f95615a, ((u) obj).f95615a);
        }
        return false;
    }

    public final List f(String name) {
        Intrinsics.g(name, "name");
        int size = size();
        ArrayList arrayList = null;
        for (int i5 = 0; i5 < size; i5++) {
            if (name.equalsIgnoreCase(c(i5))) {
                if (arrayList == null) {
                    arrayList = new ArrayList(2);
                }
                arrayList.add(e(i5));
            }
        }
        if (arrayList == null) {
            return EmptyList.f71733a;
        }
        List listUnmodifiableList = Collections.unmodifiableList(arrayList);
        Intrinsics.f(listUnmodifiableList, "{\n      Collections.unmodifiableList(result)\n    }");
        return listUnmodifiableList;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f95615a);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        int size = size();
        Pair[] pairArr = new Pair[size];
        for (int i5 = 0; i5 < size; i5++) {
            pairArr[i5] = new Pair(c(i5), e(i5));
        }
        return ArrayIteratorKt.a(pairArr);
    }

    public final int size() {
        return this.f95615a.length / 2;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        int size = size();
        for (int i5 = 0; i5 < size; i5++) {
            String strC = c(i5);
            String strE = e(i5);
            sb2.append(strC);
            sb2.append(": ");
            if (y80.c.o(strC)) {
                strE = "██";
            }
            sb2.append(strE);
            sb2.append("\n");
        }
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
        return string;
    }
}
