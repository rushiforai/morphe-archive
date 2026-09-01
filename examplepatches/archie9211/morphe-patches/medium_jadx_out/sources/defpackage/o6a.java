package defpackage;

import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o6a extends g75 implements dz7 {
    public int b;
    public p6a c;
    public s6a d;
    public int e;

    @Override // defpackage.g75
    public final q1 a() {
        q6a q6aVarD = d();
        if (q6aVarD.isInitialized()) {
            return q6aVarD;
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
            vf6 r1 = defpackage.q6a.i     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            q6a r1 = new q6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.e(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            q6a r4 = (defpackage.q6a) r4     // Catch: java.lang.Throwable -> Lf
            throw r3     // Catch: java.lang.Throwable -> L17
        L17:
            r3 = move-exception
            r0 = r4
        L19:
            if (r0 == 0) goto L1e
            r2.e(r0)
        L1e:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        e((q6a) s75Var);
        return this;
    }

    public final Object clone() {
        o6a o6aVar = new o6a();
        o6aVar.c = p6a.INV;
        o6aVar.d = s6a.t;
        o6aVar.e(d());
        return o6aVar;
    }

    public final q6a d() {
        q6a q6aVar = new q6a(this);
        int i = this.b;
        int i2 = (i & 1) != 1 ? 0 : 1;
        q6aVar.c = this.c;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        q6aVar.d = this.d;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        q6aVar.e = this.e;
        q6aVar.b = i2;
        return q6aVar;
    }

    public final void e(q6a q6aVar) {
        s6a s6aVar;
        if (q6aVar == q6a.h) {
            return;
        }
        if ((q6aVar.b & 1) == 1) {
            p6a p6aVar = q6aVar.c;
            p6aVar.getClass();
            this.b = 1 | this.b;
            this.c = p6aVar;
        }
        if ((q6aVar.b & 2) == 2) {
            s6a s6aVar2 = q6aVar.d;
            if ((this.b & 2) != 2 || (s6aVar = this.d) == s6a.t) {
                this.d = s6aVar2;
            } else {
                r6a r6aVarP = s6a.p(s6aVar);
                r6aVarP.h(s6aVar2);
                this.d = r6aVarP.e();
            }
            this.b |= 2;
        }
        if ((q6aVar.b & 4) == 4) {
            int i = q6aVar.e;
            this.b = 4 | this.b;
            this.e = i;
        }
        this.a = this.a.e(q6aVar.a);
    }
}
