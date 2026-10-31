package com.fyber.inneractive.sdk.flow;

import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.external.MediaView;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class w0 extends x implements NativeAdContent, com.fyber.inneractive.sdk.flow.nativead.u {

    /* renamed from: g, reason: collision with root package name */
    public String f28421g;

    /* renamed from: h, reason: collision with root package name */
    public String f28422h;

    /* renamed from: i, reason: collision with root package name */
    public String f28423i;

    /* renamed from: j, reason: collision with root package name */
    public String f28424j;

    /* renamed from: k, reason: collision with root package name */
    public String f28425k;

    /* renamed from: l, reason: collision with root package name */
    public Uri f28426l;

    /* renamed from: m, reason: collision with root package name */
    public Uri f28427m;
    public MediaView n;
    public Float o;

    /* renamed from: p, reason: collision with root package name */
    public Float f28428p;

    /* renamed from: q, reason: collision with root package name */
    public final ArrayList f28429q;

    /* renamed from: r, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.nativead.r f28430r;

    /* renamed from: s, reason: collision with root package name */
    public t0 f28431s;

    /* renamed from: t, reason: collision with root package name */
    public final HashMap f28432t;

    /* renamed from: u, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.nativead.j f28433u;

    /* renamed from: v, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.nativead.a f28434v;

    /* renamed from: w, reason: collision with root package name */
    public final ArrayList f28435w;

    /* renamed from: x, reason: collision with root package name */
    public final ArrayList f28436x;

    public w0(com.fyber.inneractive.sdk.config.x0 x0Var, com.fyber.inneractive.sdk.config.global.r rVar) {
        super(x0Var, rVar);
        this.f28429q = new ArrayList();
        this.f28432t = new HashMap();
        this.f28435w = new ArrayList();
        this.f28436x = new ArrayList();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0082  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(String str) {
        com.fyber.inneractive.sdk.util.g gVar;
        if (str == null || str.trim().isEmpty()) {
            str = NativeAdContent.ViewTag.OTHER;
        }
        IAlog.c("%s : handleClick(): %s", "w0", str);
        if (this.f28433u != null) {
            switch (str.hashCode()) {
                case -1884772963:
                    if (!str.equals(NativeAdContent.ViewTag.RATING)) {
                        gVar = com.fyber.inneractive.sdk.util.g.NATIVE;
                        break;
                    } else {
                        gVar = com.fyber.inneractive.sdk.util.g.NATIVE_AD_RATING;
                        break;
                    }
                case -1840402880:
                    if (str.equals(NativeAdContent.ViewTag.MEDIA_VIEW)) {
                        if (!isVideoAd()) {
                            gVar = com.fyber.inneractive.sdk.util.g.NATIVE_AD_IMAGE;
                            break;
                        } else {
                            gVar = com.fyber.inneractive.sdk.util.g.NATIVE_AD_VIDEO;
                            break;
                        }
                    }
                    break;
                case 67056:
                    if (str.equals(NativeAdContent.ViewTag.CTA)) {
                        gVar = com.fyber.inneractive.sdk.util.g.NATIVE_CTA;
                        break;
                    }
                    break;
                case 2241657:
                    if (str.equals(NativeAdContent.ViewTag.AD_ICON)) {
                        gVar = com.fyber.inneractive.sdk.util.g.NATIVE_AD_ICON;
                        break;
                    }
                    break;
                case 2521314:
                    if (str.equals(NativeAdContent.ViewTag.ROOT)) {
                        gVar = com.fyber.inneractive.sdk.util.g.NATIVE_AD_ROOT;
                        break;
                    }
                    break;
                case 75532016:
                    str.equals(NativeAdContent.ViewTag.OTHER);
                    gVar = com.fyber.inneractive.sdk.util.g.NATIVE;
                    break;
                case 79833656:
                    if (str.equals(NativeAdContent.ViewTag.AD_TITLE)) {
                        gVar = com.fyber.inneractive.sdk.util.g.NATIVE_AD_TITLE;
                        break;
                    }
                    break;
                case 428414940:
                    if (str.equals(NativeAdContent.ViewTag.AD_DESCRIPTION)) {
                        gVar = com.fyber.inneractive.sdk.util.g.NATIVE_AD_DESCRIPTION;
                        break;
                    }
                    break;
            }
            com.fyber.inneractive.sdk.flow.nativead.i iVar = (com.fyber.inneractive.sdk.flow.nativead.i) this.f28432t.get(str);
            com.fyber.inneractive.sdk.flow.nativead.j jVar = this.f28433u;
            if (iVar == null) {
                iVar = jVar.f28212a;
            }
            if (iVar == null) {
                jVar.getClass();
                IAlog.a("%s : No active link (no root and object related links), origin: %s", com.fyber.inneractive.sdk.flow.nativead.j.f28211d, gVar);
            } else {
                com.fyber.inneractive.sdk.flow.nativead.p pVar = jVar.f28214c;
                pVar.getClass();
                com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.flow.nativead.m(pVar, iVar, false, gVar));
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final void bindMediaView(MediaView mediaView) {
        this.n = mediaView;
        com.fyber.inneractive.sdk.flow.nativead.a aVar = this.f28434v;
        if (aVar != null) {
            aVar.bind(mediaView);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final boolean d() {
        return (this.f28427m == null && this.n == null) ? false : true;
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final void destroy() {
        t0 t0Var = this.f28431s;
        if (t0Var != null) {
            t0Var.destroy();
            this.f28431s = null;
        }
        com.fyber.inneractive.sdk.flow.nativead.j jVar = this.f28433u;
        if (jVar != null) {
            jVar.f28213b = null;
            jVar.f28214c.f28242a = null;
            this.f28433u = null;
        }
        if (this.f28434v != null) {
            this.f28434v = null;
        }
        Iterator it = this.f28429q.iterator();
        while (it.hasNext()) {
            View view = (View) it.next();
            if (view != null) {
                view.setOnClickListener(null);
            }
        }
        Iterator it2 = this.f28429q.iterator();
        while (it2.hasNext()) {
            View view2 = (View) it2.next();
            if (view2 != null) {
                view2.setOnTouchListener(null);
            }
        }
        this.f28430r = null;
        this.f28429q.clear();
        this.f28425k = null;
        this.o = null;
        this.f28426l = null;
        this.f28421g = null;
        this.f28427m = null;
        this.n = null;
        this.f28422h = null;
        this.f28424j = null;
        this.f28423i = null;
        this.f28428p = null;
        this.f28432t.clear();
        this.f28435w.clear();
        this.f28436x.clear();
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final String getAdCallToAction() {
        return this.f28423i;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final String getAdDescription() {
        return this.f28422h;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final String getAdTitle() {
        return this.f28421g;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final String getAdvertiserName() {
        return this.f28424j;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final Uri getAppIcon() {
        return this.f28426l;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final Float getMediaAspectRatio() {
        return this.f28428p;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final MediaView getMediaView() {
        return this.n;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final String getPrice() {
        return this.f28425k;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final Float getRating() {
        return this.o;
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public boolean isVideoAd() {
        return this.f28431s != null;
    }

    @Override // com.fyber.inneractive.sdk.external.NativeAdContent
    public final void registerViewsForInteraction(ViewGroup viewGroup, MediaView mediaView, ImageView imageView, Collection collection) {
        this.f28429q.clear();
        if (collection != null) {
            this.f28429q.addAll(collection);
        }
        if (viewGroup != null && !this.f28429q.contains(viewGroup)) {
            this.f28429q.add(viewGroup);
        }
        if (mediaView != null && !this.f28429q.contains(mediaView)) {
            this.f28429q.add(mediaView);
        }
        if (imageView != null && !this.f28429q.contains(imageView)) {
            this.f28429q.add(imageView);
        }
        MediaView mediaView2 = this.n;
        if (mediaView2 == null || mediaView2.getContext() == null) {
            IAlog.b("%sCould not attach NativeAdViewGestureDetector, MediaView or its context are null", "w0");
            return;
        }
        this.f28430r = new com.fyber.inneractive.sdk.flow.nativead.r(this.n.getContext(), this);
        Iterator it = this.f28429q.iterator();
        while (it.hasNext()) {
            View view = (View) it.next();
            if (view != null) {
                view.setOnTouchListener(this.f28430r);
            }
        }
    }
}
