package le;

import com.google.android.exoplayer2.ParserException;
import fe.j0;
import fe.k0;
import java.io.EOFException;
import java.nio.charset.Charset;
import java.util.Arrays;
import ke.g;
import ke.j;
import ke.k;
import ke.l;
import ke.m;
import ke.n;
import ke.s;
import ke.v;
import vk.e;

/* loaded from: classes3.dex */
public final class a implements j {
    public static final int[] n = {13, 14, 16, 18, 20, 21, 27, 32, 6, 7, 6, 6, 1, 1, 1, 1};
    public static final int[] o;

    /* renamed from: p, reason: collision with root package name */
    public static final byte[] f74863p;

    /* renamed from: q, reason: collision with root package name */
    public static final byte[] f74864q;

    /* renamed from: r, reason: collision with root package name */
    public static final int f74865r;

    /* renamed from: b, reason: collision with root package name */
    public boolean f74867b;

    /* renamed from: c, reason: collision with root package name */
    public long f74868c;

    /* renamed from: d, reason: collision with root package name */
    public int f74869d;

    /* renamed from: e, reason: collision with root package name */
    public int f74870e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f74871f;

    /* renamed from: h, reason: collision with root package name */
    public int f74873h;

    /* renamed from: i, reason: collision with root package name */
    public long f74874i;

    /* renamed from: j, reason: collision with root package name */
    public l f74875j;

    /* renamed from: k, reason: collision with root package name */
    public v f74876k;

    /* renamed from: l, reason: collision with root package name */
    public s f74877l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f74878m;

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f74866a = new byte[1];

    /* renamed from: g, reason: collision with root package name */
    public int f74872g = -1;

    static {
        int[] iArr = {18, 24, 33, 37, 41, 47, 51, 59, 61, 6, 1, 1, 1, 1, 1, 1};
        o = iArr;
        int i5 = wf.v.f94376a;
        Charset charset = e.f92809c;
        f74863p = "#!AMR\n".getBytes(charset);
        f74864q = "#!AMR-WB\n".getBytes(charset);
        f74865r = iArr[8];
    }

    @Override // ke.j
    public final void a(l lVar) {
        this.f74875j = lVar;
        this.f74876k = lVar.s(0, 1);
        lVar.o();
    }

    @Override // ke.j
    public final void b(long j11, long j12) {
        this.f74868c = 0L;
        this.f74869d = 0;
        this.f74870e = 0;
        if (j11 != 0) {
            s sVar = this.f74877l;
            if (sVar instanceof re.a) {
                this.f74874i = (Math.max(0L, j11 - ((re.a) sVar).f85808b) * 8000000) / r0.f85811e;
                return;
            }
        }
        this.f74874i = 0L;
    }

    @Override // ke.j
    public final boolean c(k kVar) {
        return e(kVar);
    }

    public final int d(k kVar) throws ParserException {
        boolean z11;
        kVar.e();
        byte[] bArr = this.f74866a;
        kVar.b(0, 1, bArr);
        byte b11 = bArr[0];
        if ((b11 & 131) > 0) {
            throw ParserException.a("Invalid padding bits for frame header " + ((int) b11), null);
        }
        int i5 = (b11 >> 3) & 15;
        if (i5 >= 0 && i5 <= 15 && (((z11 = this.f74867b) && (i5 < 10 || i5 > 13)) || (!z11 && (i5 < 12 || i5 > 14)))) {
            return z11 ? o[i5] : n[i5];
        }
        StringBuilder sb2 = new StringBuilder("Illegal AMR ");
        sb2.append(this.f74867b ? "WB" : "NB");
        sb2.append(" frame type ");
        sb2.append(i5);
        throw ParserException.a(sb2.toString(), null);
    }

    public final boolean e(k kVar) {
        kVar.e();
        byte[] bArr = f74863p;
        byte[] bArr2 = new byte[bArr.length];
        kVar.b(0, bArr.length, bArr2);
        if (Arrays.equals(bArr2, bArr)) {
            this.f74867b = false;
            kVar.m(bArr.length);
            return true;
        }
        kVar.e();
        byte[] bArr3 = f74864q;
        byte[] bArr4 = new byte[bArr3.length];
        kVar.b(0, bArr3.length, bArr4);
        if (!Arrays.equals(bArr4, bArr3)) {
            return false;
        }
        this.f74867b = true;
        kVar.m(bArr3.length);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x007d  */
    @Override // ke.j
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int g(k kVar, m mVar) throws ParserException {
        int iC;
        wf.a.j(this.f74876k);
        int i5 = wf.v.f94376a;
        if (((g) kVar).f71398d == 0 && !e(kVar)) {
            throw ParserException.a("Could not find AMR header.", null);
        }
        if (!this.f74878m) {
            this.f74878m = true;
            boolean z11 = this.f74867b;
            String str = z11 ? "audio/amr-wb" : "audio/3gpp";
            int i11 = z11 ? 16000 : 8000;
            v vVar = this.f74876k;
            j0 j0Var = new j0();
            j0Var.f54856k = str;
            j0Var.f54857l = f74865r;
            j0Var.f54867x = 1;
            j0Var.f54868y = i11;
            vVar.a(new k0(j0Var));
        }
        int i12 = -1;
        if (this.f74870e == 0) {
            try {
                int iD = d(kVar);
                this.f74869d = iD;
                this.f74870e = iD;
                if (this.f74872g == -1) {
                    long j11 = ((g) kVar).f71398d;
                    this.f74872g = iD;
                }
                if (this.f74872g == iD) {
                    this.f74873h++;
                }
                iC = this.f74876k.c(kVar, this.f74870e, true);
                if (iC != -1) {
                    int i13 = this.f74870e - iC;
                    this.f74870e = i13;
                    i12 = 0;
                    if (i13 <= 0) {
                        this.f74876k.b(this.f74868c + this.f74874i, 1, this.f74869d, 0, null);
                        this.f74868c += 20000;
                    }
                }
            } catch (EOFException unused) {
            }
        } else {
            iC = this.f74876k.c(kVar, this.f74870e, true);
            if (iC != -1) {
            }
        }
        if (!this.f74871f) {
            n nVar = new n(-9223372036854775807L);
            this.f74877l = nVar;
            this.f74875j.j(nVar);
            this.f74871f = true;
        }
        return i12;
    }

    @Override // ke.j
    public final void release() {
    }
}
