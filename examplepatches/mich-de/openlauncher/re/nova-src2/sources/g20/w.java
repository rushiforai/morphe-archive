package g20;

import ai.r2;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import android.text.Html;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import e10.z2;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.regex.Pattern;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import kotlin.text.Regex;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import nova.branch.engage.sesame_lite.internal.IdHash;
import r10.o0;
import r10.q1;
import r80.y;
import r80.z;
import t70.g2;
import t70.m0;
import t70.y0;

/* loaded from: classes.dex */
public final class w {

    /* renamed from: l, reason: collision with root package name */
    public static final EnumSet f57000l;

    /* renamed from: m, reason: collision with root package name */
    public static final EnumSet f57001m;
    public static final Uri n;

    /* renamed from: a, reason: collision with root package name */
    public final Context f57002a;

    /* renamed from: b, reason: collision with root package name */
    public final y70.d f57003b;

    /* renamed from: c, reason: collision with root package name */
    public final ja.h f57004c;

    /* renamed from: d, reason: collision with root package name */
    public final x f57005d;

    /* renamed from: g, reason: collision with root package name */
    public r80.l f57008g;

    /* renamed from: h, reason: collision with root package name */
    public g2 f57009h;

    /* renamed from: e, reason: collision with root package name */
    public final a70.d f57006e = LazyKt.a(new a7.f(this, 15));

    /* renamed from: f, reason: collision with root package name */
    public final t70.s f57007f = m0.b();

    /* renamed from: i, reason: collision with root package name */
    public final Regex f57010i = new Regex("^(.*): (.*?): (.*)");

    /* renamed from: j, reason: collision with root package name */
    public final Regex f57011j = new Regex("(\\w+ \\d{1,2}(?: \\d{1,2}:\\d{2} (?:AM|PM)?)?)");

    /* renamed from: k, reason: collision with root package name */
    public final Regex f57012k = new Regex("</?.*?>");

    static {
        EnumSet enumSetOf = EnumSet.of(r80.d.f85656c, r80.d.f85661h, r80.d.f85658e, r80.d.f85659f, r80.d.f85657d);
        f57000l = enumSetOf;
        EnumSet enumSetCopyOf = EnumSet.copyOf(enumSetOf);
        enumSetCopyOf.add(r80.d.f85660g);
        f57001m = enumSetCopyOf;
        n = new Uri.Builder().scheme("android.resource").authority("com.teslacoilsw.launcher").appendPath(String.valueOf(2131231886)).build();
    }

    public w(Context context, y70.d dVar) {
        this.f57002a = context;
        this.f57003b = dVar;
        this.f57004c = (ja.h) ja.h.f69294h.h(context);
        this.f57005d = new x(context);
    }

    public static void k(w wVar, IdHash idHash) {
        m0.t(wVar.f57003b, null, null, new u(wVar, idHash, r80.j.f85686d, null, 1), 3);
    }

