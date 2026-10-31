package com.vungle.ads.internal.ui;

import android.content.Intent;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k implements com.vungle.ads.internal.presenter.y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f47571a;

    public k(l lVar) {
        this.f47571a = lVar;
    }

    public final Pair a(Intent intent) {
        Object objA;
        Intrinsics.g(intent, "intent");
        l lVar = this.f47571a;
        try {
            int i5 = Result.f71687b;
            lVar.f47580g.set(true);
            lVar.startActivityForResult(intent, Sdk.SDKError.Reason.AD_NO_FILL_VALUE);
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        l lVar2 = this.f47571a;
        Throwable thA = Result.a(objA);
        if (thA == null) {
            return new Pair(Boolean.TRUE, null);
        }
        lVar2.f47580g.set(false);
        return new Pair(Boolean.FALSE, thA.getLocalizedMessage());
    }
}
