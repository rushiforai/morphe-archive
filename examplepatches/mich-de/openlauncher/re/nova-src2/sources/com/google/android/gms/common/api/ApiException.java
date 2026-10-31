package com.google.android.gms.common.api;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public class ApiException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final Status f31794a;

    public ApiException(Status status) {
        int i5 = status.f31810f;
        String str = status.f31811g;
        str = str == null ? b.f42142b : str;
        StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 2 + String.valueOf(str).length());
        sb2.append(i5);
        sb2.append(": ");
        sb2.append(str);
        super(sb2.toString());
        this.f31794a = status;
    }

    public final int a() {
        return this.f31794a.f31810f;
    }
}