    public static List m(w wVar, int i5) {
        z zVar = z.f85743c;
        Context context = wVar.f57002a;
        if (!wVar.i()) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("SSML");
            bVar.n("SSML suggestedLinks called with awaitInited false, returning empty results", new Object[0]);
            return EmptyList.f71733a;
        }
        EnumSet enumSetCopyOf = EnumSet.copyOf(f57000l);
        enumSetCopyOf.remove(r80.d.f85657d);
        r80.x[] xVarArrSuggestedLinks = wVar.d().suggestedLinks(null, enumSetCopyOf, null, -1, i5, r80.b.values(), zVar);
        ArrayList arrayList = new ArrayList(xVarArrSuggestedLinks.length);
        for (r80.x xVar : xVarArrSuggestedLinks) {
            arrayList.add(jk.b.V(xVar.f85729k, null, null, 3));
        }
        String string = context.getString(2132019012);
        ComponentName componentName = SettingsActivity.f45966y;
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("appIcon");
        builder.authority(componentName.flattenToShortString());
        boolean zB = Intrinsics.b(userHandleMyUserHandle, Process.myUserHandle());
        x7.c cVar = ja.h.f69294h;
        if (!zB) {
            builder.fragment(String.valueOf(((ja.h) cVar.f95127b).d(userHandleMyUserHandle)));
        }
        Uri uriBuild = builder.build();
        Intent intent = new Intent();
        intent.setComponent(componentName);
        Unit unit = Unit.f71706a;
        return b70.g.u1(arrayList, new com.teslacoilsw.launcher.search.hero.e(string, uriBuild, intent.toUri(0), IdHash.INSTANCE.ofAppComponent(componentName.getPackageName(), componentName.getClassName(), ((ja.h) cVar.h(context)).d(Process.myUserHandle())), pp.t.f82774c));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        k kVar;
        boolean zBooleanValue;
        if (continuation instanceof k) {
            kVar = (k) continuation;
            int i5 = kVar.f56950v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f56950v = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuation);
            }
        }
        Object objY = kVar.f56948t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f56950v;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                t70.s sVar = this.f57007f;
                kVar.f56950v = 1;
                objY = sVar.y(kVar);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objY);
            }
            zBooleanValue = ((Boolean) objY).booleanValue();
        } catch (CancellationException unused) {
            zBooleanValue = false;
        }
        return Boolean.valueOf(zBooleanValue);
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x006f, code lost:
    
        if (r8.K(r0) == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(IdHash idHash, ContinuationImpl continuationImpl) {
        m mVar;
        w wVar;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f56958x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f56958x = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object objA = mVar.f56956v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f56958x;
        if (i11 == 0) {
            ResultKt.b(objA);
            mVar.f56954t = this;
            mVar.f56955u = idHash;
            mVar.f56958x = 1;
            objA = a(mVar);
            if (objA != coroutineSingletons) {
                wVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        idHash = mVar.f56955u;
        wVar = mVar.f56954t;
        ResultKt.b(objA);
        if (!((Boolean) objA).booleanValue()) {
            return Unit.f71706a;
        }
        g2 g2VarT = m0.t(wVar.f57003b, null, null, new ar.d(wVar, idHash, null, 25), 3);
        mVar.f56954t = null;
        mVar.f56955u = null;
        mVar.f56958x = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x00f9 A[PHI: r4
      0x00f9: PHI (r4v14 java.lang.String) = (r4v8 java.lang.String), (r4v18 java.lang.String) binds: [B:81:0x015e, B:49:0x00f5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0160  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable c(ContinuationImpl continuationImpl) {
        n nVar;
        w wVar;
        String queryParameter;
        String queryParameter2;
        Uri data;
        Uri data2;
        String query;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f56962w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f56962w = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object objA = nVar.f56960u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f56962w;
        if (i11 == 0) {
            ResultKt.b(objA);
            nVar.f56959t = this;
            nVar.f56962w = 1;
            objA = a(nVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            wVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            wVar = nVar.f56959t;
            ResultKt.b(objA);
        }
        if (!((Boolean) objA).booleanValue()) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("SSML");
            bVar.n("SSML getApiIngestedLinksForPackage called with awaitInited false, returning empty results", new Object[0]);
            return EmptyList.f71733a;
        }
        r80.l lVarD = wVar.d();
        EnumSet enumSetOf = EnumSet.of(r80.d.f85661h);
        long[] jArr = {((ja.h) ja.h.f69294h.h(wVar.f57002a)).c(Process.myUserHandle())};
        String[] strArr = new String[0];
        y70.d dVar = wVar.f57003b;
        ArrayList arrayList = new ArrayList(1000);
        for (int i12 = 0; i12 < 1000; i12++) {
            arrayList.add(z.f85741a);
        }
        r80.x[] xVarArrO0 = z2.O0(lVarD, "com.google.android.apps.maps", enumSetOf, jArr, 0, strArr, arrayList, dVar, 128);
        ArrayList arrayList2 = new ArrayList();
        for (r80.x xVar : xVarArrO0) {
            String str = xVar.f85721c;
            y yVar = xVar.f85729k;
            r80.w wVarD = yVar.d();
            r80.v vVar = wVarD instanceof r80.v ? (r80.v) wVarD : null;
            Intent intentC = vVar != null ? vVar.c() : null;
            if (Intrinsics.b(yVar.e(), "com.google.android.apps.maps")) {
                if (Intrinsics.b(intentC != null ? intentC.getScheme() : null, "geo")) {
                    Uri data3 = intentC.getData();
                    if (data3 != null && (query = data3.getQuery()) != null) {
                        queryParameter = r70.k.m1(query, "q=", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                        if (r70.k.U0(queryParameter)) {
                            queryParameter = null;
                        }
                        if (queryParameter == null) {
                        }
                    }
                    queryParameter2 = str;
                }
            } else if (!Intrinsics.b(yVar.e(), "com.google.android.apps.maps")) {
                queryParameter2 = str;
            } else if (Intrinsics.b(intentC != null ? intentC.getScheme() : null, "https")) {
                if (Intrinsics.b((intentC == null || (data2 = intentC.getData()) == null) ? null : data2.getAuthority(), "www.google.com")) {
                    if (Intrinsics.b((intentC == null || (data = intentC.getData()) == null) ? null : data.getPath(), "/maps/dir/")) {
                        Uri data4 = intentC.getData();
                        if (data4 == null || (queryParameter2 = data4.getQueryParameter("destination_place_id")) == null) {
                            Uri data5 = intentC.getData();
                            queryParameter = data5 != null ? data5.getQueryParameter("destination") : null;
                            if (queryParameter != null) {
                                queryParameter2 = queryParameter;
                            }
                        }
                    }
                }
            }
            Uri uriA = yVar.a();
            String string = uriA != null ? uriA.toString() : null;
            r80.w wVarD2 = yVar.d();
            Intrinsics.e(wVarD2, "null cannot be cast to non-null type nova.branch.engage.sesame_lite.SesameLiteOpen.StandardIntent");
            String strD = ((r80.v) wVarD2).d();
            ExternalLink externalLink = strD != null ? new ExternalLink(queryParameter2, str, null, string, strD, null, null, 228) : null;
            if (externalLink != null) {
                arrayList2.add(externalLink);
            }
        }
        return arrayList2;
    }

    public final r80.l d() {
        r80.l lVar = this.f57008g;
        if (lVar != null) {
            return lVar;
        }
        Intrinsics.m("ssml");
        throw null;
    }

    public final List e(ComponentName componentName, long j11, List list, int i5, boolean z11) {
        i iVar;
        if (!i()) {
            return EmptyList.f71733a;
        }
        EnumSet enumSetOf = z11 ? EnumSet.of(r80.d.f85656c, r80.d.f85658e, r80.d.f85659f, r80.d.f85657d, r80.d.f85661h) : EnumSet.of(r80.d.f85656c, r80.d.f85658e, r80.d.f85659f, r80.d.f85657d);
        r80.l lVarD = d();
        String packageName = componentName.getPackageName();
        long[] jArr = {j11};
        String[] strArr = new String[0];
        IntRange intRangeM0 = kotlin.ranges.a.m0(0, i5);
        ArrayList arrayList = new ArrayList(b70.c.u0(intRangeM0, 10));
        IntProgressionIterator it = intRangeM0.iterator();
        while (it.f71911c) {
            it.nextInt();
            arrayList.add(z.f85742b);
        }
        r80.x[] xVarArrO0 = z2.O0(lVarD, packageName, enumSetOf, jArr, 0, strArr, arrayList, this.f57003b, 152);
        ArrayList arrayList2 = new ArrayList();
        for (r80.x xVar : xVarArrO0) {
            if (list.contains(xVar.f85729k.d().a())) {
                iVar = null;
            } else {
                y yVar = xVar.f85729k;
                Uri uriA = o0.a(xVar);
                if (uriA == null) {
                    uriA = n;
                }
                iVar = new i(this, yVar, uriA, ic.b.y(xVar.f85720b));
            }
            if (iVar != null) {
                arrayList2.add(iVar);
            }
        }
        return arrayList2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(s80.a aVar, ContinuationImpl continuationImpl) {
        o oVar;
        w wVar;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f56967x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f56967x = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object objA = oVar.f56965v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f56967x;
        if (i11 == 0) {
            ResultKt.b(objA);
            oVar.f56963t = this;
            oVar.f56964u = aVar;
            oVar.f56967x = 1;
            objA = a(oVar);
            if (objA != coroutineSingletons) {
                wVar = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return objA;
        }
        aVar = oVar.f56964u;
        wVar = oVar.f56963t;
        ResultKt.b(objA);
        if (!((Boolean) objA).booleanValue()) {
            return new Integer(0);
        }
        r80.l lVarD = wVar.d();
        oVar.f56963t = null;
        oVar.f56964u = null;
        oVar.f56967x = 2;
        Object objIngestIntegration = lVarD.ingestIntegration(aVar, oVar);
        return objIngestIntegration == coroutineSingletons ? coroutineSingletons : objIngestIntegration;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(ContinuationImpl continuationImpl) {
        p pVar;
        w wVar;
        w wVar2;
        w wVar3;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i5 = pVar.f56972x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pVar.f56972x = i5 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        Object objA = pVar.f56970v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pVar.f56972x;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objA);
            try {
                r80.i iVar = r80.l.Companion;
                Context context = this.f57002a;
                r80.m mVar = new r80.m(context, new lm.e(22), new vm.c((ja.h) ja.h.f69294h.h(context)));
                pVar.f56968t = this;
                pVar.f56969u = this;
                pVar.f56972x = 1;
                objA = iVar.a(mVar, pVar);
                if (objA != coroutineSingletons) {
                    wVar2 = this;
                    wVar3 = wVar2;
                }
                return coroutineSingletons;
            } catch (Exception e3) {
                e = e3;
                wVar = this;
                if (!(e instanceof CancellationException)) {
                }
                wVar.f57007f.X(Boolean.FALSE);
                return Unit.f71706a;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            wVar = pVar.f56968t;
            try {
                ResultKt.b(objA);
                wVar.f57007f.X(Boolean.TRUE);
                wVar.f57009h = m0.t(wVar.f57003b, null, null, new l(wVar, continuation, 1), 3);
            } catch (Exception e11) {
                e = e11;
                if (!(e instanceof CancellationException)) {
                    mc0.d.f76206a.e(e);
                }
                wVar.f57007f.X(Boolean.FALSE);
                return Unit.f71706a;
            }
            return Unit.f71706a;
        }
        wVar2 = pVar.f56969u;
        wVar3 = pVar.f56968t;
        try {
            ResultKt.b(objA);
        } catch (Exception e12) {
            e = e12;
            wVar = wVar3;
            if (!(e instanceof CancellationException)) {
            }
            wVar.f57007f.X(Boolean.FALSE);
            return Unit.f71706a;
        }
        wVar2.f57008g = (r80.l) objA;
        wVar3.d().registerAndroidListeners(wVar3.f57003b);
        r80.l lVarD = wVar3.d();
        pVar.f56968t = wVar3;
        pVar.f56969u = null;
        pVar.f56972x = 2;
        if (z2.z0(lVarD, null, pVar, 3) != coroutineSingletons) {
            wVar = wVar3;
            wVar.f57007f.X(Boolean.TRUE);
            wVar.f57009h = m0.t(wVar.f57003b, null, null, new l(wVar, continuation, 1), 3);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(ExternalLink externalLink, r80.d dVar, String str, long j11, ContinuationImpl continuationImpl) {
        r rVar;
        w wVar;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.A = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(this, continuationImpl);
            }
        }
        Object objA = rVar.f56982y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.A;
        if (i11 == 0) {
            ResultKt.b(objA);
            rVar.f56977t = this;
            rVar.f56978u = externalLink;
            rVar.f56979v = dVar;
            rVar.f56980w = str;
            rVar.f56981x = j11;
            rVar.A = 1;
            objA = a(rVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            wVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = rVar.f56981x;
            str = rVar.f56980w;
            dVar = rVar.f56979v;
            externalLink = rVar.f56978u;
            wVar = rVar.f56977t;
            ResultKt.b(objA);
        }
        ExternalLink externalLink2 = externalLink;
        r80.d dVar2 = dVar;
        String str2 = str;
        long j12 = j11;
        if (((Boolean) objA).booleanValue()) {
            return wVar.d().insertExternalLink(externalLink2, dVar2, str2, j12);
        }
        return null;
    }

    public final boolean i() {
        t70.s sVar = this.f57007f;
        return sVar.isCompleted() && ((Boolean) sVar.J()).booleanValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0061, code lost:
    
        if (t70.m0.y(r7, r4, r0) == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(ContinuationImpl continuationImpl) {
        t tVar;
        w wVar;
        if (continuationImpl instanceof t) {
            tVar = (t) continuationImpl;
            int i5 = tVar.f56988w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tVar.f56988w = i5 - Integer.MIN_VALUE;
            } else {
                tVar = new t(this, continuationImpl);
            }
        }
        Object objA = tVar.f56986u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tVar.f56988w;
        int i12 = 2;
        if (i11 == 0) {
            ResultKt.b(objA);
            tVar.f56985t = this;
            tVar.f56988w = 1;
            objA = a(tVar);
            if (objA != coroutineSingletons) {
                wVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        wVar = tVar.f56985t;
        ResultKt.b(objA);
        if (!((Boolean) objA).booleanValue()) {
            return Unit.f71706a;
        }
        a80.e eVar = y0.f88884a;
        a80.d dVar = a80.d.f488c;
        l lVar = new l(wVar, null, i12);
        tVar.f56985t = null;
        tVar.f56988w = 2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v12, types: [kotlin.Pair] */
    public final List l(q9.p pVar, String str, int i5, boolean z11, int i11) {
        Pair pair;
        if (!i()) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("SSML");
            bVar.n("SSML searchApps called with awaitInited false, returning empty results", new Object[0]);
            return EmptyList.f71733a;
        }
        r80.x[] xVarArrSearch = d().search(2000L, str, null, EnumSet.of(r80.d.f85655b), true, i5, null, -1, r80.b.values());
        ArrayList arrayList = new ArrayList();
        int length = xVarArrSearch.length;
        int i12 = 0;
        while (true) {
            ga.a pair2 = null;
            if (i12 >= length) {
                break;
            }
            r80.x xVar = xVarArrSearch[i12];
            r80.w wVarD = xVar.f85729k.d();
            Intrinsics.e(wVarD, "null cannot be cast to non-null type nova.branch.engage.sesame_lite.SesameLiteOpen.AppComponent");
            r80.q qVar = (r80.q) wVarD;
            UserHandle userHandleE = ((ja.h) ja.h.f69294h.h(this.f57002a)).e(qVar.e());
            if (userHandleE != null) {
                ga.a aVarB = pVar.b(new ComponentKey(new ComponentName(qVar.d(), qVar.c()), userHandleE));
                if (aVarB != null) {
                    pair2 = aVarB.clone();
                    pair2.f57300l = Html.fromHtml(xVar.f85722d, 63);
                    pair2.f57291c = i11;
                }
                pair2 = new Pair(pair2, Double.valueOf(xVar.f85723e));
            }
            if (pair2 != null) {
                arrayList.add(pair2);
            }
            i12++;
        }
        ArrayList arrayListK1 = b70.g.K1(arrayList);
        if (z11) {
            Pattern pattern = r80.k.f85688a;
            String strJ = r80.k.j(r70.k.u1(str).toString());
            ga.a[] aVarArr = pVar.f83863c;
            ArrayList arrayList2 = new ArrayList();
            for (ga.a aVar : aVarArr) {
                if (aVar instanceof iz.a) {
                    arrayList2.add(aVar);
                }
            }
            ArrayList arrayList3 = new ArrayList();
            Iterator it = arrayList2.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                ga.a aVar2 = (ga.a) it.next();
                String string = r70.k.u1(aVar2.f57300l).toString();
                String strJ2 = r80.k.j(string);
                int[] iArr = new int[strJ.length()];
                int[] iArr2 = {-1};
                if (r80.k.i(strJ, string, strJ2, iArr, iArr2)) {
                    Integer numY0 = kotlin.collections.c.y0(iArr2);
                    pair = new Pair(aVar2, Double.valueOf(r80.k.l(numY0 != null ? numY0.intValue() : -1, string, iArr)));
                } else {
                    pair = null;
                }
                if (pair != null) {
                    arrayList3.add(pair);
                }
            }
            for (Pair pair3 : b70.g.D1(new r2(14), arrayList3)) {
                Iterator it2 = arrayListK1.iterator();
                int i13 = 0;
                while (true) {
                    if (!it2.hasNext()) {
                        i13 = -1;
                        break;
                    }
                    if (((Number) ((Pair) it2.next()).f71684b).doubleValue() < ((Number) pair3.f71684b).doubleValue()) {
                        break;
                    }
                    i13++;
                }
                if (i13 != -1) {
                    arrayListK1.add(i13, pair3);
                } else {
                    arrayListK1.add(pair3);
                }
            }
        }
        ArrayList arrayList4 = new ArrayList();
        Iterator it3 = arrayListK1.iterator();
        while (it3.hasNext()) {
            ga.a aVar3 = (ga.a) ((Pair) it3.next()).f71683a;
            if (aVar3 != null) {
                arrayList4.add(aVar3);
            }
        }
        if (q1.a(str)) {
            ArrayList arrayListA = d.a(pVar, str);
            if (!z11) {
                ArrayList arrayList5 = new ArrayList();
                Iterator it4 = arrayListA.iterator();
                while (it4.hasNext()) {
                    Object next = it4.next();
                    if (!(((ga.a) next) instanceof iz.a)) {
                        arrayList5.add(next);
                    }
                }
                arrayListA = arrayList5;
            }
            ArrayList arrayListT1 = b70.g.t1(arrayListA, arrayList4);
            HashSet hashSet = new HashSet();
            arrayList4 = new ArrayList();
            Iterator it5 = arrayListT1.iterator();
            while (it5.hasNext()) {
                Object next2 = it5.next();
                if (hashSet.add(((ga.a) next2).P0())) {
                    arrayList4.add(next2);
                }
            }
        }
        return i5 > 0 ? b70.g.E1(arrayList4, i5) : arrayList4;
    }
}
