package jf;

import androidx.compose.ui.node.LayoutNode;
import com.google.android.exoplayer2.text.SubtitleDecoderException;
import java.nio.ByteBuffer;
import java.util.ArrayDeque;

/* loaded from: classes3.dex */
public abstract class e implements g, ie.d {

    /* renamed from: a, reason: collision with root package name */
    public final ib.b f69528a;

    /* renamed from: f, reason: collision with root package name */
    public final d[] f69533f;

    /* renamed from: h, reason: collision with root package name */
    public int f69535h;

    /* renamed from: i, reason: collision with root package name */
    public ie.f f69536i;

    /* renamed from: j, reason: collision with root package name */
    public SubtitleDecoderException f69537j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f69538k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f69539l;

    /* renamed from: b, reason: collision with root package name */
    public final Object f69529b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayDeque f69530c = new ArrayDeque();

    /* renamed from: d, reason: collision with root package name */
    public final ArrayDeque f69531d = new ArrayDeque();

    /* renamed from: e, reason: collision with root package name */
    public final ie.f[] f69532e = new i[2];

    /* renamed from: g, reason: collision with root package name */
    public int f69534g = 2;

    public e() {
        d[] dVarArr = new d[2];
        int i5 = 0;
        while (true) {
            if (i5 >= this.f69534g) {
                break;
            }
            this.f69532e[i5] = new i(1);
            i5++;
        }
        this.f69533f = dVarArr;
        this.f69535h = 2;
        for (int i11 = 0; i11 < this.f69535h; i11++) {
            this.f69533f[i11] = new d(this, 1);
        }
        ib.b bVar = new ib.b(this);
        this.f69528a = bVar;
        bVar.start();
        int i12 = this.f69534g;
        ie.f[] fVarArr = this.f69532e;
        wf.a.i(i12 == fVarArr.length);
        for (ie.f fVar : fVarArr) {
            fVar.u(1024);
        }
    }

    @Override // jf.g
    public final void a(long j11) {
    }

