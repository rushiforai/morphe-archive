package com.iab.omid.library.vungle.adsession;

import com.iab.omid.library.vungle.adsession.media.VastProperties;
import com.iab.omid.library.vungle.utils.g;

/* loaded from: classes3.dex */
public final class AdEvents {
    private final a adSession;

    private AdEvents(a aVar) {
        this.adSession = aVar;
    }

    public static AdEvents createAdEvents(AdSession adSession) {
        a aVar = (a) adSession;
        g.a(adSession, "AdSession is null");
        g.g(aVar);
        g.b(aVar);
        AdEvents adEvents = new AdEvents(aVar);
        aVar.d().a(adEvents);
        return adEvents;
    }

    public void impressionOccurred() {
        g.b(this.adSession);
        g.e(this.adSession);
        if (!this.adSession.h()) {
            try {
                this.adSession.start();
            } catch (Exception unused) {
            }
        }
        if (this.adSession.h()) {
            this.adSession.m();
        }
    }

    public void loaded() {
        g.a(this.adSession);
        g.e(this.adSession);
        this.adSession.n();
    }

    public void loaded(VastProperties vastProperties) {
        g.a(vastProperties, "VastProperties is null");
        g.a(this.adSession);
        g.e(this.adSession);
        this.adSession.a(vastProperties.a());
    }
}
