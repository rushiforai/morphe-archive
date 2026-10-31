package com.google.android.gms.internal.measurement;

import com.google.android.gms.common.api.ApiException;

/* loaded from: classes3.dex */
public final class zzmk extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final int f33346a;

    public zzmk(int i5, String str, ApiException apiException) {
        String strValueOf;
        if (str != null) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 2 + str.length());
            sb2.append(i5);
            sb2.append(": ");
            sb2.append(str);
            strValueOf = sb2.toString();
        } else {
            strValueOf = String.valueOf(i5);
        }
        super(strValueOf, apiException);
        this.f33346a = i5;
    }
}
