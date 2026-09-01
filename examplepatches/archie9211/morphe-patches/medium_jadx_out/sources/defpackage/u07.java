package defpackage;

import java.util.AbstractMap;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class u07 implements Iterator {
    public int b;
    public Map.Entry c;
    public final /* synthetic */ AbstractMap e;
    public final /* synthetic */ int a = 1;
    public Map.Entry d = null;

    public u07(b17 b17Var) {
        this.e = b17Var;
        this.c = b17Var.f.d;
        this.b = b17Var.e;
    }

    public v07 a() {
        v07 v07Var = (v07) this.c;
        w07 w07Var = (w07) this.e;
        if (v07Var == w07Var.c) {
            ywb.n();
            return null;
        }
        if (w07Var.e != this.b) {
            z10.g();
            return null;
        }
        this.c = v07Var.d;
        this.d = v07Var;
        return v07Var;
    }

    public a17 b() {
        a17 a17Var = (a17) this.c;
        b17 b17Var = (b17) this.e;
        if (a17Var == b17Var.f) {
            ywb.n();
            return null;
        }
        if (b17Var.e != this.b) {
            z10.g();
            return null;
        }
        this.c = a17Var.d;
        this.d = a17Var;
        return a17Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        AbstractMap abstractMap = this.e;
        switch (i) {
            case 0:
                if (((v07) this.c) != ((w07) abstractMap).c) {
                }
                break;
            default:
                if (((a17) this.c) != ((b17) abstractMap).f) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.Iterator
    public Object next() {
        switch (this.a) {
            case 0:
                return a();
            default:
                return b();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        int i = this.a;
        AbstractMap abstractMap = this.e;
        switch (i) {
            case 0:
                w07 w07Var = (w07) abstractMap;
                v07 v07Var = (v07) this.d;
                if (v07Var == null) {
                    lg8.d();
                } else {
                    w07Var.c(v07Var, true);
                    this.d = null;
                    this.b = w07Var.e;
                }
                break;
            default:
                b17 b17Var = (b17) abstractMap;
                a17 a17Var = (a17) this.d;
                if (a17Var == null) {
                    lg8.d();
                } else {
                    b17Var.c(a17Var, true);
                    this.d = null;
                    this.b = b17Var.e;
                }
                break;
        }
    }

    public u07(w07 w07Var) {
        this.e = w07Var;
        this.c = w07Var.c.d;
        this.b = w07Var.e;
    }
}
