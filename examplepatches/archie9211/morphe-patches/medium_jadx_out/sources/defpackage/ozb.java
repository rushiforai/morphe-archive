package defpackage;

import com.medium.proto.model.SequenceColorPalette;
import com.squareup.wire.Message;
import gen.model.ColorSpectrum;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ozb extends Message.Builder {
    public ColorSpectrum a;
    public ColorSpectrum b;
    public ColorSpectrum c;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new SequenceColorPalette(this.a, this.b, this.c, buildUnknownFields());
    }
}