    @Override // ie.d
    public final Object b() {
        synchronized (this.f69529b) {
            try {
                SubtitleDecoderException subtitleDecoderException = this.f69537j;
                if (subtitleDecoderException != null) {
                    throw subtitleDecoderException;
                }
                if (this.f69531d.isEmpty()) {
                    return null;
                }
                return (d) this.f69531d.removeFirst();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // ie.d
    public final void c(i iVar) {
        synchronized (this.f69529b) {
            try {
                SubtitleDecoderException subtitleDecoderException = this.f69537j;
                if (subtitleDecoderException != null) {
                    throw subtitleDecoderException;
                }
                wf.a.e(iVar == this.f69536i);
                this.f69530c.addLast(iVar);
                if (!this.f69530c.isEmpty() && this.f69535h > 0) {
                    this.f69529b.notify();
                }
                this.f69536i = null;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // ie.d
    public final Object d() {
        ie.f fVar;
        synchronized (this.f69529b) {
            try {
                SubtitleDecoderException subtitleDecoderException = this.f69537j;
                if (subtitleDecoderException != null) {
                    throw subtitleDecoderException;
                }
                wf.a.i(this.f69536i == null);
                int i5 = this.f69534g;
                if (i5 == 0) {
                    fVar = null;
                } else {
                    ie.f[] fVarArr = this.f69532e;
                    int i11 = i5 - 1;
                    this.f69534g = i11;
                    fVar = fVarArr[i11];
                }
                this.f69536i = fVar;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return fVar;
    }

    public final SubtitleDecoderException e(ie.f fVar, d dVar, boolean z11) {
        i iVar = (i) fVar;
        try {
            ByteBuffer byteBuffer = iVar.f61580d;
            byteBuffer.getClass();
            dVar.t(iVar.f61582f, f(byteBuffer.array(), byteBuffer.limit(), z11), iVar.f69541i);
            dVar.f61556b &= LayoutNode.NotPlacedPlaceOrder;
            return null;
        } catch (SubtitleDecoderException e3) {
            return e3;
        }
    }

    public abstract f f(byte[] bArr, int i5, boolean z11);

    @Override // ie.d
    public final void flush() {
        synchronized (this.f69529b) {
            try {
                this.f69538k = true;
                ie.f fVar = this.f69536i;
                if (fVar != null) {
                    fVar.q();
                    ie.f[] fVarArr = this.f69532e;
                    int i5 = this.f69534g;
                    this.f69534g = i5 + 1;
                    fVarArr[i5] = fVar;
                    this.f69536i = null;
                }
                while (!this.f69530c.isEmpty()) {
                    ie.f fVar2 = (ie.f) this.f69530c.removeFirst();
                    fVar2.q();
                    ie.f[] fVarArr2 = this.f69532e;
                    int i11 = this.f69534g;
                    this.f69534g = i11 + 1;
                    fVarArr2[i11] = fVar2;
                }
                while (!this.f69531d.isEmpty()) {
                    ((d) this.f69531d.removeFirst()).q();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0087 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean g() {
        SubtitleDecoderException subtitleDecoderException;
        SubtitleDecoderException subtitleDecoderExceptionE;
        synchronized (this.f69529b) {
            while (!this.f69539l) {
                try {
                    if (!this.f69530c.isEmpty() && this.f69535h > 0) {
                        break;
                    }
                    this.f69529b.wait();
                } finally {
                }
            }
            if (this.f69539l) {
                return false;
            }
            ie.f fVar = (ie.f) this.f69530c.removeFirst();
            d[] dVarArr = this.f69533f;
            int i5 = this.f69535h - 1;
            this.f69535h = i5;
            d dVar = dVarArr[i5];
            boolean z11 = this.f69538k;
            this.f69538k = false;
            if (fVar.d(4)) {
                dVar.b(4);
            } else {
                if (fVar.d(Integer.MIN_VALUE)) {
                    dVar.b(Integer.MIN_VALUE);
                }
                if (fVar.d(134217728)) {
                    dVar.b(134217728);
                }
                try {
                    subtitleDecoderExceptionE = e(fVar, dVar, z11);
                } catch (OutOfMemoryError e3) {
                    subtitleDecoderException = new SubtitleDecoderException("Unexpected decode error", e3);
                    subtitleDecoderExceptionE = subtitleDecoderException;
                    if (subtitleDecoderExceptionE != null) {
                    }
                    synchronized (this.f69529b) {
                    }
                } catch (RuntimeException e11) {
                    subtitleDecoderException = new SubtitleDecoderException("Unexpected decode error", e11);
                    subtitleDecoderExceptionE = subtitleDecoderException;
                    if (subtitleDecoderExceptionE != null) {
                    }
                    synchronized (this.f69529b) {
                    }
                }
                if (subtitleDecoderExceptionE != null) {
                    synchronized (this.f69529b) {
                        this.f69537j = subtitleDecoderExceptionE;
                    }
                    return false;
                }
            }
            synchronized (this.f69529b) {
                try {
                    if (this.f69538k || dVar.d(Integer.MIN_VALUE)) {
                        dVar.q();
                    } else {
                        this.f69531d.addLast(dVar);
                    }
                    fVar.q();
                    ie.f[] fVarArr = this.f69532e;
                    int i11 = this.f69534g;
                    this.f69534g = i11 + 1;
                    fVarArr[i11] = fVar;
                } finally {
                }
            }
            return true;
        }
    }

    @Override // ie.d
    public final void release() throws InterruptedException {
        synchronized (this.f69529b) {
            this.f69539l = true;
            this.f69529b.notify();
        }
        try {
            this.f69528a.join();
        } catch (InterruptedException unused) {
            Thread.currentThread().interrupt();
        }
    }
}
