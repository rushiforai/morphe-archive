package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vbg extends eag {
    public final byte[] g;

    public vbg(byte[] bArr) {
        super(Arrays.copyOfRange(bArr, 0, 25));
        this.g = bArr;
    }

    @Override // defpackage.eag
    public final byte[] o() {
        return this.g;
    }
}
