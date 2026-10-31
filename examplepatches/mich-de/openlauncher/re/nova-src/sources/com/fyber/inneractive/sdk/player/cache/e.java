package com.fyber.inneractive.sdk.player.cache;

import java.io.File;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f28845a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f28846b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f28847c;

    /* renamed from: d, reason: collision with root package name */
    public d f28848d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ g f28849e;

    public e(g gVar, String str) {
        this.f28849e = gVar;
        this.f28845a = str;
        this.f28846b = new long[gVar.f28858g];
    }

    public final File a(int i5) {
        return new File(this.f28849e.f28852a, this.f28845a + "." + i5);
    }

    public final File b(int i5) {
        return new File(this.f28849e.f28852a, this.f28845a + "." + i5 + ".tmp");
    }
}
