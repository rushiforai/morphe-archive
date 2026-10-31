package r70;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes5.dex */
public final class c implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f85606a;

    /* renamed from: b, reason: collision with root package name */
    public int f85607b;

    /* renamed from: c, reason: collision with root package name */
    public int f85608c;

    /* renamed from: d, reason: collision with root package name */
    public int f85609d;

    /* renamed from: e, reason: collision with root package name */
    public int f85610e;

    public c(CharSequence string) {
        Intrinsics.g(string, "string");
        this.f85606a = string;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i5;
        int i11;
        int i12 = this.f85607b;
        if (i12 != 0) {
            return i12 == 1;
        }
        if (this.f85610e < 0) {
            this.f85607b = 2;
            return false;
        }
        CharSequence charSequence = this.f85606a;
        int length = charSequence.length();
        int length2 = charSequence.length();
        for (int i13 = this.f85608c; i13 < length2; i13++) {
            char cCharAt = charSequence.charAt(i13);
            if (cCharAt == '\n' || cCharAt == '\r') {
                i5 = (cCharAt == '\r' && (i11 = i13 + 1) < charSequence.length() && charSequence.charAt(i11) == '\n') ? 2 : 1;
                length = i13;
                this.f85607b = 1;
                this.f85610e = i5;
                this.f85609d = length;
                return true;
            }
        }
        i5 = -1;
        this.f85607b = 1;
        this.f85610e = i5;
        this.f85609d = length;
        return true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.f85607b = 0;
        int i5 = this.f85609d;
        int i11 = this.f85608c;
        this.f85608c = this.f85610e + i5;
        return this.f85606a.subSequence(i11, i5).toString();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
