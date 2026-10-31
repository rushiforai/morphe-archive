package aq;

import java.util.AbstractMap;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;

/* loaded from: classes4.dex */
public abstract class b0 implements Iterator {

    /* renamed from: b, reason: collision with root package name */
    public int f15413b;

    /* renamed from: c, reason: collision with root package name */
    public Map.Entry f15414c;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ AbstractMap f15416e;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15412a = 0;

    /* renamed from: d, reason: collision with root package name */
    public Map.Entry f15415d = null;

    public b0(ep.o oVar) {
        this.f15416e = oVar;
        this.f15414c = oVar.f52895f.f52883d;
        this.f15413b = oVar.f52894e;
    }

    public c0 a() {
        c0 c0Var = (c0) this.f15414c;
        d0 d0Var = (d0) this.f15416e;
        if (c0Var == d0Var.f15442c) {
            throw new NoSuchElementException();
        }
        if (d0Var.f15444e != this.f15413b) {
            throw new ConcurrentModificationException();
        }
        this.f15414c = c0Var.f15426d;
        this.f15415d = c0Var;
        return c0Var;
    }

    public ep.n b() {
        ep.n nVar = (ep.n) this.f15414c;
        ep.o oVar = (ep.o) this.f15416e;
        if (nVar == oVar.f52895f) {
            throw new NoSuchElementException();
        }
        if (oVar.f52894e != this.f15413b) {
            throw new ConcurrentModificationException();
        }
        this.f15414c = nVar.f52883d;
        this.f15415d = nVar;
        return nVar;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f15412a) {
            case 0:
                if (((c0) this.f15414c) != ((d0) this.f15416e).f15442c) {
                }
                break;
            default:
                if (((ep.n) this.f15414c) != ((ep.o) this.f15416e).f52895f) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public Object next() {
        switch (this.f15412a) {
            case 0:
                return a();
            default:
                return b();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f15412a) {
            case 0:
                d0 d0Var = (d0) this.f15416e;
                c0 c0Var = (c0) this.f15415d;
                if (c0Var == null) {
                    throw new IllegalStateException();
                }
                d0Var.c(c0Var, true);
                this.f15415d = null;
                this.f15413b = d0Var.f15444e;
                return;
            default:
                ep.o oVar = (ep.o) this.f15416e;
                ep.n nVar = (ep.n) this.f15415d;
                if (nVar == null) {
                    throw new IllegalStateException();
                }
                oVar.c(nVar, true);
                this.f15415d = null;
                this.f15413b = oVar.f52894e;
                return;
        }
    }

    public b0(d0 d0Var) {
        this.f15416e = d0Var;
        this.f15414c = d0Var.f15442c.f15426d;
        this.f15413b = d0Var.f15444e;
    }
}
