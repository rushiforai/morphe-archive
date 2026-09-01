package defpackage;

import j$.util.DesugarCollections;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zf6 extends g75 implements dz7 {
    public final /* synthetic */ int b;
    public int c;
    public Serializable d;
    public Object e;
    public s75 f;
    public Serializable g;
    public Serializable h;

    public /* synthetic */ zf6(int i) {
        this.b = i;
    }

    public static zf6 g() {
        zf6 zf6Var = new zf6(0);
        zf6Var.d = xf6.g;
        yf6 yf6Var = yf6.g;
        zf6Var.e = yf6Var;
        zf6Var.f = yf6Var;
        zf6Var.g = yf6Var;
        zf6Var.h = yf6Var;
        return zf6Var;
    }

    public static zf6 h() {
        zf6 zf6Var = new zf6(1);
        zf6Var.d = r5a.RETURNS_CONSTANT;
        zf6Var.e = Collections.EMPTY_LIST;
        zf6Var.f = y5a.l;
        zf6Var.g = s5a.AT_MOST_ONCE;
        zf6Var.h = q5a.CONCLUSION_CONDITION;
        return zf6Var;
    }

    @Override // defpackage.g75
    public final q1 a() {
        switch (this.b) {
            case 0:
                ag6 ag6VarD = d();
                if (ag6VarD.isInitialized()) {
                    return ag6VarD;
                }
                throw new UninitializedMessageException();
            default:
                t5a t5aVarE = e();
                if (t5aVarE.isInitialized()) {
                    return t5aVarE;
                }
                throw new UninitializedMessageException();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0020  */
    @Override // defpackage.g75
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.g75 b(defpackage.tp1 r3, defpackage.q74 r4) throws java.lang.Throwable {
        /*
            r2 = this;
            int r0 = r2.b
            r1 = 0
            switch(r0) {
                case 0: goto L24;
                default: goto L6;
            }
        L6:
            vf6 r0 = defpackage.t5a.k     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r0.getClass()     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            t5a r0 = new t5a     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r2.j(r0)
            return r2
        L14:
            r3 = move-exception
            goto L1e
        L16:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L14
            t5a r4 = (defpackage.t5a) r4     // Catch: java.lang.Throwable -> L14
            throw r3     // Catch: java.lang.Throwable -> L1c
        L1c:
            r3 = move-exception
            r1 = r4
        L1e:
            if (r1 == 0) goto L23
            r2.j(r1)
        L23:
            throw r3
        L24:
            vf6 r0 = defpackage.ag6.k     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.getClass()     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            ag6 r0 = new ag6     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r2.i(r0)
            return r2
        L32:
            r3 = move-exception
            goto L3c
        L34:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L32
            ag6 r4 = (defpackage.ag6) r4     // Catch: java.lang.Throwable -> L32
            throw r3     // Catch: java.lang.Throwable -> L3a
        L3a:
            r3 = move-exception
            r1 = r4
        L3c:
            if (r1 == 0) goto L41
            r2.i(r1)
        L41:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zf6.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        switch (this.b) {
            case 0:
                i((ag6) s75Var);
                break;
            default:
                j((t5a) s75Var);
                break;
        }
        return this;
    }

    public final Object clone() {
        switch (this.b) {
            case 0:
                zf6 zf6VarG = g();
                zf6VarG.i(d());
                return zf6VarG;
            default:
                zf6 zf6VarH = h();
                zf6VarH.j(e());
                return zf6VarH;
        }
    }

    public ag6 d() {
        ag6 ag6Var = new ag6(this);
        int i = this.c;
        int i2 = (i & 1) != 1 ? 0 : 1;
        ag6Var.c = (xf6) this.d;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        ag6Var.d = (yf6) this.e;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        ag6Var.e = (yf6) this.f;
        if ((i & 8) == 8) {
            i2 |= 8;
        }
        ag6Var.f = (yf6) this.g;
        if ((i & 16) == 16) {
            i2 |= 16;
        }
        ag6Var.g = (yf6) this.h;
        ag6Var.b = i2;
        return ag6Var;
    }

    public t5a e() {
        t5a t5aVar = new t5a(this);
        int i = this.c;
        int i2 = (i & 1) != 1 ? 0 : 1;
        t5aVar.c = (r5a) this.d;
        if ((i & 2) == 2) {
            this.e = DesugarCollections.unmodifiableList((List) this.e);
            this.c &= -3;
        }
        t5aVar.d = (List) this.e;
        if ((i & 4) == 4) {
            i2 |= 2;
        }
        t5aVar.e = (y5a) this.f;
        if ((i & 8) == 8) {
            i2 |= 4;
        }
        t5aVar.f = (s5a) this.g;
        if ((i & 16) == 16) {
            i2 |= 8;
        }
        t5aVar.g = (q5a) this.h;
        t5aVar.b = i2;
        return t5aVar;
    }

    public void i(ag6 ag6Var) {
        yf6 yf6Var;
        yf6 yf6Var2;
        yf6 yf6Var3;
        yf6 yf6Var4;
        xf6 xf6Var;
        if (ag6Var == ag6.j) {
            return;
        }
        if ((ag6Var.b & 1) == 1) {
            xf6 xf6Var2 = ag6Var.c;
            if ((this.c & 1) != 1 || (xf6Var = (xf6) this.d) == xf6.g) {
                this.d = xf6Var2;
            } else {
                wf6 wf6Var = new wf6(0);
                wf6Var.g(xf6Var);
                wf6Var.g(xf6Var2);
                this.d = wf6Var.d();
            }
            this.c |= 1;
        }
        if ((ag6Var.b & 2) == 2) {
            yf6 yf6Var5 = ag6Var.d;
            if ((this.c & 2) != 2 || (yf6Var4 = (yf6) this.e) == yf6.g) {
                this.e = yf6Var5;
            } else {
                wf6 wf6VarG = yf6.g(yf6Var4);
                wf6VarG.h(yf6Var5);
                this.e = wf6VarG.e();
            }
            this.c |= 2;
        }
        if (ag6Var.g()) {
            yf6 yf6Var6 = ag6Var.e;
            if ((this.c & 4) != 4 || (yf6Var3 = (yf6) this.f) == yf6.g) {
                this.f = yf6Var6;
            } else {
                wf6 wf6VarG2 = yf6.g(yf6Var3);
                wf6VarG2.h(yf6Var6);
                this.f = wf6VarG2.e();
            }
            this.c |= 4;
        }
        if ((ag6Var.b & 8) == 8) {
            yf6 yf6Var7 = ag6Var.f;
            if ((this.c & 8) != 8 || (yf6Var2 = (yf6) this.g) == yf6.g) {
                this.g = yf6Var7;
            } else {
                wf6 wf6VarG3 = yf6.g(yf6Var2);
                wf6VarG3.h(yf6Var7);
                this.g = wf6VarG3.e();
            }
            this.c |= 8;
        }
        if ((ag6Var.b & 16) == 16) {
            yf6 yf6Var8 = ag6Var.g;
            if ((this.c & 16) != 16 || (yf6Var = (yf6) this.h) == yf6.g) {
                this.h = yf6Var8;
            } else {
                wf6 wf6VarG4 = yf6.g(yf6Var);
                wf6VarG4.h(yf6Var8);
                this.h = wf6VarG4.e();
            }
            this.c |= 16;
        }
        this.a = this.a.e(ag6Var.a);
    }

    public void j(t5a t5aVar) {
        y5a y5aVar;
        if (t5aVar == t5a.j) {
            return;
        }
        if ((t5aVar.b & 1) == 1) {
            r5a r5aVar = t5aVar.c;
            r5aVar.getClass();
            this.c = 1 | this.c;
            this.d = r5aVar;
        }
        if (!t5aVar.d.isEmpty()) {
            if (((List) this.e).isEmpty()) {
                this.e = t5aVar.d;
                this.c &= -3;
            } else {
                if ((this.c & 2) != 2) {
                    this.e = new ArrayList((List) this.e);
                    this.c |= 2;
                }
                ((List) this.e).addAll(t5aVar.d);
            }
        }
        if ((t5aVar.b & 2) == 2) {
            y5a y5aVar2 = t5aVar.e;
            if ((this.c & 4) != 4 || (y5aVar = (y5a) this.f) == y5a.l) {
                this.f = y5aVar2;
            } else {
                w5a w5aVarE = w5a.e();
                w5aVarE.g(y5aVar);
                w5aVarE.g(y5aVar2);
                this.f = w5aVarE.d();
            }
            this.c |= 4;
        }
        if ((t5aVar.b & 4) == 4) {
            s5a s5aVar = t5aVar.f;
            s5aVar.getClass();
            this.c |= 8;
            this.g = s5aVar;
        }
        if ((t5aVar.b & 8) == 8) {
            q5a q5aVar = t5aVar.g;
            q5aVar.getClass();
            this.c |= 16;
            this.h = q5aVar;
        }
        this.a = this.a.e(t5aVar.a);
    }
}
