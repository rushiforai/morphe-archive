package com.bytedance.sdk.openadsdk.core.xkz;

import android.util.Pair;
import android.view.View;
import com.iab.omid.library.bytedance2.adsession.AdEvents;
import com.iab.omid.library.bytedance2.adsession.AdSession;
import com.iab.omid.library.bytedance2.adsession.FriendlyObstructionPurpose;
import com.iab.omid.library.bytedance2.adsession.media.Position;
import com.iab.omid.library.bytedance2.adsession.media.VastProperties;
import java.util.Set;

/* loaded from: classes2.dex */
public class ul {

    /* renamed from: dj, reason: collision with root package name */
    protected VastProperties f26464dj;

    /* renamed from: lt, reason: collision with root package name */
    private final AdEvents f26465lt;
    private final AdSession lud;
    protected String sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f26466ul = false;
    protected boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    protected int f26467zb = 0;

    public ul(AdSession adSession, AdEvents adEvents, View view) {
        this.lud = adSession;
        this.f26465lt = adEvents;
        this.sya = adSession.getAdSessionId();
        ycx(view);
    }

    public void dj() {
        ycx(3);
    }

    public void sya() {
        ycx(4);
    }

    public void ycx(float f11, boolean z11) {
    }

    public void zb(int i5) {
    }

    public void ycx(boolean z11) {
    }

    public void zb() {
        ycx(1);
    }

    public void ycx(boolean z11, float f11) {
    }

    public void ycx(View view) {
        AdSession adSession;
        if (view == null || (adSession = this.lud) == null) {
            return;
        }
        adSession.registerAdView(view);
    }

    public void ycx(View view, FriendlyObstructionPurpose friendlyObstructionPurpose) {
        AdSession adSession = this.lud;
        if (adSession != null) {
            adSession.addFriendlyObstruction(view, friendlyObstructionPurpose, null);
        }
    }

    public boolean ycx() {
        return this.ycx;
    }

    public void ycx(int i5) {
        int i11;
        if (this.lud == null || this.f26465lt == null || !lud.sya()) {
            return;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                if (i5 != 3) {
                    if (i5 != 4 || (i11 = this.f26467zb) == 0 || i11 == 4) {
                        return;
                    }
                    this.lud.finish();
                    this.ycx = false;
                } else {
                    if (this.f26466ul) {
                        return;
                    }
                    int i12 = this.f26467zb;
                    if (i12 != 1 && i12 != 2) {
                        return;
                    }
                    this.f26465lt.impressionOccurred();
                    this.f26466ul = true;
                }
            } else {
                if (this.f26467zb != 0) {
                    return;
                }
                this.lud.start();
                if (this.f26464dj == null) {
                    this.f26464dj = VastProperties.createVastPropertiesForNonSkippableMedia(true, Position.STANDALONE);
                }
                this.f26465lt.loaded(this.f26464dj);
                this.ycx = true;
                this.f26464dj = null;
            }
        } else {
            if (this.f26467zb != 0) {
                return;
            }
            this.lud.start();
            this.f26465lt.loaded();
            this.ycx = true;
        }
        this.f26467zb = i5;
    }

    public void ycx(Set<Pair<View, FriendlyObstructionPurpose>> set) {
        for (Pair<View, FriendlyObstructionPurpose> pair : set) {
            ycx((View) pair.first, (FriendlyObstructionPurpose) pair.second);
        }
    }
}
