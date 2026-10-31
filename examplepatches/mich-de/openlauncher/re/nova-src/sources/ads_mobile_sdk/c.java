package ads_mobile_sdk;

import b.d2;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import zk.f;

/* loaded from: classes2.dex */
public final class c implements d2 {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f1614a;

    public c(byte[] bArr, int i5) {
        switch (i5) {
            case 1:
                this.f1614a = bArr;
                break;
            default:
                this.f1614a = new byte[256];
                for (int i11 = 0; i11 < 256; i11++) {
                    this.f1614a[i11] = (byte) i11;
                }
                int i12 = 0;
                for (int i13 = 0; i13 < 256; i13++) {
                    byte[] bArr2 = this.f1614a;
                    byte b11 = bArr2[i13];
                    i12 = (i12 + b11 + bArr[i13 % bArr.length]) & 255;
                    bArr2[i13] = bArr2[i12];
                    bArr2[i12] = b11;
                }
                break;
        }
    }

    @Override // b.d2
    public Object a() {
        return this.f1614a;
    }

    @Override // b.d2
    public Object a(FileInputStream fileInputStream) {
        try {
            return f.c(fileInputStream);
        } catch (IOException e3) {
            throw new cm0("Cannot read bytes.", e3);
        }
    }

    @Override // b.d2
    public void a(Object obj, FileOutputStream fileOutputStream) throws IOException {
        fileOutputStream.write((byte[]) obj);
    }
}
