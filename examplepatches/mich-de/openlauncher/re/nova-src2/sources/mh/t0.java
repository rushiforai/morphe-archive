package mh;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public final class t0 {

    /* renamed from: a, reason: collision with root package name */
    public final byte f76378a;

    /* renamed from: b, reason: collision with root package name */
    public final byte f76379b;

    public t0(int i5) {
        this.f76378a = (byte) (i5 & Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
        this.f76379b = (byte) (i5 & 31);
    }
}
