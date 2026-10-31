package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.ads.androidx.media3.common.MediaItem;
import com.facebook.ads.androidx.media3.common.StreamKey;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Kj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1034Kj {
    public Uri A00;
    public C1270Ud A04;
    public Object A05;
    public String A06;
    public String A07;
    public String A08;
    public C1035Kk A01 = new C1035Kk();
    public C1037Km A02 = new C1037Km();
    public List<StreamKey> A09 = Collections.emptyList();
    public List<MediaItem.SubtitleConfiguration> A0A = Collections.emptyList();
    public C1040Kp A03 = new C1040Kp();

    public final C1034Kj A00(Uri uri) {
        this.A00 = uri;
        return this;
    }

    public final C1034Kj A01(Object obj) {
        this.A05 = obj;
        return this;
    }

    public final C1034Kj A02(String str) {
        this.A06 = str;
        return this;
    }

    public final C1034Kj A03(String str) {
        this.A07 = (String) AbstractC1062Ln.A01(str);
        return this;
    }

    public final C1034Kj A04(List<StreamKey> streamKeys) {
        List<StreamKey> listEmptyList;
        if (streamKeys != null && !streamKeys.isEmpty()) {
            listEmptyList = Collections.unmodifiableList(new ArrayList(streamKeys));
        } else {
            listEmptyList = Collections.emptyList();
        }
        this.A09 = listEmptyList;
        return this;
    }

    public final C1273Ug A05() {
        AbstractC1062Ln.A08(this.A02.A00 == null || this.A02.A03 != null);
        C1274Uh c1274Uh = null;
        Uri uri = this.A00;
        if (uri != null) {
            c1274Uh = new C1274Uh(uri, this.A08, this.A02.A03 != null ? this.A02.A08() : null, null, this.A09, this.A06, this.A0A, this.A05);
        }
        return new C1273Ug(this.A07 != null ? this.A07 : b.f42142b, this.A01.A0B(), c1274Uh, this.A03.A05(), this.A04 != null ? this.A04 : C1270Ud.A0Z);
    }
}
