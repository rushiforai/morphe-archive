package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cg6 extends g75 implements dz7 {
    public int b;
    public int c;
    public int d;
    public Object e;
    public dg6 f;
    public List g;
    public List h;

    public static cg6 e() {
        cg6 cg6Var = new cg6();
        cg6Var.c = 1;
        cg6Var.e = "";
        cg6Var.f = dg6.NONE;
        List list = Collections.EMPTY_LIST;
        cg6Var.g = list;
        cg6Var.h = list;
        return cg6Var;
    }

    @Override // defpackage.g75
    public final q1 a() {
        eg6 eg6VarD = d();
        if (eg6VarD.isInitialized()) {
            return eg6VarD;
        }
        throw new UninitializedMessageException();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x001b  */
    @Override // defpackage.g75
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.g75 b(defpackage.tp1 r2, defpackage.q74 r3) throws java.lang.Throwable {
        /*
            r1 = this;
            r3 = 0
            vf6 r0 = defpackage.eg6.n     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r0.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            eg6 r0 = new eg6     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r0.<init>(r2)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.g(r0)
            return r1
        Lf:
            r2 = move-exception
            goto L19
        L11:
            r2 = move-exception
            q1 r0 = r2.a     // Catch: java.lang.Throwable -> Lf
            eg6 r0 = (defpackage.eg6) r0     // Catch: java.lang.Throwable -> Lf
            throw r2     // Catch: java.lang.Throwable -> L17
        L17:
            r2 = move-exception
            r3 = r0
        L19:
            if (r3 == 0) goto L1e
            r1.g(r3)
        L1e:
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cg6.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        g((eg6) s75Var);
        return this;
    }

    public final Object clone() {
        cg6 cg6VarE = e();
        cg6VarE.g(d());
        return cg6VarE;
    }

    public final eg6 d() {
        eg6 eg6Var = new eg6(this);
        int i = this.b;
        int i2 = (i & 1) != 1 ? 0 : 1;
        eg6Var.c = this.c;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        eg6Var.d = this.d;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        eg6Var.e = this.e;
        if ((i & 8) == 8) {
            i2 |= 8;
        }
        eg6Var.f = this.f;
        if ((i & 16) == 16) {
            this.g = DesugarCollections.unmodifiableList(this.g);
            i = this.b & (-17);
            this.b = i;
        }
        eg6Var.g = this.g;
        if ((i & 32) == 32) {
            this.h = DesugarCollections.unmodifiableList(this.h);
            this.b &= -33;
        }
        eg6Var.i = this.h;
        eg6Var.b = i2;
        return eg6Var;
    }

    public final void g(eg6 eg6Var) {
        if (eg6Var == eg6.m) {
            return;
        }
        int i = eg6Var.b;
        if ((i & 1) == 1) {
            int i2 = eg6Var.c;
            this.b = 1 | this.b;
            this.c = i2;
        }
        if ((i & 2) == 2) {
            int i3 = eg6Var.d;
            this.b = 2 | this.b;
            this.d = i3;
        }
        if ((i & 4) == 4) {
            this.b |= 4;
            this.e = eg6Var.e;
        }
        if ((i & 8) == 8) {
            dg6 dg6Var = eg6Var.f;
            dg6Var.getClass();
            this.b = 8 | this.b;
            this.f = dg6Var;
        }
        if (!eg6Var.g.isEmpty()) {
            if (this.g.isEmpty()) {
                this.g = eg6Var.g;
                this.b &= -17;
            } else {
                if ((this.b & 16) != 16) {
                    this.g = new ArrayList(this.g);
                    this.b |= 16;
                }
                this.g.addAll(eg6Var.g);
            }
        }
        if (!eg6Var.i.isEmpty()) {
            if (this.h.isEmpty()) {
                this.h = eg6Var.i;
                this.b &= -33;
            } else {
                if ((this.b & 32) != 32) {
                    this.h = new ArrayList(this.h);
                    this.b |= 32;
                }
                this.h.addAll(eg6Var.i);
            }
        }
        this.a = this.a.e(eg6Var.a);
    }
}
