package com.stripe.android.attestation;

import com.stripe.android.attestation.AttestationActivityResult;
import cv.y;
import dv.r;
import f1.o0;
import fl.l;
import fq.e;
import gq.d;
import h6.f1;
import h6.g1;
import hq.t;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import p10.c0;
import t70.m0;
import w70.t1;
import w70.u1;
import xw.g;

/* loaded from: classes4.dex */
public final class c extends f1 {

    /* renamed from: f, reason: collision with root package name */
    public static final r f42464f;

    /* renamed from: a, reason: collision with root package name */
    public final g f42465a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f42466b;

    /* renamed from: c, reason: collision with root package name */
    public final l f42467c;

    /* renamed from: d, reason: collision with root package name */
    public final t1 f42468d;

    /* renamed from: e, reason: collision with root package name */
    public final t1 f42469e;

    static {
        t tVar = new t(1);
        tVar.b(Reflection.f71864a.getOrCreateKotlinClass(c.class), new o0(10));
        f42464f = tVar.c();
    }

    public c(g gVar, CoroutineContext workContext, l lVar) {
        Intrinsics.g(workContext, "workContext");
        this.f42465a = gVar;
        this.f42466b = workContext;
        this.f42467c = lVar;
        t1 t1VarB = u1.b(1, 0, null, 6);
        this.f42468d = t1VarB;
        this.f42469e = t1VarB;
        m0.t(g1.f(this), workContext, null, new y(this, null, 11), 2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00da, code lost:
    
        if (r11.emit(r4, r0) == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(c cVar, ContinuationImpl continuationImpl) {
        e eVar;
        Object objC;
        c cVar2;
        Object obj;
        c cVar3;
        Throwable thA;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f55576x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f55576x = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(cVar, continuationImpl);
            }
        }
        Object obj2 = eVar.f55574v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f55576x;
        if (i11 == 0) {
            ResultKt.b(obj2);
            l lVar = cVar.f42467c;
            c0.d0((ir.c) lVar.f55375c, ir.b.f68004j);
            lVar.l(d.f57756a);
            g gVar = cVar.f42465a;
            eVar.f55572t = cVar;
            eVar.f55576x = 1;
            objC = gVar.c(eVar);
            if (objC != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj2);
                return Unit.f71706a;
            }
            obj = eVar.f55573u;
            cVar3 = (c) eVar.f55572t;
            ResultKt.b(obj2);
            cVar2 = cVar3;
            thA = Result.a(obj);
            if (thA != null) {
                l lVar2 = cVar2.f42467c;
                lVar2.l(new gq.b(thA, l.j(((ir.a) ((ir.c) lVar2.f55375c)).a(ir.b.f68004j)), 1));
                t1 t1Var = cVar2.f42468d;
                AttestationActivityResult.Failed failed = new AttestationActivityResult.Failed(thA);
                eVar.f55572t = obj;
                eVar.f55573u = null;
                eVar.f55576x = 3;
            }
            return Unit.f71706a;
        }
        cVar = (c) eVar.f55572t;
        ResultKt.b(obj2);
        objC = ((Result) obj2).f71688a;
        Object obj3 = objC;
        cVar2 = cVar;
        obj = obj3;
        int i12 = Result.f71687b;
        if (obj instanceof Result.Failure) {
            thA = Result.a(obj);
            if (thA != null) {
            }
            return Unit.f71706a;
        }
        l lVar3 = cVar2.f42467c;
        lVar3.l(new gq.c(l.j(((ir.a) ((ir.c) lVar3.f55375c)).a(ir.b.f68004j)), 1));
        t1 t1Var2 = cVar2.f42468d;
        AttestationActivityResult.Success success = new AttestationActivityResult.Success((String) obj);
        eVar.f55572t = cVar2;
        eVar.f55573u = obj;
        eVar.f55576x = 2;
        if (t1Var2.emit(success, eVar) != coroutineSingletons) {
            cVar3 = cVar2;
            cVar2 = cVar3;
            thA = Result.a(obj);
            if (thA != null) {
            }
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
