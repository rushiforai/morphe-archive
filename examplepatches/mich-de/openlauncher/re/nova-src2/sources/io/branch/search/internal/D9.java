package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class D9 implements x80.y {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Ye f62345a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final A9 f62346b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final EnumC3075b4 f62347c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final y40.y f62348d;

    public D9(@NotNull Ye transferDataSource, @NotNull A9 networkRepository, @NotNull EnumC3075b4 channel, @NotNull y40.y maxDailyBandwidthCap) {
        Intrinsics.g(transferDataSource, "transferDataSource");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(channel, "channel");
        Intrinsics.g(maxDailyBandwidthCap, "maxDailyBandwidthCap");
        this.f62345a = transferDataSource;
        this.f62346b = networkRepository;
        this.f62347c = channel;
        this.f62348d = maxDailyBandwidthCap;
    }

    @Override // x80.y
    @NotNull
    public final x80.m0 intercept(@NotNull x80.x chain) throws C3486z9 {
        Intrinsics.g(chain, "chain");
        c90.f fVar = (c90.f) chain;
        x80.h0 h0Var = fVar.f19892e;
        String strC = this.f62346b.c();
        boolean zK0 = r70.k.K0(strC, "Cellular", true);
        boolean zK02 = r70.k.K0(strC, "wifi", true);
        EnumC3075b4 enumC3075b4 = this.f62347c;
        if (!enumC3075b4.f64011e && zK0) {
            y40.y yVar = this.f62348d;
            String channel = enumC3075b4.toString();
            yVar.getClass();
            Intrinsics.g(channel, "channel");
        }
        EnumC3075b4 enumC3075b42 = this.f62347c;
        if (!enumC3075b42.f64011e && zK02) {
            y40.y yVar2 = this.f62348d;
            String channel2 = enumC3075b42.toString();
            yVar2.getClass();
            Intrinsics.g(channel2, "channel");
        }
        if (this.f62345a.a(this.f62347c.toString(), strC)) {
            throw new C3486z9("Cannot make network request, per-channel bandwidth usage limit has been reached");
        }
        return fVar.b(h0Var);
    }
}
