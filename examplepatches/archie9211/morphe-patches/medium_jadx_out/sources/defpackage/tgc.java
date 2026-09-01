package defpackage;

import java.util.AbstractMap;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tgc implements Iterator {
    public final /* synthetic */ int a;
    public int b = -1;
    public boolean c;
    public Iterator d;
    public final /* synthetic */ AbstractMap e;

    public /* synthetic */ tgc(AbstractMap abstractMap, int i) {
        this.a = i;
        this.e = abstractMap;
    }

    public Iterator a() {
        int i = this.a;
        AbstractMap abstractMap = this.e;
        switch (i) {
            case 0:
                Iterator it2 = this.d;
                if (it2 != null) {
                    return it2;
                }
                Iterator it3 = ((mgc) abstractMap).c.entrySet().iterator();
                this.d = it3;
                return it3;
            case 1:
                Iterator it4 = this.d;
                if (it4 != null) {
                    return it4;
                }
                Iterator it5 = ((ngc) abstractMap).c.entrySet().iterator();
                this.d = it5;
                return it5;
            default:
                Iterator it6 = this.d;
                if (it6 != null) {
                    return it6;
                }
                Iterator it7 = ((ogc) abstractMap).b.entrySet().iterator();
                this.d = it7;
                return it7;
        }
    }

    public Iterator b() {
        Iterator it2 = this.d;
        if (it2 != null) {
            return it2;
        }
        Iterator it3 = ((h8g) this.e).c.entrySet().iterator();
        this.d = it3;
        return it3;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        AbstractMap abstractMap = this.e;
        switch (i) {
            case 0:
                mgc mgcVar = (mgc) abstractMap;
                if (this.b + 1 >= mgcVar.b.size()) {
                    if (mgcVar.c.isEmpty() || !a().hasNext()) {
                    }
                }
                break;
            case 1:
                if (this.b + 1 >= ((ngc) abstractMap).b.size() && !a().hasNext()) {
                    break;
                }
                break;
            case 2:
                ogc ogcVar = (ogc) abstractMap;
                if (this.b + 1 >= ogcVar.a.size()) {
                    if (ogcVar.b.isEmpty() || !a().hasNext()) {
                    }
                }
                break;
            default:
                h8g h8gVar = (h8g) abstractMap;
                if (this.b + 1 >= h8gVar.b) {
                    if (h8gVar.c.isEmpty() || !b().hasNext()) {
                    }
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        AbstractMap abstractMap = this.e;
        switch (i) {
            case 0:
                this.c = true;
                int i2 = this.b + 1;
                this.b = i2;
                mgc mgcVar = (mgc) abstractMap;
                return i2 < mgcVar.b.size() ? (Map.Entry) mgcVar.b.get(this.b) : (Map.Entry) a().next();
            case 1:
                this.c = true;
                int i3 = this.b + 1;
                this.b = i3;
                ngc ngcVar = (ngc) abstractMap;
                return i3 < ngcVar.b.size() ? (Map.Entry) ngcVar.b.get(this.b) : (Map.Entry) a().next();
            case 2:
                this.c = true;
                int i4 = this.b + 1;
                this.b = i4;
                ogc ogcVar = (ogc) abstractMap;
                return i4 < ogcVar.a.size() ? (Map.Entry) ogcVar.a.get(this.b) : (Map.Entry) a().next();
            default:
                this.c = true;
                int i5 = this.b + 1;
                this.b = i5;
                h8g h8gVar = (h8g) abstractMap;
                return i5 < h8gVar.b ? (j8g) h8gVar.a[i5] : (Map.Entry) b().next();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        int i = this.a;
        AbstractMap abstractMap = this.e;
        switch (i) {
            case 0:
                mgc mgcVar = (mgc) abstractMap;
                if (!this.c) {
                    ygf.f("remove() was called before next()");
                } else {
                    this.c = false;
                    int i2 = mgc.g;
                    mgcVar.b();
                    if (this.b >= mgcVar.b.size()) {
                        a().remove();
                    } else {
                        int i3 = this.b;
                        this.b = i3 - 1;
                        mgcVar.h(i3);
                    }
                }
                break;
            case 1:
                ngc ngcVar = (ngc) abstractMap;
                if (!this.c) {
                    ygf.f("remove() was called before next()");
                } else {
                    this.c = false;
                    int i4 = ngc.f;
                    ngcVar.b();
                    if (this.b >= ngcVar.b.size()) {
                        a().remove();
                    } else {
                        int i5 = this.b;
                        this.b = i5 - 1;
                        ngcVar.g(i5);
                    }
                }
                break;
            case 2:
                ogc ogcVar = (ogc) abstractMap;
                if (!this.c) {
                    ygf.f("remove() was called before next()");
                } else {
                    this.c = false;
                    int i6 = ogc.f;
                    ogcVar.b();
                    if (this.b >= ogcVar.a.size()) {
                        a().remove();
                    } else {
                        int i7 = this.b;
                        this.b = i7 - 1;
                        ogcVar.i(i7);
                    }
                }
                break;
            default:
                if (!this.c) {
                    ygf.f("remove() was called before next()");
                } else {
                    this.c = false;
                    h8g h8gVar = (h8g) abstractMap;
                    int i8 = h8g.g;
                    h8gVar.h();
                    int i9 = this.b;
                    if (i9 >= h8gVar.b) {
                        b().remove();
                    } else {
                        this.b = i9 - 1;
                        h8gVar.f(i9);
                    }
                }
                break;
        }
    }
}
