package androidx.room;

import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class t implements d7.f, d7.e {

    /* renamed from: i, reason: collision with root package name */
    public static final TreeMap f15266i = new TreeMap();

    /* renamed from: a, reason: collision with root package name */
    public final int f15267a;

    /* renamed from: b, reason: collision with root package name */
    public volatile String f15268b;

    /* renamed from: c, reason: collision with root package name */
    public final long[] f15269c;

    /* renamed from: d, reason: collision with root package name */
    public final double[] f15270d;

    /* renamed from: e, reason: collision with root package name */
    public final String[] f15271e;

    /* renamed from: f, reason: collision with root package name */
    public final byte[][] f15272f;

    /* renamed from: g, reason: collision with root package name */
    public final int[] f15273g;

    /* renamed from: h, reason: collision with root package name */
    public int f15274h;

    public t(int i5) {
        this.f15267a = i5;
        int i11 = i5 + 1;
        this.f15273g = new int[i11];
        this.f15269c = new long[i11];
        this.f15270d = new double[i11];
        this.f15271e = new String[i11];
        this.f15272f = new byte[i11][];
    }

    public static final t c(int i5, String query) {
        Intrinsics.g(query, "query");
        TreeMap treeMap = f15266i;
        synchronized (treeMap) {
            Map.Entry entryCeilingEntry = treeMap.ceilingEntry(Integer.valueOf(i5));
            if (entryCeilingEntry == null) {
                Unit unit = Unit.f71706a;
                t tVar = new t(i5);
                tVar.f15268b = query;
                tVar.f15274h = i5;
                return tVar;
            }
            treeMap.remove(entryCeilingEntry.getKey());
            t tVar2 = (t) entryCeilingEntry.getValue();
            tVar2.getClass();
            tVar2.f15268b = query;
            tVar2.f15274h = i5;
            return tVar2;
        }
    }

    @Override // d7.f
    public final String a() {
        String str = this.f15268b;
        if (str != null) {
            return str;
        }
        throw new IllegalStateException("Required value was null.");
    }

    @Override // d7.f
    public final void b(d7.e eVar) {
        int i5 = this.f15274h;
        if (1 > i5) {
            return;
        }
        int i11 = 1;
        while (true) {
            int i12 = this.f15273g[i11];
            if (i12 == 1) {
                eVar.bindNull(i11);
            } else if (i12 == 2) {
                eVar.bindLong(i11, this.f15269c[i11]);
            } else if (i12 == 3) {
                eVar.bindDouble(i11, this.f15270d[i11]);
            } else if (i12 == 4) {
                String str = this.f15271e[i11];
                if (str == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                eVar.bindString(i11, str);
            } else if (i12 == 5) {
                byte[] bArr = this.f15272f[i11];
                if (bArr == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                eVar.bindBlob(i11, bArr);
            }
            if (i11 == i5) {
                return;
            } else {
                i11++;
            }
        }
    }

    @Override // d7.e
    public final void bindBlob(int i5, byte[] bArr) {
        this.f15273g[i5] = 5;
        this.f15272f[i5] = bArr;
    }

    @Override // d7.e
    public final void bindDouble(int i5, double d5) {
        this.f15273g[i5] = 3;
        this.f15270d[i5] = d5;
    }

    @Override // d7.e
    public final void bindLong(int i5, long j11) {
        this.f15273g[i5] = 2;
        this.f15269c[i5] = j11;
    }

    @Override // d7.e
    public final void bindNull(int i5) {
        this.f15273g[i5] = 1;
    }

    @Override // d7.e
    public final void bindString(int i5, String value) {
        Intrinsics.g(value, "value");
        this.f15273g[i5] = 4;
        this.f15271e[i5] = value;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    public final void d() {
        TreeMap treeMap = f15266i;
        synchronized (treeMap) {
            treeMap.put(Integer.valueOf(this.f15267a), this);
            if (treeMap.size() > 15) {
                int size = treeMap.size() - 10;
                Iterator it = treeMap.descendingKeySet().iterator();
                Intrinsics.f(it, "queryPool.descendingKeySet().iterator()");
                while (true) {
                    int i5 = size - 1;
                    if (size <= 0) {
                        break;
                    }
                    it.next();
                    it.remove();
                    size = i5;
                }
            }
            Unit unit = Unit.f71706a;
        }
    }
}
