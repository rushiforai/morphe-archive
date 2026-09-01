package defpackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zqa extends InputStream {
    public int a;
    public int b;
    public final /* synthetic */ bra c;

    public zqa(bra braVar, yqa yqaVar) {
        this.c = braVar;
        this.a = braVar.U(yqaVar.b + 4);
        this.b = yqaVar.c;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i, int i2) throws IOException {
        if (bArr == null) {
            z72.c("buffer");
            return 0;
        }
        if ((i | i2) < 0 || i2 > bArr.length - i) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int i3 = this.b;
        if (i3 <= 0) {
            return -1;
        }
        if (i2 > i3) {
            i2 = i3;
        }
        int i4 = this.a;
        bra braVar = this.c;
        braVar.Q(i4, i, i2, bArr);
        this.a = braVar.U(this.a + i2);
        this.b -= i2;
        return i2;
    }

    @Override // java.io.InputStream
    public final int read() throws IOException {
        bra braVar = this.c;
        RandomAccessFile randomAccessFile = braVar.a;
        if (this.b == 0) {
            return -1;
        }
        randomAccessFile.seek(this.a);
        int i = randomAccessFile.read();
        this.a = braVar.U(this.a + 1);
        this.b--;
        return i;
    }
}
