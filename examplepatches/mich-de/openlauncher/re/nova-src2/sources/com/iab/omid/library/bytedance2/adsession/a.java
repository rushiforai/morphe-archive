package com.iab.omid.library.bytedance2.adsession;

import android.view.View;
import com.iab.omid.library.bytedance2.internal.c;
import com.iab.omid.library.bytedance2.internal.e;
import com.iab.omid.library.bytedance2.internal.f;
import com.iab.omid.library.bytedance2.internal.i;
import com.iab.omid.library.bytedance2.publisher.AdSessionStatePublisher;
import com.iab.omid.library.bytedance2.publisher.b;
import com.iab.omid.library.bytedance2.utils.g;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class a extends AdSession {

    /* renamed from: a, reason: collision with root package name */
    private final AdSessionContext f35016a;

    /* renamed from: b, reason: collision with root package name */
    private final AdSessionConfiguration f35017b;

    /* renamed from: c, reason: collision with root package name */
    private final f f35018c;

    /* renamed from: d, reason: collision with root package name */
    private com.iab.omid.library.bytedance2.weakreference.a f35019d;

    /* renamed from: e, reason: collision with root package name */
    private AdSessionStatePublisher f35020e;

    /* renamed from: f, reason: collision with root package name */
    private boolean f35021f;

    /* renamed from: g, reason: collision with root package name */
    private boolean f35022g;

    /* renamed from: h, reason: collision with root package name */
    private final String f35023h;

    /* renamed from: i, reason: collision with root package name */
    private boolean f35024i;

    /* renamed from: j, reason: collision with root package name */
    private boolean f35025j;

    /* renamed from: k, reason: collision with root package name */
    private PossibleObstructionListener f35026k;

    public a(AdSessionConfiguration adSessionConfiguration, AdSessionContext adSessionContext) {
        this(adSessionConfiguration, adSessionContext, UUID.randomUUID().toString());
    }

    private void a() {
        if (this.f35024i) {
            throw new IllegalStateException("Impression event can only be sent once");
        }
    }

    private void b() {
        if (this.f35025j) {
            throw new IllegalStateException("Loaded event can only be sent once");
        }
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void addFriendlyObstruction(View view, FriendlyObstructionPurpose friendlyObstructionPurpose, String str) {
        if (this.f35022g) {
            return;
        }
        this.f35018c.a(view, friendlyObstructionPurpose, str);
    }

    public View c() {
        return this.f35019d.get();
    }

    public List<e> d() {
        return this.f35018c.a();
    }

    public boolean e() {
        return this.f35026k != null;
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void error(ErrorType errorType, String str) {
        if (this.f35022g) {
            throw new IllegalStateException("AdSession is finished");
        }
        g.a(errorType, "Error type is null");
        g.a(str, "Message is null");
        getAdSessionStatePublisher().a(errorType, str);
    }

    public boolean f() {
        return this.f35021f && !this.f35022g;
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void finish() {
        if (this.f35022g) {
            return;
        }
        this.f35019d.clear();
        removeAllFriendlyObstructions();
        this.f35022g = true;
        getAdSessionStatePublisher().f();
        c.c().b(this);
        getAdSessionStatePublisher().b();
        this.f35020e = null;
        this.f35026k = null;
    }

    public boolean g() {
        return this.f35022g;
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public String getAdSessionId() {
        return this.f35023h;
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public AdSessionStatePublisher getAdSessionStatePublisher() {
        return this.f35020e;
    }

    public boolean h() {
        return this.f35017b.isNativeImpressionOwner();
    }

    public boolean i() {
        return this.f35017b.isNativeMediaEventsOwner();
    }

    public boolean j() {
        return this.f35021f;
    }

    public void k() {
        a();
        getAdSessionStatePublisher().g();
        this.f35024i = true;
    }

    public void l() {
        b();
        getAdSessionStatePublisher().h();
        this.f35025j = true;
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void registerAdView(View view) {
        if (this.f35022g) {
            return;
        }
        g.a(view, "AdView is null");
        if (c() == view) {
            return;
        }
        b(view);
        getAdSessionStatePublisher().a();
        a(view);
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void removeAllFriendlyObstructions() {
        if (this.f35022g) {
            return;
        }
        this.f35018c.b();
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void removeFriendlyObstruction(View view) {
        if (this.f35022g) {
            return;
        }
        this.f35018c.c(view);
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void setPossibleObstructionListener(PossibleObstructionListener possibleObstructionListener) {
        this.f35026k = possibleObstructionListener;
    }

    @Override // com.iab.omid.library.bytedance2.adsession.AdSession
    public void start() {
        if (this.f35021f) {
            return;
        }
        this.f35021f = true;
        c.c().c(this);
        this.f35020e.a(i.c().b());
        this.f35020e.a(com.iab.omid.library.bytedance2.internal.a.a().b());
        this.f35020e.a(this, this.f35016a);
    }

    public a(AdSessionConfiguration adSessionConfiguration, AdSessionContext adSessionContext, String str) {
        this.f35018c = new f();
        this.f35021f = false;
        this.f35022g = false;
        this.f35017b = adSessionConfiguration;
        this.f35016a = adSessionContext;
        this.f35023h = str;
        b(null);
        this.f35020e = (adSessionContext.getAdSessionContextType() == AdSessionContextType.HTML || adSessionContext.getAdSessionContextType() == AdSessionContextType.JAVASCRIPT) ? new com.iab.omid.library.bytedance2.publisher.a(str, adSessionContext.getWebView()) : new b(str, adSessionContext.getInjectedResourcesMap(), adSessionContext.getOmidJsScriptContent());
        this.f35020e.i();
        c.c().a(this);
        this.f35020e.a(adSessionConfiguration);
    }

    private void a(View view) {
        Collection<a> collectionB = c.c().b();
        if (collectionB == null || collectionB.isEmpty()) {
            return;
        }
        for (a aVar : collectionB) {
            if (aVar != this && aVar.c() == view) {
                aVar.f35019d.clear();
            }
        }
    }

    private void b(View view) {
        this.f35019d = new com.iab.omid.library.bytedance2.weakreference.a(view);
    }

    public void a(List<com.iab.omid.library.bytedance2.weakreference.a> list) {
        if (e()) {
            ArrayList arrayList = new ArrayList();
            Iterator<com.iab.omid.library.bytedance2.weakreference.a> it = list.iterator();
            while (it.hasNext()) {
                View view = it.next().get();
                if (view != null) {
                    arrayList.add(view);
                }
            }
            this.f35026k.onPossibleObstructionsDetected(this.f35023h, arrayList);
        }
    }

    public void a(JSONObject jSONObject) {
        b();
        getAdSessionStatePublisher().a(jSONObject);
        this.f35025j = true;
    }
}
