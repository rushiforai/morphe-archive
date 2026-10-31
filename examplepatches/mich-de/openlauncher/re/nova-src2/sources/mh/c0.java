package mh;

import com.amplitude.eventbridge.EventBridgeChannel;

/* loaded from: classes3.dex */
public final class c0 extends e0 {

    /* renamed from: e, reason: collision with root package name */
    public final char[] f76326e;

    public c0(b0 b0Var) {
        super(b0Var, (Character) null);
        this.f76326e = new char[EventBridgeChannel.QUEUE_CAPACITY];
        char[] cArr = b0Var.f76315b;
        if (cArr.length != 16) {
            throw new IllegalArgumentException();
        }
        for (int i5 = 0; i5 < 256; i5++) {
            char[] cArr2 = this.f76326e;
            cArr2[i5] = cArr[i5 >>> 4];
            cArr2[i5 | 256] = cArr[i5 & 15];
        }
    }

    @Override // mh.e0
    public final void a(StringBuilder sb2, byte[] bArr, int i5) {
        a.m(0, i5, bArr.length);
        for (int i11 = 0; i11 < i5; i11++) {
            int i12 = bArr[i11] & 255;
            char[] cArr = this.f76326e;
            sb2.append(cArr[i12]);
            sb2.append(cArr[i12 | 256]);
        }
    }
}
