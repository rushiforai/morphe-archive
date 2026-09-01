package defpackage;

import com.squareup.wire.sjIw.ezwlgQm;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class sh7 implements fd6 {
    public final List a;
    public cd6 b;
    public Object c;
    public Object[] d;
    public Map[] e;
    public Iterator[] f;
    public int[] g;
    public int h;

    public sh7(Map map, List list) {
        list.getClass();
        this.a = list;
        this.d = new Object[64];
        this.e = new Map[64];
        this.f = new Iterator[64];
        this.g = new int[64];
        this.b = m(map);
        this.c = map;
    }

    public static cd6 m(Object obj) {
        return obj == null ? cd6.NULL : obj instanceof List ? cd6.BEGIN_ARRAY : obj instanceof Map ? cd6.BEGIN_OBJECT : obj instanceof Integer ? cd6.NUMBER : obj instanceof Long ? cd6.LONG : obj instanceof Double ? cd6.NUMBER : obj instanceof rc6 ? cd6.NUMBER : obj instanceof String ? cd6.STRING : obj instanceof Boolean ? cd6.BOOLEAN : cd6.ANY;
    }

    public final void B() {
        int i = this.h;
        Object[] objArr = this.d;
        if (i == objArr.length) {
            this.d = Arrays.copyOf(objArr, objArr.length * 2);
            Map[] mapArr = this.e;
            this.e = (Map[]) Arrays.copyOf(mapArr, mapArr.length * 2);
            int[] iArr = this.g;
            this.g = Arrays.copyOf(iArr, iArr.length * 2);
            Iterator[] itArr = this.f;
            this.f = (Iterator[]) Arrays.copyOf(itArr, itArr.length * 2);
        }
        this.h++;
    }

    @Override // defpackage.fd6
    public final String X() {
        if (this.b != cd6.NAME) {
            StringBuilder sb = new StringBuilder("Expected NAME but was ");
            sb.append(this.b);
            rd6.t(sb, p());
            return null;
        }
        Object obj = this.c;
        obj.getClass();
        Map.Entry entry = (Map.Entry) obj;
        this.d[this.h - 1] = entry.getKey();
        this.c = entry.getValue();
        this.b = m(entry.getValue());
        return (String) entry.getKey();
    }

    @Override // defpackage.fd6
    public final void a0() {
        if (this.b == cd6.NULL) {
            f();
            return;
        }
        StringBuilder sb = new StringBuilder("Expected NULL but was ");
        sb.append(this.b);
        rd6.t(sb, p());
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    @Override // defpackage.fd6
    public final fd6 e() {
        int i = this.h - 1;
        this.h = i;
        this.f[i] = null;
        this.d[i] = null;
        this.e[i] = null;
        f();
        return this;
    }

    public final void f() {
        int i = this.h;
        if (i == 0) {
            this.b = cd6.END_DOCUMENT;
            return;
        }
        Iterator it2 = this.f[i - 1];
        it2.getClass();
        Object[] objArr = this.d;
        int i2 = this.h - 1;
        Object obj = objArr[i2];
        if (obj instanceof Integer) {
            obj.getClass();
            objArr[i2] = Integer.valueOf(((Integer) obj).intValue() + 1);
        }
        if (!it2.hasNext()) {
            this.b = this.d[this.h + (-1)] instanceof Integer ? cd6.END_ARRAY : cd6.END_OBJECT;
            return;
        }
        Object next = it2.next();
        this.c = next;
        this.b = next instanceof Map.Entry ? cd6.NAME : m(next);
    }

    @Override // defpackage.fd6
    public final ArrayList h() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.a);
        int i = this.h;
        for (int i2 = 0; i2 < i; i2++) {
            Object obj = this.d[i2];
            if (obj != null) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    @Override // defpackage.fd6
    public final boolean hasNext() {
        int i = rh7.a[this.b.ordinal()];
        return (i == 1 || i == 2) ? false : true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.fd6
    public final fd6 i() {
        if (this.b != cd6.BEGIN_OBJECT) {
            StringBuilder sb = new StringBuilder("Expected BEGIN_OBJECT but was ");
            sb.append(this.b);
            rd6.t(sb, p());
            return null;
        }
        B();
        Map[] mapArr = this.e;
        int i = this.h - 1;
        Object obj = this.c;
        obj.getClass();
        mapArr[i] = obj;
        j();
        return this;
    }

    @Override // defpackage.fd6
    public final void j() {
        Map[] mapArr = this.e;
        int i = this.h;
        Map map = mapArr[i - 1];
        this.d[i - 1] = null;
        map.getClass();
        this.f[i - 1] = map.entrySet().iterator();
        this.g[this.h - 1] = 0;
        f();
    }

    @Override // defpackage.fd6
    public final fd6 k() {
        if (this.b != cd6.END_ARRAY) {
            StringBuilder sb = new StringBuilder("Expected END_ARRAY but was ");
            sb.append(this.b);
            rd6.t(sb, p());
            return null;
        }
        int i = this.h - 1;
        this.h = i;
        this.f[i] = null;
        this.d[i] = null;
        f();
        return this;
    }

    @Override // defpackage.fd6
    public final fd6 n() {
        if (this.b != cd6.BEGIN_ARRAY) {
            StringBuilder sb = new StringBuilder("Expected BEGIN_ARRAY but was ");
            sb.append(this.b);
            rd6.t(sb, p());
            return null;
        }
        Object obj = this.c;
        obj.getClass();
        B();
        this.d[this.h - 1] = -1;
        this.f[this.h - 1] = ((List) obj).iterator();
        f();
        return this;
    }

    @Override // defpackage.fd6
    public final int n0(List list) {
        list.getClass();
        while (hasNext()) {
            String strX = X();
            int iIndexOf = this.g[this.h - 1];
            if (iIndexOf >= list.size() || !g76.L(list.get(iIndexOf), strX)) {
                iIndexOf = list.indexOf(strX);
                if (iIndexOf != -1) {
                    this.g[this.h - 1] = iIndexOf + 1;
                }
            } else {
                int[] iArr = this.g;
                int i = this.h - 1;
                iArr[i] = iArr[i] + 1;
            }
            if (iIndexOf != -1) {
                return iIndexOf;
            }
            f();
        }
        return -1;
    }

    @Override // defpackage.fd6
    public final boolean nextBoolean() {
        if (this.b == cd6.BOOLEAN) {
            Object obj = this.c;
            obj.getClass();
            f();
            return ((Boolean) obj).booleanValue();
        }
        StringBuilder sb = new StringBuilder("Expected BOOLEAN but was ");
        sb.append(this.b);
        rd6.t(sb, p());
        return false;
    }

    @Override // defpackage.fd6
    public final double nextDouble() {
        double dDoubleValue;
        int i = rh7.a[this.b.ordinal()];
        if (i != 3 && i != 4 && i != 5) {
            StringBuilder sb = new StringBuilder("Expected a Double but was ");
            sb.append(this.b);
            rd6.t(sb, p());
            return 0.0d;
        }
        Object obj = this.c;
        if (obj instanceof Integer) {
            dDoubleValue = ((Number) obj).intValue();
        } else if (obj instanceof Long) {
            long jLongValue = ((Number) obj).longValue();
            double d = jLongValue;
            if (((long) d) != jLongValue) {
                throw new IllegalStateException((jLongValue + " cannot be converted to Double").toString());
            }
            dDoubleValue = d;
        } else if (obj instanceof Double) {
            dDoubleValue = ((Number) obj).doubleValue();
        } else if (obj instanceof String) {
            dDoubleValue = Double.parseDouble((String) obj);
        } else {
            if (!(obj instanceof rc6)) {
                rd6.o("Expected a Double but got ", obj, " instead");
                return 0.0d;
            }
            dDoubleValue = Double.parseDouble(((rc6) obj).a);
        }
        f();
        return dDoubleValue;
    }

    @Override // defpackage.fd6
    public final int nextInt() {
        int iIntValue;
        int i;
        int i2 = rh7.a[this.b.ordinal()];
        if (i2 != 3 && i2 != 4 && i2 != 5) {
            StringBuilder sb = new StringBuilder("Expected an Int but was ");
            sb.append(this.b);
            rd6.t(sb, p());
            return 0;
        }
        Object obj = this.c;
        if (obj instanceof Integer) {
            iIntValue = ((Number) obj).intValue();
        } else {
            if (obj instanceof Long) {
                long jLongValue = ((Number) obj).longValue();
                i = (int) jLongValue;
                if (i != jLongValue) {
                    throw new IllegalStateException((jLongValue + " cannot be converted to Int").toString());
                }
            } else if (obj instanceof Double) {
                double dDoubleValue = ((Number) obj).doubleValue();
                i = (int) dDoubleValue;
                if (i != dDoubleValue) {
                    throw new IllegalStateException((dDoubleValue + " cannot be converted to Int").toString());
                }
            } else if (obj instanceof String) {
                iIntValue = Integer.parseInt((String) obj);
            } else {
                if (!(obj instanceof rc6)) {
                    rd6.o("Expected an Int but got ", obj, " instead");
                    return 0;
                }
                iIntValue = Integer.parseInt(((rc6) obj).a);
            }
            iIntValue = i;
        }
        f();
        return iIntValue;
    }

    @Override // defpackage.fd6
    public final long nextLong() {
        long jLongValue;
        int i = rh7.a[this.b.ordinal()];
        if (i != 3 && i != 4 && i != 5) {
            StringBuilder sb = new StringBuilder("Expected a Long but was ");
            sb.append(this.b);
            rd6.t(sb, p());
            return 0L;
        }
        Object obj = this.c;
        if (obj instanceof Integer) {
            jLongValue = ((Number) obj).intValue();
        } else if (obj instanceof Long) {
            jLongValue = ((Number) obj).longValue();
        } else if (obj instanceof Double) {
            double dDoubleValue = ((Number) obj).doubleValue();
            long j = (long) dDoubleValue;
            if (j != dDoubleValue) {
                throw new IllegalStateException((dDoubleValue + " cannot be converted to Long").toString());
            }
            jLongValue = j;
        } else if (obj instanceof String) {
            jLongValue = Long.parseLong((String) obj);
        } else {
            if (!(obj instanceof rc6)) {
                rd6.o("Expected Int but got ", obj, " instead");
                return 0L;
            }
            jLongValue = Long.parseLong(((rc6) obj).a);
        }
        f();
        return jLongValue;
    }

    public final String p() {
        return bu1.F0(h(), ".", null, null, null, 62);
    }

    @Override // defpackage.fd6
    public final cd6 peek() {
        return this.b;
    }

    @Override // defpackage.fd6
    public final String q() {
        String strValueOf;
        Object obj = this.c;
        if (obj instanceof Integer) {
            strValueOf = String.valueOf(((Number) obj).intValue());
        } else if (obj instanceof Long) {
            strValueOf = String.valueOf(((Number) obj).longValue());
        } else if (obj instanceof Double) {
            strValueOf = String.valueOf(((Number) obj).doubleValue());
        } else if (obj instanceof String) {
            strValueOf = (String) obj;
        } else if (obj == null) {
            strValueOf = "null";
        } else {
            if (!(obj instanceof rc6)) {
                rd6.o("Expected a String but got ", obj, " instead");
                return null;
            }
            strValueOf = ((rc6) obj).a;
        }
        f();
        return strValueOf;
    }

    @Override // defpackage.fd6
    public final void v() {
        f();
    }

    @Override // defpackage.fd6
    public final rc6 l0() {
        rc6 rc6Var;
        int i = rh7.a[this.b.ordinal()];
        if (i != 3 && i != 4 && i != 5) {
            StringBuilder sb = new StringBuilder(ezwlgQm.PjYfHrQZrJG);
            sb.append(this.b);
            rd6.t(sb, p());
            return null;
        }
        Object obj = this.c;
        if ((obj instanceof Integer) || (obj instanceof Long) || (obj instanceof Double)) {
            rc6Var = new rc6(obj.toString());
        } else if (obj instanceof String) {
            rc6Var = new rc6((String) obj);
        } else {
            if (!(obj instanceof rc6)) {
                rd6.o("Expected JsonNumber but got ", obj, " instead");
                return null;
            }
            rc6Var = (rc6) obj;
        }
        f();
        return rc6Var;
    }

    public /* synthetic */ sh7(Map map) {
        this(map, ey3.a);
    }
}
