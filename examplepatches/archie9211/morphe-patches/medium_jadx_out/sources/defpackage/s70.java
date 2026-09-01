package defpackage;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class s70 extends AbstractSet {
    public final /* synthetic */ int a;
    public final /* synthetic */ Map b;

    public /* synthetic */ s70(int i, Map map) {
        this.a = i;
        this.b = map;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean add(Object obj) {
        int i = this.a;
        Map map = this.b;
        switch (i) {
            case 1:
                Map.Entry entry = (Map.Entry) obj;
                if (contains(entry)) {
                    return false;
                }
                ((mgc) map).put((Comparable) entry.getKey(), entry.getValue());
                return true;
            case 2:
                Map.Entry entry2 = (Map.Entry) obj;
                if (contains(entry2)) {
                    return false;
                }
                ((ngc) map).f((Comparable) entry2.getKey(), entry2.getValue());
                return true;
            case 3:
                Map.Entry entry3 = (Map.Entry) obj;
                if (contains(entry3)) {
                    return false;
                }
                ((ogc) map).put((Comparable) entry3.getKey(), entry3.getValue());
                return true;
            case 4:
                Map.Entry entry4 = (Map.Entry) obj;
                if (contains(entry4)) {
                    return false;
                }
                ((h8g) map).put((Comparable) entry4.getKey(), entry4.getValue());
                return true;
            default:
                return super.add(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        int i = this.a;
        Map map = this.b;
        switch (i) {
            case 1:
                ((mgc) map).clear();
                break;
            case 2:
                ((ngc) map).clear();
                break;
            case 3:
                ((ogc) map).clear();
                break;
            case 4:
                ((h8g) map).clear();
                break;
            default:
                super.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        int i = this.a;
        Map map = this.b;
        switch (i) {
            case 1:
                Map.Entry entry = (Map.Entry) obj;
                Object obj2 = ((mgc) map).get(entry.getKey());
                Object value = entry.getValue();
                if (obj2 != value) {
                    return obj2 != null && obj2.equals(value);
                }
                return true;
            case 2:
                Map.Entry entry2 = (Map.Entry) obj;
                Object obj3 = ((ngc) map).get(entry2.getKey());
                Object value2 = entry2.getValue();
                if (obj3 != value2) {
                    return obj3 != null && obj3.equals(value2);
                }
                return true;
            case 3:
                Map.Entry entry3 = (Map.Entry) obj;
                Object obj4 = ((ogc) map).get(entry3.getKey());
                Object value3 = entry3.getValue();
                if (obj4 != value3) {
                    return obj4 != null && obj4.equals(value3);
                }
                return true;
            case 4:
                Map.Entry entry4 = (Map.Entry) obj;
                Object obj5 = ((h8g) map).get(entry4.getKey());
                Object value4 = entry4.getValue();
                if (obj5 != value4) {
                    return obj5 != null && obj5.equals(value4);
                }
                return true;
            default:
                return super.contains(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator iterator() {
        int i = this.a;
        Map map = this.b;
        switch (i) {
            case 0:
                return new v70((y70) map);
            case 1:
                return new tgc((mgc) map, 0);
            case 2:
                return new tgc((ngc) map, 1);
            case 3:
                return new tgc((ogc) map, 2);
            default:
                return new tgc((h8g) map, 3);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean remove(Object obj) {
        int i = this.a;
        Map map = this.b;
        switch (i) {
            case 1:
                Map.Entry entry = (Map.Entry) obj;
                if (!contains(entry)) {
                    return false;
                }
                ((mgc) map).remove(entry.getKey());
                return true;
            case 2:
                Map.Entry entry2 = (Map.Entry) obj;
                if (!contains(entry2)) {
                    return false;
                }
                ((ngc) map).remove(entry2.getKey());
                return true;
            case 3:
                Map.Entry entry3 = (Map.Entry) obj;
                if (!contains(entry3)) {
                    return false;
                }
                ((ogc) map).remove(entry3.getKey());
                return true;
            case 4:
                Map.Entry entry4 = (Map.Entry) obj;
                if (!contains(entry4)) {
                    return false;
                }
                ((h8g) map).remove(entry4.getKey());
                return true;
            default:
                return super.remove(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        int i = this.a;
        Map map = this.b;
        switch (i) {
            case 0:
                return ((y70) map).c;
            case 1:
                return ((mgc) map).size();
            case 2:
                return ((ngc) map).size();
            case 3:
                return ((ogc) map).size();
            default:
                return ((h8g) map).size();
        }
    }
}
