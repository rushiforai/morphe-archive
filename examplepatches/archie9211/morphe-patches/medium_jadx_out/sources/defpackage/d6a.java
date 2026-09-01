package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class d6a extends k75 {
    public int d;
    public List e;
    public List f;
    public List g;
    public y6a h;
    public f7a i;

    public static d6a g() {
        d6a d6aVar = new d6a();
        List list = Collections.EMPTY_LIST;
        d6aVar.e = list;
        d6aVar.f = list;
        d6aVar.g = list;
        d6aVar.h = y6a.g;
        d6aVar.i = f7a.e;
        return d6aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        e6a e6aVarE = e();
        if (e6aVarE.isInitialized()) {
            return e6aVarE;
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
            vf6 r1 = defpackage.e6a.l     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            e6a r1 = new e6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            e6a r4 = (defpackage.e6a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((e6a) s75Var);
        return this;
    }

    public final Object clone() {
        d6a d6aVarG = g();
        d6aVarG.h(e());
        return d6aVarG;
    }

    public final e6a e() {
        int i;
        e6a e6aVar = new e6a(this);
        int i2 = this.d;
        if ((i2 & 1) == 1) {
            this.e = DesugarCollections.unmodifiableList(this.e);
            i = this.d & (-2);
            this.d = i;
        } else {
            i = i2;
        }
        e6aVar.d = this.e;
        if ((i & 2) == 2) {
            this.f = DesugarCollections.unmodifiableList(this.f);
            i = this.d & (-3);
            this.d = i;
        }
        e6aVar.e = this.f;
        if ((i & 4) == 4) {
            this.g = DesugarCollections.unmodifiableList(this.g);
            this.d &= -5;
        }
        e6aVar.f = this.g;
        int i3 = (i2 & 8) != 8 ? 0 : 1;
        e6aVar.g = this.h;
        if ((i2 & 16) == 16) {
            i3 |= 2;
        }
        e6aVar.h = this.i;
        e6aVar.c = i3;
        return e6aVar;
    }

    public final void h(e6a e6aVar) {
        f7a f7aVar;
        y6a y6aVar;
        if (e6aVar == e6a.k) {
            return;
        }
        if (!e6aVar.d.isEmpty()) {
            if (this.e.isEmpty()) {
                this.e = e6aVar.d;
                this.d &= -2;
            } else {
                if ((this.d & 1) != 1) {
                    this.e = new ArrayList(this.e);
                    this.d |= 1;
                }
                this.e.addAll(e6aVar.d);
            }
        }
        if (!e6aVar.e.isEmpty()) {
            if (this.f.isEmpty()) {
                this.f = e6aVar.e;
                this.d &= -3;
            } else {
                if ((this.d & 2) != 2) {
                    this.f = new ArrayList(this.f);
                    this.d |= 2;
                }
                this.f.addAll(e6aVar.e);
            }
        }
        if (!e6aVar.f.isEmpty()) {
            if (this.g.isEmpty()) {
                this.g = e6aVar.f;
                this.d &= -5;
            } else {
                if ((this.d & 4) != 4) {
                    this.g = new ArrayList(this.g);
                    this.d |= 4;
                }
                this.g.addAll(e6aVar.f);
            }
        }
        if ((e6aVar.c & 1) == 1) {
            y6a y6aVar2 = e6aVar.g;
            if ((this.d & 8) != 8 || (y6aVar = this.h) == y6a.g) {
                this.h = y6aVar2;
            } else {
                g5a g5aVarG = y6a.g(y6aVar);
                g5aVarG.h(y6aVar2);
                this.h = g5aVarG.e();
            }
            this.d |= 8;
        }
        if ((e6aVar.c & 2) == 2) {
            f7a f7aVar2 = e6aVar.h;
            if ((this.d & 16) != 16 || (f7aVar = this.i) == f7a.e) {
                this.i = f7aVar2;
            } else {
                o5a o5aVar = new o5a(2);
                o5aVar.d = Collections.EMPTY_LIST;
                o5aVar.l(f7aVar);
                o5aVar.l(f7aVar2);
                this.i = o5aVar.h();
            }
            this.d |= 16;
        }
        d(e6aVar);
        this.a = this.a.e(e6aVar.b);
    }
}
