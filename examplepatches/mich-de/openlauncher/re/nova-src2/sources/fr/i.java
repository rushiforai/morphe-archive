package fr;

import b.u4;
import com.stripe.android.core.AppInfo;
import com.stripe.android.core.exception.InvalidRequestException;
import com.stripe.android.core.networking.ApiRequest$Options;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public final class i extends t0 {

    /* renamed from: a, reason: collision with root package name */
    public final r0 f55628a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55629b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f55630c;

    /* renamed from: d, reason: collision with root package name */
    public final ApiRequest$Options f55631d;

    /* renamed from: e, reason: collision with root package name */
    public final AppInfo f55632e;

    /* renamed from: f, reason: collision with root package name */
    public final String f55633f;

    /* renamed from: g, reason: collision with root package name */
    public final String f55634g;

    /* renamed from: h, reason: collision with root package name */
    public final String f55635h;

    /* renamed from: i, reason: collision with root package name */
    public final IntRange f55636i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f55637j;

    /* renamed from: k, reason: collision with root package name */
    public final Map f55638k;

    public i(r0 r0Var, String baseUrl, Map map, ApiRequest$Options options, AppInfo appInfo, String apiVersion, String str) {
        String strF1;
        Intrinsics.g(baseUrl, "baseUrl");
        Intrinsics.g(options, "options");
        Intrinsics.g(apiVersion, "apiVersion");
        this.f55628a = r0Var;
        this.f55629b = baseUrl;
        this.f55630c = map;
        this.f55631d = options;
        this.f55632e = appInfo;
        this.f55633f = apiVersion;
        this.f55634g = str;
        this.f55635h = (map == null || (strF1 = b70.g.f1(u.b(null, u.a(map)), "&", null, null, 0, new f1.o0(15), 30)) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strF1;
        j0 j0Var = new j0(options, appInfo, apiVersion, str);
        s0 s0Var = s0.f55700b;
        this.f55636i = y.f55714a;
        this.f55637j = j0Var.a();
        this.f55638k = j0Var.f55650h;
    }

    @Override // fr.t0
    public final Map a() {
        return this.f55637j;
    }

    @Override // fr.t0
    public final r0 b() {
        return this.f55628a;
    }

    @Override // fr.t0
    public final Map c() {
        return this.f55638k;
    }

    @Override // fr.t0
    public final Iterable d() {
        return this.f55636i;
    }

    @Override // fr.t0
    public final boolean e() {
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return this.f55628a == iVar.f55628a && Intrinsics.b(this.f55629b, iVar.f55629b) && Intrinsics.b(this.f55630c, iVar.f55630c) && Intrinsics.b(this.f55631d, iVar.f55631d) && Intrinsics.b(this.f55632e, iVar.f55632e) && Intrinsics.b(this.f55633f, iVar.f55633f) && this.f55634g.equals(iVar.f55634g);
    }

    @Override // fr.t0
    public final String f() {
        r0 r0Var = r0.f55694b;
        String str = this.f55629b;
        r0 r0Var2 = this.f55628a;
        if (r0Var != r0Var2 && r0.f55696d != r0Var2) {
            return str;
        }
        String str2 = this.f55635h;
        if (str2.length() <= 0) {
            str2 = null;
        }
        return b70.g.f1(kotlin.collections.c.v0(new String[]{str, str2}), r70.k.K0(str, "?", false) ? "&" : "?", null, null, 0, null, 62);
    }

    @Override // fr.t0
    public final void g(OutputStream outputStream) throws InvalidRequestException, IOException {
        try {
            byte[] bytes = this.f55635h.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            outputStream.write(bytes);
            outputStream.flush();
        } catch (UnsupportedEncodingException e3) {
            throw new InvalidRequestException(0, 7, null, null, b.c0.l("Unable to encode parameters to ", Charsets.f72000b.name(), ". Please contact support@stripe.com for assistance."), e3);
        }
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f55628a.hashCode() * 31, 31, this.f55629b);
        Map map = this.f55630c;
        int iHashCode = (this.f55631d.hashCode() + ((iE + (map == null ? 0 : map.hashCode())) * 31)) * 31;
        AppInfo appInfo = this.f55632e;
        return Boolean.hashCode(false) + b.c0.e(b.c0.e((iHashCode + (appInfo == null ? 0 : appInfo.hashCode())) * 31, 31, this.f55633f), 31, this.f55634g);
    }

    public final String toString() {
        return u4.m(this.f55628a.f55698a, " ", this.f55629b);
    }
}
