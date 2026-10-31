package com.android.volley.toolbox;

import b.c0;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import jb.q;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public long f21386a;

    /* renamed from: b, reason: collision with root package name */
    public final String f21387b;

    /* renamed from: c, reason: collision with root package name */
    public final String f21388c;

    /* renamed from: d, reason: collision with root package name */
    public final long f21389d;

    /* renamed from: e, reason: collision with root package name */
    public final long f21390e;

    /* renamed from: f, reason: collision with root package name */
    public final long f21391f;

    /* renamed from: g, reason: collision with root package name */
    public final long f21392g;

    /* renamed from: h, reason: collision with root package name */
    public final List f21393h;

    public b(String str, String str2, long j11, long j12, long j13, long j14, List list) {
        this.f21387b = str;
        this.f21388c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.equals(str2) ? null : str2;
        this.f21389d = j11;
        this.f21390e = j12;
        this.f21391f = j13;
        this.f21392g = j14;
        this.f21393h = list;
    }

    public static b a(c cVar) throws IOException {
        if (d.i(cVar) != 538247942) {
            throw new IOException();
        }
        String strK = d.k(cVar);
        String strK2 = d.k(cVar);
        long j11 = d.j(cVar);
        long j12 = d.j(cVar);
        long j13 = d.j(cVar);
        long j14 = d.j(cVar);
        int i5 = d.i(cVar);
        if (i5 < 0) {
            throw new IOException(c0.h(i5, "readHeaderList size="));
        }
        List arrayList = i5 == 0 ? Collections.EMPTY_LIST : new ArrayList();
        for (int i11 = 0; i11 < i5; i11++) {
            arrayList.add(new jb.d(d.k(cVar).intern(), d.k(cVar).intern()));
        }
        return new b(strK, strK2, j11, j12, j13, j14, arrayList);
    }

    public final jb.a b(byte[] bArr) {
        jb.a aVar = new jb.a();
        aVar.f69369a = bArr;
        aVar.f69370b = this.f21388c;
        aVar.f69371c = this.f21389d;
        aVar.f69372d = this.f21390e;
        aVar.f69373e = this.f21391f;
        aVar.f69374f = this.f21392g;
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        List<jb.d> list = this.f21393h;
        for (jb.d dVar : list) {
            treeMap.put(dVar.f69388a, dVar.f69389b);
        }
        aVar.f69375g = treeMap;
        aVar.f69376h = Collections.unmodifiableList(list);
        return aVar;
    }

    public final boolean c(BufferedOutputStream bufferedOutputStream) throws IOException {
        try {
            d.m(bufferedOutputStream, 538247942);
            d.o(bufferedOutputStream, this.f21387b);
            String str = this.f21388c;
            if (str == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            d.o(bufferedOutputStream, str);
            d.n(bufferedOutputStream, this.f21389d);
            d.n(bufferedOutputStream, this.f21390e);
            d.n(bufferedOutputStream, this.f21391f);
            d.n(bufferedOutputStream, this.f21392g);
            List<jb.d> list = this.f21393h;
            if (list != null) {
                d.m(bufferedOutputStream, list.size());
                for (jb.d dVar : list) {
                    d.o(bufferedOutputStream, dVar.f69388a);
                    d.o(bufferedOutputStream, dVar.f69389b);
                }
            } else {
                d.m(bufferedOutputStream, 0);
            }
            bufferedOutputStream.flush();
            return true;
        } catch (IOException e3) {
            q.a("%s", e3.toString());
            return false;
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v2 */
    public b(String str, jb.a aVar) {
        String str2 = aVar.f69370b;
        long j11 = aVar.f69371c;
        long j12 = aVar.f69372d;
        long j13 = aVar.f69373e;
        long j14 = aVar.f69374f;
        List arrayList = aVar.f69376h;
        if (arrayList == 0) {
            Map map = aVar.f69375g;
            arrayList = new ArrayList(map.size());
            for (Map.Entry entry : map.entrySet()) {
                arrayList.add(new jb.d((String) entry.getKey(), (String) entry.getValue()));
            }
        }
        this(str, str2, j11, j12, j13, j14, arrayList);
    }
}
