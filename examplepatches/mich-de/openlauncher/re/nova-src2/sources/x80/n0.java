package x80;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class n0 extends Reader {

    /* renamed from: a, reason: collision with root package name */
    public final m90.i f95571a;

    /* renamed from: b, reason: collision with root package name */
    public final Charset f95572b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f95573c;

    /* renamed from: d, reason: collision with root package name */
    public InputStreamReader f95574d;

    public n0(m90.i source, Charset charset) {
        Intrinsics.g(source, "source");
        Intrinsics.g(charset, "charset");
        this.f95571a = source;
        this.f95572b = charset;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        Unit unit;
        this.f95573c = true;
        InputStreamReader inputStreamReader = this.f95574d;
        if (inputStreamReader != null) {
            inputStreamReader.close();
            unit = Unit.f71706a;
        } else {
            unit = null;
        }
        if (unit == null) {
            this.f95571a.close();
        }
    }

    @Override // java.io.Reader
    public final int read(char[] cbuf, int i5, int i11) throws IOException {
        Intrinsics.g(cbuf, "cbuf");
        if (this.f95573c) {
            throw new IOException("Stream closed");
        }
        InputStreamReader inputStreamReader = this.f95574d;
        if (inputStreamReader == null) {
            m90.i iVar = this.f95571a;
            inputStreamReader = new InputStreamReader(iVar.b0(), y80.c.q(iVar, this.f95572b));
            this.f95574d = inputStreamReader;
        }
        return inputStreamReader.read(cbuf, i5, i11);
    }
}
