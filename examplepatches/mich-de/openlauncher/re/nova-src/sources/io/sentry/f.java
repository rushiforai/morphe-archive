package io.sentry;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes4.dex */
public final class f implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f67217a;

    /* renamed from: b, reason: collision with root package name */
    public int f67218b = -1;

    /* renamed from: c, reason: collision with root package name */
    public boolean f67219c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ g f67220d;

    public f(g gVar) {
        this.f67220d = gVar;
        this.f67217a = gVar.f67241b;
        this.f67219c = gVar.f67243d;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f67219c || this.f67217a != this.f67220d.f67242c;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.f67219c = false;
        int i5 = this.f67217a;
        this.f67218b = i5;
        int i11 = i5 + 1;
        g gVar = this.f67220d;
        this.f67217a = i11 < gVar.f67244e ? i11 : 0;
        return gVar.f67240a[i5];
    }

    @Override // java.util.Iterator
    public final void remove() {
        int i5;
        g gVar = this.f67220d;
        int i11 = gVar.f67244e;
        Object[] objArr = gVar.f67240a;
        int i12 = this.f67218b;
        if (i12 == -1) {
            throw new IllegalStateException();
        }
        int i13 = gVar.f67241b;
        if (i12 == i13) {
            gVar.remove();
            this.f67218b = -1;
            return;
        }
        int i14 = i12 + 1;
        if (i13 >= i12 || i14 >= (i5 = gVar.f67242c)) {
            while (i14 != gVar.f67242c) {
                if (i14 >= i11) {
                    objArr[i14 - 1] = objArr[0];
                } else {
                    int i15 = i14 - 1;
                    if (i15 < 0) {
                        i15 = i11 - 1;
                    }
                    objArr[i15] = objArr[i14];
                    i14++;
                    if (i14 >= i11) {
                    }
                }
                i14 = 0;
            }
        } else {
            System.arraycopy(objArr, i14, objArr, i12, i5 - i14);
        }
        this.f67218b = -1;
        int i16 = gVar.f67242c - 1;
        if (i16 < 0) {
            i16 = i11 - 1;
        }
        gVar.f67242c = i16;
        objArr[i16] = null;
        gVar.f67243d = false;
        int i17 = this.f67217a - 1;
        if (i17 < 0) {
            i17 = i11 - 1;
        }
        this.f67217a = i17;
    }
}
