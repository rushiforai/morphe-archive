package he;

import com.google.android.exoplayer2.audio.AudioProcessor$UnhandledAudioFormatException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;

/* loaded from: classes3.dex */
public final class g0 implements h {

    /* renamed from: b, reason: collision with root package name */
    public int f59720b;

    /* renamed from: c, reason: collision with root package name */
    public float f59721c;

    /* renamed from: d, reason: collision with root package name */
    public float f59722d;

    /* renamed from: e, reason: collision with root package name */
    public g f59723e;

    /* renamed from: f, reason: collision with root package name */
    public g f59724f;

    /* renamed from: g, reason: collision with root package name */
    public g f59725g;

    /* renamed from: h, reason: collision with root package name */
    public g f59726h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f59727i;

    /* renamed from: j, reason: collision with root package name */
    public f0 f59728j;

    /* renamed from: k, reason: collision with root package name */
    public ByteBuffer f59729k;

    /* renamed from: l, reason: collision with root package name */
    public ShortBuffer f59730l;

    /* renamed from: m, reason: collision with root package name */
    public ByteBuffer f59731m;
    public long n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f59732p;

    @Override // he.h
    public final ByteBuffer a() {
        f0 f0Var = this.f59728j;
        if (f0Var != null) {
            int i5 = f0Var.f59696b;
            int i11 = f0Var.f59707m * i5 * 2;
            if (i11 > 0) {
                if (this.f59729k.capacity() < i11) {
                    ByteBuffer byteBufferOrder = ByteBuffer.allocateDirect(i11).order(ByteOrder.nativeOrder());
                    this.f59729k = byteBufferOrder;
                    this.f59730l = byteBufferOrder.asShortBuffer();
                } else {
                    this.f59729k.clear();
                    this.f59730l.clear();
                }
                ShortBuffer shortBuffer = this.f59730l;
                int iMin = Math.min(shortBuffer.remaining() / i5, f0Var.f59707m);
                int i12 = iMin * i5;
                shortBuffer.put(f0Var.f59706l, 0, i12);
                int i13 = f0Var.f59707m - iMin;
                f0Var.f59707m = i13;
                short[] sArr = f0Var.f59706l;
                System.arraycopy(sArr, i12, sArr, 0, i13 * i5);
                this.o += i11;
                this.f59729k.limit(i11);
                this.f59731m = this.f59729k;
            }
        }
        ByteBuffer byteBuffer = this.f59731m;
        this.f59731m = h.f59733a;
        return byteBuffer;
    }

    @Override // he.h
    public final boolean b() {
        if (this.f59724f.f59716a != -1) {
            return Math.abs(this.f59721c - 1.0f) >= 1.0E-4f || Math.abs(this.f59722d - 1.0f) >= 1.0E-4f || this.f59724f.f59716a != this.f59723e.f59716a;
        }
        return false;
    }

    @Override // he.h
    public final g c(g gVar) throws AudioProcessor$UnhandledAudioFormatException {
        if (gVar.f59718c != 2) {
            throw new AudioProcessor$UnhandledAudioFormatException(gVar);
        }
        int i5 = this.f59720b;
        if (i5 == -1) {
            i5 = gVar.f59716a;
        }
        this.f59723e = gVar;
        g gVar2 = new g(i5, gVar.f59717b, 2);
        this.f59724f = gVar2;
        this.f59727i = true;
        return gVar2;
    }

    @Override // he.h
    public final void d(ByteBuffer byteBuffer) {
        if (byteBuffer.hasRemaining()) {
            f0 f0Var = this.f59728j;
            f0Var.getClass();
            ShortBuffer shortBufferAsShortBuffer = byteBuffer.asShortBuffer();
            int iRemaining = byteBuffer.remaining();
            this.n += iRemaining;
            int iRemaining2 = shortBufferAsShortBuffer.remaining();
            int i5 = f0Var.f59696b;
            int i11 = iRemaining2 / i5;
            short[] sArrC = f0Var.c(f0Var.f59704j, f0Var.f59705k, i11);
            f0Var.f59704j = sArrC;
            shortBufferAsShortBuffer.get(sArrC, f0Var.f59705k * i5, ((i11 * i5) * 2) / 2);
            f0Var.f59705k += i11;
            f0Var.f();
            byteBuffer.position(byteBuffer.position() + iRemaining);
        }
    }

    @Override // he.h
    public final void e() {
        f0 f0Var = this.f59728j;
        if (f0Var != null) {
            int i5 = f0Var.f59705k;
            float f11 = f0Var.f59697c;
            float f12 = f0Var.f59698d;
            int i11 = f0Var.f59707m + ((int) ((((i5 / (f11 / f12)) + f0Var.o) / (f0Var.f59699e * f12)) + 0.5f));
            short[] sArr = f0Var.f59704j;
            int i12 = f0Var.f59702h * 2;
            f0Var.f59704j = f0Var.c(sArr, i5, i12 + i5);
            int i13 = 0;
            while (true) {
                int i14 = f0Var.f59696b;
                if (i13 >= i12 * i14) {
                    break;
                }
                f0Var.f59704j[(i14 * i5) + i13] = 0;
                i13++;
            }
            f0Var.f59705k = i12 + f0Var.f59705k;
            f0Var.f();
            if (f0Var.f59707m > i11) {
                f0Var.f59707m = i11;
            }
            f0Var.f59705k = 0;
            f0Var.f59710r = 0;
            f0Var.o = 0;
        }
        this.f59732p = true;
    }

    @Override // he.h
    public final boolean f() {
        if (!this.f59732p) {
            return false;
        }
        f0 f0Var = this.f59728j;
        return f0Var == null || (f0Var.f59707m * f0Var.f59696b) * 2 == 0;
    }

    @Override // he.h
    public final void flush() {
        if (b()) {
            g gVar = this.f59723e;
            this.f59725g = gVar;
            g gVar2 = this.f59724f;
            this.f59726h = gVar2;
            if (this.f59727i) {
                this.f59728j = new f0(this.f59721c, this.f59722d, gVar.f59716a, gVar.f59717b, gVar2.f59716a);
            } else {
                f0 f0Var = this.f59728j;
                if (f0Var != null) {
                    f0Var.f59705k = 0;
                    f0Var.f59707m = 0;
                    f0Var.o = 0;
                    f0Var.f59708p = 0;
                    f0Var.f59709q = 0;
                    f0Var.f59710r = 0;
                    f0Var.f59711s = 0;
                    f0Var.f59712t = 0;
                    f0Var.f59713u = 0;
                    f0Var.f59714v = 0;
                }
            }
        }
        this.f59731m = h.f59733a;
        this.n = 0L;
        this.o = 0L;
        this.f59732p = false;
    }

    @Override // he.h
    public final void reset() {
        this.f59721c = 1.0f;
        this.f59722d = 1.0f;
        g gVar = g.f59715e;
        this.f59723e = gVar;
        this.f59724f = gVar;
        this.f59725g = gVar;
        this.f59726h = gVar;
        ByteBuffer byteBuffer = h.f59733a;
        this.f59729k = byteBuffer;
        this.f59730l = byteBuffer.asShortBuffer();
        this.f59731m = byteBuffer;
        this.f59720b = -1;
        this.f59727i = false;
        this.f59728j = null;
        this.n = 0L;
        this.o = 0L;
        this.f59732p = false;
    }
}
