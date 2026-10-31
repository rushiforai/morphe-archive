package com.fyber.inneractive.sdk.model.vast;

import android.text.TextUtils;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f28563a;

    /* renamed from: b, reason: collision with root package name */
    public final String f28564b;

    /* renamed from: c, reason: collision with root package name */
    public final String f28565c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f28566d;

    public a(String str, String str2, String str3) {
        String strTrim = str != null ? str.trim() : null;
        this.f28563a = strTrim;
        String strTrim2 = str2 != null ? str2.trim() : null;
        this.f28564b = strTrim2;
        String strTrim3 = str3 != null ? str3.trim() : null;
        this.f28565c = strTrim3;
        this.f28566d = (TextUtils.isEmpty(strTrim) || TextUtils.isEmpty(strTrim2) || TextUtils.isEmpty(strTrim3) || !strTrim3.contains("[TIME]")) ? false : true;
    }
}
