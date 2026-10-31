package io.branch.search.internal;

import io.branch.search.internal.W7;
import io.branch.search.internal.util.CorosKt;
import java.util.Iterator;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'j' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* renamed from: io.branch.search.internal.b4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class EnumC3075b4 {
    public static final EnumC3075b4 A;
    public static final EnumC3075b4 B;
    public static final EnumC3075b4 C;

    @NotNull
    public static final a Companion;
    public static final /* synthetic */ EnumC3075b4[] D;

    /* renamed from: i, reason: collision with root package name */
    public static final long f63991i;

    /* renamed from: j, reason: collision with root package name */
    public static final EnumC3075b4 f63992j;

    /* renamed from: k, reason: collision with root package name */
    public static final EnumC3075b4 f63993k;

    /* renamed from: l, reason: collision with root package name */
    public static final EnumC3075b4 f63994l;

    /* renamed from: m, reason: collision with root package name */
    public static final EnumC3075b4 f63995m;
    public static final EnumC3075b4 n;
    public static final EnumC3075b4 o;

    /* renamed from: p, reason: collision with root package name */
    public static final EnumC3075b4 f63996p;

    /* renamed from: q, reason: collision with root package name */
    public static final EnumC3075b4 f63997q;

    /* renamed from: r, reason: collision with root package name */
    public static final EnumC3075b4 f63998r;

    /* renamed from: s, reason: collision with root package name */
    public static final EnumC3075b4 f63999s;

    /* renamed from: t, reason: collision with root package name */
    public static final EnumC3075b4 f64000t;

    /* renamed from: u, reason: collision with root package name */
    public static final EnumC3075b4 f64001u;

    /* renamed from: v, reason: collision with root package name */
    public static final EnumC3075b4 f64002v;

    /* renamed from: w, reason: collision with root package name */
    public static final EnumC3075b4 f64003w;

    /* renamed from: x, reason: collision with root package name */
    public static final EnumC3075b4 f64004x;

    /* renamed from: y, reason: collision with root package name */
    public static final EnumC3075b4 f64005y;

    /* renamed from: z, reason: collision with root package name */
    public static final EnumC3075b4 f64006z;

    /* renamed from: a, reason: collision with root package name */
    public final long f64007a;

    /* renamed from: b, reason: collision with root package name */
    public final int f64008b;

    /* renamed from: c, reason: collision with root package name */
    public final int f64009c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f64010d;

    /* renamed from: e, reason: collision with root package name */
    @JvmField
    public final boolean f64011e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f64012f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final W7 f64013g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public x80.e0 f64014h;

    /* renamed from: io.branch.search.internal.b4$a */
    public static final class a {
    }

    static {
        W7.Companion.getClass();
        W7.a.C0329a c0329a = W7.a.f63574b;
        EnumC3075b4 enumC3075b4 = new EnumC3075b4("APP_STORE_SEARCH", 0, 0L, 0, 0, true, true, false, c0329a);
        f63992j = enumC3075b4;
        EnumC3075b4 enumC3075b42 = new EnumC3075b4("AUTOSUGGEST", 1, 3000L, 3, 100, true, true, false, c0329a);
        W7.a.d dVar = W7.a.f63577e;
        EnumC3075b4 enumC3075b43 = new EnumC3075b4("BRANCH_CLICK_TRACKING", 2, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, 15, 100, false, true, false, dVar);
        f63993k = enumC3075b43;
        EnumC3075b4 enumC3075b44 = new EnumC3075b4("ANALYTICS", 3, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, 3, 60000, true, false, false, c0329a);
        f63994l = enumC3075b44;
        EnumC3075b4 enumC3075b45 = new EnumC3075b4("BRANCH_IMPRESSION_TRACKING", 4, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, 15, 100, false, true, false, dVar);
        f63995m = enumC3075b45;
        EnumC3075b4 enumC3075b46 = new EnumC3075b4("LOCAL_CONTENT", 5, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, 0, 500, true, false, false, W7.a.f63575c);
        n = enumC3075b46;
        EnumC3075b4 enumC3075b47 = new EnumC3075b4("PING_SERVICE", 6, 5000L, 3, 500, false, false, false, W7.a.f63576d);
        o = enumC3075b47;
        EnumC3075b4 enumC3075b48 = new EnumC3075b4("EXTERNAL", 7, 5000L, 0, 0, false, true, false, dVar);
        f63996p = enumC3075b48;
        W7.a.e eVar = W7.a.f63578f;
        EnumC3075b4 enumC3075b49 = new EnumC3075b4("REMOTE_SEARCH_IMAGE", 8, 2000L, 0, 0, false, false, true, eVar);
        f63997q = enumC3075b49;
        EnumC3075b4 enumC3075b410 = new EnumC3075b4("LOCAL_SEARCH_AD_IMAGE", 9, 2000L, 0, 0, false, false, true, eVar);
        f63998r = enumC3075b410;
        EnumC3075b4 enumC3075b411 = new EnumC3075b4("APP_STORE_SEARCH_IMAGE", 10, 2000L, 0, 0, false, false, true, eVar);
        f63999s = enumC3075b411;
        EnumC3075b4 enumC3075b412 = new EnumC3075b4("GROUP_IMAGE", 11, 2000L, 0, 0, false, false, true, eVar);
        f64000t = enumC3075b412;
        EnumC3075b4 enumC3075b413 = new EnumC3075b4("RICH_CONTENT_IMAGE", 12, 2000L, 0, 0, false, false, true, eVar);
        f64001u = enumC3075b413;
        EnumC3075b4 enumC3075b414 = new EnumC3075b4("LOCAL_SEARCH_LINK_IMAGE", 13, 2000L, 0, 0, false, false, true, eVar);
        f64002v = enumC3075b414;
        EnumC3075b4 enumC3075b415 = new EnumC3075b4("LOCAL_ZERO_STATE_AD_IMAGE", 14, 2000L, 0, 0, false, false, true, eVar);
        f64003w = enumC3075b415;
        EnumC3075b4 enumC3075b416 = new EnumC3075b4("LOCAL_ZERO_STATE_LINK_IMAGE", 15, 2000L, 0, 0, false, false, true, eVar);
        f64004x = enumC3075b416;
        EnumC3075b4 enumC3075b417 = new EnumC3075b4("LOCAL_SEARCH_AD_IMAGE_PRELOAD", 16, 2000L, 0, 0, false, false, true, eVar);
        f64005y = enumC3075b417;
        EnumC3075b4 enumC3075b418 = new EnumC3075b4("LOCAL_SEARCH_LINK_IMAGE_PRELOAD", 17, 2000L, 0, 0, false, false, true, eVar);
        f64006z = enumC3075b418;
        EnumC3075b4 enumC3075b419 = new EnumC3075b4("LOCAL_ZERO_STATE_AD_IMAGE_PRELOAD", 18, 2000L, 0, 0, false, false, true, eVar);
        A = enumC3075b419;
        EnumC3075b4 enumC3075b420 = new EnumC3075b4("LOCAL_ZERO_STATE_LINK_IMAGE_PRELOAD", 19, 2000L, 0, 0, false, false, true, eVar);
        B = enumC3075b420;
        EnumC3075b4 enumC3075b421 = new EnumC3075b4("NOT_A_CHANNEL", 20, 0L, 0, 0, false, false, false, W7.a.f63579g);
        C = enumC3075b421;
        D = new EnumC3075b4[]{enumC3075b4, enumC3075b42, enumC3075b43, enumC3075b44, enumC3075b45, enumC3075b46, enumC3075b47, enumC3075b48, enumC3075b49, enumC3075b410, enumC3075b411, enumC3075b412, enumC3075b413, enumC3075b414, enumC3075b415, enumC3075b416, enumC3075b417, enumC3075b418, enumC3075b419, enumC3075b420, enumC3075b421};
        Companion = new a();
        f63991i = ThreadLocalRandom.current().nextLong(0L, 14400000L);
    }

    public EnumC3075b4(String str, int i5, long j11, int i11, int i12, boolean z11, boolean z12, boolean z13, W7 w72) {
        this.f64007a = j11;
        this.f64008b = i11;
        this.f64009c = i12;
        this.f64010d = z11;
        this.f64011e = z12;
        this.f64012f = z13;
        this.f64013g = w72;
    }

    public static EnumC3075b4 valueOf(String str) {
        return (EnumC3075b4) Enum.valueOf(EnumC3075b4.class, str);
    }

    public static EnumC3075b4[] values() {
        return (EnumC3075b4[]) D.clone();
    }

    @NotNull
    public final x80.e0 a(@NotNull Ye transferDataSource, @NotNull A9 networkRepository, @NotNull F2 remoteConfigManager, @NotNull H analyticalBufferRepository, @NotNull y40.y maxDailyBandwidthCap) {
        Intrinsics.g(transferDataSource, "transferDataSource");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(maxDailyBandwidthCap, "maxDailyBandwidthCap");
        x80.e0 e0Var = this.f64014h;
        if (e0Var != null) {
            return e0Var;
        }
        x80.d0 d0VarA = ((x80.e0) CorosKt.f66062c.getValue()).a();
        d0VarA.f95437f = this.f64012f;
        Iterator<T> it = this.f64013g.a(transferDataSource, networkRepository, remoteConfigManager, analyticalBufferRepository, this, maxDailyBandwidthCap).iterator();
        while (it.hasNext()) {
            d0VarA.a((x80.y) it.next());
        }
        long j11 = this.f64007a;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        d0VarA.b(j11);
        x80.e0 e0Var2 = new x80.e0(d0VarA);
        this.f64014h = e0Var2;
        return e0Var2;
    }

    public final boolean a() {
        return this == f63993k || this == f63995m;
    }
}
