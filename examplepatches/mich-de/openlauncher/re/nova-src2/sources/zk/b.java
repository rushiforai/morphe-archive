package zk;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.common.io.BaseEncoding$DecodingException;
import vk.b0;

/* loaded from: classes.dex */
public final class b extends d {

    /* renamed from: g, reason: collision with root package name */
    public final char[] f98546g;

    public b(a aVar) {
        super(aVar, (Character) null);
        this.f98546g = new char[EventBridgeChannel.QUEUE_CAPACITY];
        char[] cArr = aVar.f98538b;
        b0.c(cArr.length == 16);
        for (int i5 = 0; i5 < 256; i5++) {
            char[] cArr2 = this.f98546g;
            cArr2[i5] = cArr[i5 >>> 4];
            cArr2[i5 | 256] = cArr[i5 & 15];
        }
    }

    @Override // zk.d
    public final int b(byte[] bArr, CharSequence charSequence) throws BaseEncoding$DecodingException {
        if (charSequence.length() % 2 == 1) {
            throw new BaseEncoding$DecodingException("Invalid input length " + charSequence.length());
        }
        int i5 = 0;
        int i11 = 0;
        while (i5 < charSequence.length()) {
            char cCharAt = charSequence.charAt(i5);
            a aVar = this.f98550a;
            bArr[i11] = (byte) ((aVar.a(cCharAt) << 4) | aVar.a(charSequence.charAt(i5 + 1)));
            i5 += 2;
            i11++;
        }
        return i11;
    }

    @Override // zk.d
    public final void e(StringBuilder sb2, byte[] bArr, int i5) {
        b0.i(0, i5, bArr.length);
        for (int i11 = 0; i11 < i5; i11++) {
            int i12 = bArr[i11] & 255;
            char[] cArr = this.f98546g;
            sb2.append(cArr[i12]);
            sb2.append(cArr[i12 | 256]);
        }
    }

    @Override // zk.d
    public final d g(a aVar, Character ch) {
        return new b(aVar);
    }
}
