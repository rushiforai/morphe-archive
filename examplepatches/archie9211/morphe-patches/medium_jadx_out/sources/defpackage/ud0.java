package defpackage;

import android.os.Bundle;
import com.google.android.libraries.identity.googleid.GoogleIdTokenParsingException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ud0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ n4 d;
    public final /* synthetic */ yd0 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ud0(n4 n4Var, yd0 yd0Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = n4Var;
        this.e = yd0Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        yd0 yd0Var = this.e;
        n4 n4Var = this.d;
        switch (i) {
            case 0:
                return new ud0(n4Var, yd0Var, n92Var, 0);
            default:
                return new ud0(n4Var, yd0Var, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((ud0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        yd0 yd0Var = this.e;
        n4 n4Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1 || i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (!(n4Var instanceof tl2)) {
                    this.c = 2;
                    if (yd0Var.o(n4Var, this) != tb2Var) {
                        return c1eVar;
                    }
                } else {
                    if (g76.L((String) n4Var.a, "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL")) {
                        try {
                            yd0Var.s(new tg2(v4.d((Bundle) n4Var.b).c));
                            return c1eVar;
                        } catch (GoogleIdTokenParsingException e) {
                            yd0Var.n(e);
                            return c1eVar;
                        }
                    }
                    this.c = 1;
                    if (yd0Var.o(n4Var, this) != tb2Var) {
                        return c1eVar;
                    }
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1 || i3 == 2 || i3 == 3) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (!(n4Var instanceof tl2)) {
                    this.c = 3;
                    if (yd0Var.o(n4Var, this) != tb2Var2) {
                        return c1eVar;
                    }
                } else if (g76.L((String) n4Var.a, "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL")) {
                    try {
                        yd0Var.s(new tg2(v4.d((Bundle) n4Var.b).c));
                        return c1eVar;
                    } catch (GoogleIdTokenParsingException unused) {
                        r6c r6cVar = yd0Var.p;
                        this.c = 1;
                        if (r6cVar.a(id0.a, this) != tb2Var2) {
                            return c1eVar;
                        }
                    }
                } else {
                    this.c = 2;
                    if (yd0Var.o(n4Var, this) != tb2Var2) {
                        return c1eVar;
                    }
                }
                return tb2Var2;
        }
    }
}
