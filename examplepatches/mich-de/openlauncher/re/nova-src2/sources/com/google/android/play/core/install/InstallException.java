package com.google.android.play.core.install;

import a80.m;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.Locale;
import nk.a;

/* loaded from: classes3.dex */
public class InstallException extends ApiException {
    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public InstallException(int i5) {
        String strH;
        Locale locale = Locale.getDefault();
        Integer numValueOf = Integer.valueOf(i5);
        HashMap map = a.f78355a;
        Integer numValueOf2 = Integer.valueOf(i5);
        if (map.containsKey(numValueOf2)) {
            HashMap map2 = a.f78356b;
            strH = !map2.containsKey(numValueOf2) ? b.f42142b : m.h((String) map.get(numValueOf2), " (https://developer.android.com/reference/com/google/android/play/core/install/model/InstallErrorCode#", (String) map2.get(numValueOf2), ")");
        }
        super(new Status(i5, String.format(locale, "Install Error(%d): %s", numValueOf, strH), null, null));
        if (i5 == 0) {
            throw new IllegalArgumentException("errorCode should not be 0.");
        }
    }
}
