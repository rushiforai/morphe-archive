package jb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f69395a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f69396b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f69397c;

    /* renamed from: d, reason: collision with root package name */
    public final List f69398d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f69399e;

    public f(int i5, byte[] bArr, Map map, List list, boolean z11) {
        this.f69395a = i5;
        this.f69396b = bArr;
        this.f69397c = map;
        if (list == null) {
            this.f69398d = null;
        } else {
            this.f69398d = Collections.unmodifiableList(list);
        }
        this.f69399e = z11;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.util.TreeMap] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    public f(int i5, byte[] bArr, boolean z11, List list) {
        Map treeMap;
        if (list == null) {
            treeMap = 0;
        } else if (list.isEmpty()) {
            treeMap = Collections.EMPTY_MAP;
        } else {
            treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
            Iterator it = list.iterator();
            while (it.hasNext()) {
                d dVar = (d) it.next();
                treeMap.put(dVar.f69388a, dVar.f69389b);
            }
        }
        this(i5, bArr, treeMap, list, z11);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    public f(byte[] bArr, Map map) {
        List arrayList;
        if (map == null) {
            arrayList = 0;
        } else if (map.isEmpty()) {
            arrayList = Collections.EMPTY_LIST;
        } else {
            arrayList = new ArrayList(map.size());
            for (Map.Entry entry : map.entrySet()) {
                arrayList.add(new d((String) entry.getKey(), (String) entry.getValue()));
            }
        }
        this(200, bArr, map, arrayList, false);
    }
}
