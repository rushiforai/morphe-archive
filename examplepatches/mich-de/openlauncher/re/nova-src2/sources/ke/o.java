package ke;

import com.google.android.exoplayer2.metadata.Metadata;
import fe.j0;
import fe.k0;
import io.sentry.e3;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final int f71411a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71412b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71413c;

    /* renamed from: d, reason: collision with root package name */
    public final int f71414d;

    /* renamed from: e, reason: collision with root package name */
    public final int f71415e;

    /* renamed from: f, reason: collision with root package name */
    public final int f71416f;

    /* renamed from: g, reason: collision with root package name */
    public final int f71417g;

    /* renamed from: h, reason: collision with root package name */
    public final int f71418h;

    /* renamed from: i, reason: collision with root package name */
    public final int f71419i;

    /* renamed from: j, reason: collision with root package name */
    public final long f71420j;

    /* renamed from: k, reason: collision with root package name */
    public final e3 f71421k;

    /* renamed from: l, reason: collision with root package name */
    public final Metadata f71422l;

    public o(byte[] bArr, int i5) {
        x xVar = new x(bArr, bArr.length);
        xVar.o(i5 * 8);
        this.f71411a = xVar.i(16);
        this.f71412b = xVar.i(16);
        this.f71413c = xVar.i(24);
        this.f71414d = xVar.i(24);
        int i11 = xVar.i(20);
        this.f71415e = i11;
        this.f71416f = d(i11);
        this.f71417g = xVar.i(3) + 1;
        int i12 = xVar.i(5) + 1;
        this.f71418h = i12;
        this.f71419i = a(i12);
        int i13 = xVar.i(4);
        int i14 = xVar.i(32);
        int i15 = wf.v.f94376a;
        this.f71420j = ((i13 & 4294967295L) << 32) | (i14 & 4294967295L);
        this.f71421k = null;
        this.f71422l = null;
    }

    public static int a(int i5) {
        if (i5 == 8) {
            return 1;
        }
        if (i5 == 12) {
            return 2;
        }
        if (i5 == 16) {
            return 4;
        }
        if (i5 != 20) {
            return i5 != 24 ? -1 : 6;
        }
        return 5;
    }

    public static int d(int i5) {
        switch (i5) {
            case 8000:
                return 4;
            case 16000:
                return 5;
            case 22050:
                return 6;
            case 24000:
                return 7;
            case 32000:
                return 8;
            case 44100:
                return 9;
            case 48000:
                return 10;
            case 88200:
                return 1;
            case 96000:
                return 11;
            case 176400:
                return 2;
            case 192000:
                return 3;
            default:
                return -1;
        }
    }

    public final long b() {
        long j11 = this.f71420j;
        if (j11 == 0) {
            return -9223372036854775807L;
        }
        return (j11 * 1000000) / this.f71415e;
    }

    public final k0 c(byte[] bArr, Metadata metadata) {
        bArr[4] = -128;
        int i5 = this.f71414d;
        if (i5 <= 0) {
            i5 = -1;
        }
        Metadata metadata2 = this.f71422l;
        if (metadata2 != null) {
            metadata = metadata == null ? metadata2 : metadata2.a(metadata.f31467a);
        }
        j0 j0Var = new j0();
        j0Var.f54856k = "audio/flac";
        j0Var.f54857l = i5;
        j0Var.f54867x = this.f71417g;
        j0Var.f54868y = this.f71415e;
        j0Var.f54858m = Collections.singletonList(bArr);
        j0Var.f54854i = metadata;
        return new k0(j0Var);
    }

    public o(int i5, int i11, int i12, int i13, int i14, int i15, int i16, long j11, e3 e3Var, Metadata metadata) {
        this.f71411a = i5;
        this.f71412b = i11;
        this.f71413c = i12;
        this.f71414d = i13;
        this.f71415e = i14;
        this.f71416f = d(i14);
        this.f71417g = i15;
        this.f71418h = i16;
        this.f71419i = a(i16);
        this.f71420j = j11;
        this.f71421k = e3Var;
        this.f71422l = metadata;
    }
}
