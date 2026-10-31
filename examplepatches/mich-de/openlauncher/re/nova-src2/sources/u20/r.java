package u20;

import java.util.ArrayList;
import java.util.Collection;

/* loaded from: classes4.dex */
public final class r extends ArrayList {

    /* renamed from: a, reason: collision with root package name */
    public ArrayList f90502a;

    /* renamed from: b, reason: collision with root package name */
    public ex.a f90503b;

    /* renamed from: c, reason: collision with root package name */
    public ArrayList f90504c;

    /* renamed from: d, reason: collision with root package name */
    public aa.n f90505d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f90506e;

    @Override // java.util.ArrayList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        this.f90506e = false;
        return super.addAll(collection);
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final boolean add(e eVar) {
        this.f90506e = false;
        return super.add(eVar);
    }

    public final c d(String str) {
        if (this.f90502a == null) {
            this.f90502a = new ArrayList();
        }
        if (this.f90506e) {
            this.f90506e = false;
            this.f90502a.remove(r0.size() - 1);
        }
        int size = size();
        c cVar = new c();
        cVar.f90462b = false;
        cVar.f90461a = str;
        cVar.f90463c = size;
        this.f90502a.add(cVar);
        return cVar;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public final boolean addAll(int i5, Collection collection) {
        this.f90506e = false;
        return super.addAll(i5, collection);
    }
}
