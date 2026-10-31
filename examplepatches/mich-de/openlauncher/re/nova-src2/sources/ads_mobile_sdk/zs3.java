package ads_mobile_sdk;

import android.net.Uri;
import android.webkit.WebResourceRequest;
import b.d0;
import b.e6;
import java.net.URL;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class zs3 {

    /* renamed from: a, reason: collision with root package name */
    public final um0 f12645a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f12646b;

    /* renamed from: c, reason: collision with root package name */
    public final rw0 f12647c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f12648d;

    /* renamed from: e, reason: collision with root package name */
    public final z1 f12649e;

    /* renamed from: f, reason: collision with root package name */
    public final e6 f12650f;

    public zs3(um0 firebaseAnalyticsAdapter, t70.j0 backgroundScope, rw0 gmaUtil, jr0 flags, z1 adConfiguration, e6 httpClient) {
        Intrinsics.g(firebaseAnalyticsAdapter, "firebaseAnalyticsAdapter");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(httpClient, "httpClient");
        this.f12645a = firebaseAnalyticsAdapter;
        this.f12646b = backgroundScope;
        this.f12647c = gmaUtil;
        this.f12648d = flags;
        this.f12649e = adConfiguration;
        this.f12650f = httpClient;
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x00f2, code lost:
    
        if (r13 == r1) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(WebResourceRequest webResourceRequest, ContinuationImpl continuationImpl) {
        xs3 xs3Var;
        rm0 rm0Var;
        rm0 rm0Var2;
        Uri uri;
        String str;
        zs3 zs3Var;
        String str2;
        if (continuationImpl instanceof xs3) {
            xs3Var = (xs3) continuationImpl;
            int i5 = xs3Var.f11820g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xs3Var.f11820g = i5 - Integer.MIN_VALUE;
            } else {
                xs3Var = new xs3(this, continuationImpl);
            }
        }
        Object objA = xs3Var.f11818e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xs3Var.f11820g;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objA);
            Uri url = webResourceRequest.getUrl();
            String string = url.toString();
            Intrinsics.f(string, "toString(...)");
            if (r70.k.K0(string, this.f12648d.R(), false)) {
                um0 um0Var = this.f12645a;
                Object objA2 = um0Var.a("generateEventId");
                String string2 = objA2 != null ? objA2.toString() : null;
                if (string2 != null) {
                    rw0 rw0Var = this.f12647c;
                    if (rw0Var.a(url)) {
                        rm0Var2 = rm0.f9230b;
                    } else if (rw0Var.c(url)) {
                        rm0Var2 = rm0.f9231c;
                    } else {
                        rm0Var = null;
                        if (rm0Var != null) {
                            androidx.room.q qVar = new androidx.room.q(this, rm0Var, string2, continuation, 19);
                            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                            t70.j0 j0Var = this.f12646b;
                            Intrinsics.g(j0Var, "<this>");
                            Intrinsics.g(context, "context");
                            m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
                            Object objA3 = um0Var.a("getAppInstanceId");
                            String string3 = objA3 != null ? objA3.toString() : null;
                            xs3Var.f11814a = this;
                            xs3Var.f11815b = url;
                            xs3Var.f11816c = string2;
                            xs3Var.f11817d = string3;
                            xs3Var.f11820g = 1;
                            Object objA4 = um0.a(um0Var, xs3Var);
                            if (objA4 != coroutineSingletons) {
                                uri = url;
                                str = string3;
                                objA = objA4;
                                zs3Var = this;
                                str2 = string2;
                            }
                            return coroutineSingletons;
                        }
                    }
                    rm0Var = rm0Var2;
                    if (rm0Var != null) {
                    }
                }
            }
            return null;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            b.a1 a1Var = (b.a1) objA;
            if (a1Var instanceof xu0) {
                return d0.h((a21) ((xu0) a1Var).f11834b);
            }
            return null;
        }
        str = xs3Var.f11817d;
        str2 = xs3Var.f11816c;
        uri = xs3Var.f11815b;
        zs3Var = xs3Var.f11814a;
        ResultKt.b(objA);
        e6 e6Var = zs3Var.f12650f;
        URL url2 = new URL(uri.toString());
        bn0 bn0Var = new bn0((String) objA, str, str2);
        xs3Var.f11814a = null;
        xs3Var.f11815b = null;
        xs3Var.f11816c = null;
        xs3Var.f11817d = null;
        xs3Var.f11820g = 2;
        objA = e6Var.a(url2, bn0Var, xs3Var);
    }
}
