package defpackage;

import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wf6 extends g75 implements dz7 {
    public final /* synthetic */ int b;
    public int c;
    public int d;
    public int e;

    public /* synthetic */ wf6(int i) {
        this.b = i;
    }

    @Override // defpackage.g75
    public final q1 a() {
        switch (this.b) {
            case 0:
                xf6 xf6VarD = d();
                if (xf6VarD.isInitialized()) {
                    return xf6VarD;
                }
                throw new UninitializedMessageException();
            default:
                yf6 yf6VarE = e();
                if (yf6VarE.isInitialized()) {
                    return yf6VarE;
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
    public final defpackage.g75 b(defpackage.tp1 r2, defpackage.q74 r3) throws java.lang.Throwable {
        /*
            r1 = this;
            int r3 = r1.b
            r0 = 0
            switch(r3) {
                case 0: goto L24;
                default: goto L6;
            }
        L6:
            vf6 r3 = defpackage.yf6.h     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r3.getClass()     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            yf6 r3 = new yf6     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r3.<init>(r2)     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r1.h(r3)
            return r1
        L14:
            r2 = move-exception
            goto L1e
        L16:
            r2 = move-exception
            q1 r3 = r2.a     // Catch: java.lang.Throwable -> L14
            yf6 r3 = (defpackage.yf6) r3     // Catch: java.lang.Throwable -> L14
            throw r2     // Catch: java.lang.Throwable -> L1c
        L1c:
            r2 = move-exception
            r0 = r3
        L1e:
            if (r0 == 0) goto L23
            r1.h(r0)
        L23:
            throw r2
        L24:
            vf6 r3 = defpackage.xf6.h     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r3.getClass()     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            xf6 r3 = new xf6     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r3.<init>(r2)     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r1.g(r3)
            return r1
        L32:
            r2 = move-exception
            goto L3c
        L34:
            r2 = move-exception
            q1 r3 = r2.a     // Catch: java.lang.Throwable -> L32
            xf6 r3 = (defpackage.xf6) r3     // Catch: java.lang.Throwable -> L32
            throw r2     // Catch: java.lang.Throwable -> L3a
        L3a:
            r2 = move-exception
            r0 = r3
        L3c:
            if (r0 == 0) goto L41
            r1.g(r0)
        L41:
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wf6.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        switch (this.b) {
            case 0:
                g((xf6) s75Var);
                break;
            default:
                h((yf6) s75Var);
                break;
        }
        return this;
    }

    public final Object clone() {
        switch (this.b) {
            case 0:
                wf6 wf6Var = new wf6(0);
                wf6Var.g(d());
                return wf6Var;
            default:
                wf6 wf6Var2 = new wf6(1);
                wf6Var2.h(e());
                return wf6Var2;
        }
    }

    public xf6 d() {
        xf6 xf6Var = new xf6(this);
        int i = this.c;
        int i2 = (i & 1) != 1 ? 0 : 1;
        xf6Var.c = this.d;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        xf6Var.d = this.e;
        xf6Var.b = i2;
        return xf6Var;
    }

    public yf6 e() {
        yf6 yf6Var = new yf6(this);
        int i = this.c;
        int i2 = (i & 1) != 1 ? 0 : 1;
        yf6Var.c = this.d;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        yf6Var.d = this.e;
        yf6Var.b = i2;
        return yf6Var;
    }

    public void g(xf6 xf6Var) {
        if (xf6Var == xf6.g) {
            return;
        }
        int i = xf6Var.b;
        if ((i & 1) == 1) {
            int i2 = xf6Var.c;
            this.c = 1 | this.c;
            this.d = i2;
        }
        if ((i & 2) == 2) {
            int i3 = xf6Var.d;
            this.c = 2 | this.c;
            this.e = i3;
        }
        this.a = this.a.e(xf6Var.a);
    }

    public void h(yf6 yf6Var) {
        if (yf6Var == yf6.g) {
            return;
        }
        int i = yf6Var.b;
        if ((i & 1) == 1) {
            int i2 = yf6Var.c;
            this.c = 1 | this.c;
            this.d = i2;
        }
        if ((i & 2) == 2) {
            int i3 = yf6Var.d;
            this.c = 2 | this.c;
            this.e = i3;
        }
        this.a = this.a.e(yf6Var.a);
    }
}
