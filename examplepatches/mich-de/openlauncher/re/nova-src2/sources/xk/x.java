package xk;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class x implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f96046a;

    /* renamed from: b, reason: collision with root package name */
    public int f96047b;

    /* renamed from: c, reason: collision with root package name */
    public int f96048c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ a0 f96049d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f96050e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ a0 f96051f;

    public x(a0 a0Var, int i5) {
        this.f96050e = i5;
        this.f96051f = a0Var;
        this.f96049d = a0Var;
        this.f96046a = a0Var.f95853e;
        this.f96047b = a0Var.isEmpty() ? -1 : 0;
        this.f96048c = -1;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f96047b >= 0;
    }

    @Override // java.util.Iterator
    public final Object next() {
        Object zVar;
        a0 a0Var = this.f96049d;
        if (a0Var.f95853e != this.f96046a) {
            throw new ConcurrentModificationException();
        }
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f96047b;
        this.f96048c = i5;
        switch (this.f96050e) {
            case 0:
                zVar = this.f96051f.j()[i5];
                break;
            case 1:
                zVar = new z(this.f96051f, i5);
                break;
            default:
                zVar = this.f96051f.k()[i5];
                break;
        }
        int i11 = this.f96047b + 1;
        if (i11 >= a0Var.f95854f) {
            i11 = -1;
        }
        this.f96047b = i11;
        return zVar;
    }

    @Override // java.util.Iterator
    public final void remove() {
        a0 a0Var = this.f96049d;
        if (a0Var.f95853e != this.f96046a) {
            throw new ConcurrentModificationException();
        }
        w20.e.f(this.f96048c >= 0);
        this.f96046a += 32;
        a0Var.remove(a0Var.j()[this.f96048c]);
        this.f96047b--;
        this.f96048c = -1;
    }
}
