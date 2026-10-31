package io.branch.search.internal;

import com.amplitude.eventbridge.EventBridgeChannel;
import io.branch.search.internal.C3386tb;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class N8 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62975a;

    /* renamed from: b, reason: collision with root package name */
    public final long f62976b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f62977c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f62978d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f62979e;

    /* renamed from: f, reason: collision with root package name */
    public final long f62980f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public Long f62981g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public Long f62982h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public Long f62983i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final Function0<Long> f62984j;

    public /* synthetic */ N8(String str, long j11, String str2, String str3, boolean z11, long j12, Long l9, Long l11, Long l12, C3386tb.h hVar, int i5) {
        this(str, j11, str2, str3, z11, j12, (i5 & 64) != 0 ? null : l9, (i5 & 128) != 0 ? null : l11, (i5 & 256) != 0 ? null : l12, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : hVar);
    }

    public final long a() {
        if (this.f62982h == null) {
            a(System.currentTimeMillis() / 1000);
        }
        Long l9 = this.f62982h;
        if (l9 != null) {
            return l9.longValue();
        }
        return 0L;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LocalPackage{name='");
        sb2.append(this.f62975a);
        sb2.append("', userId=");
        sb2.append(this.f62976b);
        sb2.append(", label='");
        sb2.append(this.f62977c);
        sb2.append("', relabeledName='");
        sb2.append(this.f62978d);
        sb2.append("', isInstalled=");
        sb2.append(this.f62979e);
        sb2.append(", firstInstalledDateSeconds=");
        sb2.append(this.f62981g);
        sb2.append(", latestInstalledDateSeconds=");
        sb2.append(this.f62982h);
        sb2.append(", latestUninstalledDateSeconds=");
        sb2.append(this.f62983i);
        sb2.append(", uninstallCount=");
        return C3380t5.a(sb2, this.f62980f, AbstractJsonLexerKt.END_OBJ);
    }

    public N8(@NotNull String name, long j11, @NotNull String label, @Nullable String str, boolean z11, long j12, @Nullable Long l9, @Nullable Long l11, @Nullable Long l12, @Nullable Function0<Long> function0) {
        Intrinsics.g(name, "name");
        Intrinsics.g(label, "label");
        this.f62975a = name;
        this.f62976b = j11;
        this.f62977c = label;
        this.f62978d = str;
        this.f62979e = z11;
        this.f62980f = j12;
        this.f62981g = l9;
        this.f62982h = l11;
        this.f62983i = l12;
        this.f62984j = function0;
    }

    public final void a(long j11) {
        Function0<Long> function0 = this.f62984j;
        if (function0 == null) {
            C3309p1.d(EnumC3131e9.PackageSync, "LocalPackageWrapper but retrieveFirstInstallTime lambda is not set, this is wrong!");
            return;
        }
        long jDoubleValue = (long) ((((Number) function0.invoke()).doubleValue() * 0.001d) + 0.5d);
        this.f62981g = Long.valueOf(jDoubleValue);
        long jValueOf = j11 - jDoubleValue < 300 ? Long.valueOf(jDoubleValue) : Long.valueOf(j11);
        this.f62982h = jValueOf;
        if (this.f62979e) {
            jValueOf = 0L;
        }
        this.f62983i = jValueOf;
    }
}
