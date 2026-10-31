package androidx.datastore.preferences.protobuf;

import ads_mobile_sdk.ob3;
import com.google.android.gms.internal.consent_sdk.v6;
import com.google.android.gms.internal.measurement.ni;
import com.google.android.gms.internal.measurement.v2;
import com.google.android.gms.internal.play_billing.z3;
import com.google.protobuf.d2;
import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes2.dex */
public class e1 extends AbstractSet {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14312a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14313b;

    public /* synthetic */ e1(Object obj, int i5) {
        this.f14312a = i5;
        this.f14313b = obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean add(Object obj) {
        switch (this.f14312a) {
            case 0:
                Map.Entry entry = (Map.Entry) obj;
                if (contains(entry)) {
                    return false;
                }
                ((b1) this.f14313b).put((Comparable) entry.getKey(), entry.getValue());
                return true;
            case 1:
            case 4:
            default:
                return super.add(obj);
            case 2:
                Map.Entry entry2 = (Map.Entry) obj;
                if (contains(entry2)) {
                    return false;
                }
                ((v6) this.f14313b).put((Comparable) entry2.getKey(), entry2.getValue());
                return true;
            case 3:
                Map.Entry entry3 = (Map.Entry) obj;
                if (contains(entry3)) {
                    return false;
                }
                ((v2) this.f14313b).put((Comparable) entry3.getKey(), entry3.getValue());
                return true;
            case 5:
                Map.Entry entry4 = (Map.Entry) obj;
                if (contains(entry4)) {
                    return false;
                }
                ((z3) this.f14313b).put((Comparable) entry4.getKey(), entry4.getValue());
                return true;
            case 6:
                Map.Entry entry5 = (Map.Entry) obj;
                if (contains(entry5)) {
                    return false;
                }
                ((d2) this.f14313b).put((Comparable) entry5.getKey(), entry5.getValue());
                return true;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        switch (this.f14312a) {
            case 0:
                ((b1) this.f14313b).clear();
                break;
            case 1:
            case 4:
            default:
                super.clear();
                break;
            case 2:
                ((v6) this.f14313b).clear();
                break;
            case 3:
                ((v2) this.f14313b).clear();
                break;
            case 5:
                ((z3) this.f14313b).clear();
                break;
            case 6:
                ((d2) this.f14313b).clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        switch (this.f14312a) {
            case 0:
                Map.Entry entry = (Map.Entry) obj;
                Object obj2 = ((b1) this.f14313b).get(entry.getKey());
                Object value = entry.getValue();
                return obj2 == value || (obj2 != null && obj2.equals(value));
            case 1:
                Map.Entry entry2 = (Map.Entry) obj;
                ((ob3) this.f14313b).get(entry2.getKey());
                return entry2.getValue() == null;
            case 2:
                Map.Entry entry3 = (Map.Entry) obj;
                Object obj3 = ((v6) this.f14313b).get(entry3.getKey());
                Object value2 = entry3.getValue();
                if (obj3 != value2) {
                    return obj3 != null && obj3.equals(value2);
                }
                return true;
            case 3:
                Map.Entry entry4 = (Map.Entry) obj;
                Object obj4 = ((v2) this.f14313b).get(entry4.getKey());
                Object value3 = entry4.getValue();
                if (obj4 != value3) {
                    return obj4 != null && obj4.equals(value3);
                }
                return true;
            case 4:
            default:
                return super.contains(obj);
            case 5:
                Map.Entry entry5 = (Map.Entry) obj;
                Object obj5 = ((z3) this.f14313b).get(entry5.getKey());
                Object value4 = entry5.getValue();
                if (obj5 != value4) {
                    return obj5 != null && obj5.equals(value4);
                }
                return true;
            case 6:
                Map.Entry entry6 = (Map.Entry) obj;
                Object obj6 = ((d2) this.f14313b).get(entry6.getKey());
                Object value5 = entry6.getValue();
                return obj6 == value5 || (obj6 != null && obj6.equals(value5));
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator iterator() {
        switch (this.f14312a) {
            case 0:
                return new d1((b1) this.f14313b, 0);
            case 1:
                ob3 ob3Var = (ob3) this.f14313b;
                ob3Var.b$1();
                return new com.google.android.gms.internal.measurement.b1(ob3Var);
            case 2:
                return new d1((v6) this.f14313b);
            case 3:
                return new d1((v2) this.f14313b);
            case 4:
                return new com.google.android.gms.internal.measurement.u(this, 1);
            case 5:
                return new d1((z3) this.f14313b);
            case 6:
                return new d1((d2) this.f14313b, 4);
            default:
                return new z.c((z.e) this.f14313b);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean remove(Object obj) {
        switch (this.f14312a) {
            case 0:
                Map.Entry entry = (Map.Entry) obj;
                if (!contains(entry)) {
                    return false;
                }
                ((b1) this.f14313b).remove(entry.getKey());
                return true;
            case 1:
            case 4:
            default:
                return super.remove(obj);
            case 2:
                Map.Entry entry2 = (Map.Entry) obj;
                if (!contains(entry2)) {
                    return false;
                }
                ((v6) this.f14313b).remove(entry2.getKey());
                return true;
            case 3:
                Map.Entry entry3 = (Map.Entry) obj;
                if (!contains(entry3)) {
                    return false;
                }
                ((v2) this.f14313b).remove(entry3.getKey());
                return true;
            case 5:
                Map.Entry entry4 = (Map.Entry) obj;
                if (!contains(entry4)) {
                    return false;
                }
                ((z3) this.f14313b).remove(entry4.getKey());
                return true;
            case 6:
                Map.Entry entry5 = (Map.Entry) obj;
                if (!contains(entry5)) {
                    return false;
                }
                ((d2) this.f14313b).remove(entry5.getKey());
                return true;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        switch (this.f14312a) {
            case 0:
                return ((b1) this.f14313b).size();
            case 1:
                ob3 ob3Var = (ob3) this.f14313b;
                ob3Var.b$1();
                return ob3Var.f7809b;
            case 2:
                return ((v6) this.f14313b).size();
            case 3:
                return ((v2) this.f14313b).size();
            case 4:
                return ((ni) this.f14313b).f32864e;
            case 5:
                return ((z3) this.f14313b).size();
            case 6:
                return ((d2) this.f14313b).size();
            default:
                return ((z.e) this.f14313b).f97753c;
        }
    }
}
