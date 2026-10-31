package a70;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import z.d1;

/* loaded from: classes4.dex */
public final class e implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f453a = 4;

    /* renamed from: b, reason: collision with root package name */
    public int f454b;

    /* renamed from: c, reason: collision with root package name */
    public final Cloneable f455c;

    /* JADX WARN: Multi-variable type inference failed */
    public e(byte[] array) {
        Intrinsics.g(array, "array");
        this.f455c = array;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f453a) {
            case 0:
                if (this.f454b < ((byte[]) this.f455c).length) {
                }
                break;
            case 1:
                if (this.f454b < ((int[]) this.f455c).length) {
                }
                break;
            case 2:
                if (this.f454b < ((long[]) this.f455c).length) {
                }
                break;
            case 3:
                if (this.f454b < ((short[]) this.f455c).length) {
                }
                break;
            default:
                if (this.f454b < ((d1) this.f455c).f()) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f453a) {
            case 0:
                int i5 = this.f454b;
                byte[] bArr = (byte[]) this.f455c;
                if (i5 >= bArr.length) {
                    throw new NoSuchElementException(String.valueOf(this.f454b));
                }
                this.f454b = i5 + 1;
                return new UByte(bArr[i5]);
            case 1:
                int i11 = this.f454b;
                int[] iArr = (int[]) this.f455c;
                if (i11 >= iArr.length) {
                    throw new NoSuchElementException(String.valueOf(this.f454b));
                }
                this.f454b = i11 + 1;
                return new UInt(iArr[i11]);
            case 2:
                int i12 = this.f454b;
                long[] jArr = (long[]) this.f455c;
                if (i12 >= jArr.length) {
                    throw new NoSuchElementException(String.valueOf(this.f454b));
                }
                this.f454b = i12 + 1;
                return new ULong(jArr[i12]);
            case 3:
                int i13 = this.f454b;
                short[] sArr = (short[]) this.f455c;
                if (i13 >= sArr.length) {
                    throw new NoSuchElementException(String.valueOf(this.f454b));
                }
                this.f454b = i13 + 1;
                return new UShort(sArr[i13]);
            default:
                d1 d1Var = (d1) this.f455c;
                int i14 = this.f454b;
                this.f454b = i14 + 1;
                return d1Var.g(i14);
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f453a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 2:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 3:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public e(int[] array) {
        Intrinsics.g(array, "array");
        this.f455c = array;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public e(long[] array) {
        Intrinsics.g(array, "array");
        this.f455c = array;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public e(short[] array) {
        Intrinsics.g(array, "array");
        this.f455c = array;
    }

    public e(d1 d1Var) {
        this.f455c = d1Var;
    }
}
