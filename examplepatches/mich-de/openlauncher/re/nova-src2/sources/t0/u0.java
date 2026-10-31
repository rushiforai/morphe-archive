package t0;

import c3.c3;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class u0 {

    /* renamed from: a, reason: collision with root package name */
    public final c3 f88222a;

    /* renamed from: b, reason: collision with root package name */
    public v0 f88223b;

    /* renamed from: c, reason: collision with root package name */
    public g2.j f88224c;

    public u0(c3 c3Var) {
        this.f88222a = c3Var;
    }

    public final v0 a() {
        v0 v0Var = this.f88223b;
        if (v0Var != null) {
            return v0Var;
        }
        Intrinsics.m("keyboardActions");
        throw null;
    }

    public final boolean b(int i5) {
        Function1 function1;
        c3 c3Var;
        if (i5 == 7) {
            function1 = a().f88239a;
        } else if (i5 == 2) {
            function1 = a().f88240b;
        } else if (i5 == 6) {
            function1 = a().f88241c;
        } else if (i5 == 5) {
            function1 = a().f88242d;
        } else if (i5 == 3) {
            function1 = a().f88243e;
        } else if (i5 == 4) {
            function1 = a().f88244f;
        } else {
            if (i5 != 1 && i5 != 0) {
                throw new IllegalStateException("invalid ImeAction");
            }
            function1 = null;
        }
        if (function1 != null) {
            function1.invoke(this);
            return true;
        }
        if (i5 == 6) {
            g2.j jVar = this.f88224c;
            if (jVar != null) {
                ((g2.l) jVar).i(1);
                return true;
            }
            Intrinsics.m("focusManager");
            throw null;
        }
        if (i5 != 5) {
            if (i5 != 7 || (c3Var = this.f88222a) == null) {
                return false;
            }
            ((c3.b2) c3Var).a();
            return true;
        }
        g2.j jVar2 = this.f88224c;
        if (jVar2 != null) {
            ((g2.l) jVar2).i(2);
            return true;
        }
        Intrinsics.m("focusManager");
        throw null;
    }
}
