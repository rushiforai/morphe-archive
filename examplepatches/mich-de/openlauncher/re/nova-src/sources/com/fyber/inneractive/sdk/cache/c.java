package com.fyber.inneractive.sdk.cache;

import android.graphics.Bitmap;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.w0;

/* loaded from: classes3.dex */
public final class c implements a {

    /* renamed from: a, reason: collision with root package name */
    public final String f27657a;

    public c(String str) {
        this.f27657a = str;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final void a(Object obj) {
        Bitmap bitmap = (Bitmap) obj;
        if (bitmap != null) {
            com.fyber.inneractive.sdk.util.o.f31210a.getSharedPreferences("IAConfigurationPreferences", 0).edit().putString("dt.dynamic.icon.data", w0.a(bitmap)).apply();
        }
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String b() {
        return "dt.dynamic.icon.last.modified";
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String c() {
        return String.valueOf(("dt.dynamic.icon_" + this.f27657a).hashCode());
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final boolean d() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final Object a(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return w0.a(str);
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String a() {
        return this.f27657a;
    }
}
