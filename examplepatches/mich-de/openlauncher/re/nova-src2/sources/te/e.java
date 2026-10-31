package te;

import java.io.EOFException;
import ke.k;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final f f89027a = new f();

    /* renamed from: b, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f89028b = new com.google.android.gms.internal.consent_sdk.a(new byte[65025], 0);

    /* renamed from: c, reason: collision with root package name */
    public int f89029c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f89030d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f89031e;

    public final int a(int i5) {
        int i11;
        int i12 = 0;
        this.f89030d = 0;
        do {
            int i13 = this.f89030d;
            int i14 = i5 + i13;
            f fVar = this.f89027a;
            if (i14 >= fVar.f89034c) {
                break;
            }
            int[] iArr = fVar.f89037f;
            this.f89030d = i13 + 1;
            i11 = iArr[i14];
            i12 += i11;
        } while (i11 == 255);
        return i12;
    }

    public final boolean b(k kVar) {
        int i5;
        wf.a.i(kVar != null);
        boolean z11 = this.f89031e;
        com.google.android.gms.internal.consent_sdk.a aVar = this.f89028b;
        if (z11) {
            this.f89031e = false;
            aVar.U(0);
        }
        while (!this.f89031e) {
            int i11 = this.f89029c;
            f fVar = this.f89027a;
            if (i11 < 0) {
                if (fVar.b(kVar, -1L) && fVar.a(kVar, true)) {
                    int iA = fVar.f89035d;
                    if ((fVar.f89032a & 1) == 1 && aVar.f31985c == 0) {
                        iA += a(0);
                        i5 = this.f89030d;
                    } else {
                        i5 = 0;
                    }
                    try {
                        kVar.m(iA);
                        this.f89029c = i5;
                    } catch (EOFException unused) {
                    }
                }
                return false;
            }
            int iA2 = a(this.f89029c);
            int i12 = this.f89029c + this.f89030d;
            if (iA2 > 0) {
                aVar.p(aVar.f31985c + iA2);
                try {
                    kVar.readFully((byte[]) aVar.f31986d, aVar.f31985c, iA2);
                    aVar.X(aVar.f31985c + iA2);
                    this.f89031e = fVar.f89037f[i12 + (-1)] != 255;
                } catch (EOFException unused2) {
                    return false;
                }
            }
            if (i12 == fVar.f89034c) {
                i12 = -1;
            }
            this.f89029c = i12;
        }
        return true;
    }
}
