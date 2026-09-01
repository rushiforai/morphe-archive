package defpackage;

import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b7a extends g75 implements dz7 {
    public int b;
    public int c;
    public int d;
    public c7a e;
    public int f;
    public int g;
    public d7a h;

    @Override // defpackage.g75
    public final q1 a() {
        e7a e7aVarD = d();
        if (e7aVarD.isInitialized()) {
            return e7aVarD;
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
            vf6 r0 = defpackage.e7a.l     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r0.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            e7a r0 = new e7a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r0.<init>(r2)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.e(r0)
            return r1
        Lf:
            r2 = move-exception
            goto L19
        L11:
            r2 = move-exception
            q1 r0 = r2.a     // Catch: java.lang.Throwable -> Lf
            e7a r0 = (defpackage.e7a) r0     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b7a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        e((e7a) s75Var);
        return this;
    }

    public final Object clone() {
        b7a b7aVar = new b7a();
        b7aVar.e = c7a.ERROR;
        b7aVar.h = d7a.LANGUAGE_VERSION;
        b7aVar.e(d());
        return b7aVar;
    }

    public final e7a d() {
        e7a e7aVar = new e7a(this);
        int i = this.b;
        int i2 = (i & 1) != 1 ? 0 : 1;
        e7aVar.c = this.c;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        e7aVar.d = this.d;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        e7aVar.e = this.e;
        if ((i & 8) == 8) {
            i2 |= 8;
        }
        e7aVar.f = this.f;
        if ((i & 16) == 16) {
            i2 |= 16;
        }
        e7aVar.g = this.g;
        if ((i & 32) == 32) {
            i2 |= 32;
        }
        e7aVar.h = this.h;
        e7aVar.b = i2;
        return e7aVar;
    }

    public final void e(e7a e7aVar) {
        if (e7aVar == e7a.k) {
            return;
        }
        int i = e7aVar.b;
        if ((i & 1) == 1) {
            int i2 = e7aVar.c;
            this.b = 1 | this.b;
            this.c = i2;
        }
        if ((i & 2) == 2) {
            int i3 = e7aVar.d;
            this.b = 2 | this.b;
            this.d = i3;
        }
        if ((i & 4) == 4) {
            c7a c7aVar = e7aVar.e;
            c7aVar.getClass();
            this.b = 4 | this.b;
            this.e = c7aVar;
        }
        int i4 = e7aVar.b;
        if ((i4 & 8) == 8) {
            int i5 = e7aVar.f;
            this.b = 8 | this.b;
            this.f = i5;
        }
        if ((i4 & 16) == 16) {
            int i6 = e7aVar.g;
            this.b = 16 | this.b;
            this.g = i6;
        }
        if ((i4 & 32) == 32) {
            d7a d7aVar = e7aVar.h;
            d7aVar.getClass();
            this.b = 32 | this.b;
            this.h = d7aVar;
        }
        this.a = this.a.e(e7aVar.a);
    }
}
