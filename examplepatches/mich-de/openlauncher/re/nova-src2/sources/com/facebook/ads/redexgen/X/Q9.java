package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public interface Q9 extends KR {
    void A4X(int i5) throws IOException;

    boolean A4Y(int i5, boolean z11) throws IOException;

    long A90();

    long A9L();

    long A9Q();

    @MetaExoPlayerCustomization
    Uri AA2();

    int AI5(byte[] bArr, int i5, int i11) throws IOException;

    void AI6(byte[] bArr, int i5, int i11) throws IOException;

    boolean AI7(byte[] bArr, int i5, int i11, boolean z11) throws IOException;

    boolean AIe(byte[] bArr, int i5, int i11, boolean z11) throws IOException;

    void AK3();

    int ALI(int i5) throws IOException;

    void ALL(int i5) throws IOException;

    @Override // com.facebook.ads.redexgen.X.KR
    int read(byte[] bArr, int i5, int i11) throws IOException;

    void readFully(byte[] bArr, int i5, int i11) throws IOException;
}
