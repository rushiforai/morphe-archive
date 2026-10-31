package t1;

import java.util.ConcurrentModificationException;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.markers.KMutableListIterator;

/* loaded from: classes2.dex */
public final class h extends a implements KMutableListIterator {

    /* renamed from: c, reason: collision with root package name */
    public final f f88451c;

    /* renamed from: d, reason: collision with root package name */
    public int f88452d;

    /* renamed from: e, reason: collision with root package name */
    public j f88453e;

    /* renamed from: f, reason: collision with root package name */
    public int f88454f;

    public h(f fVar, int i5) {
        super(i5, fVar.f88448h);
        this.f88451c = fVar;
        this.f88452d = fVar.g();
        this.f88454f = -1;
        b();
    }

    public final void a() {
        if (this.f88452d != this.f88451c.g()) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // t1.a, java.util.ListIterator
    public final void add(Object obj) {
        a();
        int i5 = this.f88431a;
        f fVar = this.f88451c;
        fVar.add(i5, obj);
        this.f88431a++;
        this.f88432b = fVar.getF71724c();
        this.f88452d = fVar.g();
        this.f88454f = -1;
        b();
    }

    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r6v4 */
    public final void b() {
        f fVar = this.f88451c;
        Object[] objArr = fVar.f88446f;
        if (objArr == null) {
            this.f88453e = null;
            return;
        }
        int i5 = (fVar.f88448h - 1) & (-32);
        int i11 = this.f88431a;
        if (i11 > i5) {
            i11 = i5;
        }
        int i12 = (fVar.f88444d / 5) + 1;
        j jVar = this.f88453e;
        if (jVar == null) {
            this.f88453e = new j(objArr, i11, i5, i12);
            return;
        }
        jVar.f88431a = i11;
        jVar.f88432b = i5;
        jVar.f88457c = i12;
        if (jVar.f88458d.length < i12) {
            jVar.f88458d = new Object[i12];
        }
        jVar.f88458d[0] = objArr;
        ?? r62 = i11 == i5 ? 1 : 0;
        jVar.f88459e = r62;
        jVar.b(i11 - r62, 1);
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        a();
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f88431a;
        this.f88454f = i5;
        j jVar = this.f88453e;
        f fVar = this.f88451c;
        if (jVar == null) {
            Object[] objArr = fVar.f88447g;
            this.f88431a = i5 + 1;
            return objArr[i5];
        }
        if (jVar.hasNext()) {
            this.f88431a++;
            return jVar.next();
        }
        Object[] objArr2 = fVar.f88447g;
        int i11 = this.f88431a;
        this.f88431a = i11 + 1;
        return objArr2[i11 - jVar.f88432b];
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        a();
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f88431a;
        this.f88454f = i5 - 1;
        j jVar = this.f88453e;
        f fVar = this.f88451c;
        if (jVar == null) {
            Object[] objArr = fVar.f88447g;
            int i11 = i5 - 1;
            this.f88431a = i11;
            return objArr[i11];
        }
        int i12 = jVar.f88432b;
        if (i5 <= i12) {
            this.f88431a = i5 - 1;
            return jVar.previous();
        }
        Object[] objArr2 = fVar.f88447g;
        int i13 = i5 - 1;
        this.f88431a = i13;
        return objArr2[i13 - i12];
    }

    @Override // t1.a, java.util.ListIterator, java.util.Iterator
    public final void remove() {
        a();
        int i5 = this.f88454f;
        if (i5 == -1) {
            throw new IllegalStateException();
        }
        f fVar = this.f88451c;
        fVar.d(i5);
        int i11 = this.f88454f;
        if (i11 < this.f88431a) {
            this.f88431a = i11;
        }
        this.f88432b = fVar.getF71724c();
        this.f88452d = fVar.g();
        this.f88454f = -1;
        b();
    }

    @Override // t1.a, java.util.ListIterator
    public final void set(Object obj) {
        a();
        int i5 = this.f88454f;
        if (i5 == -1) {
            throw new IllegalStateException();
        }
        f fVar = this.f88451c;
        fVar.set(i5, obj);
        this.f88452d = fVar.g();
        b();
    }
}
