package defpackage;

import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gj7 extends k1 {
    public final /* synthetic */ int a = 0;
    public final Object b;

    public gj7(List list) {
        list.getClass();
        this.b = list;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public /* bridge */ boolean contains(Object obj) {
        switch (this.a) {
            case 0:
                if (obj instanceof String) {
                    return super.contains((String) obj);
                }
                return false;
            default:
                return super.contains(obj);
        }
    }

    @Override // java.util.List
    public final Object get(int i) {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                String strGroup = ((ij7) obj).a.group(i);
                return strGroup == null ? "" : strGroup;
            default:
                return ((List) obj).get(bu1.W0(i, this));
        }
    }

    @Override // defpackage.t0
    public final int getSize() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((ij7) obj).a.groupCount() + 1;
            default:
                return ((List) obj).size();
        }
    }

    @Override // defpackage.k1, java.util.List
    public /* bridge */ int indexOf(Object obj) {
        switch (this.a) {
            case 0:
                if (obj instanceof String) {
                    return super.indexOf((String) obj);
                }
                return -1;
            default:
                return super.indexOf(obj);
        }
    }

    @Override // defpackage.k1, java.util.Collection, java.lang.Iterable, java.util.List
    public Iterator iterator() {
        switch (this.a) {
            case 1:
                return new vjb(this, 0);
            default:
                return super.iterator();
        }
    }

    @Override // defpackage.k1, java.util.List
    public /* bridge */ int lastIndexOf(Object obj) {
        switch (this.a) {
            case 0:
                if (obj instanceof String) {
                    return super.lastIndexOf((String) obj);
                }
                return -1;
            default:
                return super.lastIndexOf(obj);
        }
    }

    @Override // defpackage.k1, java.util.List
    public ListIterator listIterator() {
        switch (this.a) {
            case 1:
                return new vjb(this, 0);
            default:
                return super.listIterator();
        }
    }

    public gj7(ij7 ij7Var) {
        this.b = ij7Var;
    }

    @Override // defpackage.k1, java.util.List
    public ListIterator listIterator(int i) {
        switch (this.a) {
            case 1:
                return new vjb(this, i);
            default:
                return super.listIterator(i);
        }
    }
}
