package com.fyber.inneractive.sdk.cache;

import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.File;
import java.util.Locale;

/* loaded from: classes.dex */
public final class e implements a {

    /* renamed from: c, reason: collision with root package name */
    public static final String f27659c = IAlog.a(e.class);

    /* renamed from: a, reason: collision with root package name */
    public final String f27660a;

    /* renamed from: b, reason: collision with root package name */
    public final String f27661b;

    public e(String str) {
        this.f27660a = str;
        Locale locale = Locale.US;
        int iHashCode = str.hashCode();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(iHashCode);
        this.f27661b = sb2.toString();
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final void a(Object obj) {
        String str = this.f27660a;
        IAlog.c("%s: onCacheCommitted: %s for url: %s", f27659c, (Uri) obj, str);
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String b() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String c() {
        return this.f27661b;
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
        return Uri.fromFile(new File(str));
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String a() {
        return this.f27660a;
    }
}
