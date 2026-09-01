package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ghg extends vgg {
    public final transient khg d;
    public final transient Object[] e;
    public final transient int f;

    public ghg(khg khgVar, Object[] objArr, int i) {
        this.d = khgVar;
        this.e = objArr;
        this.f = i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) obj;
        Object key = entry.getKey();
        Object value = entry.getValue();
        return value != null && value.equals(this.d.get(key));
    }

    @Override // defpackage.agg
    public final ugf d() {
        return s().listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return s().listIterator(0);
    }

    @Override // defpackage.agg
    public final boolean p() {
        return true;
    }

    @Override // defpackage.agg
    public final int q(Object[] objArr) {
        return s().q(objArr);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f;
    }

    @Override // defpackage.vgg
    public final mgg t() {
        return new ehg(this);
    }
}
