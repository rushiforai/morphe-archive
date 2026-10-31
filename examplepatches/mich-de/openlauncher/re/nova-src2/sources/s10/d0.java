package s10;

import android.content.Context;
import android.net.Uri;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import e00.q4;
import e10.a3;
import e10.z2;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import r10.o1;
import r10.p1;
import r10.s1;
import t70.m0;
import t70.q0;
import t70.y0;
import u10.r0;
import w70.i2;
import w70.u1;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f86578a;

    /* renamed from: b, reason: collision with root package name */
    public final y70.d f86579b;

    /* renamed from: c, reason: collision with root package name */
    public final ja.h f86580c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f86581d = LazyKt.a(new h50.q(25));

    /* renamed from: e, reason: collision with root package name */
    public final t70.s f86582e = m0.b();

    /* renamed from: f, reason: collision with root package name */
    public final a70.d f86583f = LazyKt.a(new r(this, 0));

    /* renamed from: g, reason: collision with root package name */
    public final i2 f86584g;

    /* renamed from: h, reason: collision with root package name */
    public final ConcurrentHashMap f86585h;

    /* renamed from: i, reason: collision with root package name */
    public volatile q9.p f86586i;

    /* renamed from: j, reason: collision with root package name */
    public final AtomicBoolean f86587j;

    /* renamed from: k, reason: collision with root package name */
    public volatile boolean f86588k;

    /* renamed from: l, reason: collision with root package name */
    public volatile Object f86589l;

    /* renamed from: m, reason: collision with root package name */
    public final q9.a f86590m;

    public d0(Context context, y70.d dVar, ja.h hVar) {
        this.f86578a = context;
        this.f86579b = dVar;
        this.f86580c = hVar;
        EmptyList emptyList = EmptyList.f71733a;
        this.f86584g = u1.c(emptyList);
        this.f86585h = new ConcurrentHashMap();
        this.f86587j = new AtomicBoolean(false);
        this.f86589l = emptyList;
        this.f86590m = new q9.a(this, 2);
    }

    public static final ArrayList a(d0 d0Var, List list) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (Intrinsics.b(((BranchContainer) obj).getContainerType(), "suggested_apps")) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            b70.d.z0(((BranchContainer) it.next()).getContent(), arrayList2);
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            BranchEntity branchEntity = (BranchEntity) it2.next();
            d dVar = null;
            BranchEntity.App app = branchEntity instanceof BranchEntity.App ? (BranchEntity.App) branchEntity : null;
            if (app != null) {
                try {
                    q9.p pVar = d0Var.f86586i;
                    if (pVar == null) {
                        Intrinsics.m("allAppsStore");
                        throw null;
                    }
                    dVar = new d(pVar, app, d0Var.f86580c);
                } catch (Exception e3) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NovaBranchSearchManager");
                    bVar.f(e3, "Failed to create BranchAppInfo for " + app, new Object[0]);
                }
            }
            if (dVar != null) {
                arrayList3.add(dVar);
            }
        }
        return arrayList3;
    }

    public static final ArrayList b(d0 d0Var, List list) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (Intrinsics.b(((BranchContainer) obj).getContainerType(), "suggested_installs_zs")) {
                arrayList.add(obj);
            }
        }
        return d0Var.j(arrayList, new i(2));
    }

    public static final ArrayList c(d0 d0Var, List list) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (Intrinsics.b(((BranchContainer) obj).getContainerType(), "suggested_links")) {
                arrayList.add(obj);
            }
        }
        return d0Var.j(arrayList, new i(2));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable d(String str, i iVar, ContinuationImpl continuationImpl) {
        u uVar;
        d0 d0Var;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f86637x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f86637x = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(this, continuationImpl);
            }
        }
        Object objA = uVar.f86635v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f86637x;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (this.f86588k || !i()) {
                if (!i()) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NovaBranchSearchManager");
                    bVar.n("BranchNavigatorCore is not initialized", new Object[0]);
                }
                return EmptyList.f71733a;
            }
            if (r70.k.u1(str).toString().length() < 3) {
                return EmptyList.f71733a;
            }
            y40.c cVarAppStoreRequest = g().appStoreRequest(str);
            uVar.f86633t = iVar;
            uVar.f86634u = this;
            uVar.f86637x = 1;
            objA = cVarAppStoreRequest.a(uVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            d0Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d0Var = uVar.f86634u;
            iVar = uVar.f86633t;
            ResultKt.b(objA);
        }
        Iterable iterable = (Iterable) ((y40.w) objA).b();
        ArrayList arrayList = new ArrayList();
        for (Object obj : iterable) {
            if (Intrinsics.b(((BranchContainer) obj).getContainerType(), "app_store_search")) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayListJ = d0Var.j(arrayList, iVar);
        mc0.b bVar2 = mc0.d.f76206a;
        bVar2.r("NovaBranchSearchManager");
        bVar2.b(b.c0.i(arrayListJ.size(), "appStoreSearch: Found ", " appstore from Branch"), new Object[0]);
        return arrayListJ;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(ContinuationImpl continuationImpl) {
        w wVar;
        boolean zBooleanValue;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f86641v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f86641v = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(this, continuationImpl);
            }
        }
        Object objY = wVar.f86639t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f86641v;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                t70.s sVar = this.f86582e;
                wVar.f86641v = 1;
                objY = sVar.y(wVar);
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

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable f(q0 q0Var, List list, Function1 function1, ContinuationImpl continuationImpl) {
        x xVar;
        d0 d0Var;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i5 = xVar.f86647y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f86647y = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(this, continuationImpl);
            }
        }
        Object objY = xVar.f86645w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar.f86647y;
        if (i11 == 0) {
            ResultKt.b(objY);
            if (this.f86588k || !i()) {
                if (!i()) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NovaBranchSearchManager");
                    bVar.n("BranchNavigatorCore is not initialized", new Object[0]);
                }
                return EmptyList.f71733a;
            }
            xVar.f86642t = list;
            xVar.f86643u = function1;
            xVar.f86644v = this;
            xVar.f86647y = 1;
            objY = q0Var.y(xVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            d0Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d0Var = xVar.f86644v;
            function1 = xVar.f86643u;
            list = xVar.f86642t;
            ResultKt.b(objY);
        }
        Iterable iterable = (Iterable) ((y40.w) objY).b();
        ArrayList arrayList = new ArrayList();
        for (Object obj : iterable) {
            if (list.contains(((BranchContainer) obj).getContainerType())) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayListJ = d0Var.j(arrayList, function1);
        mc0.b bVar2 = mc0.d.f76206a;
        bVar2.r("NovaBranchSearchManager");
        bVar2.b(b.c0.i(arrayListJ.size(), "searchShortcuts: Found ", " shortcuts from Branch"), new Object[0]);
        return arrayListJ;
    }

    public final y40.p g() {
        return (y40.p) this.f86581d.getValue();
    }

    public final void h(Context context, boolean z11) {
        int i5 = 0;
        if (this.f86587j.compareAndSet(false, true)) {
            String str = a3.f51435a.f51552h ? "key_live_jsyxxMlhd7zNqh8pxbsuJnbosDos5LMy" : "key_live_fe5VH7SagNVLDwbrvHh57mmnDtbZekzo";
            y40.o oVar = y40.p.Companion;
            m.w wVarB = new nx.l(context, 20).b();
            oVar.getClass();
            y40.o.b(wVarB);
            y40.q qVar = y40.s.Companion;
            y40.t tVar = new y40.t(context);
            tVar.d(str);
            if (z11) {
                tVar.b();
            } else {
                tVar.c();
            }
            tVar.e();
            y40.u uVarA = tVar.a();
            y yVar = new y(this);
            qVar.getClass();
            y40.q.a(uVarA, yVar);
            a80.e eVar = y0.f88884a;
            m0.t(this.f86579b, a80.d.f488c, null, new z(this, null, i5), 2);
        }
    }

    public final boolean i() {
        t70.s sVar = this.f86582e;
        return sVar.isCompleted() && ((Boolean) sVar.J()).booleanValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:199:0x04ba  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x0508  */
    /* JADX WARN: Removed duplicated region for block: B:284:0x0699 A[PHI: r10 r19
      0x0699: PHI (r10v36 java.lang.Object) = (r10v1 java.lang.Object), (r10v2 java.lang.Object), (r10v37 java.lang.Object) binds: [B:283:0x0697, B:268:0x0620, B:8:0x0031] A[DONT_GENERATE, DONT_INLINE]
      0x0699: PHI (r19v20 java.util.Iterator) = (r19v0 java.util.Iterator), (r19v1 java.util.Iterator), (r19v21 java.util.Iterator) binds: [B:283:0x0697, B:268:0x0620, B:8:0x0031] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:288:0x06b1  */
    /* JADX WARN: Removed duplicated region for block: B:294:0x06d1  */
    /* JADX WARN: Removed duplicated region for block: B:300:0x06fe  */
    /* JADX WARN: Removed duplicated region for block: B:306:0x0728 A[LOOP:8: B:304:0x0722->B:306:0x0728, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:309:0x0773  */
    /* JADX WARN: Removed duplicated region for block: B:344:0x0776 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:352:0x00fb A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:396:0x04bd A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:403:0x05ca A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:405:0x0574 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ArrayList j(ArrayList arrayList, Function1 function1) {
        Iterator it;
        BranchContainer branchContainer;
        Object obj;
        Object objP;
        s1 s1Var;
        Function0 function0;
        o1 zVar;
        u10.g gVar;
        q9.p pVar;
        String string;
        Function0 function02;
        o1 zVar2;
        CharSequence header;
        BranchContainer branchContainer2;
        u10.g gVar2;
        q9.p pVar2;
        Function0 function03;
        o1 zVar3;
        u10.g gVar3;
        q9.p pVar3;
        Iterator it2;
        Iterator it3;
        Iterator it4;
        Object objP2;
        q9.p pVar4;
        String string2;
        q9.p pVar5;
        String string3;
        o1 zVar4;
        Iterator it5;
        u10.g gVar4;
        u10.g gVar5;
        q9.p pVar6;
        q qVar = q.f86627a;
        ArrayList arrayList2 = new ArrayList();
        Iterator it6 = arrayList.iterator();
        while (it6.hasNext()) {
            BranchContainer branchContainer3 = (BranchContainer) it6.next();
            String containerType = branchContainer3.getContainerType();
            int iHashCode = containerType.hashCode();
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            switch (iHashCode) {
                case -1621149795:
                    it = it6;
                    branchContainer = branchContainer3;
                    obj = null;
                    if (containerType.equals("suggested_links")) {
                        List content = branchContainer.getContent();
                        ArrayList arrayList3 = new ArrayList();
                        for (Object obj2 : content) {
                            if (obj2 instanceof BranchEntity.Shortcut) {
                                arrayList3.add(obj2);
                            }
                        }
                        HashSet hashSet = new HashSet();
                        ArrayList arrayList4 = new ArrayList();
                        it2 = arrayList3.iterator();
                        while (it2.hasNext()) {
                            Object next = it2.next();
                            if (hashSet.add(Integer.valueOf(((BranchEntity.Shortcut) next).getId()))) {
                                arrayList4.add(next);
                            }
                        }
                        HashSet hashSet2 = new HashSet();
                        ArrayList arrayList5 = new ArrayList();
                        it3 = arrayList4.iterator();
                        while (it3.hasNext()) {
                            Object next2 = it3.next();
                            if (hashSet2.add(((BranchEntity.Shortcut) next2).l())) {
                                arrayList5.add(next2);
                            }
                        }
                        ArrayList arrayList6 = new ArrayList(b70.c.u0(arrayList5, 10));
                        it4 = arrayList5.iterator();
                        while (it4.hasNext()) {
                            BranchEntity.Shortcut shortcut = (BranchEntity.Shortcut) it4.next();
                            String string4 = shortcut.l().toString();
                            Uri uriA = e0.a(shortcut.getF66453d(), this.f86580c);
                            o7.a aVar = pp.b0.f82688a;
                            arrayList6.add(new r10.b0(new a0(shortcut, string4, uriA), shortcut.l().toString(), null, new s(0, this, shortcut), null, "BranchShortcuts", 16));
                        }
                        objP = b70.g.E1(arrayList6, 3);
                    } else {
                        objP = obj;
                    }
                    if (objP == null) {
                        arrayList2.add(objP);
                    }
                    it6 = it;
                case -857889697:
                    it = it6;
                    obj = null;
                    if (containerType.equals("auto_suggestions")) {
                        List<BranchEntity> content2 = branchContainer3.getContent();
                        ArrayList arrayList7 = new ArrayList();
                        for (BranchEntity branchEntity : content2) {
                            if (((Boolean) function1.invoke(branchEntity)).booleanValue() && (branchEntity instanceof BranchEntity.AutoSuggestion)) {
                                BranchEntity.AutoSuggestion autoSuggestion = (BranchEntity.AutoSuggestion) branchEntity;
                                String string5 = autoSuggestion.i().toString();
                                Uri uriA2 = p1.a();
                                o7.a aVar2 = pp.b0.f82688a;
                                s1Var = new s1(new b0(autoSuggestion, string5, uriA2), autoSuggestion.i().toString(), null, null, null, new l10.z(autoSuggestion, 17), 60);
                            } else {
                                s1Var = null;
                            }
                            if (s1Var != null) {
                                arrayList7.add(s1Var);
                            }
                        }
                        objP = arrayList7;
                    }
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
                case -581892220:
                    it = it6;
                    if (containerType.equals("suggested_installs_zs")) {
                        List<BranchEntity> content3 = branchContainer3.getContent();
                        ArrayList arrayList8 = new ArrayList();
                        for (BranchEntity branchEntity2 : content3) {
                            BranchEntity.SuggestedInstalls suggestedInstalls = (((Boolean) function1.invoke(branchEntity2)).booleanValue() && (branchEntity2 instanceof BranchEntity.SuggestedInstalls)) ? (BranchEntity.SuggestedInstalls) branchEntity2 : null;
                            if (suggestedInstalls != null) {
                                arrayList8.add(suggestedInstalls);
                            }
                        }
                        if (arrayList8.isEmpty()) {
                            objP = EmptyList.f71733a;
                        } else {
                            ArrayList arrayList9 = new ArrayList();
                            Iterator it7 = arrayList8.iterator();
                            while (it7.hasNext()) {
                                BranchEntity.SuggestedInstalls suggestedInstalls2 = (BranchEntity.SuggestedInstalls) it7.next();
                                try {
                                    pVar = this.f86586i;
                                } catch (Exception e3) {
                                    e = e3;
                                }
                                if (pVar == null) {
                                    Intrinsics.m("allAppsStore");
                                    throw null;
                                    break;
                                } else {
                                    try {
                                        gVar = new u10.g(new d(suggestedInstalls2, b.a(pVar, suggestedInstalls2, suggestedInstalls2.getF66465d(), suggestedInstalls2.l(), this.f86580c)), null, 12);
                                    } catch (Exception e11) {
                                        e = e11;
                                    }
                                    if (gVar == null) {
                                        arrayList9.add(gVar);
                                    }
                                }
                                e = e11;
                                mc0.b bVar = mc0.d.f76206a;
                                bVar.r("NovaBranchSearchManager");
                                bVar.f(e, "Failed to create BranchAppInfo for " + suggestedInstalls2, new Object[0]);
                                gVar = null;
                                if (gVar == null) {
                                }
                            }
                            u10.f fVar = new u10.f("Suggested Installs", (Uri) this.f86583f.getValue(), arrayList9);
                            u10.g gVar6 = (u10.g) b70.g.Y0(arrayList9);
                            if (gVar6 != null) {
                                function0 = null;
                                zVar = z2.L0(gVar6, qVar, null, 6);
                                if (zVar == null) {
                                }
                                objP = ul.b.P(new r10.a0(fVar, (q4) null, "Related Apps", zVar, (EmptyList) null, 50));
                            } else {
                                function0 = null;
                            }
                            zVar = new r10.z(fVar.f90374c, fVar.f90375d, function0);
                            objP = ul.b.P(new r10.a0(fVar, (q4) null, "Related Apps", zVar, (EmptyList) null, 50));
                        }
                        if (objP == null) {
                        }
                        it6 = it;
                    }
                    obj = null;
                    objP = obj;
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
                case -539437172:
                    it = it6;
                    if (containerType.equals("search_more")) {
                        List<BranchEntity> content4 = branchContainer3.getContent();
                        ArrayList arrayList10 = new ArrayList();
                        for (BranchEntity branchEntity3 : content4) {
                            BranchEntity.SearchMore searchMore = (((Boolean) function1.invoke(branchEntity3)).booleanValue() && (branchEntity3 instanceof BranchEntity.SearchMore)) ? (BranchEntity.SearchMore) branchEntity3 : null;
                            if (searchMore != null) {
                                arrayList10.add(searchMore);
                            }
                        }
                        List<BranchEntity.SearchMore> listE1 = b70.g.E1(arrayList10, 5);
                        if (listE1.isEmpty()) {
                            objP = EmptyList.f71733a;
                        } else {
                            ArrayList arrayList11 = new ArrayList();
                            for (BranchEntity.SearchMore searchMore2 : listE1) {
                                try {
                                    pVar2 = this.f86586i;
                                } catch (Exception e12) {
                                    e = e12;
                                    branchContainer2 = branchContainer3;
                                }
                                if (pVar2 == null) {
                                    branchContainer2 = branchContainer3;
                                    Intrinsics.m("allAppsStore");
                                    throw null;
                                    break;
                                } else {
                                    branchContainer2 = branchContainer3;
                                    try {
                                        gVar2 = new u10.g(new d(searchMore2, b.a(pVar2, searchMore2, searchMore2.getF66448c(), searchMore2.l(), this.f86580c)), null, 14);
                                    } catch (Exception e13) {
                                        e = e13;
                                    }
                                    if (gVar2 == null) {
                                        arrayList11.add(gVar2);
                                    }
                                    branchContainer3 = branchContainer2;
                                }
                                e = e13;
                                mc0.b bVar2 = mc0.d.f76206a;
                                bVar2.r("NovaBranchSearchManager");
                                bVar2.f(e, "Failed to create BranchAppInfo for " + searchMore2, new Object[0]);
                                gVar2 = null;
                                if (gVar2 == null) {
                                }
                                branchContainer3 = branchContainer2;
                            }
                            BranchContainer branchContainer4 = branchContainer3;
                            CharSequence header2 = branchContainer4.getHeader();
                            if (header2 == null || (string = header2.toString()) == null) {
                                string = "Search in";
                            }
                            r0 r0Var = new r0(string, p1.a(), arrayList11);
                            u10.g gVar7 = (u10.g) b70.g.Y0(arrayList11);
                            if (gVar7 != null) {
                                function02 = null;
                                zVar2 = z2.L0(gVar7, qVar, null, 6);
                                if (zVar2 == null) {
                                }
                                o1 o1Var = zVar2;
                                header = branchContainer4.getHeader();
                                if (header != null || (string = header.toString()) == null) {
                                    String string6 = "Search More";
                                }
                                objP = ul.b.P(new r10.a0(r0Var, (q4) null, string6, o1Var, (EmptyList) null, 50));
                            } else {
                                function02 = null;
                            }
                            zVar2 = new r10.z(r0Var.f90418c, r0Var.f90419d, function02);
                            o1 o1Var2 = zVar2;
                            header = branchContainer4.getHeader();
                            if (header != null) {
                                String string62 = "Search More";
                                objP = ul.b.P(new r10.a0(r0Var, (q4) null, string62, o1Var2, (EmptyList) null, 50));
                            }
                        }
                        if (objP == null) {
                        }
                        it6 = it;
                    }
                    obj = null;
                    objP = obj;
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
                case 153799174:
                    it = it6;
                    if (containerType.equals("related_apps")) {
                        List<BranchEntity> content5 = branchContainer3.getContent();
                        ArrayList arrayList12 = new ArrayList();
                        for (BranchEntity branchEntity4 : content5) {
                            BranchEntity.RelatedApp relatedApp = (((Boolean) function1.invoke(branchEntity4)).booleanValue() && (branchEntity4 instanceof BranchEntity.RelatedApp)) ? (BranchEntity.RelatedApp) branchEntity4 : null;
                            if (relatedApp != null) {
                                arrayList12.add(relatedApp);
                            }
                        }
                        if (arrayList12.isEmpty()) {
                            objP = EmptyList.f71733a;
                        } else {
                            ArrayList arrayList13 = new ArrayList();
                            Iterator it8 = arrayList12.iterator();
                            while (it8.hasNext()) {
                                BranchEntity.RelatedApp relatedApp2 = (BranchEntity.RelatedApp) it8.next();
                                try {
                                    pVar3 = this.f86586i;
                                } catch (Exception e14) {
                                    mc0.b bVar3 = mc0.d.f76206a;
                                    bVar3.r("NovaBranchSearchManager");
                                    bVar3.f(e14, "Failed to create BranchAppInfo for " + relatedApp2, new Object[0]);
                                    gVar3 = null;
                                }
                                if (pVar3 == null) {
                                    Intrinsics.m("allAppsStore");
                                    throw null;
                                    break;
                                } else {
                                    gVar3 = new u10.g(new d(relatedApp2, b.a(pVar3, relatedApp2, relatedApp2.getF66438d(), relatedApp2.l(), this.f86580c)), null, 12);
                                    if (gVar3 != null) {
                                        arrayList13.add(gVar3);
                                    }
                                }
                            }
                            u10.f fVar2 = new u10.f("Related Apps", (Uri) this.f86583f.getValue(), arrayList13);
                            u10.g gVar8 = (u10.g) b70.g.Y0(arrayList13);
                            if (gVar8 != null) {
                                function03 = null;
                                zVar3 = z2.L0(gVar8, qVar, null, 6);
                                if (zVar3 == null) {
                                }
                                objP = ul.b.P(new r10.a0(fVar2, (q4) null, "Related Apps", zVar3, (EmptyList) null, 50));
                            } else {
                                function03 = null;
                            }
                            zVar3 = new r10.z(fVar2.f90374c, fVar2.f90375d, function03);
                            objP = ul.b.P(new r10.a0(fVar2, (q4) null, "Related Apps", zVar3, (EmptyList) null, 50));
                        }
                        if (objP == null) {
                        }
                        it6 = it;
                    }
                    obj = null;
                    objP = obj;
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
                case 676809665:
                    it = it6;
                    if (containerType.equals("shortcut_search")) {
                        branchContainer = branchContainer3;
                        List content6 = branchContainer.getContent();
                        ArrayList arrayList32 = new ArrayList();
                        while (r0.hasNext()) {
                        }
                        HashSet hashSet3 = new HashSet();
                        ArrayList arrayList42 = new ArrayList();
                        it2 = arrayList32.iterator();
                        while (it2.hasNext()) {
                        }
                        HashSet hashSet22 = new HashSet();
                        ArrayList arrayList52 = new ArrayList();
                        it3 = arrayList42.iterator();
                        while (it3.hasNext()) {
                        }
                        ArrayList arrayList62 = new ArrayList(b70.c.u0(arrayList52, 10));
                        it4 = arrayList52.iterator();
                        while (it4.hasNext()) {
                        }
                        objP = b70.g.E1(arrayList62, 3);
                        if (objP == null) {
                        }
                        it6 = it;
                    }
                    obj = null;
                    objP = obj;
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
                case 811329160:
                    it = it6;
                    if (containerType.equals("hero_ad")) {
                        List<BranchEntity> content7 = branchContainer3.getContent();
                        ArrayList arrayList14 = new ArrayList();
                        for (BranchEntity branchEntity5 : content7) {
                            BranchEntity.HeroAd heroAd = (((Boolean) function1.invoke(branchEntity5)).booleanValue() && (branchEntity5 instanceof BranchEntity.HeroAd)) ? (BranchEntity.HeroAd) branchEntity5 : null;
                            if (heroAd != null) {
                                arrayList14.add(heroAd);
                            }
                        }
                        if (!arrayList14.isEmpty()) {
                            BranchEntity.HeroAd heroAd2 = (BranchEntity.HeroAd) b70.g.W0(arrayList14);
                            try {
                                pVar4 = this.f86586i;
                            } catch (Exception e15) {
                                mc0.b bVar4 = mc0.d.f76206a;
                                bVar4.r("NovaBranchSearchManager");
                                bVar4.f(e15, "Failed to create BranchAppInfo for " + heroAd2, new Object[0]);
                                objP2 = EmptyList.f71733a;
                            }
                            if (pVar4 == null) {
                                Intrinsics.m("allAppsStore");
                                throw null;
                                break;
                            } else {
                                d dVar = new d(heroAd2, b.a(pVar4, heroAd2, heroAd2.getF66421d(), heroAd2.m(), this.f86580c));
                                CharSequence charSequenceI = heroAd2.i();
                                if (charSequenceI != null && (string2 = charSequenceI.toString()) != null) {
                                    str = string2;
                                }
                                u10.m mVar = new u10.m(dVar.f57300l.toString(), (Uri) this.f86583f.getValue(), new u10.n(dVar, str, e0.a(heroAd2.getF66421d(), this.f86580c)));
                                objP2 = ul.b.P(new r10.a0(mVar, (q4) null, dVar.f57300l.toString(), new r10.z(mVar.f90392c, mVar.f90393d, null), (EmptyList) null, 50));
                                objP = objP2;
                                if (objP == null) {
                                }
                                it6 = it;
                            }
                        } else {
                            objP = EmptyList.f71733a;
                            if (objP == null) {
                            }
                            it6 = it;
                        }
                    }
                    obj = null;
                    objP = obj;
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
                case 811329761:
                    it = it6;
                    if (containerType.equals("hero_v2")) {
                        List<BranchEntity> content8 = branchContainer3.getContent();
                        ArrayList arrayList15 = new ArrayList();
                        for (BranchEntity branchEntity6 : content8) {
                            BranchEntity.HeroV2 heroV2 = (((Boolean) function1.invoke(branchEntity6)).booleanValue() && (branchEntity6 instanceof BranchEntity.HeroV2)) ? (BranchEntity.HeroV2) branchEntity6 : null;
                            if (heroV2 != null) {
                                arrayList15.add(heroV2);
                            }
                        }
                        if (!arrayList15.isEmpty()) {
                            BranchEntity.HeroV2 heroV22 = (BranchEntity.HeroV2) b70.g.W0(arrayList15);
                            try {
                                pVar5 = this.f86586i;
                            } catch (Exception e16) {
                                mc0.b bVar5 = mc0.d.f76206a;
                                bVar5.r("NovaBranchSearchManager");
                                bVar5.f(e16, "Failed to create BranchAppInfo for " + heroV22, new Object[0]);
                                objP2 = EmptyList.f71733a;
                            }
                            if (pVar5 == null) {
                                Intrinsics.m("allAppsStore");
                                throw null;
                                break;
                            } else {
                                d dVar2 = new d(heroV22, b.a(pVar5, heroV22, heroV22.getF66430d(), heroV22.m(), this.f86580c));
                                CharSequence charSequenceI2 = heroV22.i();
                                if (charSequenceI2 != null && (string3 = charSequenceI2.toString()) != null) {
                                    str = string3;
                                }
                                u10.m mVar2 = new u10.m(dVar2.f57300l.toString(), (Uri) this.f86583f.getValue(), new u10.n(dVar2, str, e0.a(heroV22.getF66430d(), this.f86580c)));
                                objP2 = ul.b.P(new r10.a0(mVar2, (q4) null, dVar2.f57300l.toString(), new r10.z(mVar2.f90392c, mVar2.f90393d, null), (EmptyList) null, 50));
                                objP = objP2;
                                if (objP == null) {
                                }
                                it6 = it;
                            }
                        } else {
                            objP = EmptyList.f71733a;
                            if (objP == null) {
                            }
                            it6 = it;
                        }
                    }
                    obj = null;
                    objP = obj;
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
                case 1642858532:
                    if (containerType.equals("app_store_search")) {
                        List<BranchEntity> content9 = branchContainer3.getContent();
                        ArrayList arrayList16 = new ArrayList();
                        for (BranchEntity branchEntity7 : content9) {
                            BranchEntity.AppStore appStore = (((Boolean) function1.invoke(branchEntity7)).booleanValue() && (branchEntity7 instanceof BranchEntity.AppStore)) ? (BranchEntity.AppStore) branchEntity7 : null;
                            if (appStore != null) {
                                arrayList16.add(appStore);
                            }
                        }
                        if (arrayList16.isEmpty()) {
                            it = it6;
                            objP = EmptyList.f71733a;
                        } else {
                            ArrayList arrayList17 = new ArrayList();
                            Iterator it9 = arrayList16.iterator();
                            while (it9.hasNext()) {
                                BranchEntity.AppStore appStore2 = (BranchEntity.AppStore) it9.next();
                                try {
                                    gVar4 = null;
                                    try {
                                        pVar6 = this.f86586i;
                                    } catch (Exception e17) {
                                        e = e17;
                                        it5 = it6;
                                    }
                                } catch (Exception e18) {
                                    e = e18;
                                    it5 = it6;
                                    gVar4 = null;
                                }
                                if (pVar6 == null) {
                                    it5 = it6;
                                    Intrinsics.m("allAppsStore");
                                    throw null;
                                    break;
                                } else {
                                    it5 = it6;
                                    try {
                                        gVar5 = new u10.g(new d(appStore2, b.a(pVar6, appStore2, appStore2.getF66400d(), appStore2.S(), this.f86580c)), new u10.j(appStore2.getF66402f(), appStore2.getF66403g(), appStore2.getF66404h(), appStore2.getF66405i(), appStore2.getF66408l()), 12);
                                    } catch (Exception e19) {
                                        e = e19;
                                    }
                                    if (gVar5 == null) {
                                        arrayList17.add(gVar5);
                                    }
                                    it6 = it5;
                                }
                                e = e19;
                                mc0.b bVar6 = mc0.d.f76206a;
                                bVar6.r("NovaBranchSearchManager");
                                bVar6.f(e, "Failed to create BranchAppInfo for " + appStore2, new Object[0]);
                                gVar5 = gVar4;
                                if (gVar5 == null) {
                                }
                                it6 = it5;
                            }
                            it = it6;
                            u10.f fVar3 = new u10.f("App Store", (Uri) this.f86583f.getValue(), arrayList17);
                            u10.g gVar9 = (u10.g) b70.g.Y0(arrayList17);
                            if (gVar9 == null || (zVar4 = z2.L0(gVar9, qVar, null, 6)) == null) {
                                zVar4 = new r10.z(fVar3.f90374c, fVar3.f90375d, null);
                            }
                            objP = ul.b.P(new r10.a0(fVar3, (q4) null, "App Store", zVar4, (EmptyList) null, 50));
                        }
                        if (objP == null) {
                        }
                        it6 = it;
                    }
                    break;
                default:
                    it = it6;
                    obj = null;
                    objP = obj;
                    if (objP == null) {
                    }
                    it6 = it;
                    break;
            }
        }
        ArrayList arrayList18 = new ArrayList();
        Iterator it10 = arrayList2.iterator();
        while (it10.hasNext()) {
            b70.d.z0((List) it10.next(), arrayList18);
        }
        return arrayList18;
    }

    public final void k(AppSearchResultsView appSearchResultsView, int i5) {
        this.f86585h.put(appSearchResultsView, Integer.valueOf(i5));
        a80.e eVar = y0.f88884a;
        m0.t(this.f86579b, a80.d.f488c, null, new pu.q(this, appSearchResultsView, null, 20), 2);
    }
}
