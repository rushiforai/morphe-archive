package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u5a extends k75 {
    public int d;
    public int e;
    public List f;

    @Override // defpackage.g75
    public final q1 a() {
        v5a v5aVarE = e();
        if (v5aVarE.isInitialized()) {
            return v5aVarE;
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
            vf6 r1 = defpackage.v5a.i     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            v5a r1 = new v5a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.g(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            v5a r4 = (defpackage.v5a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        g((v5a) s75Var);
        return this;
    }

    public final Object clone() {
        u5a u5aVar = new u5a();
        u5aVar.f = Collections.EMPTY_LIST;
        u5aVar.g(e());
        return u5aVar;
    }

    public final v5a e() {
        v5a v5aVar = new v5a(this);
        int i = this.d;
        int i2 = (i & 1) != 1 ? 0 : 1;
        v5aVar.d = this.e;
        if ((i & 2) == 2) {
            this.f = DesugarCollections.unmodifiableList(this.f);
            this.d &= -3;
        }
        v5aVar.e = this.f;
        v5aVar.c = i2;
        return v5aVar;
    }

    public final void g(v5a v5aVar) {
        if (v5aVar == v5a.h) {
            return;
        }
        if ((v5aVar.c & 1) == 1) {
            int i = v5aVar.d;
            this.d = 1 | this.d;
            this.e = i;
        }
        if (!v5aVar.e.isEmpty()) {
            if (this.f.isEmpty()) {
                this.f = v5aVar.e;
                this.d &= -3;
            } else {
                if ((this.d & 2) != 2) {
                    this.f = new ArrayList(this.f);
                    this.d |= 2;
                }
                this.f.addAll(v5aVar.e);
            }
        }
        d(v5aVar);
        this.a = this.a.e(v5aVar.b);
    }
}
