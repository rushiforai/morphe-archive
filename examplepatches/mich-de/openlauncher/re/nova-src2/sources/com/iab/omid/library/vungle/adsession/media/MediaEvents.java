package com.iab.omid.library.vungle.adsession.media;

import com.iab.omid.library.vungle.adsession.AdSession;
import com.iab.omid.library.vungle.adsession.a;
import com.iab.omid.library.vungle.internal.i;
import com.iab.omid.library.vungle.utils.c;
import com.iab.omid.library.vungle.utils.g;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class MediaEvents {
    private final a adSession;

    private MediaEvents(a aVar) {
        this.adSession = aVar;
    }

    private void confirmValidDuration(float f11) {
        if (f11 <= 0.0f) {
            throw new IllegalArgumentException("Invalid Media duration");
        }
    }

    private void confirmValidVolume(float f11) {
        if (f11 < 0.0f || f11 > 1.0f) {
            throw new IllegalArgumentException("Invalid Media volume");
        }
    }

    public static MediaEvents createMediaEvents(AdSession adSession) {
        a aVar = (a) adSession;
        g.a(adSession, "AdSession is null");
        g.f(aVar);
        g.c(aVar);
        g.b(aVar);
        g.h(aVar);
        MediaEvents mediaEvents = new MediaEvents(aVar);
        aVar.d().a(mediaEvents);
        return mediaEvents;
    }

    public void adUserInteraction(InteractionType interactionType) throws JSONException {
        g.a(interactionType, "InteractionType is null");
        g.a(this.adSession);
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "interactionType", interactionType);
        this.adSession.d().a("adUserInteraction", jSONObject);
    }

    public void bufferFinish() {
        g.a(this.adSession);
        this.adSession.d().a("bufferFinish");
    }

    public void bufferStart() {
        g.a(this.adSession);
        this.adSession.d().a("bufferStart");
    }

    public void complete() {
        g.a(this.adSession);
        this.adSession.d().a("complete");
    }

    public void firstQuartile() {
        g.a(this.adSession);
        this.adSession.d().a("firstQuartile");
    }

    public void midpoint() {
        g.a(this.adSession);
        this.adSession.d().a("midpoint");
    }

    public void pause() {
        g.a(this.adSession);
        this.adSession.d().a("pause");
    }

    public void playerStateChange(PlayerState playerState) throws JSONException {
        g.a(playerState, "PlayerState is null");
        g.a(this.adSession);
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "state", playerState);
        this.adSession.d().a("playerStateChange", jSONObject);
    }

    public void resume() {
        g.a(this.adSession);
        this.adSession.d().a("resume");
    }

    public void skipped() {
        g.a(this.adSession);
        this.adSession.d().a("skipped");
    }

    public void start(float f11, float f12) throws JSONException {
        confirmValidDuration(f11);
        confirmValidVolume(f12);
        g.a(this.adSession);
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "duration", Float.valueOf(f11));
        c.a(jSONObject, "mediaPlayerVolume", Float.valueOf(f12));
        c.a(jSONObject, "deviceVolume", Float.valueOf(i.c().b()));
        this.adSession.d().a("start", jSONObject);
    }

    public void thirdQuartile() {
        g.a(this.adSession);
        this.adSession.d().a("thirdQuartile");
    }

    public void volumeChange(float f11) throws JSONException {
        confirmValidVolume(f11);
        g.a(this.adSession);
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "mediaPlayerVolume", Float.valueOf(f11));
        c.a(jSONObject, "deviceVolume", Float.valueOf(i.c().b()));
        this.adSession.d().a("volumeChange", jSONObject);
    }
}
