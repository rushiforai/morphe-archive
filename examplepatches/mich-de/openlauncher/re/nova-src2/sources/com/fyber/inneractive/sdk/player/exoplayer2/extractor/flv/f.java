package com.fyber.inneractive.sdk.player.exoplayer2.extractor.flv;

import com.fyber.inneractive.sdk.player.exoplayer2.extractor.r;
import com.fyber.inneractive.sdk.player.exoplayer2.m;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.util.l;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;

/* loaded from: classes3.dex */
public final class f extends e {

    /* renamed from: b, reason: collision with root package name */
    public final n f29177b;

    /* renamed from: c, reason: collision with root package name */
    public final n f29178c;

    /* renamed from: d, reason: collision with root package name */
    public int f29179d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f29180e;

    /* renamed from: f, reason: collision with root package name */
    public int f29181f;

    public f(r rVar) {
        super(rVar);
        this.f29177b = new n(l.f30453a);
        this.f29178c = new n(4);
    }

    public final boolean a(n nVar) throws d {
        int iJ = nVar.j();
        int i5 = (iJ >> 4) & 15;
        int i11 = iJ & 15;
        if (i11 != 7) {
            throw new d(m.a("Video format not supported: ", i11));
        }
        this.f29181f = i5;
        return i5 != 5;
    }

    public final void a(n nVar, long j11) throws com.fyber.inneractive.sdk.player.exoplayer2.r {
        int iJ = nVar.j();
        long jL = (nVar.l() * 1000) + j11;
        if (iJ == 0 && !this.f29180e) {
            byte[] bArr = new byte[nVar.f30463c - nVar.f30462b];
            n nVar2 = new n(bArr);
            nVar.a(bArr, 0, nVar.f30463c - nVar.f30462b);
            com.fyber.inneractive.sdk.player.exoplayer2.video.a aVarA = com.fyber.inneractive.sdk.player.exoplayer2.video.a.a(nVar2);
            this.f29179d = aVarA.f30520b;
            this.f29176a.a(o.a(null, "video/avc", -1, aVarA.f30521c, aVarA.f30522d, aVarA.f30519a, -1, aVarA.f30523e, null, -1, null, null));
            this.f29180e = true;
            return;
        }
        if (iJ == 1 && this.f29180e) {
            byte[] bArr2 = this.f29178c.f30461a;
            bArr2[0] = 0;
            bArr2[1] = 0;
            bArr2[2] = 0;
            int i5 = 4 - this.f29179d;
            int i11 = 0;
            while (nVar.f30463c - nVar.f30462b > 0) {
                nVar.a(this.f29178c.f30461a, i5, this.f29179d);
                this.f29178c.e(0);
                int iM = this.f29178c.m();
                this.f29177b.e(0);
                this.f29176a.a(4, this.f29177b);
                this.f29176a.a(iM, nVar);
                i11 = i11 + 4 + iM;
            }
            this.f29176a.a(jL, this.f29181f == 1 ? 1 : 0, i11, 0, null);
        }
    }
}
