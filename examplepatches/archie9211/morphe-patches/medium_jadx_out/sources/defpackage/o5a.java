package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o5a extends g75 implements dz7 {
    public final /* synthetic */ int b;
    public int c;
    public List d;

    public /* synthetic */ o5a(int i) {
        this.b = i;
    }

    @Override // defpackage.g75
    public final q1 a() {
        switch (this.b) {
            case 0:
                p5a p5aVarD = d();
                if (p5aVarD.isInitialized()) {
                    return p5aVarD;
                }
                throw new UninitializedMessageException();
            case 1:
                m6a m6aVarE = e();
                if (m6aVarE.isInitialized()) {
                    return m6aVarE;
                }
                throw new UninitializedMessageException();
            case 2:
                f7a f7aVarH = h();
                if (f7aVarH.isInitialized()) {
                    return f7aVarH;
                }
                throw new UninitializedMessageException();
            default:
                n6a n6aVarG = g();
                if (n6aVarG.isInitialized()) {
                    return n6aVarG;
                }
                throw new UninitializedMessageException();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x007a  */
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
                case 0: goto L60;
                case 1: goto L42;
                case 2: goto L24;
                default: goto L6;
            }
        L6:
            vf6 r4 = defpackage.n6a.f     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r4.getClass()     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            n6a r4 = new n6a     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r4.<init>(r3)     // Catch: java.lang.Throwable -> L14 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L16
            r2.k(r4)
            return r2
        L14:
            r3 = move-exception
            goto L1e
        L16:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L14
            n6a r4 = (defpackage.n6a) r4     // Catch: java.lang.Throwable -> L14
            throw r3     // Catch: java.lang.Throwable -> L1c
        L1c:
            r3 = move-exception
            r1 = r4
        L1e:
            if (r1 == 0) goto L23
            r2.k(r1)
        L23:
            throw r3
        L24:
            vf6 r0 = defpackage.f7a.f     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.getClass()     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            f7a r0 = new f7a     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            r2.l(r0)
            return r2
        L32:
            r3 = move-exception
            goto L3c
        L34:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L32
            f7a r4 = (defpackage.f7a) r4     // Catch: java.lang.Throwable -> L32
            throw r3     // Catch: java.lang.Throwable -> L3a
        L3a:
            r3 = move-exception
            r1 = r4
        L3c:
            if (r1 == 0) goto L41
            r2.l(r1)
        L41:
            throw r3
        L42:
            vf6 r0 = defpackage.m6a.f     // Catch: java.lang.Throwable -> L50 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L52
            r0.getClass()     // Catch: java.lang.Throwable -> L50 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L52
            m6a r0 = new m6a     // Catch: java.lang.Throwable -> L50 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L52
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L50 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L52
            r2.j(r0)
            return r2
        L50:
            r3 = move-exception
            goto L5a
        L52:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L50
            m6a r4 = (defpackage.m6a) r4     // Catch: java.lang.Throwable -> L50
            throw r3     // Catch: java.lang.Throwable -> L58
        L58:
            r3 = move-exception
            r1 = r4
        L5a:
            if (r1 == 0) goto L5f
            r2.j(r1)
        L5f:
            throw r3
        L60:
            vf6 r0 = defpackage.p5a.f     // Catch: java.lang.Throwable -> L6e kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L70
            r0.getClass()     // Catch: java.lang.Throwable -> L6e kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L70
            p5a r0 = new p5a     // Catch: java.lang.Throwable -> L6e kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L70
            r0.<init>(r3, r4)     // Catch: java.lang.Throwable -> L6e kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L70
            r2.i(r0)
            return r2
        L6e:
            r3 = move-exception
            goto L78
        L70:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> L6e
            p5a r4 = (defpackage.p5a) r4     // Catch: java.lang.Throwable -> L6e
            throw r3     // Catch: java.lang.Throwable -> L76
        L76:
            r3 = move-exception
            r1 = r4
        L78:
            if (r1 == 0) goto L7d
            r2.i(r1)
        L7d:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        switch (this.b) {
            case 0:
                i((p5a) s75Var);
                break;
            case 1:
                j((m6a) s75Var);
                break;
            case 2:
                l((f7a) s75Var);
                break;
            default:
                k((n6a) s75Var);
                break;
        }
        return this;
    }

    public final Object clone() {
        switch (this.b) {
            case 0:
                o5a o5aVar = new o5a(0);
                o5aVar.d = Collections.EMPTY_LIST;
                o5aVar.i(d());
                return o5aVar;
            case 1:
                o5a o5aVar2 = new o5a(1);
                o5aVar2.d = Collections.EMPTY_LIST;
                o5aVar2.j(e());
                return o5aVar2;
            case 2:
                o5a o5aVar3 = new o5a(2);
                o5aVar3.d = Collections.EMPTY_LIST;
                o5aVar3.l(h());
                return o5aVar3;
            default:
                o5a o5aVar4 = new o5a(3);
                o5aVar4.d = sw6.b;
                o5aVar4.k(g());
                return o5aVar4;
        }
    }

    public p5a d() {
        p5a p5aVar = new p5a(this);
        if ((this.c & 1) == 1) {
            this.d = DesugarCollections.unmodifiableList(this.d);
            this.c &= -2;
        }
        p5aVar.b = this.d;
        return p5aVar;
    }

    public m6a e() {
        m6a m6aVar = new m6a(this);
        if ((this.c & 1) == 1) {
            this.d = DesugarCollections.unmodifiableList(this.d);
            this.c &= -2;
        }
        m6aVar.b = this.d;
        return m6aVar;
    }

    public n6a g() {
        n6a n6aVar = new n6a(this);
        if ((this.c & 1) == 1) {
            this.d = ((vw6) this.d).b();
            this.c &= -2;
        }
        n6aVar.b = (vw6) this.d;
        return n6aVar;
    }

    public f7a h() {
        f7a f7aVar = new f7a(this);
        if ((this.c & 1) == 1) {
            this.d = DesugarCollections.unmodifiableList(this.d);
            this.c &= -2;
        }
        f7aVar.b = this.d;
        return f7aVar;
    }

    public void i(p5a p5aVar) {
        if (p5aVar == p5a.e) {
            return;
        }
        if (!p5aVar.b.isEmpty()) {
            if (this.d.isEmpty()) {
                this.d = p5aVar.b;
                this.c &= -2;
            } else {
                if ((this.c & 1) != 1) {
                    this.d = new ArrayList(this.d);
                    this.c |= 1;
                }
                this.d.addAll(p5aVar.b);
            }
        }
        this.a = this.a.e(p5aVar.a);
    }

    public void j(m6a m6aVar) {
        if (m6aVar == m6a.e) {
            return;
        }
        if (!m6aVar.b.isEmpty()) {
            if (this.d.isEmpty()) {
                this.d = m6aVar.b;
                this.c &= -2;
            } else {
                if ((this.c & 1) != 1) {
                    this.d = new ArrayList(this.d);
                    this.c |= 1;
                }
                this.d.addAll(m6aVar.b);
            }
        }
        this.a = this.a.e(m6aVar.a);
    }

    public void k(n6a n6aVar) {
        if (n6aVar == n6a.e) {
            return;
        }
        if (!n6aVar.b.isEmpty()) {
            if (((vw6) this.d).isEmpty()) {
                this.d = n6aVar.b;
                this.c &= -2;
            } else {
                if ((this.c & 1) != 1) {
                    this.d = new sw6((vw6) this.d);
                    this.c |= 1;
                }
                ((vw6) this.d).addAll(n6aVar.b);
            }
        }
        this.a = this.a.e(n6aVar.a);
    }

    public void l(f7a f7aVar) {
        if (f7aVar == f7a.e) {
            return;
        }
        if (!f7aVar.b.isEmpty()) {
            if (this.d.isEmpty()) {
                this.d = f7aVar.b;
                this.c &= -2;
            } else {
                if ((this.c & 1) != 1) {
                    this.d = new ArrayList(this.d);
                    this.c |= 1;
                }
                this.d.addAll(f7aVar.b);
            }
        }
        this.a = this.a.e(f7aVar.a);
    }
}
