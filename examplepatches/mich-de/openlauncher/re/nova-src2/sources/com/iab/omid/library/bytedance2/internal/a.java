package com.iab.omid.library.bytedance2.internal;

import android.content.Context;
import com.iab.omid.library.bytedance2.internal.d;
import java.util.Date;
import java.util.Iterator;
import org.json.JSONException;

/* loaded from: classes3.dex */
public class a implements d.a {

    /* renamed from: f, reason: collision with root package name */
    private static a f35044f = new a(new d());

    /* renamed from: a, reason: collision with root package name */
    protected com.iab.omid.library.bytedance2.utils.f f35045a = new com.iab.omid.library.bytedance2.utils.f();

    /* renamed from: b, reason: collision with root package name */
    private Date f35046b;

    /* renamed from: c, reason: collision with root package name */
    private boolean f35047c;

    /* renamed from: d, reason: collision with root package name */
    private d f35048d;

    /* renamed from: e, reason: collision with root package name */
    private boolean f35049e;

    private a(d dVar) {
        this.f35048d = dVar;
    }

    public static a a() {
        return f35044f;
    }

    private void c() throws JSONException {
        if (!this.f35047c || this.f35046b == null) {
            return;
        }
        Iterator<com.iab.omid.library.bytedance2.adsession.a> it = c.c().a().iterator();
        while (it.hasNext()) {
            it.next().getAdSessionStatePublisher().a(b());
        }
    }

    public Date b() {
        Date date = this.f35046b;
        if (date != null) {
            return (Date) date.clone();
        }
        return null;
    }

    public void d() throws JSONException {
        Date dateA = this.f35045a.a();
        Date date = this.f35046b;
        if (date == null || dateA.after(date)) {
            this.f35046b = dateA;
            c();
        }
    }

    public void a(Context context) {
        if (this.f35047c) {
            return;
        }
        this.f35048d.a(context);
        this.f35048d.a(this);
        this.f35048d.e();
        this.f35049e = this.f35048d.c();
        this.f35047c = true;
    }

    @Override // com.iab.omid.library.bytedance2.internal.d.a
    public void a(boolean z11) throws JSONException {
        if (!this.f35049e && z11) {
            d();
        }
        this.f35049e = z11;
    }
}
