package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y11 extends c21 {
    public final int e;
    public final int f;

    public y11(byte[] bArr, int i, int i2) {
        super(bArr);
        f21.e(i, i + i2, bArr.length);
        this.e = i;
        this.f = i2;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("BoundedByteStream instances are not to be serialized directly");
    }

    @Override // defpackage.c21, defpackage.f21
    public final byte d(int i) {
        int i2 = this.f;
        if (((i2 - (i + 1)) | i) >= 0) {
            return this.d[this.e + i];
        }
        if (i < 0) {
            throw new ArrayIndexOutOfBoundsException(b09.w(i, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(ev6.v("Index > length: ", i, i2, ", "));
    }

    @Override // defpackage.c21, defpackage.f21
    public final byte m(int i) {
        return this.d[this.e + i];
    }

    @Override // defpackage.c21, defpackage.f21
    public final int size() {
        return this.f;
    }

    @Override // defpackage.c21
    public final int w() {
        return this.e;
    }

    public Object writeReplace() {
        byte[] bArr;
        int size = size();
        if (size == 0) {
            bArr = v56.b;
        } else {
            byte[] bArr2 = new byte[size];
            System.arraycopy(this.d, this.e, bArr2, 0, size);
            bArr = bArr2;
        }
        return new c21(bArr);
    }
}
