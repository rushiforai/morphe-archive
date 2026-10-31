package xk;

import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

/* loaded from: classes3.dex */
public class e implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95898a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final Iterator f95899b;

    /* renamed from: c, reason: collision with root package name */
    public Object f95900c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f95901d;

    public e(n nVar) {
        this.f95901d = nVar;
        Collection collection = nVar.f95968b;
        this.f95900c = collection;
        this.f95899b = collection instanceof List ? ((List) collection).listIterator() : collection.iterator();
    }

    public void a() {
        n nVar = (n) this.f95901d;
        nVar.d();
        if (nVar.f95968b != ((Collection) this.f95900c)) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f95898a) {
            case 0:
                break;
            case 1:
                break;
            default:
                a();
                break;
        }
        return this.f95899b.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f95898a) {
            case 0:
                Map.Entry entry = (Map.Entry) this.f95899b.next();
                this.f95900c = (Collection) entry.getValue();
                return ((f) this.f95901d).a(entry);
            case 1:
                Map.Entry entry2 = (Map.Entry) this.f95899b.next();
                this.f95900c = entry2;
                return entry2.getKey();
            default:
                a();
                return this.f95899b.next();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f95898a) {
            case 0:
                vk.b0.j("no calls to next() since the last call to remove()", ((Collection) this.f95900c) != null);
                this.f95899b.remove();
                ((f) this.f95901d).f95909d.f95894e -= ((Collection) this.f95900c).size();
                ((Collection) this.f95900c).clear();
                this.f95900c = null;
                break;
            case 1:
                vk.b0.j("no calls to next() since the last call to remove()", ((Map.Entry) this.f95900c) != null);
                Collection collection = (Collection) ((Map.Entry) this.f95900c).getValue();
                this.f95899b.remove();
                ((g) this.f95901d).f95915b.f95894e -= collection.size();
                collection.clear();
                this.f95900c = null;
                break;
            default:
                this.f95899b.remove();
                n nVar = (n) this.f95901d;
                d2 d2Var = nVar.f95971e;
                d2Var.f95894e--;
                nVar.e();
                break;
        }
    }

    public e(n nVar, ListIterator listIterator) {
        this.f95901d = nVar;
        this.f95900c = nVar.f95968b;
        this.f95899b = listIterator;
    }

    public e(g gVar, Iterator it) {
        this.f95901d = gVar;
        this.f95899b = it;
    }

    public e(f fVar) {
        this.f95901d = fVar;
        this.f95899b = fVar.f95908c.entrySet().iterator();
    }
}
