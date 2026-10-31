package com.google.android.exoplayer2.mediacodec;

import android.media.MediaCodec;
import com.google.android.exoplayer2.decoder.DecoderException;
import we.l;
import wf.v;

/* loaded from: classes3.dex */
public class MediaCodecDecoderException extends DecoderException {

    /* renamed from: a, reason: collision with root package name */
    public final String f31462a;

    public MediaCodecDecoderException(IllegalStateException illegalStateException, l lVar) {
        StringBuilder sb2 = new StringBuilder("Decoder failed: ");
        String diagnosticInfo = null;
        sb2.append(lVar == null ? null : lVar.f94250a);
        super(sb2.toString(), illegalStateException);
        if (v.f94376a >= 21 && (illegalStateException instanceof MediaCodec.CodecException)) {
            diagnosticInfo = ((MediaCodec.CodecException) illegalStateException).getDiagnosticInfo();
        }
        this.f31462a = diagnosticInfo;
    }
}
