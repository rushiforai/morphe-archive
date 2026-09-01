package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wgg extends vgg {
    public final /* synthetic */ int d;
    public final transient Object e;

    public /* synthetic */ wgg(int i, Object obj) {
        this.d = i;
        this.e = obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        int i = this.d;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    Object key = entry.getKey();
                    Object value = entry.getValue();
                    Collection collection = (Collection) ((xgg) obj2).a().get(key);
                    if (collection != null && collection.contains(value)) {
                        return true;
                    }
                }
                return false;
            default:
                return obj2.equals(obj);
        }
    }

    @Override // defpackage.agg
    public final ugf d() {
        int i = this.d;
        Object obj = this.e;
        switch (i) {
            case 0:
                return new rgg((xgg) obj);
            default:
                return new ahg(obj);
        }
    }

    @Override // defpackage.vgg, java.util.Collection, java.util.Set
    public int hashCode() {
        switch (this.d) {
            case 1:
                return this.e.hashCode();
            default:
                return super.hashCode();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        int i = this.d;
        Object obj = this.e;
        switch (i) {
            case 0:
                return new rgg((xgg) obj);
            default:
                return new ahg(obj);
        }
    }

    @Override // defpackage.agg
    public final boolean p() {
        switch (this.d) {
        }
        return false;
    }

    @Override // defpackage.agg
    public int q(Object[] objArr) {
        switch (this.d) {
            case 1:
                objArr[0] = this.e;
                return 1;
            default:
                return super.q(objArr);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        switch (this.d) {
            case 0:
                return ((xgg) this.e).b;
            default:
                return 1;
        }
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        switch (this.d) {
            case 1:
                String string = this.e.toString();
                return y30.s(new StringBuilder(String.valueOf(string).length() + 2), "[", string, "]");
            default:
                return super.toString();
        }
    }
}
