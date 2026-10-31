package m90;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class b0 extends OutputStream {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76094a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Object f76095b;

    public b0(FileOutputStream fileOutputStream) {
        this.f76095b = fileOutputStream;
    }

    private final void a() {
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        switch (this.f76094a) {
            case 0:
                ((c0) this.f76095b).close();
                break;
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public final void flush() throws IOException {
        switch (this.f76094a) {
            case 0:
                c0 c0Var = (c0) this.f76095b;
                if (!c0Var.f76100c) {
                    c0Var.flush();
                    break;
                }
                break;
            default:
                ((FileOutputStream) this.f76095b).flush();
                break;
        }
    }

    public String toString() {
        switch (this.f76094a) {
            case 0:
                return ((c0) this.f76095b) + ".outputStream()";
            default:
                return super.toString();
        }
    }

    @Override // java.io.OutputStream
    public final void write(int i5) throws IOException {
        switch (this.f76094a) {
            case 0:
                c0 c0Var = (c0) this.f76095b;
                if (c0Var.f76100c) {
                    throw new IOException("closed");
                }
                c0Var.f76099b.g0((byte) i5);
                c0Var.b();
                return;
            default:
                ((FileOutputStream) this.f76095b).write(i5);
                return;
        }
    }

    public b0(c0 c0Var) {
        this.f76095b = c0Var;
    }

    @Override // java.io.OutputStream
    public void write(byte[] b11) throws IOException {
        switch (this.f76094a) {
            case 1:
                Intrinsics.g(b11, "b");
                ((FileOutputStream) this.f76095b).write(b11);
                break;
            default:
                super.write(b11);
                break;
        }
    }

    @Override // java.io.OutputStream
    public final void write(byte[] data, int i5, int i11) throws IOException {
        switch (this.f76094a) {
            case 0:
                Intrinsics.g(data, "data");
                c0 c0Var = (c0) this.f76095b;
                if (!c0Var.f76100c) {
                    c0Var.f76099b.write(data, i5, i11);
                    c0Var.b();
                    return;
                }
                throw new IOException("closed");
            default:
                Intrinsics.g(data, "bytes");
                ((FileOutputStream) this.f76095b).write(data, i5, i11);
                return;
        }
    }
}
