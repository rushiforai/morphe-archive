package ads_mobile_sdk;

import b.e9;
import b.k9;
import b.t2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.Objects;

/* loaded from: classes.dex */
public final class c60 extends cu0 {
    public static final int A = 25;
    public static final int B = 26;
    public static final int C = 27;
    public static final int D = 29;
    private static final c60 DEFAULT_INSTANCE;
    public static final int E = 30;
    public static final int F = 31;
    public static final int G = 32;
    public static final int H = 33;
    public static final int I = 34;
    public static final int J = 35;
    public static final int K = 36;
    public static final int L = 37;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1668c = 10;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1669d = 11;

    /* renamed from: e, reason: collision with root package name */
    public static final int f1670e = 1;

    /* renamed from: f, reason: collision with root package name */
    public static final int f1671f = 2;

    /* renamed from: g, reason: collision with root package name */
    public static final int f1672g = 3;

    /* renamed from: h, reason: collision with root package name */
    public static final int f1673h = 12;

    /* renamed from: i, reason: collision with root package name */
    public static final int f1674i = 4;

    /* renamed from: j, reason: collision with root package name */
    public static final int f1675j = 16;

    /* renamed from: k, reason: collision with root package name */
    public static final int f1676k = 13;

    /* renamed from: l, reason: collision with root package name */
    public static final int f1677l = 14;

    /* renamed from: m, reason: collision with root package name */
    public static final int f1678m = 5;
    public static final int n = 6;
    public static final int o = 7;

    /* renamed from: p, reason: collision with root package name */
    public static final int f1679p = 8;

    /* renamed from: q, reason: collision with root package name */
    public static final int f1680q = 9;

    /* renamed from: r, reason: collision with root package name */
    public static final int f1681r = 15;

    /* renamed from: s, reason: collision with root package name */
    public static final int f1682s = 17;

    /* renamed from: t, reason: collision with root package name */
    public static final int f1683t = 18;

    /* renamed from: u, reason: collision with root package name */
    public static final int f1684u = 19;

    /* renamed from: v, reason: collision with root package name */
    public static final int f1685v = 20;

    /* renamed from: w, reason: collision with root package name */
    public static final int f1686w = 21;

    /* renamed from: x, reason: collision with root package name */
    public static final int f1687x = 22;

    /* renamed from: y, reason: collision with root package name */
    public static final int f1688y = 23;

    /* renamed from: z, reason: collision with root package name */
    public static final int f1689z = 24;
    private int bitField0_;
    private String clickUrl_;
    private e9 clientAsn_;
    private String clientCountry_;
    private l50 clientProperties_;
    private boolean complete_;
    private v30 creativeProperties_;
    private boolean didProceed_;
    private e9 disallowedPermissions_;
    private e9 dom_;
    private z30 downloadItemInfo_;
    private int downloadVerdict_;
    private e9 downloadWarningActions_;
    private e9 interstitialInteractions_;
    private String locale_;
    private v40 permissionPromptInfo_;
    private e9 phishySiteInteractions_;
    private q30 population_;
    private e9 referrerChain_;
    private e9 rejectedPermissions_;
    private d50 renderedAd_;
    private boolean repeatVisit_;
    private e9 resources_;
    private String safetyNetId_;
    private e9 serviceWorkerBehaviors_;
    private boolean showDownloadInFolder_;
    private sq token_;
    private int type_;
    private t50 urlRealTimeAndHashRealTimeDiscrepancyInfo_;
    private int urlRequestDestination_;
    private String userAgent_;
    private x50 userInfo_;
    private b60 warningShownInfo_;
    private long warningShownTimestampMsec_;
    private byte memoizedIsInitialized = 2;
    private String url_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String pageUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String referrerUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        c60 c60Var = new c60();
        DEFAULT_INSTANCE = c60Var;
        cu0.a(c60.class, c60Var);
    }

    public c60() {
        in2 in2Var = in2.f4887e;
        this.resources_ = in2Var;
        this.dom_ = in2Var;
        this.clickUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.clientAsn_ = in2Var;
        this.clientCountry_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.token_ = sq.f9634b;
        this.userAgent_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.disallowedPermissions_ = in2Var;
        this.rejectedPermissions_ = in2Var;
        this.referrerChain_ = in2Var;
        this.safetyNetId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.downloadWarningActions_ = in2Var;
        this.interstitialInteractions_ = in2Var;
        this.phishySiteInteractions_ = in2Var;
        this.locale_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.serviceWorkerBehaviors_ = in2Var;
    }

    public static b.qa o() {
        return (b.qa) DEFAULT_INSTANCE.e();
    }

    public final void a(j50 j50Var) {
        e9 e9Var = this.resources_;
        if (!((j) e9Var).f5068a) {
            this.resources_ = k9.n(e9Var);
        }
        this.resources_.add(j50Var);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 64;
        this.clickUrl_ = str;
    }

    public final void c(String str) {
        this.bitField0_ |= 8;
        this.pageUrl_ = str;
    }

    public final void d(String str) {
        this.bitField0_ |= 4;
        this.url_ = str;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 0) {
            return Byte.valueOf(this.memoizedIsInitialized);
        }
        if (iA == 1) {
            this.memoizedIsInitialized = (byte) (cu0Var == null ? 0 : 1);
            return null;
        }
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001$\u0000\u0001\u0001%$\u0000\n\u0001\u0001ဈ\u0002\u0002ဈ\u0003\u0003ဈ\u0004\u0004Л\u0005ဇ\b\u0006\u001a\u0007ဈ\t\bဇ\n\tဇ\u000b\n᠌\u0000\u000b᠌\u0001\fဉ\u0005\rဈ\u0006\u000eဉ\u0007\u000fည\f\u0010\u001b\u0011ဉ\r\u0012ဇ\u000e\u0013ဈ\u000f\u0014\u001a\u0015\u001a\u0016ဉ\u0010\u0017\u001b\u0018ဉ\u0011\u0019ဈ\u0012\u001aဉ\u0013\u001b\u001b\u001d᠌\u0014\u001e\u001b\u001f\u001b ဂ\u0015!ဉ\u0016\"ဉ\u0017#ဈ\u0018$ဉ\u0019%\u001b", new Object[]{"bitField0_", "url_", "pageUrl_", "referrerUrl_", "resources_", j50.class, "complete_", "clientAsn_", "clientCountry_", "didProceed_", "repeatVisit_", "type_", b8.a$5, "downloadVerdict_", ad.a$18, "creativeProperties_", "clickUrl_", "renderedAd_", "token_", "dom_", g60.class, "clientProperties_", "showDownloadInFolder_", "userAgent_", "disallowedPermissions_", "rejectedPermissions_", "userInfo_", "referrerChain_", o60.class, "downloadItemInfo_", "safetyNetId_", "population_", "downloadWarningActions_", f40.class, "urlRequestDestination_", b8.a$14, "interstitialInteractions_", t40.class, "phishySiteInteractions_", z40.class, "warningShownTimestampMsec_", "warningShownInfo_", "permissionPromptInfo_", "locale_", "urlRealTimeAndHashRealTimeDiscrepancyInfo_", "serviceWorkerBehaviors_", p50.class});
        }
        if (iA == 3) {
            return new c60();
        }
        if (iA != 4) {
            return null;
        }
        return new b.qa();
    }

    public final void a(v30 v30Var) {
        this.creativeProperties_ = v30Var;
        this.bitField0_ |= 32;
    }

    public final void a(l50 l50Var) {
        this.clientProperties_ = l50Var;
        this.bitField0_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
    }
}
