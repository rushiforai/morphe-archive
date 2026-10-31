package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class i extends l {
    public static final int o = z.a("Opus");

    /* renamed from: p, reason: collision with root package name */
    public static final byte[] f29702p = {79, 112, 117, 115, 72, 101, 97, 100};
    public boolean n;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final void a(boolean z11) {
        super.a(z11);
        if (z11) {
            this.n = false;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int i5;
        byte[] bArr = nVar.f30461a;
        byte b11 = bArr[0];
        int i11 = b11 & 255;
        int i12 = b11 & 3;
        if (i12 != 0) {
            i5 = 2;
            if (i12 != 1 && i12 != 2) {
                i5 = bArr[1] & 63;
            }
        } else {
            i5 = 1;
        }
        int i13 = i11 >> 3;
        return (this.f29713i * (i5 * (i13 >= 16 ? 2500 << r0 : i13 >= 12 ? 10000 << (i13 & 1) : (i13 & 3) == 3 ? 60000 : 10000 << r0))) / 1000000;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, long j11, j jVar) {
        if (!this.n) {
            byte[] bArrCopyOf = Arrays.copyOf(nVar.f30461a, nVar.f30463c);
            int i5 = bArrCopyOf[9] & 255;
            int i11 = ((bArrCopyOf[11] & 255) << 8) | (bArrCopyOf[10] & 255);
            ArrayList arrayList = new ArrayList(3);
            arrayList.add(bArrCopyOf);
            arrayList.add(ByteBuffer.allocate(8).order(ByteOrder.nativeOrder()).putLong((i11 * 1000000000) / 48000).array());
            arrayList.add(ByteBuffer.allocate(8).order(ByteOrder.nativeOrder()).putLong((3840 * 1000000000) / 48000).array());
            jVar.f29703a = com.fyber.inneractive.sdk.player.exoplayer2.o.a(null, "audio/opus", -1, -1, i5, 48000, arrayList, null, null);
            this.n = true;
            return true;
        }
        boolean z11 = nVar.b() == o;
        nVar.e(0);
        return z11;
    }
}
