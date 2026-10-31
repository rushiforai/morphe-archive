package com.google.android.play.core.integrity;

import a80.m;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.Locale;
import pk.a;

/* loaded from: classes3.dex */
public class StandardIntegrityException extends ApiException {

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f34555b;

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Removed duplicated region for block: B:8:0x002e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public StandardIntegrityException(Exception exc, int i5) {
        String strH;
        Locale locale = Locale.ROOT;
        HashMap map = a.f82606a;
        Integer numValueOf = Integer.valueOf(i5);
        if (map.containsKey(numValueOf)) {
            HashMap map2 = a.f82607b;
            strH = !map2.containsKey(numValueOf) ? b.f42142b : m.h((String) map.get(numValueOf), " (https://developer.android.com/google/play/integrity/reference/com/google/android/play/core/integrity/model/StandardIntegrityErrorCode.html#", (String) map2.get(numValueOf), ")");
        }
        super(new Status(i5, "Standard Integrity API error (" + i5 + "): " + strH + ".", null, null));
        if (i5 == 0) {
            throw new IllegalArgumentException("ErrorCode should not be 0.");
        }
        this.f34555b = exc;
    }

    @Override // java.lang.Throwable
    public final synchronized Throwable getCause() {
        return this.f34555b;
    }
}
