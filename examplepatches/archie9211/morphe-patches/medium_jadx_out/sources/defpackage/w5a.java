package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w5a extends g75 implements dz7 {
    public int b;
    public int c;
    public int d;
    public x5a e;
    public s6a f;
    public int g;
    public List h;
    public List i;

    public static w5a e() {
        w5a w5aVar = new w5a();
        w5aVar.e = x5a.TRUE;
        w5aVar.f = s6a.t;
        List list = Collections.EMPTY_LIST;
        w5aVar.h = list;
        w5aVar.i = list;
        return w5aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        y5a y5aVarD = d();
        if (y5aVarD.isInitialized()) {
            return y5aVarD;
        }
        throw new UninitializedMessageException();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x001b  */
    @Override // defpackage.g75
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.g75 b(defpackage.tp1 r3, defpackage.q74 r4) throws java.lang.Throwable {
        /*
            r2 = this;
            r0 = 0
            vf6 r1 = defpackage.y5a.m     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            y5a r1 = new y5a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.g(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            y5a r4 = (defpackage.y5a) r4     // Catch: java.lang.Throwable -> Lf
            throw r3     // Catch: java.lang.Throwable -> L17
        L17:
            r3 = move-exception
            r0 = r4
        L19:
            if (r0 == 0) goto L1e
            r2.g(r0)
        L1e:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        g((y5a) s75Var);
        return this;
    }

    public final Object clone() {
        w5a w5aVarE = e();
        w5aVarE.g(d());
        return w5aVarE;
    }

    public final y5a d() {
        y5a y5aVar = new y5a(this);
        int i = this.b;
        int i2 = (i & 1) != 1 ? 0 : 1;
        y5aVar.c = this.c;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        y5aVar.d = this.d;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        y5aVar.e = this.e;
        if ((i & 8) == 8) {
            i2 |= 8;
        }
        y5aVar.f = this.f;
        if ((i & 16) == 16) {
            i2 |= 16;
        }
        y5aVar.g = this.g;
        if ((i & 32) == 32) {
            this.h = DesugarCollections.unmodifiableList(this.h);
            i = this.b & (-33);
            this.b = i;
        }
        y5aVar.h = this.h;
        if ((i & 64) == 64) {
            this.i = DesugarCollections.unmodifiableList(this.i);
            this.b &= -65;
        }
        y5aVar.i = this.i;
        y5aVar.b = i2;
        return y5aVar;
    }

    public final void g(y5a y5aVar) {
        s6a s6aVar;
        if (y5aVar == y5a.l) {
            return;
        }
        int i = y5aVar.b;
        if ((i & 1) == 1) {
            int i2 = y5aVar.c;
            this.b = 1 | this.b;
            this.c = i2;
        }
        if ((i & 2) == 2) {
            int i3 = y5aVar.d;
            this.b = 2 | this.b;
            this.d = i3;
        }
        if ((i & 4) == 4) {
            x5a x5aVar = y5aVar.e;
            x5aVar.getClass();
            this.b = 4 | this.b;
            this.e = x5aVar;
        }
        if ((y5aVar.b & 8) == 8) {
            s6a s6aVar2 = y5aVar.f;
            if ((this.b & 8) != 8 || (s6aVar = this.f) == s6a.t) {
                this.f = s6aVar2;
            } else {
                r6a r6aVarP = s6a.p(s6aVar);
                r6aVarP.h(s6aVar2);
                this.f = r6aVarP.e();
            }
            this.b |= 8;
        }
        if ((y5aVar.b & 16) == 16) {
            int i4 = y5aVar.g;
            this.b = 16 | this.b;
            this.g = i4;
        }
        if (!y5aVar.h.isEmpty()) {
            if (this.h.isEmpty()) {
                this.h = y5aVar.h;
                this.b &= -33;
            } else {
                if ((this.b & 32) != 32) {
                    this.h = new ArrayList(this.h);
                    this.b |= 32;
                }
                this.h.addAll(y5aVar.h);
            }
        }
        if (!y5aVar.i.isEmpty()) {
            if (this.i.isEmpty()) {
                this.i = y5aVar.i;
                this.b &= -65;
            } else {
                if ((this.b & 64) != 64) {
                    this.i = new ArrayList(this.i);
                    this.b |= 64;
                }
                this.i.addAll(y5aVar.i);
            }
        }
        this.a = this.a.e(y5aVar.a);
    }
}
