package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xz6 implements Iterator, th6 {
    public final CharSequence a;
    public int b;
    public int c;
    public int d;
    public int e;

    public xz6(CharSequence charSequence) {
        this.a = charSequence;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i;
        int i2;
        int i3 = this.b;
        if (i3 != 0) {
            return i3 == 1;
        }
        if (this.e < 0) {
            this.b = 2;
            return false;
        }
        CharSequence charSequence = this.a;
        int length = charSequence.length();
        int length2 = charSequence.length();
        for (int i4 = this.c; i4 < length2; i4++) {
            char cCharAt = charSequence.charAt(i4);
            if (cCharAt == '\n' || cCharAt == '\r') {
                i = (cCharAt == '\r' && (i2 = i4 + 1) < charSequence.length() && charSequence.charAt(i2) == '\n') ? 2 : 1;
                length = i4;
                this.b = 1;
                this.e = i;
                this.d = length;
                return true;
            }
        }
        i = -1;
        this.b = 1;
        this.e = i;
        this.d = length;
        return true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        this.b = 0;
        int i = this.d;
        int i2 = this.c;
        this.c = this.e + i;
        return this.a.subSequence(i2, i).toString();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
