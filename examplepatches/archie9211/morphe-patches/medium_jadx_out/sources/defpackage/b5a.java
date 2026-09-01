package defpackage;

import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b5a extends g75 implements dz7 {
    public final /* synthetic */ int b;
    public int c;
    public int d;
    public Object e;

    public /* synthetic */ b5a(int i) {
        this.b = i;
    }

    @Override // defpackage.g75
    public final q1 a() {
        switch (this.b) {
            case 0:
                f5a f5aVarD = d();
                if (f5aVarD.isInitialized()) {
                    return f5aVarD;
                }
                throw new UninitializedMessageException();
            default:
                l5a l5aVarE = e();
                if (l5aVarE.isInitialized()) {
                    return l5aVarE;
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
            vf6 r4 = defpackage.l5a.h     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r4.getClass()     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            l5a r4 = new l5a     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r4.<init>(r3)     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r2.h(r4)
            return r2
        L14:
            r3 = move-exception
            goto L1e
        L16:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L14
            l5a r4 = (defpackage.l5a) r4     // Catch: java.lang.Throwable -> L14
            throw r3     // Catch: java.lang.Throwable -> L1c
        L1c:
            r3 = move-exception
            r1 = r4
        L1e:
            if (r1 == 0) goto L23
            r2.h(r1)
        L23:
            throw r3
        L24:
            vf6 r0 = defpackage.f5a.h     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.getClass()     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            f5a r0 = new f5a     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r2.g(r0)
            return r2
        L32:
            r3 = move-exception
            goto L3c
        L34:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L32
            f5a r4 = (defpackage.f5a) r4     // Catch: java.lang.Throwable -> L32
            throw r3     // Catch: java.lang.Throwable -> L3a
        L3a:
            r3 = move-exception
            r1 = r4
        L3c:
            if (r1 == 0) goto L41
            r2.g(r1)
        L41:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        switch (this.b) {
            case 0:
                g((f5a) s75Var);
                break;
            default:
                h((l5a) s75Var);
                break;
        }
        return this;
    }

    public final Object clone() {
        switch (this.b) {
            case 0:
                b5a b5aVar = new b5a(0);
                b5aVar.e = e5a.p;
                b5aVar.g(d());
                return b5aVar;
            default:
                b5a b5aVar2 = new b5a(1);
                b5aVar2.e = g21.a;
                b5aVar2.h(e());
                return b5aVar2;
        }
    }

    public f5a d() {
        f5a f5aVar = new f5a(this);
        int i = this.c;
        int i2 = (i & 1) != 1 ? 0 : 1;
        f5aVar.c = this.d;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        f5aVar.d = (e5a) this.e;
        f5aVar.b = i2;
        return f5aVar;
    }

    public l5a e() {
        l5a l5aVar = new l5a(this);
        int i = this.c;
        int i2 = (i & 1) != 1 ? 0 : 1;
        l5aVar.c = this.d;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        l5aVar.d = (c57) this.e;
        l5aVar.b = i2;
        return l5aVar;
    }

    public void g(f5a f5aVar) {
        e5a e5aVar;
        if (f5aVar == f5a.g) {
            return;
        }
        int i = f5aVar.b;
        if ((i & 1) == 1) {
            int i2 = f5aVar.c;
            this.c = 1 | this.c;
            this.d = i2;
        }
        if ((i & 2) == 2) {
            e5a e5aVar2 = f5aVar.d;
            if ((this.c & 2) != 2 || (e5aVar = (e5a) this.e) == e5a.p) {
                this.e = e5aVar2;
            } else {
                c5a c5aVarE = c5a.e();
                c5aVarE.g(e5aVar);
                c5aVarE.g(e5aVar2);
                this.e = c5aVarE.d();
            }
            this.c |= 2;
        }
        this.a = this.a.e(f5aVar.a);
    }

    public void h(l5a l5aVar) {
        if (l5aVar == l5a.g) {
            return;
        }
        int i = l5aVar.b;
        if ((i & 1) == 1) {
            int i2 = l5aVar.c;
            this.c = 1 | this.c;
            this.d = i2;
        }
        if ((i & 2) == 2) {
            c57 c57Var = l5aVar.d;
            c57Var.getClass();
            this.c = 2 | this.c;
            this.e = c57Var;
        }
        this.a = this.a.e(l5aVar.a);
    }
}
