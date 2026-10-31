package un;

import android.app.ActivityManager;
import android.provider.Settings;
import android.view.View;
import android.webkit.WebView;
import b.e2;
import com.google.android.gms.internal.consent_sdk.v;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;
import o9.n4;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class k extends b {

    /* renamed from: a, reason: collision with root package name */
    public final v f91398a;

    /* renamed from: b, reason: collision with root package name */
    public final c f91399b;

    /* renamed from: c, reason: collision with root package name */
    public final xn.g f91400c;

    /* renamed from: d, reason: collision with root package name */
    public e2 f91401d;

    /* renamed from: e, reason: collision with root package name */
    public zn.a f91402e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f91403f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f91404g;

    /* renamed from: h, reason: collision with root package name */
    public final String f91405h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f91406i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f91407j;

    public k(c cVar, v vVar) throws JSONException {
        zn.a bVar;
        String string = UUID.randomUUID().toString();
        this.f91400c = new xn.g();
        this.f91403f = false;
        this.f91404g = false;
        this.f91399b = cVar;
        this.f91398a = vVar;
        this.f91405h = string;
        this.f91401d = new e2((Object) null);
        d dVar = (d) vVar.f32266h;
        if (dVar == d.HTML || dVar == d.JAVASCRIPT) {
            WebView webView = (WebView) vVar.f32260b;
            bVar = new zn.b(string);
            if (webView != null && !webView.getSettings().getJavaScriptEnabled()) {
                webView.getSettings().setJavaScriptEnabled(true);
            }
            bVar.f98572b = new e2(webView);
        } else {
            bVar = new zn.d(string, Collections.unmodifiableMap((HashMap) vVar.f32262d), (String) vVar.f32263e);
        }
        this.f91402e = bVar;
        this.f91402e.j();
        xn.c.f96182c.f96183a.add(this);
        zn.a aVar = this.f91402e;
        WebView webViewI = aVar.i();
        String str = aVar.f98571a;
        cVar.getClass();
        JSONObject jSONObject = new JSONObject();
        ao.b.b(jSONObject, "impressionOwner", cVar.f91366a);
        ao.b.b(jSONObject, "mediaEventsOwner", cVar.f91367b);
        ao.b.b(jSONObject, "creativeType", cVar.f91368c);
        ao.b.b(jSONObject, "impressionType", cVar.f91369d);
        ao.b.b(jSONObject, "isolateVerificationScripts", Boolean.FALSE);
        xn.i.f96196a.a(webViewI, "init", jSONObject, str);
    }

    @Override // un.b
    public final void a(View view, f fVar, String str) {
        xn.f fVar2;
        if (this.f91404g) {
            return;
        }
        xn.g gVar = this.f91400c;
        gVar.getClass();
        ArrayList arrayList = gVar.f96193a;
        if (view == null) {
            throw new IllegalArgumentException("FriendlyObstruction is null");
        }
        if (str != null) {
            if (str.length() > 50) {
                throw new IllegalArgumentException("FriendlyObstruction has detailed reason over 50 characters in length");
            }
            if (!xn.g.f96192b.matcher(str).matches()) {
                throw new IllegalArgumentException("FriendlyObstruction has detailed reason that contains characters not in [a-z][A-Z][0-9] or space");
            }
        }
        Iterator it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                fVar2 = null;
                break;
            } else {
                fVar2 = (xn.f) it.next();
                if (fVar2.f96188a.get() == view) {
                    break;
                }
            }
        }
        if (fVar2 == null) {
            arrayList.add(new xn.f(view, fVar, str));
        }
    }

    @Override // un.b
    public final void c() {
        if (this.f91404g) {
            return;
        }
        this.f91401d.clear();
        if (!this.f91404g) {
            this.f91400c.f96193a.clear();
        }
        this.f91404g = true;
        zn.a aVar = this.f91402e;
        xn.i.f96196a.a(aVar.i(), "finishSession", aVar.f98571a);
        xn.c cVar = xn.c.f96182c;
        ArrayList arrayList = cVar.f96184b;
        ArrayList arrayList2 = cVar.f96184b;
        boolean z11 = arrayList.size() > 0;
        cVar.f96183a.remove(this);
        arrayList2.remove(this);
        if (z11 && arrayList2.size() <= 0) {
            n4 n4VarC = n4.c();
            n4VarC.getClass();
            bo.a aVar2 = bo.a.f18321g;
            aVar2.getClass();
            bo.a.b();
            aVar2.f18326a.clear();
            bo.a.f18322h.post(new ai.h(aVar2, 11));
            xn.b bVar = xn.b.f96181d;
            bVar.f96185a = false;
            bVar.f96187c = null;
            wn.a aVar3 = (wn.a) n4VarC.f80037c;
            aVar3.f94623a.getContentResolver().unregisterContentObserver(aVar3);
        }
        this.f91402e.g();
        this.f91402e = null;
    }

    @Override // un.b
    public final void d(View view) {
        if (this.f91404g || g() == view) {
            return;
        }
        this.f91401d = new e2(view);
        zn.a aVar = this.f91402e;
        aVar.f98576f = System.nanoTime();
        aVar.f98575e = 1;
        Collection<k> collectionUnmodifiableCollection = Collections.unmodifiableCollection(xn.c.f96182c.f96183a);
        if (collectionUnmodifiableCollection == null || collectionUnmodifiableCollection.isEmpty()) {
            return;
        }
        for (k kVar : collectionUnmodifiableCollection) {
            if (kVar != this && kVar.g() == view) {
                kVar.f91401d.clear();
            }
        }
    }

    @Override // un.b
    public final void e() {
        if (this.f91403f || this.f91402e == null) {
            return;
        }
        this.f91403f = true;
        xn.c cVar = xn.c.f96182c;
        boolean z11 = cVar.f96184b.size() > 0;
        cVar.f96184b.add(this);
        if (!z11) {
            n4 n4VarC = n4.c();
            n4VarC.getClass();
            xn.b bVar = xn.b.f96181d;
            bVar.f96187c = n4VarC;
            bVar.f96185a = true;
            ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
            ActivityManager.getMyMemoryState(runningAppProcessInfo);
            boolean z12 = runningAppProcessInfo.importance == 100 || bVar.b();
            bVar.f96186b = z12;
            bVar.a(z12);
            bo.a.f18321g.getClass();
            bo.a.d();
            wn.a aVar = (wn.a) n4VarC.f80037c;
            aVar.f94627e = aVar.a();
            aVar.b();
            aVar.f94623a.getContentResolver().registerContentObserver(Settings.System.CONTENT_URI, true, aVar);
        }
        this.f91402e.a(n4.c().f80035a);
        zn.a aVar2 = this.f91402e;
        Date date = xn.a.f96175f.f96177b;
        aVar2.c(date != null ? (Date) date.clone() : null);
        this.f91402e.d(this, this.f91398a);
    }

    public final zn.a f() {
        return this.f91402e;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final View g() {
        return (View) this.f91401d.get();
    }

    public final boolean h() {
        return this.f91404g;
    }

    public final boolean i() {
        return h.NATIVE == this.f91399b.f91366a;
    }

    public final boolean j() {
        return this.f91403f;
    }
}
