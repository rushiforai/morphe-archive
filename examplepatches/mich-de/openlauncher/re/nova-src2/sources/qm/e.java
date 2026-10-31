package qm;

import b2.r;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import k0.i2;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import p1.t;
import p50.i;
import t70.c1;
import t70.m;
import t70.n1;
import t70.u;
import t70.x1;
import v70.s;
import w50.g;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class e {
    public static int a(Boolean bool) {
        if (bool == null) {
            return 1;
        }
        return bool.booleanValue() ? 2 : 3;
    }

    public static int b(String str) {
        if (str == null) {
            throw new NullPointerException("Name is null");
        }
        if (str.equals("UNKNOWN")) {
            return 1;
        }
        if (str.equals("NOT_REQUIRED")) {
            return 2;
        }
        if (str.equals("REQUIRED")) {
            return 3;
        }
        throw new IllegalArgumentException("No enum constant com.google.android.ump.ConsentInformation.PrivacyOptionsRequirementStatus.".concat(str));
    }

    public static String c(r rVar, float f11, t tVar, int i5, t tVar2) {
        i2.b(androidx.compose.foundation.layout.e.g(rVar, f11), tVar);
        return x7.f.Y(tVar2, i5);
    }

    public static HashMap d(Class cls, jm.a aVar) {
        HashMap map = new HashMap();
        map.put(cls, aVar);
        return map;
    }

    public static void e(int i5, int i11, int i12, int i13, int i14) {
        i.e(i5);
        i.e(i11);
        i.e(i12);
        i.e(i13);
        i.e(i14);
    }

    public static void f(String str, String str2, String str3) {
        wf.a.D(str3, str + str2);
    }

    public static /* synthetic */ void g(AtomicReference atomicReference) {
        while (!atomicReference.compareAndSet(null, ub0.e.f90788a) && atomicReference.get() == null) {
        }
    }

    public static /* synthetic */ void h(AtomicReference atomicReference, Object obj) {
        while (!atomicReference.compareAndSet(null, obj) && atomicReference.get() == null) {
        }
    }

    public static /* synthetic */ void i(AtomicReference atomicReference, ub0.c cVar) {
        while (!atomicReference.compareAndSet(null, cVar) && atomicReference.get() == null) {
        }
    }

    public static /* synthetic */ void j(AtomicReference atomicReference, ub0.e eVar) {
        while (!atomicReference.compareAndSet(null, eVar) && atomicReference.get() == null) {
        }
    }

    public static /* synthetic */ void k(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, x1 x1Var, c1 c1Var, n1 n1Var) {
        while (!atomicReferenceFieldUpdater.compareAndSet(x1Var, c1Var, n1Var) && atomicReferenceFieldUpdater.get(x1Var) == c1Var) {
        }
    }

    public static /* synthetic */ boolean l(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, m mVar, Object obj, u uVar) {
        while (!atomicReferenceFieldUpdater.compareAndSet(mVar, obj, uVar)) {
            if (atomicReferenceFieldUpdater.get(mVar) != obj) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean m(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, m mVar, u uVar, u uVar2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(mVar, uVar, uVar2)) {
            if (atomicReferenceFieldUpdater.get(mVar) != uVar) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean n(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, v70.i iVar, Object obj, Throwable th2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(iVar, obj, th2)) {
            if (atomicReferenceFieldUpdater.get(iVar) != obj) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean o(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, v70.i iVar, Object obj, g gVar) {
        while (!atomicReferenceFieldUpdater.compareAndSet(iVar, obj, gVar)) {
            if (atomicReferenceFieldUpdater.get(iVar) != obj) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean p(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, v70.i iVar, y70.t tVar, s sVar) {
        while (!atomicReferenceFieldUpdater.compareAndSet(iVar, tVar, sVar)) {
            if (atomicReferenceFieldUpdater.get(iVar) != tVar) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean q(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, v70.i iVar, y70.t tVar, y70.t tVar2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(iVar, tVar, tVar2)) {
            if (atomicReferenceFieldUpdater.get(iVar) != tVar) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ String r(int i5) {
        return i5 != 1 ? i5 != 2 ? AbstractJsonLexerKt.NULL : "BAD_CONFIG" : "OK";
    }

    public static /* synthetic */ String s(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? AbstractJsonLexerKt.NULL : "BYTES" : "STRING" : "FLOAT" : "INT" : "BOOL";
    }
}
