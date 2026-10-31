package of;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import wf.v;
import x80.s;

/* loaded from: classes3.dex */
public final class f implements jf.f {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f80376a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f80377b;

    public f(ArrayList arrayList, ArrayList arrayList2) {
        this.f80376a = arrayList;
        this.f80377b = arrayList2;
    }

    @Override // jf.f
    public int a(long j11) {
        int i5;
        Long lValueOf = Long.valueOf(j11);
        int i11 = v.f94376a;
        ArrayList arrayList = this.f80377b;
        int iBinarySearch = Collections.binarySearch(arrayList, lValueOf);
        if (iBinarySearch < 0) {
            i5 = ~iBinarySearch;
        } else {
            int size = arrayList.size();
            do {
                iBinarySearch++;
                if (iBinarySearch >= size) {
                    break;
                }
            } while (((Comparable) arrayList.get(iBinarySearch)).compareTo(lValueOf) == 0);
            i5 = iBinarySearch;
        }
        if (i5 < arrayList.size()) {
            return i5;
        }
        return -1;
    }

    public void b(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        this.f80376a.add(x80.b.b(name, 0, 0, 91, " \"':;<=>@[]^`{}|/\\?#&!$(),~"));
        this.f80377b.add(x80.b.b(value, 0, 0, 91, " \"':;<=>@[]^`{}|/\\?#&!$(),~"));
    }

    public s c() {
        return new s(this.f80376a, this.f80377b);
    }

    @Override // jf.f
    public List h(long j11) {
        int iC = v.c(this.f80377b, Long.valueOf(j11), false);
        return iC == -1 ? Collections.EMPTY_LIST : (List) this.f80376a.get(iC);
    }

    @Override // jf.f
    public long p(int i5) {
        wf.a.e(i5 >= 0);
        ArrayList arrayList = this.f80377b;
        wf.a.e(i5 < arrayList.size());
        return ((Long) arrayList.get(i5)).longValue();
    }

    @Override // jf.f
    public int r() {
        return this.f80377b.size();
    }

    public f() {
        this.f80376a = new ArrayList();
        this.f80377b = new ArrayList();
    }
}
