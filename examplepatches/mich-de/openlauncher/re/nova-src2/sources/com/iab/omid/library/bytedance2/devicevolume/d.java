package com.iab.omid.library.bytedance2.devicevolume;

import android.content.Context;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.os.Handler;
import android.provider.Settings;

/* loaded from: classes3.dex */
public final class d extends ContentObserver {

    /* renamed from: a, reason: collision with root package name */
    private final Context f35039a;

    /* renamed from: b, reason: collision with root package name */
    private final AudioManager f35040b;

    /* renamed from: c, reason: collision with root package name */
    private final a f35041c;

    /* renamed from: d, reason: collision with root package name */
    private final c f35042d;

    /* renamed from: e, reason: collision with root package name */
    private float f35043e;

    public d(Handler handler, Context context, a aVar, c cVar) {
        super(handler);
        this.f35039a = context;
        this.f35040b = (AudioManager) context.getSystemService("audio");
        this.f35041c = aVar;
        this.f35042d = cVar;
    }

    private float a() {
        return this.f35041c.a(this.f35040b.getStreamVolume(3), this.f35040b.getStreamMaxVolume(3));
    }

    private void b() {
        this.f35042d.a(this.f35043e);
    }

    public void c() {
        this.f35043e = a();
        b();
        this.f35039a.getContentResolver().registerContentObserver(Settings.System.CONTENT_URI, true, this);
    }

    public void d() {
        this.f35039a.getContentResolver().unregisterContentObserver(this);
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z11) {
        super.onChange(z11);
        float fA = a();
        if (a(fA)) {
            this.f35043e = fA;
            b();
        }
    }

    private boolean a(float f11) {
        return f11 != this.f35043e;
    }
}
