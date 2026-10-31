package r10;

import android.content.Context;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import android.text.Html;
import android.text.Spanned;
import e00.q4;
import e10.y2;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.AbstractCollection;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.MatcherMatchResult$groupValues$1;
import w70.g2;

/* loaded from: classes.dex */
public final class v1 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f85273a;

    /* renamed from: b, reason: collision with root package name */
    public final g20.w f85274b;

    public v1() {
        Context context = mx.g0.f77088a;
        this.f85274b = mx.g0.c();
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x02be  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01bc  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01be  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01d2  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01ea  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0244  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x026b  */
    /* JADX WARN: Type inference failed for: r1v15, types: [g20.j] */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Continuation continuation) {
        Iterable iterable;
        boolean z11;
        Uri uri;
        r80.x[] xVarArr;
        boolean z12;
        Spanned spannedFromHtml;
        String strX;
        int i5;
        int length;
        int i11;
        final g20.i iVar;
        UserHandle userHandleE;
        s1 s1Var;
        boolean z13;
        s1 a0Var;
        kotlin.text.b bVarE;
        Object next;
        u10.e0 e0Var;
        k30.h0 h0Var;
        k30.x xVar;
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        boolean zBooleanValue = ((Boolean) y2.o().l()).booleanValue();
        boolean zBooleanValue2 = ((Boolean) y2Var.d0().l()).booleanValue();
        final g20.w wVar = this.f85274b;
        ja.h hVar = wVar.f57004c;
        Uri uri2 = g20.w.n;
        g20.x xVar2 = wVar.f57005d;
        if (wVar.i()) {
            EnumSet enumSetCopyOf = EnumSet.copyOf(zBooleanValue ? g20.w.f57001m : g20.w.f57000l);
            enumSetCopyOf.add(r80.d.f85662i);
            r80.x[] xVarArrSearch = wVar.d().search(2000L, str, null, enumSetCopyOf, true, 11, null, -1, r80.b.values());
            ArrayList arrayList = new ArrayList();
            int length2 = xVarArrSearch.length;
            int i12 = 0;
            int i13 = 0;
            while (i12 < length2) {
                r80.x xVar3 = xVarArrSearch[i12];
                int i14 = i13 + 1;
                r80.y yVar = xVar3.f85729k;
                String str2 = xVar3.f85722d;
                r80.d dVar = xVar3.f85720b;
                r80.w wVarD = yVar.d();
                if (dVar == r80.d.f85662i && (wVarD instanceof r80.t)) {
                    Iterator it = ((Iterable) ((g2) wVar.f57006e.getValue()).getValue()).iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            z11 = zBooleanValue2;
                            next = null;
                            break;
                        }
                        next = it.next();
                        e20.k kVar = (e20.k) next;
                        z11 = zBooleanValue2;
                        if (Intrinsics.b(kVar.f52041c.f90373a, ((r80.t) wVarD).c())) {
                            u10.e0 e0Var2 = kVar.f52041c;
                            if (!(e0Var2 instanceof u10.c)) {
                                if (!(e0Var2 instanceof u10.c0)) {
                                    break;
                                }
                                y2.f51877a.getClass();
                                if (((Boolean) y2.k0().l()).booleanValue()) {
                                    break;
                                }
                            } else {
                                continue;
                            }
                        }
                        zBooleanValue2 = z11;
                    }
                    e20.k kVar2 = (e20.k) next;
                    if (kVar2 == null || (e0Var = kVar2.f52041c) == null) {
                        xVarArr = xVarArrSearch;
                        i5 = i12;
                        a0Var = null;
                        z13 = false;
                    } else {
                        u10.e0 e0Var3 = ((e0Var instanceof u10.w0) && ((h0Var = k30.h0.f70974r) == null || (xVar = h0Var.f70981g) == null || !xVar.a())) ? null : e0Var;
                        if (e0Var3 != null) {
                            xVarArr = xVarArrSearch;
                            i5 = i12;
                            a0Var = new a0(e0Var3, new q4(10, wVar, (r80.t) wVarD), Html.fromHtml(str2, 0, null, xVar2), (o1) null, (EmptyList) null, 56);
                        }
                        z13 = false;
                    }
                } else {
                    z11 = zBooleanValue2;
                    Uri uriA = o0.a(xVar3);
                    if (dVar == r80.d.f85661h && Intrinsics.b(xVar3.f85719a, "com.google.android.calendar") && (bVarE = wVar.f57010i.e(str2)) != null && ((AbstractCollection) bVarE.a()).c() == 4) {
                        uri = uriA;
                        xVarArr = xVarArrSearch;
                        if (wVar.f57011j.f(wVar.f57012k.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (CharSequence) ((MatcherMatchResult$groupValues$1) bVarE.a()).get(2)))) {
                            z12 = true;
                            str2 = ((MatcherMatchResult$groupValues$1) bVarE.a()).get(1) + ": " + ((MatcherMatchResult$groupValues$1) bVarE.a()).get(3);
                            spannedFromHtml = Html.fromHtml((String) ((MatcherMatchResult$groupValues$1) bVarE.a()).get(2), 0);
                        }
                        strX = str2;
                        Uri uri3 = uri != null ? uri2 : uri;
                        Intrinsics.e(uri3, "null cannot be cast to non-null type android.net.Uri");
                        i5 = i12;
                        g20.i iVar2 = new g20.i(wVar, xVar3.f85729k, uri3, ic.b.y(dVar), i13 != 0 ? z12 : false);
                        r80.y[] yVarArr = xVar3.f85730l;
                        ArrayList arrayList2 = new ArrayList(yVarArr.length);
                        length = yVarArr.length;
                        i11 = 0;
                        while (i11 < length) {
                            ArrayList arrayList3 = arrayList2;
                            r80.y yVar2 = yVarArr[i11];
                            r80.y[] yVarArr2 = yVarArr;
                            Uri uriA2 = yVar2.a();
                            if (uriA2 == null) {
                                uriA2 = uri2;
                            }
                            int i15 = i11;
                            int i16 = length;
                            g20.i iVar3 = iVar2;
                            arrayList3.add(new g20.i(wVar, yVar2, uriA2, ic.b.y(yVar2.f()), i13 == 0 ? z12 : false));
                            i11 = i15 + 1;
                            arrayList2 = arrayList3;
                            yVarArr = yVarArr2;
                            length = i16;
                            iVar2 = iVar3;
                            z12 = true;
                        }
                        ArrayList arrayList4 = arrayList2;
                        iVar = iVar2;
                        userHandleE = hVar.e(xVar3.f85729k.g());
                        if (userHandleE == null && hVar.h(userHandleE)) {
                            strX = ic.b.x(strX, "dual");
                        } else if (userHandleE != null && !userHandleE.equals(Process.myUserHandle())) {
                            strX = ic.b.x(strX, "work");
                        }
                        Spanned spannedFromHtml2 = Html.fromHtml(strX, 0, null, xVar2);
                        u10.p0 p0VarW = ic.b.w(xVar3);
                        if (iVar.e().f() == r80.d.f85660g) {
                            ArrayList arrayList5 = arrayList4;
                            if (p0VarW != null) {
                                if (arrayList5.isEmpty()) {
                                    arrayList5 = null;
                                }
                                if (arrayList5 == null) {
                                    List<x10.a> listQ = ul.b.Q(x10.a.f94978b, x10.a.f94979c, x10.a.f94980d, x10.a.f94982f, x10.a.f94981e);
                                    ArrayList arrayList6 = new ArrayList(b70.c.u0(listQ, 10));
                                    for (x10.a aVar : listQ) {
                                        arrayList6.add(new x1(wVar.f57002a.getString(aVar.d()), aVar.b(), pp.b0.f82691d, aVar.c(p0VarW.f90406c, p0VarW.f90407d), null));
                                    }
                                    arrayList5 = arrayList6;
                                }
                                final int i17 = 2;
                                s1Var = new a0(p0VarW, new Function0() { // from class: g20.j
                                    @Override // kotlin.jvm.functions.Function0
                                    public final Object invoke() {
                                        switch (i17) {
                                            case 0:
                                                w.k(wVar, iVar.f56942e.f85732a);
                                                break;
                                            case 1:
                                                w.k(wVar, iVar.f56942e.f85732a);
                                                break;
                                            default:
                                                w.k(wVar, iVar.f56942e.f85732a);
                                                break;
                                        }
                                        return Unit.f71706a;
                                    }
                                }, spannedFromHtml2, iVar, arrayList5, spannedFromHtml);
                            } else {
                                z13 = false;
                                s1Var = new s1(iVar, Html.fromHtml(strX, 0, null, xVar2), arrayList5, null, spannedFromHtml, null, 104);
                                a0Var = s1Var;
                            }
                        } else if (z11) {
                            r80.y yVarE = iVar.e();
                            String strC = yVarE.c();
                            Uri uriA3 = yVarE.a();
                            if (uriA3 == null) {
                                uriA3 = p6.j.d(yVarE.c(), null);
                            }
                            u10.z zVar = new u10.z(strC, uriA3, iVar, arrayList4);
                            final int i18 = 0;
                            s1Var = new a0(zVar, new Function0() { // from class: g20.j
                                @Override // kotlin.jvm.functions.Function0
                                public final Object invoke() {
                                    switch (i18) {
                                        case 0:
                                            w.k(wVar, iVar.f56942e.f85732a);
                                            break;
                                        case 1:
                                            w.k(wVar, iVar.f56942e.f85732a);
                                            break;
                                        default:
                                            w.k(wVar, iVar.f56942e.f85732a);
                                            break;
                                    }
                                    return Unit.f71706a;
                                }
                            }, spannedFromHtml2, iVar, arrayList4, spannedFromHtml);
                        } else {
                            final int i19 = 1;
                            s1Var = new b0(iVar, spannedFromHtml2, new Function0() { // from class: g20.j
                                @Override // kotlin.jvm.functions.Function0
                                public final Object invoke() {
                                    switch (i19) {
                                        case 0:
                                            w.k(wVar, iVar.f56942e.f85732a);
                                            break;
                                        case 1:
                                            w.k(wVar, iVar.f56942e.f85732a);
                                            break;
                                        default:
                                            w.k(wVar, iVar.f56942e.f85732a);
                                            break;
                                    }
                                    return Unit.f71706a;
                                }
                            }, null, arrayList4, "SSML", 8);
                        }
                        z13 = false;
                        a0Var = s1Var;
                    } else {
                        uri = uriA;
                        xVarArr = xVarArrSearch;
                    }
                    z12 = true;
                    spannedFromHtml = null;
                    strX = str2;
                    if (uri != null) {
                    }
                    Intrinsics.e(uri3, "null cannot be cast to non-null type android.net.Uri");
                    i5 = i12;
                    g20.i iVar22 = new g20.i(wVar, xVar3.f85729k, uri3, ic.b.y(dVar), i13 != 0 ? z12 : false);
                    r80.y[] yVarArr3 = xVar3.f85730l;
                    ArrayList arrayList22 = new ArrayList(yVarArr3.length);
                    length = yVarArr3.length;
                    i11 = 0;
                    while (i11 < length) {
                    }
                    ArrayList arrayList42 = arrayList22;
                    iVar = iVar22;
                    userHandleE = hVar.e(xVar3.f85729k.g());
                    if (userHandleE == null) {
                        if (userHandleE != null) {
                            strX = ic.b.x(strX, "work");
                        }
                        Spanned spannedFromHtml22 = Html.fromHtml(strX, 0, null, xVar2);
                        u10.p0 p0VarW2 = ic.b.w(xVar3);
                        if (iVar.e().f() == r80.d.f85660g) {
                        }
                        z13 = false;
                        a0Var = s1Var;
                    }
                }
                if (a0Var != null) {
                    arrayList.add(a0Var);
                }
                i12 = i5 + 1;
                i13 = i14;
                zBooleanValue2 = z11;
                xVarArrSearch = xVarArr;
            }
            iterable = arrayList;
        } else {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("SSML");
            bVar.n("SSML searchShortcuts called with awaitInited false, returning empty results", new Object[0]);
            iterable = EmptyList.f71733a;
        }
        ArrayList arrayList7 = new ArrayList();
        for (Object obj : iterable) {
            if (b70.g.E1(ul.b.Q(pp.b0.f82692e, pp.b0.f82699l), 3).contains(((s1) obj).a().f85200c)) {
                arrayList7.add(obj);
            }
        }
        return arrayList7;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(a7.f fVar, Continuation continuation) {
        u1 u1Var;
        v1 v1Var;
        if (continuation instanceof u1) {
            u1Var = (u1) continuation;
            int i5 = u1Var.f85262w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u1Var.f85262w = i5 - Integer.MIN_VALUE;
            } else {
                u1Var = new u1(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = u1Var.f85260u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = u1Var.f85262w;
        if (i11 == 0) {
            ResultKt.b(objA);
            u1Var.f85259t = this;
            u1Var.f85262w = 1;
            objA = this.f85274b.a(u1Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            v1Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            v1Var = u1Var.f85259t;
            ResultKt.b(objA);
        }
        v1Var.f85273a = ((Boolean) objA).booleanValue();
        return Unit.f71706a;
    }

    @Override // r10.q0
    public final boolean d() {
        return false;
    }

    @Override // r10.q0
    public final boolean e() {
        return false;
    }

    @Override // r10.q0
    public final int f() {
        return 6;
    }

    @Override // r10.q0
    public final String getName() {
        return "SSML";
    }

    @Override // r10.q0
    public final boolean isReady() {
        return this.f85273a;
    }
}
