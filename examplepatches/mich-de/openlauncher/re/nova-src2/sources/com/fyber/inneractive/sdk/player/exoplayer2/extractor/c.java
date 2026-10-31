package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

import com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.b0;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.u;
import com.fyber.inneractive.sdk.player.exoplayer2.util.v;
import java.lang.reflect.Constructor;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class c implements k {

    /* renamed from: a, reason: collision with root package name */
    public static final Constructor f29137a;

    static {
        Constructor constructor = null;
        try {
            constructor = Class.forName("com.fyber.inneractive.sdk.player.exoplayer2.ext.flac.FlacExtractor").asSubclass(i.class).getConstructor(null);
        } catch (ClassNotFoundException | NoSuchMethodException unused) {
        }
        f29137a = constructor;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.k
    public final synchronized i[] a() {
        i[] iVarArr;
        Constructor constructor = f29137a;
        iVarArr = new i[constructor == null ? 11 : 12];
        iVarArr[0] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.mkv.e();
        iVarArr[1] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.m(null);
        iVarArr[2] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.p();
        iVarArr[3] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3.c(-9223372036854775807L);
        iVarArr[4] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.c(0L);
        iVarArr[5] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.a(0L);
        iVarArr[6] = new b0(1, new v(0L), new com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.e(0, Collections.EMPTY_LIST));
        iVarArr[7] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.flv.b();
        iVarArr[8] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.e();
        iVarArr[9] = new u();
        iVarArr[10] = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.wav.a();
        if (constructor != null) {
            try {
                iVarArr[11] = (i) constructor.newInstance(null);
            } catch (Exception e3) {
                throw new IllegalStateException("Unexpected error creating FLAC extractor", e3);
            }
        }
        return iVarArr;
    }
}
