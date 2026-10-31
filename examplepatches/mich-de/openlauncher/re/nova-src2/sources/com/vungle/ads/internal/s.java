package com.vungle.ads.internal;

import android.content.Context;
import com.tiktok.appevents.ErrorData;
import com.vungle.ads.AdExpiredError;
import com.vungle.ads.AdExpiredOnPlayError;
import com.vungle.ads.AdMarkupInvalidError;
import com.vungle.ads.AdMarkupJsonError;
import com.vungle.ads.AdNotLoadedCantPlay;
import com.vungle.ads.EmptyBidPayloadError;
import com.vungle.ads.InvalidAdStateError;
import com.vungle.ads.InvalidBannerSizeError;
import com.vungle.ads.InvalidCSBDataError;
import com.vungle.ads.PlacementAdTypeMismatchError;
import com.vungle.ads.PlacementNotFoundError;
import com.vungle.ads.SdkNotInitialized;
import com.vungle.ads.VungleAdSize;
import com.vungle.ads.VungleAds;
import com.vungle.ads.VungleCSBData;
import com.vungle.ads.VungleError;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.PathProvider;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.NoWhenBranchMatchedException;
import kotlin.NotImplementedError;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;

/* loaded from: classes4.dex */
public abstract class s implements com.vungle.ads.internal.load.a {

    /* renamed from: p, reason: collision with root package name */
    public static final Json f47459p = JsonKt.Json$default(null, i.f46853a, 1, null);

    /* renamed from: a, reason: collision with root package name */
    public final Context f47460a;

    /* renamed from: b, reason: collision with root package name */
    public volatile h f47461b;

    /* renamed from: c, reason: collision with root package name */
    public com.vungle.ads.internal.model.i0 f47462c;

    /* renamed from: d, reason: collision with root package name */
    public j3 f47463d;

    /* renamed from: e, reason: collision with root package name */
    public com.vungle.ads.internal.model.q0 f47464e;

    /* renamed from: f, reason: collision with root package name */
    public com.vungle.ads.internal.load.a f47465f;

    /* renamed from: g, reason: collision with root package name */
    public final Lazy f47466g;

    /* renamed from: h, reason: collision with root package name */
    public com.vungle.ads.internal.load.i f47467h;

    /* renamed from: i, reason: collision with root package name */
    public l2 f47468i;

    /* renamed from: j, reason: collision with root package name */
    public l2 f47469j;

    /* renamed from: k, reason: collision with root package name */
    public final q1 f47470k;

    /* renamed from: l, reason: collision with root package name */
    public final q1 f47471l;

    /* renamed from: m, reason: collision with root package name */
    public com.vungle.ads.internal.util.s f47472m;
    public final AtomicBoolean n;
    public final AtomicBoolean o;

    public s(Context context) {
        Intrinsics.g(context, "context");
        this.f47460a = context;
        this.f47461b = h.f46843a;
        this.f47466g = LazyKt.b(LazyThreadSafetyMode.f71679a, new r(context));
        this.f47470k = new q1(Sdk.SDKMetric.SDKMetricType.AD_SHOW_TO_VALIDATION_DURATION_MS);
        this.f47471l = new q1(Sdk.SDKMetric.SDKMetricType.AD_VALIDATION_TO_PRESENT_DURATION_MS);
        this.n = new AtomicBoolean(false);
        this.o = new AtomicBoolean(false);
    }

    public void a(com.vungle.ads.internal.model.i0 advertisement) {
        Intrinsics.g(advertisement, "advertisement");
    }

    public abstract boolean a(VungleAdSize vungleAdSize);

    public abstract boolean a(j3 j3Var);

    public abstract VungleAdSize b();

    public void b(com.vungle.ads.internal.model.i0 advertisement) {
        Intrinsics.g(advertisement, "advertisement");
    }

    public final com.vungle.ads.internal.model.i0 c() {
        return this.f47462c;
    }

    public final Context d() {
        return this.f47460a;
    }

    public final com.vungle.ads.internal.util.s e() {
        return this.f47472m;
    }

    public final j3 f() {
        return this.f47463d;
    }

    public final q1 g() {
        return this.f47470k;
    }

    public final q1 h() {
        return this.f47471l;
    }

    public final boolean i() {
        return this.f47461b == h.f46846d || this.f47461b == h.f46847e;
    }

