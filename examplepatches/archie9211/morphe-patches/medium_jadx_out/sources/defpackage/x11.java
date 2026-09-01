package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x11 implements Iterator {
    public final /* synthetic */ int a = 5;
    public int b = 0;
    public final int c;
    public final /* synthetic */ Iterable d;

    public x11(t3g t3gVar) {
        this.d = t3gVar;
        this.c = t3gVar.f();
    }

    public byte a() {
        try {
            byte[] bArr = ((c57) this.d).b;
            int i = this.b;
            this.b = i + 1;
            return bArr[i];
        } catch (ArrayIndexOutOfBoundsException e) {
            ywb.h(e.getMessage());
            return (byte) 0;
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
            case 0:
                if (this.b < this.c) {
                }
                break;
            case 1:
                if (this.b < this.c) {
                }
                break;
            case 2:
                if (this.b < this.c) {
                }
                break;
            case 3:
                if (this.b < this.c) {
                }
                break;
            case 4:
                if (this.b < this.c) {
                }
                break;
            default:
                if (this.b < this.c) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Iterable iterable = this.d;
        int i2 = this.c;
        switch (i) {
            case 0:
                int i3 = this.b;
                if (i3 >= i2) {
                    ywb.n();
                } else {
                    this.b = i3 + 1;
                }
                break;
            case 1:
                int i4 = this.b;
                if (i4 >= i2) {
                    ywb.n();
                } else {
                    this.b = i4 + 1;
                }
                break;
            case 2:
                break;
            case 3:
                int i5 = this.b;
                if (i5 >= i2) {
                    ywb.n();
                } else {
                    this.b = i5 + 1;
                }
                break;
            case 4:
                int i6 = this.b;
                if (i6 >= i2) {
                    ywb.n();
                } else {
                    this.b = i6 + 1;
                }
                break;
            default:
                int i7 = this.b;
                if (i7 >= i2) {
                    ywb.n();
                } else {
                    this.b = i7 + 1;
                }
                break;
        }
        return null;
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            case 2:
                throw new UnsupportedOperationException();
            case 3:
                throw new UnsupportedOperationException();
            case 4:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    public x11(a6g a6gVar) {
        this.d = a6gVar;
        this.c = a6gVar.m();
    }

    public x11(hsf hsfVar) {
        this.d = hsfVar;
        this.c = hsfVar.e();
    }

    public x11(d21 d21Var) {
        this.d = d21Var;
        this.c = d21Var.size();
    }

    public x11(f21 f21Var) {
        this.d = f21Var;
        this.c = f21Var.size();
    }

    public x11(c57 c57Var) {
        this.d = c57Var;
        this.c = c57Var.b.length;
    }
}
