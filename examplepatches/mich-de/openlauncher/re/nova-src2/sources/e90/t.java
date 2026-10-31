package e90;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlin.jvm.internal.Intrinsics;
import m90.j0;
import m90.l0;

/* loaded from: classes.dex */
public final class t implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final m90.i f52377a;

    /* renamed from: b, reason: collision with root package name */
    public int f52378b;

    /* renamed from: c, reason: collision with root package name */
    public int f52379c;

    /* renamed from: d, reason: collision with root package name */
    public int f52380d;

    /* renamed from: e, reason: collision with root package name */
    public int f52381e;

    /* renamed from: f, reason: collision with root package name */
    public int f52382f;

    public t(m90.i source) {
        Intrinsics.g(source, "source");
        this.f52377a = source;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    @Override // m90.j0
    public final long read(m90.g sink, long j11) throws IOException {
        int i5;
        int i11;
        Intrinsics.g(sink, "sink");
        do {
            int i12 = this.f52381e;
            m90.i iVar = this.f52377a;
            if (i12 == 0) {
                iVar.skip(this.f52382f);
                this.f52382f = 0;
                if ((this.f52379c & 4) == 0) {
                    i5 = this.f52380d;
                    int iR = y80.c.r(iVar);
                    this.f52381e = iR;
                    this.f52378b = iR;
                    int i13 = iVar.readByte() & 255;
                    this.f52379c = iVar.readByte() & 255;
                    Logger logger = u.f52383d;
                    if (logger.isLoggable(Level.FINE)) {
                        m90.j jVar = e.f52313a;
                        logger.fine(e.a(this.f52380d, this.f52378b, i13, this.f52379c, true));
                    }
                    i11 = iVar.readInt() & LayoutNode.NotPlacedPlaceOrder;
                    this.f52380d = i11;
                    if (i13 != 9) {
                        throw new IOException(a2.c.h(i13, " != TYPE_CONTINUATION"));
                    }
                }
            } else {
                long j12 = iVar.read(sink, Math.min(j11, i12));
                if (j12 != -1) {
                    this.f52381e -= (int) j12;
                    return j12;
                }
            }
            return -1L;
        } while (i11 == i5);
        throw new IOException("TYPE_CONTINUATION streamId changed");
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f52377a.timeout();
    }
}
