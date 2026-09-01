package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g5a extends g75 implements dz7 {
    public final /* synthetic */ int b;
    public int c;
    public List d;
    public int e;

    public /* synthetic */ g5a(int i) {
        this.b = i;
    }

    @Override // defpackage.g75
    public final q1 a() {
        switch (this.b) {
            case 0:
                h5a h5aVarD = d();
                if (h5aVarD.isInitialized()) {
                    return h5aVarD;
                }
                throw new UninitializedMessageException();
            default:
                y6a y6aVarE = e();
                if (y6aVarE.isInitialized()) {
                    return y6aVarE;
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
            vf6 r0 = defpackage.y6a.h     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r0.getClass()     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            y6a r0 = new y6a     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r2.h(r0)
            return r2
        L14:
            r3 = move-exception
            goto L1e
        L16:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L14
            y6a r4 = (defpackage.y6a) r4     // Catch: java.lang.Throwable -> L14
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
            vf6 r0 = defpackage.h5a.h     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.getClass()     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            h5a r0 = new h5a     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r2.g(r0)
            return r2
        L32:
            r3 = move-exception
            goto L3c
        L34:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L32
            h5a r4 = (defpackage.h5a) r4     // Catch: java.lang.Throwable -> L32
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        switch (this.b) {
            case 0:
                g((h5a) s75Var);
                break;
            default:
                h((y6a) s75Var);
                break;
        }
        return this;
    }

    public final Object clone() {
        switch (this.b) {
            case 0:
                g5a g5aVar = new g5a(0);
                g5aVar.d = Collections.EMPTY_LIST;
                g5aVar.g(d());
                return g5aVar;
            default:
                g5a g5aVar2 = new g5a(1);
                g5aVar2.d = Collections.EMPTY_LIST;
                g5aVar2.e = -1;
                g5aVar2.h(e());
                return g5aVar2;
        }
    }

    public h5a d() {
        h5a h5aVar = new h5a(this);
        int i = this.c;
        int i2 = (i & 1) != 1 ? 0 : 1;
        h5aVar.c = this.e;
        if ((i & 2) == 2) {
            this.d = DesugarCollections.unmodifiableList(this.d);
            this.c &= -3;
        }
        h5aVar.d = this.d;
        h5aVar.b = i2;
        return h5aVar;
    }

    public y6a e() {
        y6a y6aVar = new y6a(this);
        int i = this.c;
        if ((i & 1) == 1) {
            this.d = DesugarCollections.unmodifiableList(this.d);
            this.c &= -2;
        }
        y6aVar.c = this.d;
        int i2 = (i & 2) != 2 ? 0 : 1;
        y6aVar.d = this.e;
        y6aVar.b = i2;
        return y6aVar;
    }

    public void g(h5a h5aVar) {
        if (h5aVar == h5a.g) {
            return;
        }
        if ((h5aVar.b & 1) == 1) {
            int i = h5aVar.c;
            this.c = 1 | this.c;
            this.e = i;
        }
        if (!h5aVar.d.isEmpty()) {
            if (this.d.isEmpty()) {
                this.d = h5aVar.d;
                this.c &= -3;
            } else {
                if ((this.c & 2) != 2) {
                    this.d = new ArrayList(this.d);
                    this.c |= 2;
                }
                this.d.addAll(h5aVar.d);
            }
        }
        this.a = this.a.e(h5aVar.a);
    }

    public void h(y6a y6aVar) {
        if (y6aVar == y6a.g) {
            return;
        }
        if (!y6aVar.c.isEmpty()) {
            if (this.d.isEmpty()) {
                this.d = y6aVar.c;
                this.c &= -2;
            } else {
                if ((this.c & 1) != 1) {
                    this.d = new ArrayList(this.d);
                    this.c |= 1;
                }
                this.d.addAll(y6aVar.c);
            }
        }
        if ((y6aVar.b & 1) == 1) {
            int i = y6aVar.d;
            this.c |= 2;
            this.e = i;
        }
        this.a = this.a.e(y6aVar.a);
    }
}
