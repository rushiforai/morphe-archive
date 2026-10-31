package mx;

import ads_mobile_sdk.c6;
import ads_mobile_sdk.c92;
import ads_mobile_sdk.du0;
import ads_mobile_sdk.dv0;
import ads_mobile_sdk.ew1;
import ads_mobile_sdk.f5;
import ads_mobile_sdk.hv;
import ads_mobile_sdk.i82;
import ads_mobile_sdk.ih0;
import ads_mobile_sdk.iu0;
import ads_mobile_sdk.iw1;
import ads_mobile_sdk.iy0;
import ads_mobile_sdk.ji3;
import ads_mobile_sdk.jl2;
import ads_mobile_sdk.lw0;
import ads_mobile_sdk.m52;
import ads_mobile_sdk.od1;
import ads_mobile_sdk.pe2;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.ru2;
import ads_mobile_sdk.th3;
import ads_mobile_sdk.tu0;
import ads_mobile_sdk.tx0;
import ads_mobile_sdk.wd1;
import ads_mobile_sdk.wv0;
import ads_mobile_sdk.x52;
import ads_mobile_sdk.xo2;
import ads_mobile_sdk.xu0;
import ads_mobile_sdk.zi3;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.provider.CalendarContract;
import android.view.ViewGroup;
import android.view.ViewParent;
import b.a4;
import b.c7;
import b.v3;
import com.google.android.gms.internal.measurement.vf;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.medialite.LocalMediaView;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import e10.y2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import p1.s2;

