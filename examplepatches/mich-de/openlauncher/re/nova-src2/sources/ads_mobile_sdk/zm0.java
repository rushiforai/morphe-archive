package ads_mobile_sdk;

import android.net.Uri;
import android.os.Bundle;
import kotlin.ResultKt;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public final class zm0 {

    /* renamed from: a, reason: collision with root package name */
    public final um0 f12583a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f12584b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f12585c;

    public zm0(um0 firebaseAnalyticsAdapter, t70.j0 backgroundScope, jr0 flags) {
        Intrinsics.g(firebaseAnalyticsAdapter, "firebaseAnalyticsAdapter");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        this.f12583a = firebaseAnalyticsAdapter;
        this.f12584b = backgroundScope;
        this.f12585c = flags;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Uri.Builder builder, ContinuationImpl continuationImpl) {
        wm0 wm0Var;
        Uri.Builder builder2;
        Uri.Builder builder3;
        Uri uri;
        zm0 zm0Var;
        if (continuationImpl instanceof wm0) {
            wm0Var = (wm0) continuationImpl;
            int i5 = wm0Var.f11333g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wm0Var.f11333g = i5 - Integer.MIN_VALUE;
            } else {
                wm0Var = new wm0(this, continuationImpl);
            }
        }
        Object obj = wm0Var.f11331e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wm0Var.f11333g;
        if (i11 == 0) {
            ResultKt.b(obj);
            Uri uriBuild = builder.build();
            wm0Var.f11327a = this;
            wm0Var.f11328b = builder;
            wm0Var.f11329c = builder;
            wm0Var.f11330d = uriBuild;
            wm0Var.f11333g = 1;
            um0 um0Var = this.f12583a;
            um0Var.getClass();
            Object objA = um0.a(um0Var, wm0Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            builder2 = builder;
            builder3 = builder2;
            uri = uriBuild;
            obj = objA;
            zm0Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            uri = wm0Var.f11330d;
            builder2 = wm0Var.f11329c;
            builder3 = wm0Var.f11328b;
            zm0Var = wm0Var.f11327a;
            ResultKt.b(obj);
        }
        String str = (String) obj;
        if (str != null && uri.getQueryParameter("gmp_app_id") == null) {
            builder2.appendQueryParameter("gmp_app_id", str);
        }
        Object objA2 = zm0Var.f12583a.a("getAppInstanceId");
        String string = objA2 != null ? objA2.toString() : null;
        if (string != null && uri.getQueryParameter("fbs_aiid") == null) {
            builder2.appendQueryParameter("fbs_aiid", string);
        }
        return builder3;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Comparable a(Uri uri, rm0 rm0Var, Bundle bundle, ContinuationImpl continuationImpl) {
        ym0 ym0Var;
        Uri.Builder builderBuildUpon;
        zm0 zm0Var;
        rm0 rm0Var2;
        Bundle bundle2;
        if (continuationImpl instanceof ym0) {
            ym0Var = (ym0) continuationImpl;
            int i5 = ym0Var.f12197g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ym0Var.f12197g = i5 - Integer.MIN_VALUE;
            } else {
                ym0Var = new ym0(this, continuationImpl);
            }
        }
        Object obj = ym0Var.f12195e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ym0Var.f12197g;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = this.f12585c;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:firebase_analytics_integration:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                return uri;
            }
            builderBuildUpon = uri.buildUpon();
            Intrinsics.d(builderBuildUpon);
            String string = builderBuildUpon.build().toString();
            Intrinsics.f(string, "toString(...)");
            if (r70.k.K0(string, jr0Var.R(), false)) {
                ym0Var.f12191a = this;
                ym0Var.f12192b = rm0Var;
                ym0Var.f12193c = bundle;
                ym0Var.f12194d = builderBuildUpon;
                ym0Var.f12197g = 1;
                if (a(builderBuildUpon, ym0Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                zm0Var = this;
                rm0Var2 = rm0Var;
                bundle2 = bundle;
            } else {
                Uri uriBuild = builderBuildUpon.build();
                Intrinsics.f(uriBuild, "build(...)");
                return uriBuild;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            builderBuildUpon = ym0Var.f12194d;
            Bundle bundle3 = ym0Var.f12193c;
            rm0 rm0Var3 = ym0Var.f12192b;
            zm0 zm0Var2 = ym0Var.f12191a;
            ResultKt.b(obj);
            zm0Var = zm0Var2;
            bundle2 = bundle3;
            rm0Var2 = rm0Var3;
        }
        Intrinsics.d(builderBuildUpon);
        Object objA = zm0Var.f12583a.a("generateEventId");
        String string2 = objA != null ? objA.toString() : null;
        if (string2 != null) {
            t70.j0 j0Var = zm0Var.f12584b;
            b00.q qVar = new b00.q(zm0Var, rm0Var2, bundle2, string2, null, 7);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
            String string3 = builderBuildUpon.build().toString();
            Intrinsics.f(string3, "toString(...)");
            Uri uri2 = Uri.parse(r70.j.F0(string3, zm0Var.f12585c.R(), string2, false));
            Intrinsics.f(uri2, "parse(...)");
            return uri2;
        }
        Uri uriBuild2 = builderBuildUpon.build();
        Intrinsics.f(uriBuild2, "build(...)");
        return uriBuild2;
    }
}
