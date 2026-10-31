package com.facebook.ads.redexgen.X;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.facebook.ads.androidx.media3.extractor.metadata.emsg.EventMessage;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.Zm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1400Zm {
    public final ByteArrayOutputStream A00 = new ByteArrayOutputStream(EventBridgeChannel.QUEUE_CAPACITY);
    public final DataOutputStream A01 = new DataOutputStream(this.A00);

    public static void A00(DataOutputStream dataOutputStream, String str) throws IOException {
        dataOutputStream.writeBytes(str);
        dataOutputStream.writeByte(0);
    }

    public final byte[] A01(EventMessage eventMessage) throws IOException {
        this.A00.reset();
        try {
            A00(this.A01, eventMessage.A03);
            A00(this.A01, eventMessage.A04 != null ? eventMessage.A04 : b.f42142b);
            this.A01.writeLong(eventMessage.A01);
            this.A01.writeLong(eventMessage.A02);
            this.A01.write(eventMessage.A05);
            this.A01.flush();
            return this.A00.toByteArray();
        } catch (IOException e3) {
            throw new RuntimeException(e3);
        }
    }
}
