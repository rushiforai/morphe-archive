package hn;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public final class l implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public n f59916a;

    /* renamed from: b, reason: collision with root package name */
    public n f59917b = null;

    /* renamed from: c, reason: collision with root package name */
    public int f59918c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ o f59919d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f59920e;

    public l(o oVar, int i5) {
        this.f59920e = i5;
        this.f59919d = oVar;
        this.f59916a = oVar.f59938f.f59926d;
        this.f59918c = oVar.f59937e;
    }

    public final Object a() {
        return b();
    }

    public final n b() {
        n nVar = this.f59916a;
        o oVar = this.f59919d;
        if (nVar == oVar.f59938f) {
            throw new NoSuchElementException();
        }
        if (oVar.f59937e != this.f59918c) {
            throw new ConcurrentModificationException();
        }
        this.f59916a = nVar.f59926d;
        this.f59917b = nVar;
        return nVar;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f59916a != this.f59919d.f59938f;
    }

    @Override // java.util.Iterator
    public Object next() {
        switch (this.f59920e) {
            case 1:
                return b().f59928f;
            default:
                return a();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        n nVar = this.f59917b;
        if (nVar == null) {
            throw new IllegalStateException();
        }
        o oVar = this.f59919d;
        oVar.c(nVar, true);
        this.f59917b = null;
        this.f59918c = oVar.f59937e;
    }
}
