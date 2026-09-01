package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f6a extends k75 {
    public int d;
    public n6a e;
    public m6a f;
    public e6a g;
    public List h;

    public static f6a g() {
        f6a f6aVar = new f6a();
        f6aVar.e = n6a.e;
        f6aVar.f = m6a.e;
        f6aVar.g = e6a.k;
        f6aVar.h = Collections.EMPTY_LIST;
        return f6aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        g6a g6aVarE = e();
        if (g6aVarE.isInitialized()) {
            return g6aVarE;
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
            vf6 r1 = defpackage.g6a.k     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            g6a r1 = new g6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            g6a r4 = (defpackage.g6a) r4     // Catch: java.lang.Throwable -> Lf
            throw r3     // Catch: java.lang.Throwable -> L17
        L17:
            r3 = move-exception
            r0 = r4
        L19:
            if (r0 == 0) goto L1e
            r2.h(r0)
        L1e:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((g6a) s75Var);
        return this;
    }

    public final Object clone() {
        f6a f6aVarG = g();
        f6aVarG.h(e());
        return f6aVarG;
    }

    public final g6a e() {
        g6a g6aVar = new g6a(this);
        int i = this.d;
        int i2 = (i & 1) != 1 ? 0 : 1;
        g6aVar.d = this.e;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        g6aVar.e = this.f;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        g6aVar.f = this.g;
        if ((i & 8) == 8) {
            this.h = DesugarCollections.unmodifiableList(this.h);
            this.d &= -9;
        }
        g6aVar.g = this.h;
        g6aVar.c = i2;
        return g6aVar;
    }

    public final void h(g6a g6aVar) {
        e6a e6aVar;
        m6a m6aVar;
        n6a n6aVar;
        if (g6aVar == g6a.j) {
            return;
        }
        if ((g6aVar.c & 1) == 1) {
            n6a n6aVar2 = g6aVar.d;
            if ((this.d & 1) != 1 || (n6aVar = this.e) == n6a.e) {
                this.e = n6aVar2;
            } else {
                o5a o5aVar = new o5a(3);
                o5aVar.d = sw6.b;
                o5aVar.k(n6aVar);
                o5aVar.k(n6aVar2);
                this.e = o5aVar.g();
            }
            this.d |= 1;
        }
        if ((g6aVar.c & 2) == 2) {
            m6a m6aVar2 = g6aVar.e;
            if ((this.d & 2) != 2 || (m6aVar = this.f) == m6a.e) {
                this.f = m6aVar2;
            } else {
                o5a o5aVar2 = new o5a(1);
                o5aVar2.d = Collections.EMPTY_LIST;
                o5aVar2.j(m6aVar);
                o5aVar2.j(m6aVar2);
                this.f = o5aVar2.e();
            }
            this.d |= 2;
        }
        if ((g6aVar.c & 4) == 4) {
            e6a e6aVar2 = g6aVar.f;
            if ((this.d & 4) != 4 || (e6aVar = this.g) == e6a.k) {
                this.g = e6aVar2;
            } else {
                d6a d6aVarG = d6a.g();
                d6aVarG.h(e6aVar);
                d6aVarG.h(e6aVar2);
                this.g = d6aVarG.e();
            }
            this.d |= 4;
        }
        if (!g6aVar.g.isEmpty()) {
            if (this.h.isEmpty()) {
                this.h = g6aVar.g;
                this.d &= -9;
            } else {
                if ((this.d & 8) != 8) {
                    this.h = new ArrayList(this.h);
                    this.d |= 8;
                }
                this.h.addAll(g6aVar.g);
            }
        }
        d(g6aVar);
        this.a = this.a.e(g6aVar.b);
    }
}