/* loaded from: classes.dex */
public final class e extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f77056t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f77057u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Object f77058v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(Object obj, Object obj2, Continuation continuation, int i5) {
        super(2, continuation);
        this.f77056t = i5;
        this.f77057u = obj;
        this.f77058v = obj2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f77056t) {
            case 0:
                return new e((kl.q0) this.f77057u, (Context) this.f77058v, continuation, 0);
            case 1:
                return new e((i82) this.f77057u, (v3) this.f77058v, continuation, 1);
            case 2:
                return new e((ViewParent) this.f77057u, (c92) this.f77058v, continuation, 2);
            case 3:
                return new e((f5) this.f77057u, (xo2) this.f77058v, continuation, 3);
            case 4:
                return new e(continuation, (ih0) this.f77057u, (String) this.f77058v, 4);
            case 5:
                return new e(continuation, (ih0) this.f77057u, (wi.a) this.f77058v, 5);
            case 6:
                return new e((iw1) this.f77057u, (ew1) this.f77058v, continuation, 6);
            case 7:
                return new e((f5) this.f77057u, (jl2) this.f77058v, continuation, 7);
            case 8:
                e eVar = new e((c7) this.f77058v, continuation, 8);
                eVar.f77057u = obj;
                return eVar;
            case 9:
                return new e(continuation, (ih0) this.f77057u, (ni.s) this.f77058v, 9);
            case 10:
                e eVar2 = new e((vf) this.f77058v, continuation, 10);
                eVar2.f77057u = obj;
                return eVar2;
            case 11:
                return new e((pe2) this.f77057u, (String) this.f77058v, continuation, 11);
            case 12:
                e eVar3 = new e((hv) this.f77058v, continuation, 12);
                eVar3.f77057u = obj;
                return eVar3;
            case 13:
                return new e((qp.i) this.f77057u, (LocalDate) this.f77058v, continuation, 13);
            case 14:
                return new e((AppSearchResultsView) this.f77057u, (ArrayList) this.f77058v, continuation, 14);
            case 15:
                return new e((w20.f0) this.f77057u, (NovaApplication) this.f77058v, continuation, 15);
            default:
                e eVar4 = new e((LocalMediaView) this.f77058v, continuation, 16);
                eVar4.f77057u = obj;
                return eVar4;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f77056t) {
            case 0:
                return ((e) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 1:
                return new e((i82) this.f77057u, (v3) this.f77058v, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            case 2:
                return new e((ViewParent) this.f77057u, (c92) this.f77058v, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
            case 3:
                return new e((f5) this.f77057u, (xo2) this.f77058v, (Continuation) obj2, 3).invokeSuspend(Unit.f71706a);
            case 4:
                return new e((Continuation) obj2, (ih0) this.f77057u, (String) this.f77058v, 4).invokeSuspend(Unit.f71706a);
            case 5:
                return new e((Continuation) obj2, (ih0) this.f77057u, (wi.a) this.f77058v, 5).invokeSuspend(Unit.f71706a);
            case 6:
                return new e((iw1) this.f77057u, (ew1) this.f77058v, (Continuation) obj2, 6).invokeSuspend(Unit.f71706a);
            case 7:
                return new e((f5) this.f77057u, (jl2) this.f77058v, (Continuation) obj2, 7).invokeSuspend(Unit.f71706a);
            case 8:
                e eVar = new e((c7) this.f77058v, (Continuation) obj2, 8);
                eVar.f77057u = (tx0) obj;
                return eVar.invokeSuspend(Unit.f71706a);
            case 9:
                return new e((Continuation) obj2, (ih0) this.f77057u, (ni.s) this.f77058v, 9).invokeSuspend(Unit.f71706a);
            case 10:
                e eVar2 = new e((vf) this.f77058v, (Continuation) obj2, 10);
                eVar2.f77057u = (od1) obj;
                return eVar2.invokeSuspend(Unit.f71706a);
            case 11:
                return new e((pe2) this.f77057u, (String) this.f77058v, (Continuation) obj2, 11).invokeSuspend(Unit.f71706a);
            case 12:
                e eVar3 = new e((hv) this.f77058v, (Continuation) obj2, 12);
                eVar3.f77057u = (tx0) obj;
                return eVar3.invokeSuspend(Unit.f71706a);
            case 13:
                return ((e) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 14:
                return ((e) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 15:
                return ((e) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((e) create((a00.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x016e A[Catch: all -> 0x0131, TRY_LEAVE, TryCatch #1 {all -> 0x0131, blocks: (B:44:0x0116, B:52:0x0133, B:54:0x0139, B:62:0x016a, B:64:0x016e, B:55:0x0143, B:57:0x0149, B:58:0x0153, B:60:0x0159, B:61:0x0161, B:47:0x011b, B:49:0x0127), top: B:148:0x0116 }] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        fx.b bVar;
        Object tu0Var;
        boolean z11;
        np.d dVarQ = null;
        switch (this.f77056t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                Intent intent = new Intent("android.intent.action.VIEW", CalendarContract.CONTENT_URI.buildUpon().appendPath("time").build());
                kl.q0 q0Var = (kl.q0) this.f77057u;
                List<ResolveInfo> listQueryIntentActivities = ((Context) this.f77058v).getPackageManager().queryIntentActivities(intent, SQLiteDatabase.OPEN_SHAREDCACHE);
                ArrayList arrayList = new ArrayList(b70.c.u0(listQueryIntentActivities, 10));
                Iterator<T> it = listQueryIntentActivities.iterator();
                while (it.hasNext()) {
                    arrayList.add(((ResolveInfo) it.next()).activityInfo.packageName);
                }
                q0Var.f71629a = arrayList;
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                x52 x52Var = ((i82) this.f77057u).f4673f;
                v3 adSession = (v3) this.f77058v;
                x52Var.getClass();
                Intrinsics.g(adSession, "adSession");
                return (Unit) x52Var.f11580f.b("FinishOmidSession", new m52(adSession, 0));
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ViewGroup viewGroup = (ViewGroup) ((ViewParent) this.f77057u);
                c92 c92Var = (c92) this.f77058v;
                viewGroup.removeView(c92Var.g());
                Context contextB = c92Var.M.b();
                if (contextB == null) {
                    contextB = c92Var.f2970a;
                }
                return Boolean.valueOf(c92Var.a(contextB));
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                f5 f5Var = (f5) this.f77057u;
                ni.z zVar = f5Var.f3160d;
                if (zVar != null) {
                    zVar.j(f5Var.f3159b, ((xo2) this.f77058v).f11792a);
                }
                return Unit.f71706a;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                synchronized (((ih0) this.f77057u)) {
                }
                return Unit.f71706a;
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ih0 ih0Var = (ih0) this.f77057u;
                synchronized (ih0Var) {
                    bVar = ih0Var.o;
                }
                if (bVar != null) {
                    bVar.a((wi.a) this.f77058v);
                }
                return Unit.f71706a;
            case 6:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                iw1 iw1Var = (iw1) this.f77057u;
                ew1 ew1Var = (ew1) this.f77058v;
                iw1.a(iw1Var, ew1Var);
                iw1Var.a(ew1Var);
                return Unit.f71706a;
            case 7:
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                f5 f5Var2 = (f5) this.f77057u;
                ni.z zVar2 = f5Var2.f3160d;
                if (zVar2 != null) {
                    zVar2.k(f5Var2.f3159b, ((jl2) this.f77058v).f5297a.getResponseInfo());
                }
                return Unit.f71706a;
            case 8:
                CoroutineSingletons coroutineSingletons9 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ((tx0) this.f77057u).f10134p = (c7) this.f77058v;
                return Unit.f71706a;
            case 9:
                CoroutineSingletons coroutineSingletons10 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ni.d dVarA = ((ih0) this.f77057u).a();
                if (dVarA != null) {
                    dVarA.b((ni.s) this.f77058v);
                }
                return Unit.f71706a;
            case 10:
                CoroutineSingletons coroutineSingletons11 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                od1 od1Var = (od1) this.f77057u;
                vf vfVar = (vf) this.f77058v;
                return new ru2(od1Var, vfVar.a().c(), vfVar.a());
            case 11:
                CoroutineSingletons coroutineSingletons12 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                c6 c6Var = ((pe2) this.f77057u).f8232b;
                String filename = (String) this.f77058v;
                c6Var.getClass();
                Intrinsics.g(filename, "filename");
                wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_FILE_DELETE;
                WeakHashMap weakHashMap = ji3.f5253a;
                th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
                try {
                    if (!c6Var.f1667b) {
                        c6Var.f1667b = c6Var.f1666a.exists();
                        if (!c6Var.f1667b) {
                            tu0Var = new tu0("Cache directory not found", wd1.f11213a);
                        }
                        if (tu0Var instanceof pu0) {
                            zi3.a((pu0) tu0Var, false);
                        }
                        th3VarA.close();
                        return tu0Var;
                    }
                    File fileB = c6Var.b(filename);
                    tu0Var = fileB == null ? new tu0("Invalid filename", wd1.f11213a) : !fileB.exists() ? new tu0("File not found", wd1.f11213a) : fileB.delete() ? new xu0(Unit.f71706a) : new tu0("Failed to delete file", wd1.f11213a);
                    if (tu0Var instanceof pu0) {
                    }
                    th3VarA.close();
                    return tu0Var;
                } catch (Throwable th2) {
                    try {
                        th3VarA.b(th2);
                        if (th2 instanceof a4) {
                            throw th2;
                        }
                        if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                            th3VarA.a(th2);
                        }
                        if (th2 instanceof TimeoutCancellationException) {
                            throw new lw0(th2);
                        }
                        if (th2 instanceof CancellationException) {
                            throw new du0(th2);
                        }
                        if (th2 instanceof dv0) {
                            throw th2;
                        }
                        throw new iu0(th2);
                    } finally {
                    }
                }
            case 12:
                CoroutineSingletons coroutineSingletons13 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                iy0 iy0VarB = ((tx0) this.f77057u).b();
                iy0VarB.o.setValue(iy0VarB, iy0.f5027w[3], Boolean.valueOf(((hv) this.f77058v).f4565u));
                return Unit.f71706a;
            case 13:
                CoroutineSingletons coroutineSingletons14 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                qp.i iVar = (qp.i) this.f77057u;
                Object obj2 = iVar.f84309c;
                LocalDate localDate = (LocalDate) this.f77058v;
                synchronized (obj2) {
                    try {
                        Intrinsics.d(localDate);
                        dVarQ = x7.f.B(localDate);
                    } catch (Exception unused) {
                    }
                    if (dVarQ == null) {
                        Intrinsics.d(localDate);
                        dVarQ = iVar.q(localDate);
                    }
                    iVar.f84310d = dVarQ;
                }
                return Unit.f71706a;
            case 14:
                CoroutineSingletons coroutineSingletons15 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                AppSearchResultsView appSearchResultsView = (AppSearchResultsView) this.f77057u;
                ArrayList arrayList2 = (ArrayList) this.f77058v;
                appSearchResultsView.f46202m = arrayList2;
                appSearchResultsView.C = arrayList2.size() >= 4;
                appSearchResultsView.h(null);
                if (appSearchResultsView.f46190g.length() > 0) {
                    appSearchResultsView.L(appSearchResultsView.f46190g, true);
                }
                return Unit.f71706a;
            case 15:
                CoroutineSingletons coroutineSingletons16 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ((w20.f0) this.f77057u).f93679c = ((NovaApplication) this.f77058v).getFileStreamPath("crashlog.txt").lastModified();
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons17 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                a00.b bVar2 = (a00.b) this.f77057u;
                LocalMediaView localMediaView = (LocalMediaView) this.f77058v;
                ((s2) localMediaView.f45873c).setValue(bVar2);
                y2 y2Var = y2.f51877a;
                xz.d dVar = (xz.d) y2Var.J0().l();
                if (bVar2 != null) {
                    String str = bVar2.f67h;
                    String str2 = dVar.f96484a;
                    boolean z12 = dVar.f96485b;
                    if (!str.equals(str2) || ((z11 = bVar2.f63d) && !z12)) {
                        y2Var.J0().a();
                    } else if (!z11 && z12) {
                        y2Var.J0().i(new xz.d(dVar.f96484a, false));
                    }
                }
                localMediaView.i(localMediaView.f45875e);
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f77056t = i5;
        this.f77058v = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(Continuation continuation, ih0 ih0Var, Object obj, int i5) {
        super(2, continuation);
        this.f77056t = i5;
        this.f77057u = ih0Var;
        this.f77058v = obj;
    }
}
