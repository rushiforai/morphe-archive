package com.fyber.inneractive.sdk.config.global;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public final class j implements d {

    /* renamed from: a, reason: collision with root package name */
    public final String f27827a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f27828b;

    public j(boolean z11, String str) {
        this.f27827a = str;
        this.f27828b = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0102  */
    @Override // com.fyber.inneractive.sdk.config.global.d
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(e eVar) {
        boolean z11;
        boolean z12;
        if (!TextUtils.isEmpty(this.f27827a)) {
            String version = InneractiveAdManager.getVersion();
            IAlog.a("%s: shouldApply - running version: %s", "j", version);
            IAlog.a("%s: shouldApply - filter version: %s", "j", this.f27827a);
            String[] strArrSplit = version.split("\\.", 4);
            String[] strArrSplit2 = this.f27827a.split("\\.", 4);
            String str = strArrSplit2[strArrSplit2.length - 1];
            if (str.equals("*")) {
                for (int i5 = 0; i5 < strArrSplit2.length - 1; i5++) {
                    if (strArrSplit.length < i5) {
                        IAlog.a("%s: shouldApplyByAsterix - running version is shorter than filter. applying", "j");
                    } else if (!strArrSplit[i5].equals(strArrSplit2[i5])) {
                        IAlog.a("%s: shouldApplyByAsterix - running version does not comply with filter. applying", "j");
                    }
                    z12 = true;
                }
                IAlog.a("%s: shouldApplyByAsterix - version aligned with filter. do not apply", "j");
                z12 = false;
                IAlog.a("%s: shouldApply - * version match: %b", "j", Boolean.valueOf(!z12));
                return z12 ? this.f27828b : !this.f27828b;
            }
            if (str.equals("+")) {
                int i11 = 0;
                while (true) {
                    if (i11 >= strArrSplit2.length - 1) {
                        IAlog.a("%s: shouldApplyByAsterix - version aligned with filter. do not apply", "j");
                        break;
                    }
                    if (strArrSplit.length < i11) {
                        IAlog.a("%s: shouldApplyByPlus - running version is shorter than filter. applying", "j");
                        break;
                    }
                    try {
                        int iIntValue = Integer.valueOf(strArrSplit2[i11]).intValue();
                        int iIntValue2 = Integer.valueOf(strArrSplit[i11]).intValue();
                        if (iIntValue2 > iIntValue) {
                            IAlog.a("%s: shouldApplyByPlus - running version is greater than the filter's version. no filter needed", "j");
                            break;
                        }
                        if (iIntValue2 < iIntValue) {
                            IAlog.a("%s: shouldApplyByPlus - running version is lower than the filter's version. applying filter ", "j");
                            break;
                        }
                        i11++;
                    } catch (NumberFormatException e3) {
                        IAlog.a("%s: shouldApplyByPlus - Error in version string! Not a number. %s", "j", e3.getMessage());
                    }
                }
                z11 = false;
                IAlog.a("%s: shouldApply - + version match: %b", "j", Boolean.valueOf(!z11));
                return !z11 ? this.f27828b : !this.f27828b;
            }
            boolean zEqualsIgnoreCase = this.f27827a.equalsIgnoreCase(version);
            IAlog.a("%s: shouldApply - exact version match: %b", "j", Boolean.valueOf(zEqualsIgnoreCase));
            if (!zEqualsIgnoreCase) {
                return this.f27828b;
            }
            if (!this.f27828b) {
                return true;
            }
        }
        return false;
        z11 = true;
        IAlog.a("%s: shouldApply - + version match: %b", "j", Boolean.valueOf(!z11));
        if (!z11) {
        }
    }

    public final String toString() {
        return "sdk - " + this.f27827a + " include: " + this.f27828b;
    }
}
