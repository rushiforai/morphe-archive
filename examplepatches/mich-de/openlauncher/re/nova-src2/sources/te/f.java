package te;

import com.google.android.exoplayer2.ParserException;
import java.io.EOFException;
import ke.k;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public int f89032a;

    /* renamed from: b, reason: collision with root package name */
    public long f89033b;

    /* renamed from: c, reason: collision with root package name */
    public int f89034c;

    /* renamed from: d, reason: collision with root package name */
    public int f89035d;

    /* renamed from: e, reason: collision with root package name */
    public int f89036e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f89037f = new int[255];

    /* renamed from: g, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f89038g = new com.google.android.gms.internal.consent_sdk.a(255);

    public final boolean a(k kVar, boolean z11) throws ParserException, EOFException {
        boolean zD;
        boolean zD2;
        this.f89032a = 0;
        this.f89033b = 0L;
        this.f89034c = 0;
        this.f89035d = 0;
        this.f89036e = 0;
        com.google.android.gms.internal.consent_sdk.a aVar = this.f89038g;
        aVar.U(27);
        try {
            zD = kVar.d((byte[]) aVar.f31986d, 0, 27, z11);
        } catch (EOFException e3) {
            if (!z11) {
                throw e3;
            }
            zD = false;
        }
        if (zD && aVar.O() == 1332176723) {
            if (aVar.N() == 0) {
                this.f89032a = aVar.N();
                this.f89033b = aVar.D();
                aVar.E();
                aVar.E();
                aVar.E();
                int iN = aVar.N();
                this.f89034c = iN;
                this.f89035d = iN + 27;
                aVar.U(iN);
                try {
                    zD2 = kVar.d((byte[]) aVar.f31986d, 0, this.f89034c, z11);
                } catch (EOFException e11) {
                    if (!z11) {
                        throw e11;
                    }
                    zD2 = false;
                }
                if (zD2) {
                    for (int i5 = 0; i5 < this.f89034c; i5++) {
                        int iN2 = aVar.N();
                        this.f89037f[i5] = iN2;
                        this.f89036e += iN2;
                    }
                    return true;
                }
            } else if (!z11) {
                throw ParserException.b("unsupported bit stream revision");
            }
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x004d, code lost:
    
        if (r11 == (-1)) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0055, code lost:
    
        if (r10.getPosition() >= r11) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x005c, code lost:
    
        if (r10.l(1) == (-1)) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005f, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b(k kVar, long j11) {
        boolean zD;
        wf.a.e(kVar.getPosition() == kVar.g());
        com.google.android.gms.internal.consent_sdk.a aVar = this.f89038g;
        aVar.U(4);
        while (true) {
            if (j11 != -1 && kVar.getPosition() + 4 >= j11) {
                break;
            }
            try {
                zD = kVar.d((byte[]) aVar.f31986d, 0, 4, true);
            } catch (EOFException unused) {
                zD = false;
            }
            if (!zD) {
                break;
            }
            aVar.Y(0);
            if (aVar.O() == 1332176723) {
                kVar.e();
                return true;
            }
            kVar.m(1);
        }
    }
}
