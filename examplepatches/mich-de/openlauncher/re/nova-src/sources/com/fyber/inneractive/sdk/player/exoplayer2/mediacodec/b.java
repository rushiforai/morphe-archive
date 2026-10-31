package com.fyber.inneractive.sdk.player.exoplayer2.mediacodec;

import android.media.MediaCodec;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class b extends Exception {
    public b(o oVar, f fVar, int i5) {
        super("Decoder init failed: [" + i5 + "], " + oVar, fVar);
        String str = oVar.f30128f;
    }

    public b(o oVar, Exception exc, String str) {
        super("Decoder init failed: " + str + ", " + oVar, exc);
        String str2 = oVar.f30128f;
        if (z.f30489a < 21 || !(exc instanceof MediaCodec.CodecException)) {
            return;
        }
        ((MediaCodec.CodecException) exc).getDiagnosticInfo();
    }
}
