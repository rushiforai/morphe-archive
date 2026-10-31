package com.iab.omid.library.vungle.internal;

import android.content.Context;
import com.iab.omid.library.vungle.internal.d;
import java.util.Date;
import java.util.Iterator;
import org.json.JSONException;

/* loaded from: classes3.dex */
public class a implements d.a {

    /* renamed from: f, reason: collision with root package name */
    private static a f35198f = new a(new d());

    /* renamed from: a, reason: collision with root package name */
    public com.iab.omid.library.vungle.utils.f f35199a = new com.iab.omid.library.vungle.utils.f();

    /* renamed from: b, reason: collision with root package name */
    private Date f35200b;

    /* renamed from: c, reason: collision with root package name */
    private boolean f35201c;

    /* renamed from: d, reason: collision with root package name */
    private d f35202d;

    /* renamed from: e, reason: collision with root package name */
    private boolean f35203e;

    private a(d dVar) {
        this.f35202d = dVar;
    }

    public static a a() {
        return f35198f;
    }

    private void c() throws JSONException {
        if (!this.f35201c || this.f35200b == null) {
            return;
        }
        Iterator<com.iab.omid.library.vungle.adsession.a> it = c.c().a().iterator();
        while (it.hasNext()) {
            it.next().d().a(b());
        }
    }

    public Date b() {
        Date date = this.f35200b;
        if (date != null) {
            return (Date) date.clone();
        }
        return null;
    }

    public void d() throws JSONException {
        Date dateA = this.f35199a.a();
        Date date = this.f35200b;
        if (date == null || dateA.after(date)) {
            this.f35200b = dateA;
            c();
        }
    }

    public void a(Context context) {
        if (this.f35201c) {
            return;
        }
        this.f35202d.a(context);
        this.f35202d.a(this);
        this.f35202d.e();
        this.f35203e = this.f35202d.c();
        this.f35201c = true;
    }

    @Override // com.iab.omid.library.vungle.internal.d.a
    public void a(boolean z11) throws JSONException {
        if (!this.f35203e && z11) {
            d();
        }
        this.f35203e = z11;
    }
}
