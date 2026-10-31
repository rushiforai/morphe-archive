package com.iab.omid.library.bytedance2.internal;

import android.content.Context;
import android.os.Handler;
import com.iab.omid.library.bytedance2.internal.d;
import com.iab.omid.library.bytedance2.walking.TreeWalker;
import java.util.Iterator;

/* loaded from: classes3.dex */
public class i implements com.iab.omid.library.bytedance2.devicevolume.c, d.a {

    /* renamed from: f, reason: collision with root package name */
    private static i f35069f;

    /* renamed from: a, reason: collision with root package name */
    private float f35070a = 0.0f;

    /* renamed from: b, reason: collision with root package name */
    private final com.iab.omid.library.bytedance2.devicevolume.e f35071b;

    /* renamed from: c, reason: collision with root package name */
    private final com.iab.omid.library.bytedance2.devicevolume.b f35072c;

    /* renamed from: d, reason: collision with root package name */
    private com.iab.omid.library.bytedance2.devicevolume.d f35073d;

    /* renamed from: e, reason: collision with root package name */
    private c f35074e;

    public i(com.iab.omid.library.bytedance2.devicevolume.e eVar, com.iab.omid.library.bytedance2.devicevolume.b bVar) {
        this.f35071b = eVar;
        this.f35072c = bVar;
    }

    private c a() {
        if (this.f35074e == null) {
            this.f35074e = c.c();
        }
        return this.f35074e;
    }

    public static i c() {
        if (f35069f == null) {
            f35069f = new i(new com.iab.omid.library.bytedance2.devicevolume.e(), new com.iab.omid.library.bytedance2.devicevolume.b());
        }
        return f35069f;
    }

    public float b() {
        return this.f35070a;
    }

    public void d() {
        b.g().a(this);
        b.g().e();
        TreeWalker.getInstance().h();
        this.f35073d.c();
    }

    public void e() {
        TreeWalker.getInstance().j();
        b.g().f();
        this.f35073d.d();
    }

    @Override // com.iab.omid.library.bytedance2.devicevolume.c
    public void a(float f11) {
        this.f35070a = f11;
        Iterator<com.iab.omid.library.bytedance2.adsession.a> it = a().a().iterator();
        while (it.hasNext()) {
            it.next().getAdSessionStatePublisher().a(f11);
        }
    }

    public void a(Context context) {
        this.f35073d = this.f35071b.a(new Handler(), context, this.f35072c.a(), this);
    }

    @Override // com.iab.omid.library.bytedance2.internal.d.a
    public void a(boolean z11) {
        if (z11) {
            TreeWalker.getInstance().h();
        } else {
            TreeWalker.getInstance().g();
        }
    }
}
