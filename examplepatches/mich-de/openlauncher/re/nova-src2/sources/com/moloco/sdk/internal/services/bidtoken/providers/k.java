package com.moloco.sdk.internal.services.bidtoken.providers;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.moloco.sdk.internal.services.AbstractC2955c;
import com.moloco.sdk.publisher.privacy.MolocoPrivacy;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: m, reason: collision with root package name */
    public static final int f37784m = 8;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f37785a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final MolocoPrivacy.PrivacySettings f37786b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final r f37787c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final d f37788d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final t f37789e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final h f37790f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final AbstractC2955c f37791g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final n f37792h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final f f37793i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final a f37794j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final p f37795k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final x f37796l;

    public k(boolean z11, @NotNull MolocoPrivacy.PrivacySettings privacySettings, @NotNull r memoryInfo, @NotNull d appDirInfo, @NotNull t networkInfoSignal, @NotNull h batteryInfoSignal, @NotNull AbstractC2955c adDataSignal, @NotNull n deviceSignal, @NotNull f audioSignal, @NotNull a accessibilitySignal, @NotNull p ilrdSignal, @NotNull x testConfigSignal) {
        Intrinsics.g(privacySettings, "privacySettings");
        Intrinsics.g(memoryInfo, "memoryInfo");
        Intrinsics.g(appDirInfo, "appDirInfo");
        Intrinsics.g(networkInfoSignal, "networkInfoSignal");
        Intrinsics.g(batteryInfoSignal, "batteryInfoSignal");
        Intrinsics.g(adDataSignal, "adDataSignal");
        Intrinsics.g(deviceSignal, "deviceSignal");
        Intrinsics.g(audioSignal, "audioSignal");
        Intrinsics.g(accessibilitySignal, "accessibilitySignal");
        Intrinsics.g(ilrdSignal, "ilrdSignal");
        Intrinsics.g(testConfigSignal, "testConfigSignal");
        this.f37785a = z11;
        this.f37786b = privacySettings;
        this.f37787c = memoryInfo;
        this.f37788d = appDirInfo;
        this.f37789e = networkInfoSignal;
        this.f37790f = batteryInfoSignal;
        this.f37791g = adDataSignal;
        this.f37792h = deviceSignal;
        this.f37793i = audioSignal;
        this.f37794j = accessibilitySignal;
        this.f37795k = ilrdSignal;
        this.f37796l = testConfigSignal;
    }

    public final boolean a() {
        return this.f37785a;
    }

    @NotNull
    public final a b() {
        return this.f37794j;
    }

    @NotNull
    public final p c() {
        return this.f37795k;
    }

    @NotNull
    public final x d() {
        return this.f37796l;
    }

    @NotNull
    public final MolocoPrivacy.PrivacySettings e() {
        return this.f37786b;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return this.f37785a == kVar.f37785a && Intrinsics.b(this.f37786b, kVar.f37786b) && Intrinsics.b(this.f37787c, kVar.f37787c) && Intrinsics.b(this.f37788d, kVar.f37788d) && Intrinsics.b(this.f37789e, kVar.f37789e) && Intrinsics.b(this.f37790f, kVar.f37790f) && Intrinsics.b(this.f37791g, kVar.f37791g) && Intrinsics.b(this.f37792h, kVar.f37792h) && Intrinsics.b(this.f37793i, kVar.f37793i) && Intrinsics.b(this.f37794j, kVar.f37794j) && Intrinsics.b(this.f37795k, kVar.f37795k) && Intrinsics.b(this.f37796l, kVar.f37796l);
    }

    @NotNull
    public final r f() {
        return this.f37787c;
    }

    @NotNull
    public final d g() {
        return this.f37788d;
    }

    @NotNull
    public final t h() {
        return this.f37789e;
    }

    public int hashCode() {
        return this.f37796l.hashCode() + ((this.f37795k.hashCode() + ((this.f37794j.hashCode() + ((this.f37793i.hashCode() + ((this.f37792h.hashCode() + ((this.f37791g.hashCode() + ((this.f37790f.hashCode() + ((this.f37789e.hashCode() + ((this.f37788d.hashCode() + ((this.f37787c.hashCode() + ((this.f37786b.hashCode() + (Boolean.hashCode(this.f37785a) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    @NotNull
    public final h i() {
        return this.f37790f;
    }

    @NotNull
    public final AbstractC2955c j() {
        return this.f37791g;
    }

    @NotNull
    public final n k() {
        return this.f37792h;
    }

    @NotNull
    public final f l() {
        return this.f37793i;
    }

    @NotNull
    public final a m() {
        return this.f37794j;
    }

    @NotNull
    public final AbstractC2955c n() {
        return this.f37791g;
    }

    @NotNull
    public final d o() {
        return this.f37788d;
    }

    @NotNull
    public final f p() {
        return this.f37793i;
    }

    @NotNull
    public final h q() {
        return this.f37790f;
    }

    @NotNull
    public final n r() {
        return this.f37792h;
    }

    @NotNull
    public final p s() {
        return this.f37795k;
    }

    @NotNull
    public final r t() {
        return this.f37787c;
    }

    @NotNull
    public String toString() {
        return "ClientSignals(sdkInitialized=" + this.f37785a + ", privacySettings=" + this.f37786b + ", memoryInfo=" + this.f37787c + ", appDirInfo=" + this.f37788d + ", networkInfoSignal=" + this.f37789e + ", batteryInfoSignal=" + this.f37790f + ", adDataSignal=" + this.f37791g + ", deviceSignal=" + this.f37792h + ", audioSignal=" + this.f37793i + ", accessibilitySignal=" + this.f37794j + ", ilrdSignal=" + this.f37795k + ", testConfigSignal=" + this.f37796l + ')';
    }

    @NotNull
    public final t u() {
        return this.f37789e;
    }

    @NotNull
    public final MolocoPrivacy.PrivacySettings v() {
        return this.f37786b;
    }

    public final boolean w() {
        return this.f37785a;
    }

    @NotNull
    public final x x() {
        return this.f37796l;
    }

    @NotNull
    public final k a(boolean z11, @NotNull MolocoPrivacy.PrivacySettings privacySettings, @NotNull r memoryInfo, @NotNull d appDirInfo, @NotNull t networkInfoSignal, @NotNull h batteryInfoSignal, @NotNull AbstractC2955c adDataSignal, @NotNull n deviceSignal, @NotNull f audioSignal, @NotNull a accessibilitySignal, @NotNull p ilrdSignal, @NotNull x testConfigSignal) {
        Intrinsics.g(privacySettings, "privacySettings");
        Intrinsics.g(memoryInfo, "memoryInfo");
        Intrinsics.g(appDirInfo, "appDirInfo");
        Intrinsics.g(networkInfoSignal, "networkInfoSignal");
        Intrinsics.g(batteryInfoSignal, "batteryInfoSignal");
        Intrinsics.g(adDataSignal, "adDataSignal");
        Intrinsics.g(deviceSignal, "deviceSignal");
        Intrinsics.g(audioSignal, "audioSignal");
        Intrinsics.g(accessibilitySignal, "accessibilitySignal");
        Intrinsics.g(ilrdSignal, "ilrdSignal");
        Intrinsics.g(testConfigSignal, "testConfigSignal");
        return new k(z11, privacySettings, memoryInfo, appDirInfo, networkInfoSignal, batteryInfoSignal, adDataSignal, deviceSignal, audioSignal, accessibilitySignal, ilrdSignal, testConfigSignal);
    }

    public static /* synthetic */ k a(k kVar, boolean z11, MolocoPrivacy.PrivacySettings privacySettings, r rVar, d dVar, t tVar, h hVar, AbstractC2955c abstractC2955c, n nVar, f fVar, a aVar, p pVar, x xVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = kVar.f37785a;
        }
        if ((i5 & 2) != 0) {
            privacySettings = kVar.f37786b;
        }
        if ((i5 & 4) != 0) {
            rVar = kVar.f37787c;
        }
        if ((i5 & 8) != 0) {
            dVar = kVar.f37788d;
        }
        if ((i5 & 16) != 0) {
            tVar = kVar.f37789e;
        }
        if ((i5 & 32) != 0) {
            hVar = kVar.f37790f;
        }
        if ((i5 & 64) != 0) {
            abstractC2955c = kVar.f37791g;
        }
        if ((i5 & 128) != 0) {
            nVar = kVar.f37792h;
        }
        if ((i5 & 256) != 0) {
            fVar = kVar.f37793i;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            aVar = kVar.f37794j;
        }
        if ((i5 & 1024) != 0) {
            pVar = kVar.f37795k;
        }
        if ((i5 & 2048) != 0) {
            xVar = kVar.f37796l;
        }
        p pVar2 = pVar;
        x xVar2 = xVar;
        f fVar2 = fVar;
        a aVar2 = aVar;
        AbstractC2955c abstractC2955c2 = abstractC2955c;
        n nVar2 = nVar;
        t tVar2 = tVar;
        h hVar2 = hVar;
        return kVar.a(z11, privacySettings, rVar, dVar, tVar2, hVar2, abstractC2955c2, nVar2, fVar2, aVar2, pVar2, xVar2);
    }
}
