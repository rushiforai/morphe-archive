package com.fyber.inneractive.sdk.network.timeouts;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public int f28791a = 0;

    /* renamed from: b, reason: collision with root package name */
    public int f28792b = 0;

    /* renamed from: c, reason: collision with root package name */
    public int f28793c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f28794d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f28795e = 0;

    /* renamed from: f, reason: collision with root package name */
    public int f28796f = 0;

    /* renamed from: g, reason: collision with root package name */
    public boolean f28797g = false;

    public final int a() {
        int iMax;
        int i5 = this.f28793c;
        int i11 = this.f28794d;
        if (i11 <= 0) {
            IAlog.f("%s Unable resolve retries because of invalid ILAT: %d, will set retries to 0", IAlog.a(com.fyber.inneractive.sdk.network.timeouts.content.a.class), Integer.valueOf(i11));
            iMax = 0;
        } else {
            int i12 = i5 / i11;
            int i13 = i12 - 1;
            if (i13 > 3) {
                i13 = i12 - 2;
            }
            iMax = Math.max(i13, 0);
        }
        int i14 = this.f28793c;
        int i15 = this.f28794d;
        int i16 = this.f28795e;
        int i17 = this.f28796f;
        int iMax2 = Math.max(0, i14);
        int iMax3 = Math.max(0, i15);
        int iMax4 = Math.max(0, iMax);
        int iMax5 = Math.max(0, (iMax2 - (Math.max(0, i16) * iMax4)) - (Math.max(0, i17) * iMax4));
        int iMax6 = Math.max(0, iMax3);
        if (iMax4 > 0) {
            iMax5 %= iMax6;
        }
        int iMax7 = Math.max(iMax5, 0);
        if (iMax7 == 0 && iMax > 2) {
            iMax--;
            iMax7 = this.f28794d;
        }
        int i18 = iMax + 1;
        int iMax8 = Math.max(0, iMax7);
        if (i18 > 0) {
            iMax8 /= i18;
        }
        this.f28792b = iMax8;
        return Math.max(0, a(this.f28793c, this.f28794d, iMax8, 0) - 1);
    }

    public static int a(int i5, int i11, int i12, int i13) {
        int iMax = Math.max(0, i5);
        if (i11 <= 0) {
            i11 = iMax;
        }
        int iMax2 = Math.max(0, i12);
        int iMax3 = Math.max(0, i13);
        int i14 = iMax3 + 1;
        int i15 = iMax - ((iMax2 * iMax3) + i11);
        if (i15 < 0) {
            return Math.max(iMax3, 0);
        }
        if (i15 == 0) {
            return Math.max(i14, 0);
        }
        return a(i15, i11, iMax2, i14);
    }
}
