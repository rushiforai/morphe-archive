package ne;

import ke.c;
import ke.d;
import ke.e;
import ke.k;
import ke.m;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final ke.a f78222a;

    /* renamed from: b, reason: collision with root package name */
    public final e f78223b;

    /* renamed from: c, reason: collision with root package name */
    public ke.b f78224c;

    /* renamed from: d, reason: collision with root package name */
    public final int f78225d;

    public a(c cVar, e eVar, long j11, long j12, long j13, long j14, long j15, int i5) {
        this.f78223b = eVar;
        this.f78225d = i5;
        this.f78222a = new ke.a(cVar, j11, j12, j13, j14, j15);
    }

    public static int a(int i5, byte[] bArr) {
        return (bArr[i5 + 3] & 255) | ((bArr[i5] & 255) << 24) | ((bArr[i5 + 1] & 255) << 16) | ((bArr[i5 + 2] & 255) << 8);
    }

    public static int c(k kVar, long j11, m mVar) {
        if (j11 == kVar.getPosition()) {
            return 0;
        }
        mVar.f71407a = j11;
        return 1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00cc, code lost:
    
        return c(r28, r8, r29);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int b(k kVar, m mVar) {
        while (true) {
            ke.b bVar = this.f78224c;
            wf.a.j(bVar);
            long j11 = bVar.f71382f;
            long j12 = bVar.f71383g;
            long j13 = bVar.f71384h;
            long j14 = j12 - j11;
            long j15 = this.f78225d;
            e eVar = this.f78223b;
            if (j14 <= j15) {
                this.f78224c = null;
                eVar.l();
                return c(kVar, j11, mVar);
            }
            long position = j13 - kVar.getPosition();
            if (position < 0 || position > 262144) {
                break;
            }
            kVar.m((int) position);
            kVar.e();
            d dVarJ = eVar.j(kVar, bVar.f71378b);
            int i5 = dVarJ.f71386a;
            long j16 = dVarJ.f71387b;
            long j17 = dVarJ.f71388c;
            if (i5 == -3) {
                this.f78224c = null;
                eVar.l();
                return c(kVar, j13, mVar);
            }
            if (i5 == -2) {
                bVar.f71380d = j16;
                bVar.f71382f = j17;
                bVar.f71384h = ke.b.a(bVar.f71378b, j16, bVar.f71381e, j17, bVar.f71383g, bVar.f71379c);
            } else {
                if (i5 != -1) {
                    if (i5 != 0) {
                        throw new IllegalStateException("Invalid case");
                    }
                    long position2 = j17 - kVar.getPosition();
                    if (position2 >= 0 && position2 <= 262144) {
                        kVar.m((int) position2);
                    }
                    this.f78224c = null;
                    eVar.l();
                    return c(kVar, j17, mVar);
                }
                bVar.f71381e = j16;
                bVar.f71383g = j17;
                bVar.f71384h = ke.b.a(bVar.f71378b, bVar.f71380d, j16, bVar.f71382f, j17, bVar.f71379c);
            }
        }
    }

    public final void d(long j11) {
        ke.b bVar = this.f78224c;
        if (bVar == null || bVar.f71377a != j11) {
            ke.a aVar = this.f78222a;
            this.f78224c = new ke.b(j11, aVar.f71371a.c(j11), aVar.f71373c, aVar.f71374d, aVar.f71375e, aVar.f71376f);
        }
    }
}
