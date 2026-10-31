package com.iab.omid.library.vungle.internal;

import android.content.Context;
import android.os.Handler;
import com.iab.omid.library.vungle.internal.d;
import com.iab.omid.library.vungle.walking.TreeWalker;
import java.util.Iterator;

/* loaded from: classes3.dex */
public class i implements d.a, com.iab.omid.library.vungle.devicevolume.c {

    /* renamed from: f, reason: collision with root package name */
    private static i f35223f;

    /* renamed from: a, reason: collision with root package name */
    private float f35224a = 0.0f;

    /* renamed from: b, reason: collision with root package name */
    private final com.iab.omid.library.vungle.devicevolume.e f35225b;

    /* renamed from: c, reason: collision with root package name */
    private final com.iab.omid.library.vungle.devicevolume.b f35226c;

    /* renamed from: d, reason: collision with root package name */
    private com.iab.omid.library.vungle.devicevolume.d f35227d;

    /* renamed from: e, reason: collision with root package name */
    private c f35228e;

    public i(com.iab.omid.library.vungle.devicevolume.e eVar, com.iab.omid.library.vungle.devicevolume.b bVar) {
        this.f35225b = eVar;
        this.f35226c = bVar;
    }

    private c a() {
        if (this.f35228e == null) {
            this.f35228e = c.c();
        }
        return this.f35228e;
    }

    public static i c() {
        if (f35223f == null) {
            f35223f = new i(new com.iab.omid.library.vungle.devicevolume.e(), new com.iab.omid.library.vungle.devicevolume.b());
        }
        return f35223f;
    }

    public float b() {
        return this.f35224a;
    }

    public void d() {
        b.g().a(this);
        b.g().e();
        TreeWalker.getInstance().h();
        this.f35227d.b();
    }

    public void e() {
        TreeWalker.getInstance().j();
        b.g().f();
        this.f35227d.c();
    }

    @Override // com.iab.omid.library.vungle.devicevolume.c
    public void a(float f11) {
        this.f35224a = f11;
        Iterator<com.iab.omid.library.vungle.adsession.a> it = a().a().iterator();
        while (it.hasNext()) {
            it.next().d().a(f11);
        }
    }

    public void a(Context context) {
        this.f35227d = this.f35225b.a(new Handler(), context, this.f35226c.a(), this);
    }

    @Override // com.iab.omid.library.vungle.internal.d.a
    public void a(boolean z11) {
        if (z11) {
            TreeWalker.getInstance().h();
        } else {
            TreeWalker.getInstance().g();
        }
    }
}
