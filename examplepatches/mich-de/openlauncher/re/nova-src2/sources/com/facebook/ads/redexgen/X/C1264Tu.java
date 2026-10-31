package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.ads.androidx.media3.common.StreamKey;
import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Tu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1264Tu {
    public String A00;
    public String A01;
    public List<StreamKey> A02;
    public byte[] A03;
    public byte[] A04;
    public final Uri A05;
    public final String A06;

    public C1264Tu(String str, Uri uri) {
        this.A06 = str;
        this.A05 = uri;
    }

    public final C1264Tu A00(String str) {
        this.A00 = str;
        return this;
    }

    public final C1264Tu A01(String str) {
        this.A01 = str;
        return this;
    }

    public final C1264Tu A02(List<StreamKey> streamKeys) {
        this.A02 = streamKeys;
        return this;
    }

    public final C1264Tu A03(byte[] bArr) {
        this.A03 = bArr;
        return this;
    }

    public final C1264Tu A04(byte[] bArr) {
        this.A04 = bArr;
        return this;
    }

    public final DownloadRequest A05() {
        return new DownloadRequest(this.A06, this.A05, this.A01, this.A02 != null ? this.A02 : AbstractC07549l.A03(), this.A04, this.A00, this.A03, null);
    }
}
