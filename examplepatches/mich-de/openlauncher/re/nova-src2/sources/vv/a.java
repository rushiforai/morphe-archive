package vv;

import android.content.Context;
import c00.d;
import com.google.android.gms.internal.consent_sdk.z;
import com.google.android.gms.internal.measurement.ag;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import m.w;
import mx.e0;
import t70.k0;
import t70.m0;
import tv.c;
import uv.g;
import wv.k;
import wv.l;
import yv.b;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final l f93262a;

    /* renamed from: b, reason: collision with root package name */
    public final c f93263b;

    /* renamed from: c, reason: collision with root package name */
    public final w f93264c;

    public a(Context context, boolean z11, CoroutineContext coroutineContext) {
        Object objA;
        b bVar = b.f97656a;
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        c cVar = new c(applicationContext, null, null, z11 ? k.f94732c : k.f94731b, 246);
        g gVar = new g(cVar);
        rv.b bVar2 = new rv.b();
        l lVar = new l();
        boolean z12 = false;
        try {
            int i5 = Result.f71687b;
            objA = Integer.valueOf(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        int iIntValue = ((Number) (objA instanceof Result.Failure ? -1 : objA)).intValue();
        d dVar = new d(context, iIntValue, coroutineContext);
        ag agVar = new ag();
        agVar.f32386b = dVar;
        agVar.f32385a = iIntValue;
        m0.t(k0.a(coroutineContext), null, null, new e0(agVar, (Continuation) null, 19), 3);
        Context applicationContext2 = context.getApplicationContext();
        Intrinsics.f(applicationContext2, "getApplicationContext(...)");
        rv.d dVar2 = new rv.d(applicationContext2, agVar, lVar);
        bh.k kVar = new bh.k(6);
        uv.b bVar3 = new uv.b(gVar, cVar);
        z zVar = new z();
        zVar.f32327b = dVar2;
        zVar.f32328c = kVar;
        zVar.f32329d = bVar2;
        zVar.f32330e = agVar;
        zVar.f32331f = bVar3;
        zVar.f32332g = lVar;
        zVar.f32326a = "3DS_LOA_SDK_STIN_020200_00960";
        zVar.f32333h = cVar;
        zVar.f32334i = coroutineContext;
        w wVar = new w(zVar, gVar, z12, 23);
        bVar2.a();
        Intrinsics.f(context.getApplicationContext(), "getApplicationContext(...)");
        this.f93262a = lVar;
        this.f93263b = cVar;
        this.f93264c = wVar;
    }
}
