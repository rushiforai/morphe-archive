package com.bytedance.sdk.openadsdk.core.xkz;

import android.view.View;
import com.iab.omid.library.bytedance2.adsession.AdEvents;
import com.iab.omid.library.bytedance2.adsession.AdSession;
import com.iab.omid.library.bytedance2.adsession.media.InteractionType;
import com.iab.omid.library.bytedance2.adsession.media.MediaEvents;
import com.iab.omid.library.bytedance2.adsession.media.PlayerState;
import com.iab.omid.library.bytedance2.adsession.media.Position;
import com.iab.omid.library.bytedance2.adsession.media.VastProperties;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class jw extends ul {

    /* renamed from: lt, reason: collision with root package name */
    private boolean f26424lt;
    private final MediaEvents lud;

    public jw(AdSession adSession, AdEvents adEvents, View view, MediaEvents mediaEvents) {
        super(adSession, adEvents, view);
        this.lud = mediaEvents;
    }

    @Override // com.bytedance.sdk.openadsdk.core.xkz.ul
    public void ycx(boolean z11, float f11) {
        if (z11) {
            this.f26464dj = VastProperties.createVastPropertiesForSkippableMedia(f11, true, Position.STANDALONE);
        } else {
            this.f26464dj = VastProperties.createVastPropertiesForNonSkippableMedia(true, Position.STANDALONE);
        }
        ycx(2);
    }

    @Override // com.bytedance.sdk.openadsdk.core.xkz.ul
    public void zb(int i5) throws JSONException {
        if (ycx()) {
            switch (i5) {
                case 0:
                    this.lud.pause();
                    break;
                case 1:
                    this.lud.resume();
                    break;
                case 2:
                case 14:
                    this.lud.skipped();
                    break;
                case 4:
                    this.lud.bufferStart();
                    break;
                case 5:
                    this.lud.bufferFinish();
                    break;
                case 6:
                    this.lud.firstQuartile();
                    break;
                case 7:
                    this.lud.midpoint();
                    break;
                case 8:
                    this.lud.thirdQuartile();
                    break;
                case 9:
                    this.lud.complete();
                    break;
                case 10:
                    this.lud.playerStateChange(PlayerState.FULLSCREEN);
                    break;
                case 11:
                    this.lud.playerStateChange(PlayerState.NORMAL);
                    break;
                case 12:
                    this.lud.volumeChange(this.f26424lt ? 0.0f : 1.0f);
                    break;
                case 13:
                    this.lud.adUserInteraction(InteractionType.CLICK);
                    break;
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.xkz.ul
    public void ycx(float f11, boolean z11) throws JSONException {
        if (ycx()) {
            this.lud.start(f11, z11 ? 0.0f : 1.0f);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.xkz.ul
    public void ycx(boolean z11) throws JSONException {
        this.f26424lt = z11;
        zb(12);
    }
}
