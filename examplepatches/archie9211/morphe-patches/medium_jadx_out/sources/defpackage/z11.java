package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z11 extends d21 {
    public final int e;
    public final int f;

    public z11(byte[] bArr, int i, int i2) {
        super(bArr);
        d21.e(i, i + i2, bArr.length);
        this.e = i;
        this.f = i2;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("BoundedByteStream instances are not to be serialized directly");
    }

    @Override // defpackage.d21
    public final byte d(int i) {
        int i2 = this.f;
        if (((i2 - (i + 1)) | i) >= 0) {
            return this.b[this.e + i];
        }
        if (i < 0) {
            throw new ArrayIndexOutOfBoundsException(b09.w(i, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(ev6.v("Index > length: ", i, i2, ", "));
    }

    @Override // defpackage.d21
    public final void m(int i, byte[] bArr) {
        System.arraycopy(this.b, this.e, bArr, 0, i);
    }

    @Override // defpackage.d21
    public final int p() {
        return this.e;
    }

    @Override // defpackage.d21
    public final byte q(int i) {
        return this.b[this.e + i];
    }

    @Override // defpackage.d21
    public final int size() {
        return this.f;
    }

    public Object writeReplace() {
        byte[] bArr;
        int size = size();
        if (size == 0) {
            bArr = x56.b;
        } else {
            byte[] bArr2 = new byte[size];
            m(size, bArr2);
            bArr = bArr2;
        }
        return new d21(bArr);
    }
}
