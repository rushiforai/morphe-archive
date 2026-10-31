package com.facebook.ads.redexgen.X;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: assets/audience_network/classes.dex */
public interface LZ {
    public static final ByteBuffer A00 = ByteBuffer.allocateDirect(0).order(ByteOrder.nativeOrder());

    LX A5g(LX lx2) throws LY;

    ByteBuffer A9G();

    boolean AB3();

    boolean AB7();

    void AIT();

    void AIU(ByteBuffer byteBuffer);

    void flush();
}
