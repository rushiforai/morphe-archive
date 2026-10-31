package com.pgl.ssdk;

import android.content.Context;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public class ap extends am {
    private Context n;
    private final int o;

    public ap(Context context, int i5) {
        super(context);
        this.n = context;
        this.o = i5;
    }

    @Override // com.pgl.ssdk.am
    public String a() {
        StringBuilder sb2;
        String strA;
        int i5 = this.o;
        if (i5 == 222) {
            sb2 = new StringBuilder("/ssdk/v2/r?os=0&ver=8.1.0.0.overseas-rc.2&mode=1&app_ver=");
            sb2.append(ab.h(this.n));
            sb2.append("&region=");
            sb2.append(ad.a());
            sb2.append("&did=");
            sb2.append(com.pgl.ssdk.ces.b.b());
            sb2.append("&aid=");
            strA = com.pgl.ssdk.ces.b.a();
        } else {
            if (i5 != 301) {
                return null;
            }
            sb2 = new StringBuilder("/ssdk/sd/token?os=android&app_id=");
            sb2.append(com.pgl.ssdk.ces.b.a());
            sb2.append("&did=");
            sb2.append(com.pgl.ssdk.ces.b.b());
            sb2.append("&app_ver=");
            sb2.append(ab.h(this.n));
            strA = "&platform=android&ver=8.1.0.0.overseas-rc.2&mode=1";
        }
        sb2.append(strA);
        return sb2.toString();
    }

    @Override // com.pgl.ssdk.am
    public void a(int i5, byte[] bArr) {
        try {
            int i11 = this.o;
            if (i11 == 222) {
                ((Integer) com.pgl.ssdk.ces.a.meta(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, null, bArr)).getClass();
            } else if (i11 == 301) {
                a4.a(bArr);
            }
        } catch (Throwable unused) {
        }
    }
}
