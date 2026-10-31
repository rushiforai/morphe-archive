package com.vungle.ads.internal.presenter;

import com.vungle.ads.VungleError;
import com.vungle.ads.internal.model.j3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final b f47352a;

    /* renamed from: b, reason: collision with root package name */
    public j3 f47353b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f47354c;

    public a(b bVar, j3 j3Var) {
        this.f47352a = bVar;
        this.f47353b = j3Var;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public final void a(String s11, String str, String str2) {
        j3 j3Var;
        b bVar;
        b bVar2;
        b bVar3;
        b bVar4;
        Intrinsics.g(s11, "s");
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        StringBuilder sbW = b.c0.w("s=", s11, ", value=", str, ", id=");
        sbW.append(str2);
        com.vungle.ads.internal.util.t.a("AdEventListener", sbW.toString());
        switch (s11.hashCode()) {
            case -1912374177:
                if (s11.equals("successfulView") && (j3Var = this.f47353b) != null && j3Var.j() && !this.f47354c) {
                    this.f47354c = true;
                    b bVar5 = this.f47352a;
                    if (bVar5 != null) {
                        bVar5.onAdRewarded(str2);
                        break;
                    }
                }
                break;
            case -1627831289:
                if (s11.equals("adViewed") && (bVar = this.f47352a) != null) {
                    bVar.onAdImpression(str2);
                    break;
                }
                break;
            case 100571:
                if (s11.equals("end") && (bVar2 = this.f47352a) != null) {
                    bVar2.onAdEnd(str2);
                    break;
                }
                break;
            case 3417674:
                if (s11.equals("open")) {
                    if (!Intrinsics.b(str, "adClick")) {
                        if (Intrinsics.b(str, "adLeftApplication") && (bVar3 = this.f47352a) != null) {
                            bVar3.onAdLeftApplication(str2);
                            break;
                        }
                    } else {
                        b bVar6 = this.f47352a;
                        if (bVar6 != null) {
                            bVar6.onAdClick(str2);
                            break;
                        }
                    }
                }
                break;
            case 109757538:
                if (s11.equals("start") && (bVar4 = this.f47352a) != null) {
                    bVar4.onAdStart(str2);
                    break;
                }
                break;
        }
    }

    public final void a(VungleError error, String str) {
        Intrinsics.g(error, "error");
        b bVar = this.f47352a;
        if (bVar != null) {
            bVar.onFailure(error);
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AdEventListener", "AdEventListener#PlayAdCallback " + str, error);
        }
    }
}
