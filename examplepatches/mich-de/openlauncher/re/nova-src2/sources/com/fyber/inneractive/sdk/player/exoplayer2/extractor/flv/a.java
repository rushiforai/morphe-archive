package com.fyber.inneractive.sdk.player.exoplayer2.extractor.flv;

import android.util.Pair;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.r;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class a extends e {

    /* renamed from: e, reason: collision with root package name */
    public static final int[] f29158e = {5512, 11025, 22050, 44100};

    /* renamed from: b, reason: collision with root package name */
    public boolean f29159b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f29160c;

    /* renamed from: d, reason: collision with root package name */
    public int f29161d;

    public a(r rVar) {
        super(rVar);
    }

    public final boolean a(n nVar) throws d {
        if (this.f29159b) {
            nVar.e(nVar.f30462b + 1);
        } else {
            int iJ = nVar.j();
            int i5 = (iJ >> 4) & 15;
            this.f29161d = i5;
            if (i5 == 2) {
                this.f29176a.a(o.a(null, "audio/mpeg", -1, -1, 1, f29158e[(iJ >> 2) & 3], null, null, null));
                this.f29160c = true;
            } else if (i5 == 7 || i5 == 8) {
                this.f29176a.a(o.a(null, i5 == 7 ? "audio/g711-alaw" : "audio/g711-mlaw", -1, -1, 1, 8000, (iJ & 1) == 1 ? 2 : 3, -1, -1, null, null, 0, null, null));
                this.f29160c = true;
            } else if (i5 != 10) {
                throw new d("Audio format not supported: " + this.f29161d);
            }
            this.f29159b = true;
        }
        return true;
    }

    public final void a(n nVar, long j11) {
        if (this.f29161d == 2) {
            int i5 = nVar.f30463c - nVar.f30462b;
            this.f29176a.a(i5, nVar);
            this.f29176a.a(j11, 1, i5, 0, null);
            return;
        }
        int iJ = nVar.j();
        if (iJ == 0 && !this.f29160c) {
            int i11 = nVar.f30463c - nVar.f30462b;
            byte[] bArr = new byte[i11];
            nVar.a(bArr, 0, i11);
            Pair pairA = com.fyber.inneractive.sdk.player.exoplayer2.util.d.a(bArr);
            this.f29176a.a(o.a(null, "audio/mp4a-latm", -1, -1, ((Integer) pairA.second).intValue(), ((Integer) pairA.first).intValue(), Collections.singletonList(bArr), null, null));
            this.f29160c = true;
            return;
        }
        if (this.f29161d != 10 || iJ == 1) {
            int i12 = nVar.f30463c - nVar.f30462b;
            this.f29176a.a(i12, nVar);
            this.f29176a.a(j11, 1, i12, 0, null);
        }
    }
}