    public InvalidAdStateError j() {
        if (this.f47461b == h.f46846d) {
            return new InvalidAdStateError(Sdk.SDKError.Reason.AD_IS_PLAYING, "Current ad is playing");
        }
        if (this.f47461b == h.f46847e) {
            return new InvalidAdStateError(Sdk.SDKError.Reason.AD_IS_PLAYING, "Current ad is playing, impression logged");
        }
        if (this.f47461b == h.f46845c) {
            return null;
        }
        return new InvalidAdStateError(Sdk.SDKError.Reason.AD_NOT_LOADED, this.f47461b + " is not READY");
    }

    public final void k() {
        List<String> listR;
        if (!this.o.compareAndSet(false, true)) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AdInternal", "Loss URL already sent, skipping");
            return;
        }
        com.vungle.ads.internal.model.i0 i0Var = this.f47462c;
        if (i0Var == null || (listR = i0Var.r()) == null) {
            return;
        }
        Lazy lazyB = LazyKt.b(LazyThreadSafetyMode.f71679a, new p(this.f47460a));
        for (String str : listR) {
            if (com.vungle.ads.internal.util.n.a(str)) {
                ((com.vungle.ads.internal.network.r) lazyB.getValue()).a(new com.vungle.ads.internal.network.p(str).d().a(), false);
            } else {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("AdInternal", "Invalid loss URL skipped: " + str);
            }
        }
    }

    public final void l() {
        List<String> listW;
        if (!this.n.compareAndSet(false, true)) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AdInternal", "Win URL already sent, skipping");
            return;
        }
        com.vungle.ads.internal.model.i0 i0Var = this.f47462c;
        if (i0Var == null || (listW = i0Var.w()) == null) {
            return;
        }
        Lazy lazyB = LazyKt.b(LazyThreadSafetyMode.f71679a, new q(this.f47460a));
        for (String str : listW) {
            if (com.vungle.ads.internal.util.n.a(str)) {
                ((com.vungle.ads.internal.network.r) lazyB.getValue()).a(new com.vungle.ads.internal.network.p(str).d().a(), false);
            } else {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("AdInternal", "Invalid win URL skipped: " + str);
            }
        }
    }

    @Override // com.vungle.ads.internal.load.a
    public final void onFailure(VungleError error) throws Throwable {
        Intrinsics.g(error, "error");
        a(h.f46849g);
        l2 l2Var = this.f47469j;
        if (l2Var != null) {
            l2Var.a(Sdk.SDKMetric.SDKMetricType.AD_LOAD_TO_FAIL_CALLBACK_DURATION_MS);
            l2Var.d();
            AnalyticsClient.INSTANCE.a(l2Var, this.f47472m, error.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String() + '-' + error.getErrorMessage());
        }
        com.vungle.ads.internal.load.a aVar = this.f47465f;
        if (aVar != null) {
            aVar.onFailure(error);
        }
    }

    @Override // com.vungle.ads.internal.load.a
    public final void onSuccess(com.vungle.ads.internal.model.i0 advertisement) throws Throwable {
        Intrinsics.g(advertisement, "advertisement");
        this.f47462c = advertisement;
        b(advertisement);
        a(h.f46845c);
        a(advertisement);
        com.vungle.ads.internal.load.a aVar = this.f47465f;
        if (aVar != null) {
            aVar.onSuccess(advertisement);
        }
        l2 l2Var = this.f47469j;
        if (l2Var != null) {
            if (!advertisement.b()) {
                l2Var.a(Sdk.SDKMetric.SDKMetricType.AD_LOAD_TO_CALLBACK_DURATION_MS);
            }
            l2Var.d();
            AnalyticsClient.a(AnalyticsClient.INSTANCE, l2Var, this.f47472m, 4);
        }
        l2 l2Var2 = this.f47468i;
        if (l2Var2 != null) {
            if (!advertisement.b()) {
                l2Var2.a(Sdk.SDKMetric.SDKMetricType.AD_REQUEST_TO_CALLBACK_DURATION_MS);
            }
            l2Var2.d();
            AnalyticsClient.a(AnalyticsClient.INSTANCE, l2Var2, this.f47472m, 4);
            Lazy lazyB = LazyKt.b(LazyThreadSafetyMode.f71679a, new o(this.f47460a));
            List listA = com.vungle.ads.internal.model.i0.a(advertisement, "ad.loadDuration", String.valueOf(l2Var2.c()), 4);
            if (listA != null) {
                Iterator it = listA.iterator();
                while (it.hasNext()) {
                    ((com.vungle.ads.internal.network.r) lazyB.getValue()).a(new com.vungle.ads.internal.network.p((String) it.next()).b("ad.loadDuration").a(this.f47472m).a(), false);
                }
            }
        }
    }

    public final void a(h value) {
        String strH;
        Intrinsics.g(value, "value");
        if (value.a()) {
            com.vungle.ads.internal.load.i iVar = this.f47467h;
            if (iVar != null) {
                iVar.a();
            }
            com.vungle.ads.internal.model.i0 i0Var = this.f47462c;
            if (i0Var != null && (strH = i0Var.h()) != null) {
                ((com.vungle.ads.internal.task.r) ((com.vungle.ads.internal.task.g) LazyKt.b(LazyThreadSafetyMode.f71679a, new j(this.f47460a)).getValue())).a(com.vungle.ads.internal.task.a.a(strH, null, 2));
            }
        }
        this.f47461b = this.f47461b.b(value);
        com.vungle.ads.internal.util.s sVar = this.f47472m;
        if (sVar == null) {
            return;
        }
        sVar.a(this.f47461b);
    }

    public final VungleError a(boolean z11) {
        VungleError adExpiredError;
        com.vungle.ads.internal.model.i iVarK;
        VungleError vungleErrorJ = j();
        com.vungle.ads.internal.model.i0 i0Var = this.f47462c;
        if (i0Var == null) {
            vungleErrorJ = new AdNotLoadedCantPlay(a2.c.l("adv is null on onPlay=", z11));
        } else if (vungleErrorJ == null) {
            Integer num = null;
            if (!i0Var.x()) {
                return null;
            }
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Ad expiry: ");
            com.vungle.ads.internal.model.i0 i0Var2 = this.f47462c;
            if (i0Var2 != null && (iVarK = i0Var2.k()) != null) {
                num = iVarK.f47024d;
            }
            sbA.append(num);
            sbA.append(", device: ");
            sbA.append(System.currentTimeMillis());
            String string = sbA.toString();
            if (z11) {
                adExpiredError = new AdExpiredOnPlayError(string);
            } else {
                adExpiredError = new AdExpiredError(string);
            }
            vungleErrorJ = adExpiredError;
        }
        if (z11) {
            vungleErrorJ.setLogEntry$vungle_ads_release(this.f47472m).logErrorNoReturnValue$vungle_ads_release();
        }
        return vungleErrorJ;
    }

    public final void a(String placementId, String str, VungleCSBData vungleCSBData, com.vungle.ads.internal.load.a adLoaderCallback) {
        Sdk.SDKError.Reason reason;
        Intrinsics.g(placementId, "placementId");
        Intrinsics.g(adLoaderCallback, "adLoaderCallback");
        com.vungle.ads.internal.util.s sVar = this.f47472m;
        if (sVar != null) {
            sVar.a(this.f47461b);
        }
        AnalyticsClient.a(AnalyticsClient.INSTANCE, Sdk.SDKMetric.SDKMetricType.LOAD_AD_API, 0L, this.f47472m, null, 10);
        l2 l2Var = new l2(Sdk.SDKMetric.SDKMetricType.AD_LOAD_TO_CALLBACK_ADO_DURATION_MS);
        this.f47469j = l2Var;
        l2Var.e();
        this.f47465f = adLoaderCallback;
        if (!VungleAds.INSTANCE.isInitialized()) {
            adLoaderCallback.onFailure(new SdkNotInitialized(ErrorData.TT_DDL_MSG_NOT_INIT).setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
            return;
        }
        ConfigManager.INSTANCE.getClass();
        j3 j3VarA = ConfigManager.a(placementId);
        if (j3VarA != null) {
            this.f47463d = j3VarA;
            if (!a(j3VarA)) {
                adLoaderCallback.onFailure(new PlacementAdTypeMismatchError(j3VarA.b()).setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
                return;
            } else if (vungleCSBData == null && j3VarA.a() && (str == null || str.length() == 0)) {
                adLoaderCallback.onFailure(new EmptyBidPayloadError(placementId).setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
                return;
            }
        } else if (ConfigManager.b() == -1) {
            j3VarA = new j3(placementId);
            this.f47463d = j3VarA;
        } else {
            adLoaderCallback.onFailure(new PlacementNotFoundError(placementId).setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
            return;
        }
        VungleAdSize vungleAdSizeB = b();
        if (!a(vungleAdSizeB)) {
            adLoaderCallback.onFailure(new InvalidBannerSizeError(vungleAdSizeB != null ? vungleAdSizeB.toString() : null).setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
            return;
        }
        if (this.f47461b != h.f46843a) {
            switch (this.f47461b.ordinal()) {
                case 0:
                    throw new NotImplementedError(0);
                case 1:
                    reason = Sdk.SDKError.Reason.AD_IS_LOADING;
                    break;
                case 2:
                    reason = Sdk.SDKError.Reason.AD_ALREADY_LOADED;
                    break;
                case 3:
                    reason = Sdk.SDKError.Reason.AD_IS_PLAYING;
                    break;
                case 4:
                    reason = Sdk.SDKError.Reason.AD_IS_PLAYING;
                    break;
                case 5:
                    reason = Sdk.SDKError.Reason.AD_CONSUMED;
                    break;
                case 6:
                    reason = Sdk.SDKError.Reason.AD_ALREADY_FAILED;
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            adLoaderCallback.onFailure(new InvalidAdStateError(reason, this.f47461b + " state is incorrect for load").setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
            return;
        }
        l2 l2Var2 = new l2(Sdk.SDKMetric.SDKMetricType.AD_REQUEST_TO_CALLBACK_ADO_DURATION_MS);
        this.f47468i = l2Var2;
        l2Var2.e();
        if (str != null && str.length() != 0) {
            try {
                Json json = f47459p;
                KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(com.vungle.ads.internal.model.q0.class));
                Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
                this.f47464e = (com.vungle.ads.internal.model.q0) json.decodeFromString(kSerializerSerializer, str);
            } catch (IllegalArgumentException e3) {
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Unable to decode payload into BidPayload object. Error: ");
                sbA.append(e3.getLocalizedMessage());
                adLoaderCallback.onFailure(new AdMarkupInvalidError(sbA.toString()).setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
                return;
            } catch (Throwable th2) {
                adLoaderCallback.onFailure(new AdMarkupJsonError(th2.getLocalizedMessage()).setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
                return;
            }
        }
        if (vungleCSBData != null) {
            double bidFloor = vungleCSBData.getBidFloor();
            InvalidCSBDataError invalidCSBDataError = bidFloor < 0.0d ? new InvalidCSBDataError("bidFloor must be >= 0, got: " + bidFloor) : null;
            if (invalidCSBDataError == null) {
                int phase = vungleCSBData.getPhase();
                invalidCSBDataError = (1 > phase || phase >= 3) ? new InvalidCSBDataError(b.c0.h(phase, "phase must be 1 or 2, got: ")) : null;
                if (invalidCSBDataError == null) {
                    invalidCSBDataError = vungleCSBData.getAuctionId().length() > 500 ? new InvalidCSBDataError("auctionId exceeds maximum length of 500") : null;
                    if (invalidCSBDataError == null) {
                        invalidCSBDataError = vungleCSBData.getCreativeId().length() > 500 ? new InvalidCSBDataError("creativeId exceeds maximum length of 500") : null;
                        if (invalidCSBDataError == null) {
                            invalidCSBDataError = vungleCSBData.getAdUnitId().length() > 500 ? new InvalidCSBDataError("adUnitId exceeds maximum length of 500") : null;
                        }
                    }
                    if (invalidCSBDataError == null) {
                        Map<String, String> extras = vungleCSBData.getExtras();
                        if (extras == null) {
                            invalidCSBDataError = null;
                        } else if (extras.size() > 50) {
                            StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("extras map exceeds maximum of 50 entries, got: ");
                            sbA2.append(extras.size());
                            invalidCSBDataError = new InvalidCSBDataError(sbA2.toString());
                        } else {
                            for (Map.Entry<String, String> entry : extras.entrySet()) {
                                String key = entry.getKey();
                                String value = entry.getValue();
                                if (key.length() == 0) {
                                    invalidCSBDataError = new InvalidCSBDataError("extras contains empty key");
                                    break;
                                } else if (key.length() > 100) {
                                    invalidCSBDataError = new InvalidCSBDataError(com.iab.omid.library.vungle.d.a("extras key exceeds maximum length of 100: ", key));
                                    break;
                                } else if (value.length() > 500) {
                                    invalidCSBDataError = new InvalidCSBDataError(b.c0.l("extras value for key '", key, "' exceeds maximum length of 500"));
                                    break;
                                }
                            }
                            invalidCSBDataError = null;
                        }
                    }
                }
            }
            if (invalidCSBDataError != null) {
                adLoaderCallback.onFailure(invalidCSBDataError.setLogEntry$vungle_ads_release(this.f47472m).logError$vungle_ads_release());
                return;
            }
        }
        a(h.f46844b);
        Context context = this.f47460a;
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
        Lazy lazyB = LazyKt.b(lazyThreadSafetyMode, new k(context));
        Lazy lazyB2 = LazyKt.b(lazyThreadSafetyMode, new l(this.f47460a));
        Lazy lazyB3 = LazyKt.b(lazyThreadSafetyMode, new m(this.f47460a));
        Lazy lazyB4 = LazyKt.b(lazyThreadSafetyMode, new n(this.f47460a));
        if (vungleCSBData != null) {
            com.vungle.ads.internal.util.s sVar2 = this.f47472m;
            if (sVar2 != null) {
                sVar2.a(vungleCSBData.getPhase() == 2 ? 4L : 3L);
            }
            this.f47467h = new com.vungle.ads.internal.load.j(this.f47460a, (VungleApiClient) this.f47466g.getValue(), (com.vungle.ads.internal.executor.d) lazyB2.getValue(), (com.vungle.ads.internal.omsdk.c) lazyB.getValue(), (com.vungle.ads.internal.downloader.n) lazyB4.getValue(), (PathProvider) lazyB3.getValue(), new com.vungle.ads.internal.load.b(j3VarA, null, vungleAdSizeB, vungleCSBData));
        } else if (str != null && str.length() != 0) {
            com.vungle.ads.internal.util.s sVar3 = this.f47472m;
            if (sVar3 != null) {
                sVar3.a((Long) 2L);
            }
            this.f47467h = new com.vungle.ads.internal.load.p(this.f47460a, (VungleApiClient) this.f47466g.getValue(), (com.vungle.ads.internal.executor.d) lazyB2.getValue(), (com.vungle.ads.internal.omsdk.c) lazyB.getValue(), (com.vungle.ads.internal.downloader.n) lazyB4.getValue(), (PathProvider) lazyB3.getValue(), new com.vungle.ads.internal.load.b(j3VarA, this.f47464e, vungleAdSizeB, null));
        } else {
            com.vungle.ads.internal.util.s sVar4 = this.f47472m;
            if (sVar4 != null) {
                sVar4.a((Long) 1L);
            }
            this.f47467h = new com.vungle.ads.internal.load.l(this.f47460a, (VungleApiClient) this.f47466g.getValue(), (com.vungle.ads.internal.executor.d) lazyB2.getValue(), (com.vungle.ads.internal.omsdk.c) lazyB.getValue(), (com.vungle.ads.internal.downloader.n) lazyB4.getValue(), (PathProvider) lazyB3.getValue(), new com.vungle.ads.internal.load.b(j3VarA, null, vungleAdSizeB, null));
        }
        com.vungle.ads.internal.load.i iVar = this.f47467h;
        if (iVar != null) {
            iVar.a(this.f47472m);
        }
        com.vungle.ads.internal.load.i iVar2 = this.f47467h;
        if (iVar2 != null) {
            iVar2.a(this);
        }
    }

    public final void a() {
        com.vungle.ads.internal.model.i0 i0Var = this.f47462c;
        if (i0Var != null && i0Var.B()) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AdInternal", "Skip cancelling download for ads with partial download enabled.");
        } else {
            com.vungle.ads.internal.load.i iVar = this.f47467h;
            if (iVar != null) {
                iVar.a();
            }
        }
    }

    public final boolean a(int i5) {
        return this.f47461b == h.f46845c && i5 == 304;
    }
}
