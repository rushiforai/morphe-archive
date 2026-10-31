package bl;

import java.io.Serializable;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import vk.b0;

/* loaded from: classes3.dex */
public final class a extends AbstractList implements RandomAccess, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final int[] f18053a;

    /* renamed from: b, reason: collision with root package name */
    public final int f18054b;

    /* renamed from: c, reason: collision with root package name */
    public final int f18055c;

    public a(int i5, int i11, int[] iArr) {
        this.f18053a = iArr;
        this.f18054b = i5;
        this.f18055c = i11;
    }

    public final int[] c() {
        return Arrays.copyOfRange(this.f18053a, this.f18054b, this.f18055c);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        if (!(obj instanceof Integer)) {
            return false;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.f18054b;
        while (true) {
            if (i5 >= this.f18055c) {
                i5 = -1;
                break;
            }
            if (this.f18053a[i5] == iIntValue) {
                break;
            }
            i5++;
        }
        return i5 != -1;
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof a)) {
            return super.equals(obj);
        }
        a aVar = (a) obj;
        int size = size();
        if (aVar.size() != size) {
            return false;
        }
        for (int i5 = 0; i5 < size; i5++) {
            if (this.f18053a[this.f18054b + i5] != aVar.f18053a[aVar.f18054b + i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        b0.e(i5, size());
        return Integer.valueOf(this.f18053a[this.f18054b + i5]);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = this.f18054b; i11 < this.f18055c; i11++) {
            i5 = (i5 * 31) + this.f18053a[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (obj instanceof Integer) {
            int iIntValue = ((Integer) obj).intValue();
            int i5 = this.f18054b;
            int i11 = i5;
            while (true) {
                if (i11 >= this.f18055c) {
                    i11 = -1;
                    break;
                }
                if (this.f18053a[i11] == iIntValue) {
                    break;
                }
                i11++;
            }
            if (i11 >= 0) {
                return i11 - i5;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return false;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        int i5;
        if (obj instanceof Integer) {
            int iIntValue = ((Integer) obj).intValue();
            int i11 = this.f18055c;
            while (true) {
                i11--;
                i5 = this.f18054b;
                if (i11 < i5) {
                    i11 = -1;
                    break;
                }
                if (this.f18053a[i11] == iIntValue) {
                    break;
                }
            }
            if (i11 >= 0) {
                return i11 - i5;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        Integer num = (Integer) obj;
        b0.e(i5, size());
        int i11 = this.f18054b + i5;
        int[] iArr = this.f18053a;
        int i12 = iArr[i11];
        num.getClass();
        iArr[i11] = num.intValue();
        return Integer.valueOf(i12);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f18055c - this.f18054b;
    }

    @Override // java.util.AbstractList, java.util.List
    public final List subList(int i5, int i11) {
        b0.i(i5, i11, size());
        if (i5 == i11) {
            return Collections.EMPTY_LIST;
        }
        int i12 = this.f18054b;
        return new a(i5 + i12, i12 + i11, this.f18053a);
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        StringBuilder sb2 = new StringBuilder(size() * 5);
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
        int[] iArr = this.f18053a;
        int i5 = this.f18054b;
        sb2.append(iArr[i5]);
        while (true) {
            i5++;
            if (i5 >= this.f18055c) {
                sb2.append(AbstractJsonLexerKt.END_LIST);
                return sb2.toString();
            }
            sb2.append(", ");
            sb2.append(iArr[i5]);
        }
    }
}
