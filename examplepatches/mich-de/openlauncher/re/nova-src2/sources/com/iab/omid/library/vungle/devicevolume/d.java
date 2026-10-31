package com.iab.omid.library.vungle.devicevolume;

import android.content.Context;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.os.Handler;
import android.provider.Settings;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class d extends ContentObserver {

    /* renamed from: a, reason: collision with root package name */
    private final Handler f35187a;

    /* renamed from: b, reason: collision with root package name */
    private final Context f35188b;

    /* renamed from: c, reason: collision with root package name */
    private final AudioManager f35189c;

    /* renamed from: d, reason: collision with root package name */
    private final com.iab.omid.library.vungle.devicevolume.a f35190d;

    /* renamed from: e, reason: collision with root package name */
    private final c f35191e;

    /* renamed from: f, reason: collision with root package name */
    private final AtomicReference<Float> f35192f;

    /* renamed from: g, reason: collision with root package name */
    private final AtomicBoolean f35193g;

    /* renamed from: h, reason: collision with root package name */
    private final ExecutorService f35194h;

    public class a implements Runnable {

        /* renamed from: com.iab.omid.library.vungle.devicevolume.d$a$a, reason: collision with other inner class name */
        public class RunnableC0126a implements Runnable {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ float f35196a;

            public RunnableC0126a(float f11) {
                this.f35196a = f11;
            }

            @Override // java.lang.Runnable
            public void run() {
                d.this.f35191e.a(this.f35196a);
            }
        }

        public a() {
        }

        @Override // java.lang.Runnable
        public void run() {
            float fA = d.this.a();
            d.this.f35193g.set(false);
            if (((Float) d.this.f35192f.getAndSet(Float.valueOf(fA))).floatValue() != fA) {
                d.this.f35187a.post(new RunnableC0126a(fA));
            }
        }
    }

    public d(Handler handler, Context context, com.iab.omid.library.vungle.devicevolume.a aVar, c cVar) {
        super(handler);
        this.f35192f = new AtomicReference<>(Float.valueOf(-1.0f));
        this.f35193g = new AtomicBoolean(false);
        this.f35194h = Executors.newSingleThreadExecutor();
        this.f35187a = handler;
        this.f35188b = context;
        this.f35189c = (AudioManager) context.getSystemService("audio");
        this.f35190d = aVar;
        this.f35191e = cVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float a() {
        return this.f35190d.a(this.f35189c.getStreamVolume(3), this.f35189c.getStreamMaxVolume(3));
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z11) {
        if (this.f35193g.getAndSet(true)) {
            return;
        }
        d();
    }

    private void d() {
        this.f35194h.submit(new a());
    }

    public void b() {
        d();
        this.f35188b.getContentResolver().registerContentObserver(Settings.System.CONTENT_URI, true, this);
    }

    public void c() {
        this.f35188b.getContentResolver().unregisterContentObserver(this);
    }
}
