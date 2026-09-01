package defpackage;

import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j6a extends g75 implements dz7 {
    public int b;
    public int c;
    public int d;
    public k6a e;

    @Override // defpackage.g75
    public final q1 a() {
        l6a l6aVarD = d();
        if (l6aVarD.isInitialized()) {
            return l6aVarD;
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
            vf6 r0 = defpackage.l6a.i     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r0.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            l6a r0 = new l6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r0.<init>(r2)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.e(r0)
            return r1
        Lf:
            r2 = move-exception
            goto L19
        L11:
            r2 = move-exception
            q1 r0 = r2.a     // Catch: java.lang.Throwable -> Lf
            l6a r0 = (defpackage.l6a) r0     // Catch: java.lang.Throwable -> Lf
            throw r2     // Catch: java.lang.Throwable -> L17
        L17:
            r2 = move-exception
            r3 = r0
        L19:
            if (r3 == 0) goto L1e
            r1.e(r3)
        L1e:
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        e((l6a) s75Var);
        return this;
    }

    public final Object clone() {
        j6a j6aVar = new j6a();
        j6aVar.c = -1;
        j6aVar.e = k6a.PACKAGE;
        j6aVar.e(d());
        return j6aVar;
    }

    public final l6a d() {
        l6a l6aVar = new l6a(this);
        int i = this.b;
        int i2 = (i & 1) != 1 ? 0 : 1;
        l6aVar.c = this.c;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        l6aVar.d = this.d;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        l6aVar.e = this.e;
        l6aVar.b = i2;
        return l6aVar;
    }

    public final void e(l6a l6aVar) {
        if (l6aVar == l6a.h) {
            return;
        }
        int i = l6aVar.b;
        if ((i & 1) == 1) {
            int i2 = l6aVar.c;
            this.b = 1 | this.b;
            this.c = i2;
        }
        if ((i & 2) == 2) {
            int i3 = l6aVar.d;
            this.b = 2 | this.b;
            this.d = i3;
        }
        if ((i & 4) == 4) {
            k6a k6aVar = l6aVar.e;
            k6aVar.getClass();
            this.b = 4 | this.b;
            this.e = k6aVar;
        }
        this.a = this.a.e(l6aVar.a);
    }
}
