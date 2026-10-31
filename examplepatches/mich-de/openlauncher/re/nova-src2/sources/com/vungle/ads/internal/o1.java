package com.vungle.ads.internal;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.util.Base64;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import b.e8;
import com.iab.omid.library.vungle.adsession.AdSession;
import com.vungle.ads.AdNotLoadedCantPlay;
import com.vungle.ads.InvalidAdStateError;
import com.vungle.ads.NativeAd$adPlayCallback$1;
import com.vungle.ads.VungleAdSize;
import com.vungle.ads.VungleError;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.nativead.NativeVideoOptions;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o1 extends s implements com.vungle.ads.internal.presenter.x {
    public final Lazy A;
    public com.vungle.ads.internal.ui.a0 B;
    public final View.OnTouchListener C;

    /* renamed from: q, reason: collision with root package name */
    public final Lazy f47297q;

    /* renamed from: r, reason: collision with root package name */
    public final AtomicBoolean f47298r;

    /* renamed from: s, reason: collision with root package name */
    public final Lazy f47299s;

    /* renamed from: t, reason: collision with root package name */
    public com.vungle.ads.internal.presenter.w f47300t;

    /* renamed from: u, reason: collision with root package name */
    public LinkedHashMap f47301u;

    /* renamed from: v, reason: collision with root package name */
    public Bitmap f47302v;

    /* renamed from: w, reason: collision with root package name */
    public Bitmap f47303w;

    /* renamed from: x, reason: collision with root package name */
    public final Lazy f47304x;

    /* renamed from: y, reason: collision with root package name */
    public final Lazy f47305y;

    /* renamed from: z, reason: collision with root package name */
    public float f47306z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o1(Context context) {
        super(context);
        Intrinsics.g(context, "context");
        this.f47297q = LazyKt.a(new i1(context));
        this.f47298r = new AtomicBoolean(false);
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
        this.f47299s = LazyKt.b(lazyThreadSafetyMode, new l1(context));
        this.f47304x = LazyKt.b(lazyThreadSafetyMode, new m1(context));
        this.f47305y = LazyKt.a(new h1(this));
        this.A = LazyKt.a(n1.f47210a);
        this.C = new e8(this, 1);
    }

    @Override // com.vungle.ads.internal.s
    public final boolean a(VungleAdSize vungleAdSize) {
        return true;
    }

    @Override // com.vungle.ads.internal.s
    public final VungleAdSize b() {
        return null;
    }

    public final void c(ImageView imageView) {
        String str;
        LinkedHashMap linkedHashMap = this.f47301u;
        if (linkedHashMap == null || (str = (String) linkedHashMap.get("MAIN_IMAGE")) == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        ((com.vungle.ads.internal.util.p) this.f47305y.getValue()).a(str, new g1(imageView));
    }

    public final void d(ImageView imageView) {
        if (imageView != null) {
            imageView.setImageBitmap(this.f47302v);
        }
    }

    @Override // com.vungle.ads.internal.s
    public final InvalidAdStateError j() {
        if (this.f47461b == h.f46845c || i()) {
            return null;
        }
        return new InvalidAdStateError(Sdk.SDKError.Reason.AD_NOT_LOADED, this.f47461b + " can not play native ad.");
    }

    public final boolean m() {
        if (this.f47302v != null) {
            return (w() && this.f47303w == null) ? false : true;
        }
        return false;
    }

    public final void n() {
        com.vungle.ads.internal.ui.a0 a0Var = this.B;
        if (a0Var != null) {
            ViewParent parent = a0Var.getParent();
            ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
            if (viewGroup != null) {
                viewGroup.removeView(a0Var);
            }
        }
        this.B = null;
        ((c1) this.f47297q.getValue()).a();
        com.vungle.ads.internal.presenter.w wVar = this.f47300t;
        if (wVar != null) {
            com.vungle.ads.internal.omsdk.b bVar = wVar.n;
            if (bVar != null) {
                AdSession adSession = bVar.f47310b;
                if (adSession != null) {
                    adSession.finish();
                }
                bVar.f47310b = null;
                bVar.f47311c = null;
                bVar.f47312d = null;
            }
            AlertDialog alertDialog = wVar.f47427h;
            if (alertDialog != null && alertDialog.isShowing()) {
                alertDialog.dismiss();
            }
            Long l9 = wVar.f47424e;
            if (l9 != null) {
                List listB = wVar.f47422c.b("ad.close", String.valueOf(System.currentTimeMillis() - l9.longValue()), String.valueOf(((com.vungle.ads.internal.platform.c) wVar.f47423d).k()));
                if (listB != null) {
                    Iterator it = listB.iterator();
                    while (it.hasNext()) {
                        com.vungle.ads.internal.network.p pVar = new com.vungle.ads.internal.network.p((String) it.next());
                        pVar.f47271i = "ad.close";
                        pVar.f47272j = wVar.a();
                        wVar.b().a(pVar.a(), false);
                    }
                }
            }
            com.vungle.ads.internal.presenter.a aVar = wVar.f47425f;
            if (aVar != null) {
                aVar.a("end", null, ((o1) wVar.f47421b).r());
            }
        }
    }

    public final Double o() {
        String str;
        LinkedHashMap linkedHashMap = this.f47301u;
        if (linkedHashMap == null || (str = (String) linkedHashMap.get("APP_RATING_VALUE")) == null) {
            return null;
        }
        return r70.i.r0(str);
    }

    public final String p() {
        String str;
        LinkedHashMap linkedHashMap = this.f47301u;
        return (linkedHashMap == null || (str = (String) linkedHashMap.get("MAIN_VIDEO")) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
    }

    public final String q() {
        String str;
        LinkedHashMap linkedHashMap = this.f47301u;
        return (linkedHashMap == null || (str = (String) linkedHashMap.get("ORIGINAL_VIDEO_URL")) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
    }

    public final String r() {
        j3 j3Var = this.f47463d;
        if (j3Var != null) {
            return j3Var.f47068a;
        }
        return null;
    }

    public final NativeVideoOptions s() {
        return (NativeVideoOptions) this.A.getValue();
    }

    public final boolean t() {
        return p().length() > 0;
    }

    public final boolean u() {
        return t();
    }

    public final boolean v() {
        boolean zBooleanValue;
        String str;
        Boolean boolT1;
        if (!((com.vungle.ads.internal.platform.c) ((com.vungle.ads.internal.platform.f) this.f47299s.getValue())).n()) {
            Boolean startMuted = s().getStartMuted();
            if (startMuted != null) {
                zBooleanValue = startMuted.booleanValue();
            } else {
                LinkedHashMap linkedHashMap = this.f47301u;
                zBooleanValue = (linkedHashMap == null || (str = (String) linkedHashMap.get(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.x.f42073a)) == null || (boolT1 = r70.k.t1(str)) == null) ? true : boolT1.booleanValue();
            }
            if (!zBooleanValue) {
                return false;
            }
        }
        return true;
    }

    public final boolean w() {
        String str;
        LinkedHashMap linkedHashMap = this.f47301u;
        if (linkedHashMap == null || (str = (String) linkedHashMap.get("VUNGLE_AI_LABEL_ICON_URL")) == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return str.length() > 0;
    }

    public final void x() {
        String str;
        com.vungle.ads.internal.presenter.w wVar = this.f47300t;
        if (wVar != null) {
            LinkedHashMap linkedHashMap = this.f47301u;
            if (linkedHashMap == null || (str = (String) linkedHashMap.get("VUNGLE_PRIVACY_URL")) == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            wVar.a("openPrivacy", (String) null, str);
        }
    }

    public final void y() {
        String str;
        a(8, (Map) null);
        com.vungle.ads.internal.presenter.w wVar = this.f47300t;
        if (wVar != null) {
            LinkedHashMap linkedHashMap = this.f47301u;
            if (linkedHashMap == null || (str = (String) linkedHashMap.get("CTA_BUTTON_URL")) == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            wVar.a("download", (String) null, str);
        }
    }

    public final void a(String str) {
        com.vungle.ads.internal.presenter.w wVar = this.f47300t;
        if (wVar != null) {
            wVar.a("tpat", "video.length", str);
        }
    }

    public final void b(ImageView imageView) {
        String str;
        LinkedHashMap linkedHashMap = this.f47301u;
        if (linkedHashMap == null || (str = (String) linkedHashMap.get("APP_ICON")) == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        ((com.vungle.ads.internal.util.p) this.f47305y.getValue()).a(str, new g1(imageView));
    }

    public static final com.vungle.ads.internal.executor.a a(o1 o1Var) {
        return (com.vungle.ads.internal.executor.a) o1Var.f47304x.getValue();
    }

    public static final boolean a(o1 this$0, View view, MotionEvent motionEvent) {
        Intrinsics.g(this$0, "this$0");
        com.vungle.ads.internal.presenter.w wVar = this$0.f47300t;
        if (wVar == null) {
            return false;
        }
        wVar.a(motionEvent);
        return false;
    }

    @Override // com.vungle.ads.internal.s
    public final void b(com.vungle.ads.internal.model.i0 advertisement) {
        Object objA;
        Bitmap bitmap;
        String str;
        Object objA2;
        Throwable thA;
        Object objA3;
        Integer numU0;
        Integer numU02;
        String str2;
        Object objA4;
        Bitmap bitmap2;
        Object objA5;
        Object objA6;
        Intrinsics.g(advertisement, "advertisement");
        LinkedHashMap linkedHashMapS = advertisement.s();
        this.f47301u = linkedHashMapS;
        String str3 = (String) linkedHashMapS.get("VUNGLE_PRIVACY_ICON_URL");
        String str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int iIntValue = 0;
        if (r70.j.I0(str3, "file://", false)) {
            try {
                int i5 = Result.f71687b;
                objA = BitmapFactory.decodeFile(r70.k.a1(str3, "file://"));
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            bitmap = (Bitmap) objA;
        } else {
            bitmap = null;
        }
        if (bitmap == null) {
            try {
                int i12 = Result.f71687b;
                byte[] bArrDecode = Base64.decode("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAABSgAwAEAAAAAQAAABQAAAAAQeed/gAAAAlwSFlzAAALEwAACxMBAJqcGAAAABxpRE9UAAAAAgAAAAAAAAAKAAAAKAAAAAoAAAAKAAAB9+x9rI0AAAHDSURBVDgRfJJLSwJhFIb7Af2G/kEEQVAEFdQigjYtWhW0CVq0CdpUIFKEYZhYylgpZSEThggWJhUmlJGSBRmB2hUbbyUyONPYePnyLWaQyGY4zOGc933O+fimru6PRyBCQ4EUej9LhSk2x9FMNHnLPKSukaOGHjR/WH9KaULqxaI4yvH8ZprJ+ML+x/AZfRm1K9xB4/COW929uo1Ajhp60EALj1gSx8CQB6DoMV3E10dsx5o+k22uzWBSNuv0iibt8kyjRotvdY4eNNDCAy8YMjAWiUckyHy7wYiASTdgsbqWvOcBRyiCQI4aetU6eF/u4vcy8Dn0GlV1Uhvfog7jqrJFZ3AueE6zGVYUSZFUB2r7ix4fNPMVLTzwgiEDQVd1UZvSZo65Qy8g+eIn4fMCyXF8GcHxH9/5ezKbtyvdHmnTmsDZ1hVK02e2vCeyPIAAY1NBzBPAypX36SaW0A9u00w4ldH2b2zBUxOIiZgMWOU3YXEkdc+aOfHylsOGJ2b/FfoYyrJcUdqyJhA3CRM2OaJ8AXrSeWCdcLp8dDCES8FG2BhAaQA8/wIBwobGIdqGoyEs4449gHanXYc4qgSE9jfwCwAA//+KFItXAAABtklEQVR9UUtLAmEU9Tf0N1oEQVBID6hVUcto07Jdm2jVJqSQoDCpFC20MgkLAu2BCEm0SBf2Qu2tkaGmpSnjzDjjODl9R/iizJrhcl/nHO69n0pFvuebl+hMl2ld07xg2Bzbc0fOYilth3nZv31x7XOch2d7Vqzu+WO/vn9twzbq3Eeef2ckxODMdJrWYuFEBFrVrypIilq10QyhgDP8EAvGM6JcUgRJVG5Poonk4ysDH/TeJQk+h7iKJ5xfgslI+mq2e9kOgKZlwWgYtDuyqTwvKbLCi4JChZFXyJ9J5jhggAUH20GDDqhiWd5pHt7yVAFkQnisd7obiuayjARRGGJMj953LLjQ+BIUZbkv6L1PT7Uumejak036xYlGnV7Xa7VZRnZcq8QQo4YeTgMsOOCKsjjwJYhA+ChpA65QarrNaAHw0OQL0IcACYbJDuaOfOgBAyw44P4Qo0lZKY9fem7jWAv3gmFNPAIMMa3jHMCCQ/l1fVEuDQlySWA5vgLD7fDSMMS0Th5KBLauSG2xUCiqOY5/ouRaj16hILTX8v7NGYZp4DhunOV5HxF8JfaGGDX0/iJ/Apualt8qeDHZAAAAAElFTkSuQmCC", 0);
                objA6 = BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length);
            } catch (Throwable th3) {
                int i13 = Result.f71687b;
                objA6 = ResultKt.a(th3);
            }
            if (objA6 instanceof Result.Failure) {
                objA6 = null;
            }
            bitmap = (Bitmap) objA6;
        }
        this.f47302v = bitmap;
        if (w()) {
            LinkedHashMap linkedHashMap = this.f47301u;
            if (linkedHashMap == null || (str2 = (String) linkedHashMap.get("VUNGLE_AI_LABEL_ICON_URL")) == null) {
                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (r70.j.I0(str2, "file://", false)) {
                try {
                    int i14 = Result.f71687b;
                    objA4 = BitmapFactory.decodeFile(r70.k.a1(str2, "file://"));
                } catch (Throwable th4) {
                    int i15 = Result.f71687b;
                    objA4 = ResultKt.a(th4);
                }
                if (objA4 instanceof Result.Failure) {
                    objA4 = null;
                }
                bitmap2 = (Bitmap) objA4;
            } else {
                bitmap2 = null;
            }
            if (bitmap2 == null) {
                try {
                    int i16 = Result.f71687b;
                    byte[] bArrDecode2 = Base64.decode("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", 0);
                    objA5 = BitmapFactory.decodeByteArray(bArrDecode2, 0, bArrDecode2.length);
                } catch (Throwable th5) {
                    int i17 = Result.f71687b;
                    objA5 = ResultKt.a(th5);
                }
                if (objA5 instanceof Result.Failure) {
                    objA5 = null;
                }
                bitmap2 = (Bitmap) objA5;
            }
            this.f47303w = bitmap2;
        }
        com.vungle.ads.internal.util.s sVarE = e();
        Long lA = sVarE != null ? sVarE.a() : null;
        if ((lA != null && lA.longValue() == 3) || (lA != null && lA.longValue() == 4)) {
            l();
        }
        if (t()) {
            MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
            try {
                Context contextD = d();
                Uri uri = Uri.parse(p());
                Intrinsics.f(uri, "parse(this)");
                mediaMetadataRetriever.setDataSource(contextD, uri);
                String strExtractMetadata = mediaMetadataRetriever.extractMetadata(18);
                int iIntValue2 = (strExtractMetadata == null || (numU02 = r70.i.u0(strExtractMetadata)) == null) ? 0 : numU02.intValue();
                String strExtractMetadata2 = mediaMetadataRetriever.extractMetadata(19);
                if (strExtractMetadata2 != null && (numU0 = r70.i.u0(strExtractMetadata2)) != null) {
                    iIntValue = numU0.intValue();
                }
                if (iIntValue2 > 0 && iIntValue > 0) {
                    this.f47306z = iIntValue2 / iIntValue;
                }
                try {
                    int i18 = Result.f71687b;
                    mediaMetadataRetriever.release();
                    objA3 = Unit.f71706a;
                } catch (Throwable th6) {
                    int i19 = Result.f71687b;
                    objA3 = ResultKt.a(th6);
                }
                thA = Result.a(objA3);
                if (thA == null) {
                    return;
                }
            } catch (Throwable th7) {
                try {
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.b("NativeAd", "Failed to retrieve video metadata: " + th7.getLocalizedMessage());
                    try {
                        int i21 = Result.f71687b;
                        mediaMetadataRetriever.release();
                        objA2 = Unit.f71706a;
                    } catch (Throwable th8) {
                        int i22 = Result.f71687b;
                        objA2 = ResultKt.a(th8);
                    }
                    thA = Result.a(objA2);
                    if (thA == null) {
                        return;
                    }
                } finally {
                }
            }
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("NativeAdInternal", "Failed to release metadata retriever", thA);
            return;
        }
        com.vungle.ads.internal.util.p pVar = (com.vungle.ads.internal.util.p) this.f47305y.getValue();
        LinkedHashMap linkedHashMap2 = this.f47301u;
        if (linkedHashMap2 != null && (str = (String) linkedHashMap2.get("MAIN_IMAGE")) != null) {
            str4 = str;
        }
        k1 k1Var = new k1(this);
        pVar.getClass();
        com.vungle.ads.internal.util.p.a(str4, k1Var);
    }

    @Override // com.vungle.ads.internal.s
    public final boolean a(j3 placement) {
        Intrinsics.g(placement, "placement");
        return placement.i();
    }

    public final void a(ImageView imageView) {
        imageView.setImageBitmap(this.f47303w);
    }

    public final void a(int i5, Map map) {
        com.vungle.ads.internal.presenter.w wVar = this.f47300t;
        if (wVar != null) {
            wVar.a(i5, map);
        }
    }

    public static void a(o1 o1Var, String event) {
        o1Var.getClass();
        Intrinsics.g(event, "event");
        com.vungle.ads.internal.presenter.w wVar = o1Var.f47300t;
        if (wVar != null) {
            wVar.a("tpat", event, (String) null);
        }
    }

    public final void a(ViewGroup rootView, String str) {
        Intrinsics.g(rootView, "rootView");
        if (str == null) {
            return;
        }
        if (this.B == null) {
            Context context = rootView.getContext();
            Intrinsics.f(context, "rootView.context");
            this.B = new com.vungle.ads.internal.ui.a0(context, str);
        }
        com.vungle.ads.internal.ui.a0 a0Var = this.B;
        if (a0Var == null || Intrinsics.b(a0Var.getParent(), rootView)) {
            return;
        }
        ViewParent parent = a0Var.getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(a0Var);
        }
        rootView.addView(a0Var);
        a0Var.bringToFront();
    }

    public final void a(View rootView, NativeAd$adPlayCallback$1 nativeAd$adPlayCallback$1) {
        String str;
        Intrinsics.g(rootView, "rootView");
        com.vungle.ads.internal.model.i0 i0VarC = c();
        if (i0VarC == null) {
            VungleError vungleErrorLogError$vungle_ads_release = new AdNotLoadedCantPlay("Ad is null").setLogEntry$vungle_ads_release(e()).logError$vungle_ads_release();
            if (nativeAd$adPlayCallback$1 != null) {
                nativeAd$adPlayCallback$1.onFailure(vungleErrorLogError$vungle_ads_release);
                return;
            }
            return;
        }
        if (this.f47300t == null) {
            com.vungle.ads.internal.presenter.w wVar = new com.vungle.ads.internal.presenter.w(d(), this, i0VarC, (com.vungle.ads.internal.platform.f) this.f47299s.getValue());
            this.f47300t = wVar;
            wVar.a(new com.vungle.ads.internal.presenter.a(nativeAd$adPlayCallback$1, f()));
        }
        com.vungle.ads.internal.presenter.w wVar2 = this.f47300t;
        if (wVar2 != null) {
            LinkedHashMap linkedHashMap = this.f47301u;
            if (linkedHashMap == null || (str = (String) linkedHashMap.get("OM_SDK_DATA")) == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            wVar2.a(rootView, str);
        }
        ((c1) this.f47297q.getValue()).a(rootView, new j1(this));
        com.vungle.ads.internal.presenter.w wVar3 = this.f47300t;
        if (wVar3 != null) {
            wVar3.c();
        }
    }

    public final void a(View view) {
        Intrinsics.g(view, "view");
        com.vungle.ads.internal.model.i0 i0VarC = c();
        if (i0VarC == null || !i0VarC.z()) {
            return;
        }
        view.setOnTouchListener(this.C);
    }
}
