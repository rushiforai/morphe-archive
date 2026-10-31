package hn;

import java.io.IOException;
import java.io.Writer;
import java.util.Objects;

/* loaded from: classes.dex */
public final class r extends Writer {

    /* renamed from: a, reason: collision with root package name */
    public final Appendable f59943a;

    /* renamed from: b, reason: collision with root package name */
    public final q f59944b = new q();

    public r(Appendable appendable) {
        this.f59943a = appendable;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Writer append(CharSequence charSequence) throws IOException {
        this.f59943a.append(charSequence);
        return this;
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    @Override // java.io.Writer, java.io.Flushable
    public final void flush() {
    }

    @Override // java.io.Writer
    public final void write(int i5) throws IOException {
        this.f59943a.append((char) i5);
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Appendable append(CharSequence charSequence) throws IOException {
        this.f59943a.append(charSequence);
        return this;
    }

    @Override // java.io.Writer
    public final void write(String str, int i5, int i11) throws IOException {
        Objects.requireNonNull(str);
        this.f59943a.append(str, i5, i11 + i5);
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Writer append(CharSequence charSequence, int i5, int i11) throws IOException {
        this.f59943a.append(charSequence, i5, i11);
        return this;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Appendable append(CharSequence charSequence, int i5, int i11) throws IOException {
        this.f59943a.append(charSequence, i5, i11);
        return this;
    }

    @Override // java.io.Writer
    public final void write(char[] cArr, int i5, int i11) throws IOException {
        q qVar = this.f59944b;
        qVar.f59941a = cArr;
        qVar.f59942b = null;
        this.f59943a.append(qVar, i5, i11 + i5);
    }
}
