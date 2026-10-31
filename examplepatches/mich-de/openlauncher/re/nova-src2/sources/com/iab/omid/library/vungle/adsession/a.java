package com.iab.omid.library.vungle.adsession;

import android.view.View;
import com.iab.omid.library.vungle.internal.c;
import com.iab.omid.library.vungle.internal.e;
import com.iab.omid.library.vungle.internal.f;
import com.iab.omid.library.vungle.internal.i;
import com.iab.omid.library.vungle.publisher.AdSessionStatePublisher;
import com.iab.omid.library.vungle.publisher.b;
import com.iab.omid.library.vungle.utils.g;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class a extends AdSession {

    /* renamed from: a, reason: collision with root package name */
    private final AdSessionContext f35145a;

    /* renamed from: b, reason: collision with root package name */
    private final AdSessionConfiguration f35146b;

    /* renamed from: c, reason: collision with root package name */
    private final f f35147c;

    /* renamed from: d, reason: collision with root package name */
    private com.iab.omid.library.vungle.weakreference.a f35148d;

    /* renamed from: e, reason: collision with root package name */
    private AdSessionStatePublisher f35149e;

    /* renamed from: f, reason: collision with root package name */
    private boolean f35150f;

    /* renamed from: g, reason: collision with root package name */
    private boolean f35151g;

    /* renamed from: h, reason: collision with root package name */
    private final String f35152h;

    /* renamed from: i, reason: collision with root package name */
    private boolean f35153i;

    /* renamed from: j, reason: collision with root package name */
    private boolean f35154j;

    /* renamed from: k, reason: collision with root package name */
    private PossibleObstructionListener f35155k;

    public a(AdSessionConfiguration adSessionConfiguration, AdSessionContext adSessionContext) {
        this(adSessionConfiguration, adSessionContext, UUID.randomUUID().toString());
    }

    private void a() {
        if (this.f35153i) {
            throw new IllegalStateException("Impression event can only be sent once");
        }
    }

    private void b() {
        if (this.f35154j) {
            throw new IllegalStateException("Loaded event can only be sent once");
        }
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void addFriendlyObstruction(View view, FriendlyObstructionPurpose friendlyObstructionPurpose, String str) {
        if (this.f35151g) {
            return;
        }
        this.f35147c.a(view, friendlyObstructionPurpose, str);
    }

    public String c() {
        return this.f35152h;
    }

    public AdSessionStatePublisher d() {
        return this.f35149e;
    }

    public View e() {
        return this.f35148d.get();
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void error(ErrorType errorType, String str) {
        if (this.f35151g) {
            throw new IllegalStateException("AdSession is finished");
        }
        g.a(errorType, "Error type is null");
        g.a(str, "Message is null");
        d().a(errorType, str);
    }

    public List<e> f() {
        return this.f35147c.a();
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void finish() {
        if (this.f35151g) {
            return;
        }
        this.f35148d.clear();
        removeAllFriendlyObstructions();
        this.f35151g = true;
        d().f();
        c.c().b(this);
        d().b();
        this.f35149e = null;
        this.f35155k = null;
    }

    public boolean g() {
        return this.f35155k != null;
    }

    public boolean h() {
        return this.f35150f && !this.f35151g;
    }

    public boolean i() {
        return this.f35151g;
    }

    public boolean j() {
        return this.f35146b.isNativeImpressionOwner();
    }

    public boolean k() {
        return this.f35146b.isNativeMediaEventsOwner();
    }

    public boolean l() {
        return this.f35150f;
    }

    public void m() {
        a();
        d().g();
        this.f35153i = true;
    }

    public void n() {
        b();
        d().h();
        this.f35154j = true;
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void registerAdView(View view) {
        if (this.f35151g || e() == view) {
            return;
        }
        b(view);
        d().a();
        a(view);
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void removeAllFriendlyObstructions() {
        if (this.f35151g) {
            return;
        }
        this.f35147c.b();
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void removeFriendlyObstruction(View view) {
        if (this.f35151g) {
            return;
        }
        this.f35147c.c(view);
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void setPossibleObstructionListener(PossibleObstructionListener possibleObstructionListener) {
        this.f35155k = possibleObstructionListener;
    }

    @Override // com.iab.omid.library.vungle.adsession.AdSession
    public void start() {
        if (this.f35150f || this.f35149e == null) {
            return;
        }
        this.f35150f = true;
        c.c().c(this);
        this.f35149e.a(i.c().b());
        this.f35149e.a(com.iab.omid.library.vungle.internal.a.a().b());
        this.f35149e.b(com.iab.omid.library.vungle.attestation.c.a(com.iab.omid.library.vungle.internal.g.b().a()).a());
        this.f35149e.a(this, this.f35145a);
    }

    public a(AdSessionConfiguration adSessionConfiguration, AdSessionContext adSessionContext, String str) {
        this.f35147c = new f();
        this.f35150f = false;
        this.f35151g = false;
        this.f35146b = adSessionConfiguration;
        this.f35145a = adSessionContext;
        this.f35152h = str;
        b(null);
        this.f35149e = (adSessionContext.getAdSessionContextType() == AdSessionContextType.HTML || adSessionContext.getAdSessionContextType() == AdSessionContextType.JAVASCRIPT) ? new com.iab.omid.library.vungle.publisher.a(str, adSessionContext.getWebView()) : new b(str, adSessionContext.getInjectedResourcesMap(), adSessionContext.getOmidJsScriptContent());
        this.f35149e.i();
        c.c().a(this);
        this.f35149e.a(adSessionConfiguration);
    }

    private void a(View view) {
        Collection<a> collectionB = c.c().b();
        if (collectionB == null || collectionB.isEmpty()) {
            return;
        }
        for (a aVar : collectionB) {
            if (aVar != this && aVar.e() == view) {
                aVar.f35148d.clear();
            }
        }
    }

    private void b(View view) {
        this.f35148d = new com.iab.omid.library.vungle.weakreference.a(view);
    }

    public void a(List<com.iab.omid.library.vungle.weakreference.a> list) {
        if (g()) {
            ArrayList arrayList = new ArrayList();
            Iterator<com.iab.omid.library.vungle.weakreference.a> it = list.iterator();
            while (it.hasNext()) {
                View view = it.next().get();
                if (view != null) {
                    arrayList.add(view);
                }
            }
            this.f35155k.onPossibleObstructionsDetected(this.f35152h, arrayList);
        }
    }

    public void a(JSONObject jSONObject) {
        b();
        d().b(jSONObject);
        this.f35154j = true;
    }
}
