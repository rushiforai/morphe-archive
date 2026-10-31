package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Metadata;
import java.nio.ByteBuffer;

/* renamed from: com.facebook.ads.redexgen.X.Pn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1158Pn implements InterfaceC1396Zi {
    public abstract Metadata A0R(C07368e c07368e, ByteBuffer byteBuffer);

    @Override // com.facebook.ads.redexgen.X.InterfaceC1396Zi
    public final Metadata A6N(C07368e c07368e) {
        ByteBuffer byteBuffer = (ByteBuffer) AbstractC1062Ln.A01(c07368e.A02);
        AbstractC1062Ln.A07(byteBuffer.position() == 0 && byteBuffer.hasArray() && byteBuffer.arrayOffset() == 0);
        if (c07368e.A04()) {
            return null;
        }
        return A0R(c07368e, byteBuffer);
    }
}
