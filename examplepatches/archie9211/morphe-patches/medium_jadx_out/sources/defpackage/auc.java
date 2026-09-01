package defpackage;

import j$.util.Objects;
import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class auc extends Writer {
    public final Appendable a;
    public final ztc b = new ztc();

    public auc(Appendable appendable) {
        this.a = appendable;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Writer append(CharSequence charSequence) throws IOException {
        this.a.append(charSequence);
        return this;
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        Appendable appendable = this.a;
        if (appendable instanceof Closeable) {
            ((Closeable) appendable).close();
        }
    }

    @Override // java.io.Writer, java.io.Flushable
    public final void flush() throws IOException {
        Appendable appendable = this.a;
        if (appendable instanceof Flushable) {
            ((Flushable) appendable).flush();
        }
    }

    @Override // java.io.Writer
    public final void write(char[] cArr, int i, int i2) throws IOException {
        ztc ztcVar = this.b;
        ztcVar.a = cArr;
        ztcVar.b = null;
        this.a.append(ztcVar, i, i2 + i);
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Appendable append(CharSequence charSequence) throws IOException {
        this.a.append(charSequence);
        return this;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Writer append(CharSequence charSequence, int i, int i2) throws IOException {
        this.a.append(charSequence, i, i2);
        return this;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public final Appendable append(CharSequence charSequence, int i, int i2) throws IOException {
        this.a.append(charSequence, i, i2);
        return this;
    }

    @Override // java.io.Writer
    public final void write(String str, int i, int i2) throws IOException {
        Objects.requireNonNull(str);
        this.a.append(str, i, i2 + i);
    }

    @Override // java.io.Writer
    public final void write(int i) throws IOException {
        this.a.append((char) i);
    }
}
