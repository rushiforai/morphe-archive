package ads_mobile_sdk;

import java.io.Closeable;
import java.util.LinkedHashMap;
import java.util.Map;
import t70.p0;

/* loaded from: classes2.dex */
public final class a21 implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final int f809a;

    /* renamed from: b, reason: collision with root package name */
    public final String f810b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f811c;

    /* renamed from: d, reason: collision with root package name */
    public final ww2 f812d;

    /* renamed from: e, reason: collision with root package name */
    public final p0 f813e;

    /* renamed from: f, reason: collision with root package name */
    public final String f814f;

    public a21(int i5, String str, LinkedHashMap linkedHashMap, ww2 ww2Var, p0 p0Var, String str2) {
        this.f809a = i5;
        this.f810b = str;
        this.f811c = linkedHashMap;
        this.f812d = ww2Var;
        this.f813e = p0Var;
        this.f814f = str2;
    }

    public final int b() {
        return this.f809a;
    }

    public final Map c() {
        return this.f811c;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    public final String d() {
        return this.f810b;
    }

    public final String e() {
        return this.f814f;
    }

    public final boolean f() {
        int i5 = this.f809a;
        return 200 <= i5 && i5 < 300;
    }
}
