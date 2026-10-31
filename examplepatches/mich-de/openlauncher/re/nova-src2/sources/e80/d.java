package e80;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class d implements e {

    /* renamed from: a, reason: collision with root package name */
    public final k f52249a;

    /* renamed from: b, reason: collision with root package name */
    public final a f52250b;

    /* renamed from: c, reason: collision with root package name */
    public h f52251c;

    /* renamed from: d, reason: collision with root package name */
    public int f52252d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f52253e;

    /* renamed from: f, reason: collision with root package name */
    public long f52254f;

    public d(k kVar) {
        this.f52249a = kVar;
        a aVarI = kVar.i();
        this.f52250b = aVarI;
        h hVar = aVarI.f52245a;
        this.f52251c = hVar;
        this.f52252d = hVar != null ? hVar.f52261b : -1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x001b, code lost:
    
        if (r3 == r5.f52261b) goto L15;
     */
    @Override // e80.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long B(a aVar, long j11) {
        h hVar;
        if (this.f52253e) {
            throw new IllegalStateException("Source is closed.");
        }
        if (j11 < 0) {
            throw new IllegalArgumentException(c1.o(j11, "byteCount (", ") < 0").toString());
        }
        h hVar2 = this.f52251c;
        a aVar2 = this.f52250b;
        if (hVar2 != null) {
            h hVar3 = aVar2.f52245a;
            if (hVar2 == hVar3) {
                int i5 = this.f52252d;
                Intrinsics.d(hVar3);
            }
            throw new IllegalStateException("Peek source is invalid because upstream source was used");
        }
        if (j11 == 0) {
            return 0L;
        }
        if (!this.f52249a.j(this.f52254f + 1)) {
            return -1L;
        }
        if (this.f52251c == null && (hVar = aVar2.f52245a) != null) {
            this.f52251c = hVar;
            this.f52252d = hVar.f52261b;
        }
        long jMin = Math.min(j11, aVar2.f52247c - this.f52254f);
        long j12 = this.f52254f;
        long j13 = j12 + jMin;
        n.a(aVar2.f52247c, j12, j13);
        if (j12 != j13) {
            long j14 = j13 - j12;
            aVar.f52247c += j14;
            h hVar4 = aVar2.f52245a;
            while (true) {
                Intrinsics.d(hVar4);
                long j15 = hVar4.f52262c - hVar4.f52261b;
                if (j12 < j15) {
                    break;
                }
                j12 -= j15;
                hVar4 = hVar4.f52265f;
            }
            while (j14 > 0) {
                Intrinsics.d(hVar4);
                h hVarD = hVar4.d();
                int i11 = hVarD.f52261b + ((int) j12);
                hVarD.f52261b = i11;
                hVarD.f52262c = Math.min(i11 + ((int) j14), hVarD.f52262c);
                if (aVar.f52245a == null) {
                    aVar.f52245a = hVarD;
                    aVar.f52246b = hVarD;
                } else {
                    h hVar5 = aVar.f52246b;
                    Intrinsics.d(hVar5);
                    hVar5.c(hVarD);
                    aVar.f52246b = hVarD;
                }
                j14 -= hVarD.f52262c - hVarD.f52261b;
                hVar4 = hVar4.f52265f;
                j12 = 0;
            }
        }
        this.f52254f += jMin;
        return jMin;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        this.f52253e = true;
    }
}
