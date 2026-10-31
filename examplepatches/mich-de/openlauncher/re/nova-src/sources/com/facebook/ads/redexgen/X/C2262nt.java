package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.facebook.ads.internal.protocol.AdErrorType;

/* renamed from: com.facebook.ads.redexgen.X.nt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2262nt {
    public final AdErrorType A00;
    public final String A01;

    public C2262nt(int i5, String str) {
        this(AdErrorType.adErrorTypeFromCode(i5), str);
    }

    public C2262nt(AdErrorType adErrorType, String str) {
        str = TextUtils.isEmpty(str) ? adErrorType.getDefaultErrorMessage() : str;
        this.A00 = adErrorType;
        this.A01 = str;
    }

    public static C2262nt A00(AdErrorType adErrorType) {
        return new C2262nt(adErrorType, (String) null);
    }

    public static C2262nt A01(AdErrorType adErrorType, String str) {
        return new C2262nt(adErrorType, str);
    }

    public static C2262nt A02(C2263nu c2263nu) {
        return new C2262nt(c2263nu.A00(), c2263nu.A01());
    }

    public final AdErrorType A03() {
        return this.A00;
    }

    public final String A04() {
        return this.A01;
    }
}
