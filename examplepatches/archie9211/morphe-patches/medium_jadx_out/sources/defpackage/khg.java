package defpackage;

import j$.util.Map;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class khg implements Map, Serializable, j$.util.Map {
    public static final khg g = new khg(0, null, new Object[0]);
    public transient ghg a;
    public transient ihg b;
    public transient jhg c;
    public final transient Object d;
    public final transient Object[] e;
    public final transient int f;

    public khg(int i, Object obj, Object[] objArr) {
        this.d = obj;
        this.e = objArr;
        this.f = i;
    }

    @Override // java.util.Map
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final vgg entrySet() {
        ghg ghgVar = this.a;
        if (ghgVar != null) {
            return ghgVar;
        }
        ghg ghgVar2 = new ghg(this, this.e, this.f);
        this.a = ghgVar2;
        return ghgVar2;
    }

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object compute(Object obj, BiFunction biFunction) {
        return Map.CC.$default$compute(this, obj, biFunction);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object computeIfAbsent(Object obj, Function function) {
        return Map.CC.$default$computeIfAbsent(this, obj, function);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object computeIfPresent(Object obj, BiFunction biFunction) {
        return Map.CC.$default$computeIfPresent(this, obj, biFunction);
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return get(obj) != null;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        jhg jhgVar = this.c;
        if (jhgVar == null) {
            jhgVar = new jhg(1, this.f, this.e);
            this.c = jhgVar;
        }
        return jhgVar.contains(obj);
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof java.util.Map) {
            return entrySet().equals(((java.util.Map) obj).entrySet());
        }
        return false;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0003  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0003 A[EDGE_INSN: B:44:0x0003->B:4:0x0003 BREAK  A[LOOP:0: B:16:0x0038->B:22:0x004e], EDGE_INSN: B:46:0x0003->B:4:0x0003 BREAK  A[LOOP:1: B:26:0x0063->B:32:0x007a], EDGE_INSN: B:48:0x0003->B:4:0x0003 BREAK  A[LOOP:2: B:34:0x0089->B:43:0x00a0]] */
    @Override // java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object get(java.lang.Object r9) {
        /*
            r8 = this;
            r0 = 0
            if (r9 != 0) goto L6
        L3:
            r8 = r0
            goto L9c
        L6:
            r1 = 1
            int r2 = r8.f
            java.lang.Object[] r3 = r8.e
            if (r2 != r1) goto L20
            r8 = 0
            r8 = r3[r8]
            j$.util.Objects.requireNonNull(r8)
            boolean r8 = r8.equals(r9)
            if (r8 == 0) goto L3
            r8 = r3[r1]
            j$.util.Objects.requireNonNull(r8)
            goto L9c
        L20:
            java.lang.Object r8 = r8.d
            if (r8 != 0) goto L25
            goto L3
        L25:
            boolean r2 = r8 instanceof byte[]
            r4 = -1
            if (r2 == 0) goto L51
            r2 = r8
            byte[] r2 = (byte[]) r2
            int r8 = r2.length
            int r5 = r8 + (-1)
            int r8 = r9.hashCode()
            int r8 = defpackage.gr7.G(r8)
        L38:
            r8 = r8 & r5
            r4 = r2[r8]
            r6 = 255(0xff, float:3.57E-43)
            r4 = r4 & r6
            if (r4 != r6) goto L41
            goto L3
        L41:
            r6 = r3[r4]
            boolean r6 = r9.equals(r6)
            if (r6 == 0) goto L4e
            r8 = r4 ^ 1
            r8 = r3[r8]
            goto L9c
        L4e:
            int r8 = r8 + 1
            goto L38
        L51:
            boolean r2 = r8 instanceof short[]
            if (r2 == 0) goto L7d
            r2 = r8
            short[] r2 = (short[]) r2
            int r8 = r2.length
            int r5 = r8 + (-1)
            int r8 = r9.hashCode()
            int r8 = defpackage.gr7.G(r8)
        L63:
            r8 = r8 & r5
            short r4 = r2[r8]
            char r4 = (char) r4
            r6 = 65535(0xffff, float:9.1834E-41)
            if (r4 != r6) goto L6d
            goto L3
        L6d:
            r6 = r3[r4]
            boolean r6 = r9.equals(r6)
            if (r6 == 0) goto L7a
            r8 = r4 ^ 1
            r8 = r3[r8]
            goto L9c
        L7a:
            int r8 = r8 + 1
            goto L63
        L7d:
            int[] r8 = (int[]) r8
            int r2 = r8.length
            int r2 = r2 + r4
            int r5 = r9.hashCode()
            int r5 = defpackage.gr7.G(r5)
        L89:
            r5 = r5 & r2
            r6 = r8[r5]
            if (r6 != r4) goto L90
            goto L3
        L90:
            r7 = r3[r6]
            boolean r7 = r9.equals(r7)
            if (r7 == 0) goto La0
            r8 = r6 ^ 1
            r8 = r3[r8]
        L9c:
            if (r8 != 0) goto L9f
            return r0
        L9f:
            return r8
        La0:
            int r5 = r5 + 1
            goto L89
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.khg.get(java.lang.Object):java.lang.Object");
    }

    @Override // java.util.Map, j$.util.Map
    public final Object getOrDefault(Object obj, Object obj2) {
        Object obj3 = get(obj);
        return obj3 != null ? obj3 : obj2;
    }

    @Override // java.util.Map
    public final int hashCode() {
        Iterator it2 = entrySet().iterator();
        int iHashCode = 0;
        while (it2.hasNext()) {
            Object next = it2.next();
            iHashCode += next != null ? next.hashCode() : 0;
        }
        return iHashCode;
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.Map
    public final Set keySet() {
        ihg ihgVar = this.b;
        if (ihgVar != null) {
            return ihgVar;
        }
        ihg ihgVar2 = new ihg(this, new jhg(0, this.f, this.e));
        this.b = ihgVar2;
        return ihgVar2;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final void putAll(java.util.Map map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object putIfAbsent(Object obj, Object obj2) {
        return Map.CC.$default$putIfAbsent(this, obj, obj2);
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object replace(Object obj, Object obj2) {
        return Map.CC.$default$replace(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void replaceAll(BiFunction biFunction) {
        Map.CC.$default$replaceAll(this, biFunction);
    }

    @Override // java.util.Map
    public final int size() {
        return this.f;
    }

    public final String toString() {
        int i = this.f;
        br7.G(i, "size");
        StringBuilder sb = new StringBuilder((int) Math.min(((long) i) * 8, 1073741824L));
        sb.append('{');
        boolean z = true;
        for (Map.Entry entry : (ghg) entrySet()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append(entry.getKey());
            sb.append('=');
            sb.append(entry.getValue());
            z = false;
        }
        sb.append('}');
        return sb.toString();
    }

    @Override // java.util.Map
    public final Collection values() {
        jhg jhgVar = this.c;
        if (jhgVar != null) {
            return jhgVar;
        }
        jhg jhgVar2 = new jhg(1, this.f, this.e);
        this.c = jhgVar2;
        return jhgVar2;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ boolean replace(Object obj, Object obj2, Object obj3) {
        return Map.CC.$default$replace(this, obj, obj2, obj3);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ boolean remove(Object obj, Object obj2) {
        return Map.CC.$default$remove(this, obj, obj2);
    }
}
