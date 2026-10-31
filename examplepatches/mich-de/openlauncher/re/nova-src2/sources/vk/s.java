package vk;

import b.c0;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public abstract class s implements Iterator {

    /* renamed from: b, reason: collision with root package name */
    public String f92827b;

    /* renamed from: c, reason: collision with root package name */
    public final CharSequence f92828c;

    /* renamed from: d, reason: collision with root package name */
    public final b f92829d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f92830e;

    /* renamed from: g, reason: collision with root package name */
    public int f92832g;

    /* renamed from: a, reason: collision with root package name */
    public int f92826a = 2;

    /* renamed from: f, reason: collision with root package name */
    public int f92831f = 0;

    public s(cz.b bVar, CharSequence charSequence) {
        this.f92829d = (b) bVar.f48575c;
        this.f92830e = bVar.f48573a;
        this.f92832g = bVar.f48574b;
        this.f92828c = charSequence;
    }

    public abstract int a(int i5);

    public abstract int b(int i5);

    @Override // java.util.Iterator
    public final boolean hasNext() {
        String string;
        int iB;
        CharSequence charSequence;
        b bVar;
        int i5 = this.f92826a;
        if (i5 == 4) {
            throw new IllegalStateException();
        }
        int iF = c0.F(i5);
        if (iF == 0) {
            return true;
        }
        if (iF == 2) {
            return false;
        }
        this.f92826a = 4;
        int i11 = this.f92831f;
        while (true) {
            int i12 = this.f92831f;
            if (i12 == -1) {
                this.f92826a = 3;
                string = null;
                break;
            }
            iB = b(i12);
            charSequence = this.f92828c;
            if (iB == -1) {
                iB = charSequence.length();
                this.f92831f = -1;
            } else {
                this.f92831f = a(iB);
            }
            int i13 = this.f92831f;
            if (i13 == i11) {
                int i14 = i13 + 1;
                this.f92831f = i14;
                if (i14 > charSequence.length()) {
                    this.f92831f = -1;
                }
            } else {
                while (true) {
                    bVar = this.f92829d;
                    if (i11 >= iB || !bVar.a(charSequence.charAt(i11))) {
                        break;
                    }
                    i11++;
                }
                while (iB > i11 && bVar.a(charSequence.charAt(iB - 1))) {
                    iB--;
                }
                if (!this.f92830e || i11 != iB) {
                    break;
                }
                i11 = this.f92831f;
            }
        }
        int i15 = this.f92832g;
        if (i15 == 1) {
            iB = charSequence.length();
            this.f92831f = -1;
            while (iB > i11 && bVar.a(charSequence.charAt(iB - 1))) {
                iB--;
            }
        } else {
            this.f92832g = i15 - 1;
        }
        string = charSequence.subSequence(i11, iB).toString();
        this.f92827b = string;
        if (this.f92826a == 3) {
            return false;
        }
        this.f92826a = 1;
        return true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.f92826a = 2;
        String str = this.f92827b;
        this.f92827b = null;
        return str;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
