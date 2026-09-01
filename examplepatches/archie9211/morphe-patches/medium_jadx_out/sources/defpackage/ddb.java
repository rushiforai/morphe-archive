package defpackage;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ddb extends Reader {
    public final zz0 a;
    public final Charset b;
    public boolean c;
    public InputStreamReader d;

    public ddb(zz0 zz0Var, Charset charset) {
        zz0Var.getClass();
        charset.getClass();
        this.a = zz0Var;
        this.b = charset;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.c = true;
        InputStreamReader inputStreamReader = this.d;
        if (inputStreamReader != null) {
            inputStreamReader.close();
        } else {
            this.a.close();
        }
    }

    @Override // java.io.Reader
    public final int read(char[] cArr, int i, int i2) throws IOException {
        cArr.getClass();
        if (this.c) {
            ik4.g("Stream closed");
            return 0;
        }
        InputStreamReader inputStreamReader = this.d;
        if (inputStreamReader == null) {
            zz0 zz0Var = this.a;
            inputStreamReader = new InputStreamReader(zz0Var.D0(), ggf.f(zz0Var, this.b));
            this.d = inputStreamReader;
        }
        return inputStreamReader.read(cArr, i, i2);
    }
}
