package mh;

import java.util.Set;

/* loaded from: classes3.dex */
public abstract class l extends f implements Set {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f76354c = 0;

    /* renamed from: b, reason: collision with root package name */
    public transient j f76355b;

    @Override // java.util.Collection, java.util.Set
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof l) && (this instanceof v) && (((l) obj) instanceof v) && ((v) this).f76390e != obj.hashCode()) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Set)) {
            return false;
        }
        Set set = (Set) obj;
        try {
            if (size() == set.size()) {
                return containsAll(set);
            }
            return false;
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    public j g() {
        j jVar = this.f76355b;
        if (jVar != null) {
            return jVar;
        }
        j jVarH = h();
        this.f76355b = jVarH;
        return jVarH;
    }

    public j h() {
        Object[] array = toArray(f.f76333a);
        g gVar = j.f76346b;
        return j.j(array.length, array);
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        return a.b(this);
    }
}
