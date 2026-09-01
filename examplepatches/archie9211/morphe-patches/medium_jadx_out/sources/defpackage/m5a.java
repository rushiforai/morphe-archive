package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class m5a extends k75 {
    public int d;
    public int e;
    public List f;
    public List g;
    public List h;
    public List i;

    public static m5a g() {
        m5a m5aVar = new m5a();
        m5aVar.e = 6;
        List list = Collections.EMPTY_LIST;
        m5aVar.f = list;
        m5aVar.g = list;
        m5aVar.h = list;
        m5aVar.i = list;
        return m5aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        n5a n5aVarE = e();
        if (n5aVarE.isInitialized()) {
            return n5aVarE;
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
            vf6 r1 = defpackage.n5a.l     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            n5a r1 = new n5a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            n5a r4 = (defpackage.n5a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((n5a) s75Var);
        return this;
    }

    public final Object clone() {
        m5a m5aVarG = g();
        m5aVarG.h(e());
        return m5aVarG;
    }

    public final n5a e() {
        n5a n5aVar = new n5a(this);
        int i = this.d;
        int i2 = (i & 1) != 1 ? 0 : 1;
        n5aVar.d = this.e;
        if ((i & 2) == 2) {
            this.f = DesugarCollections.unmodifiableList(this.f);
            i = this.d & (-3);
            this.d = i;
        }
        n5aVar.e = this.f;
        if ((i & 4) == 4) {
            this.g = DesugarCollections.unmodifiableList(this.g);
            i = this.d & (-5);
            this.d = i;
        }
        n5aVar.f = this.g;
        if ((i & 8) == 8) {
            this.h = DesugarCollections.unmodifiableList(this.h);
            i = this.d & (-9);
            this.d = i;
        }
        n5aVar.g = this.h;
        if ((i & 16) == 16) {
            this.i = DesugarCollections.unmodifiableList(this.i);
            this.d &= -17;
        }
        n5aVar.h = this.i;
        n5aVar.c = i2;
        return n5aVar;
    }

    public final void h(n5a n5aVar) {
        if (n5aVar == n5a.k) {
            return;
        }
        if ((n5aVar.c & 1) == 1) {
            int i = n5aVar.d;
            this.d = 1 | this.d;
            this.e = i;
        }
        if (!n5aVar.e.isEmpty()) {
            if (this.f.isEmpty()) {
                this.f = n5aVar.e;
                this.d &= -3;
            } else {
                if ((this.d & 2) != 2) {
                    this.f = new ArrayList(this.f);
                    this.d |= 2;
                }
                this.f.addAll(n5aVar.e);
            }
        }
        if (!n5aVar.f.isEmpty()) {
            if (this.g.isEmpty()) {
                this.g = n5aVar.f;
                this.d &= -5;
            } else {
                if ((this.d & 4) != 4) {
                    this.g = new ArrayList(this.g);
                    this.d |= 4;
                }
                this.g.addAll(n5aVar.f);
            }
        }
        if (!n5aVar.g.isEmpty()) {
            if (this.h.isEmpty()) {
                this.h = n5aVar.g;
                this.d &= -9;
            } else {
                if ((this.d & 8) != 8) {
                    this.h = new ArrayList(this.h);
                    this.d |= 8;
                }
                this.h.addAll(n5aVar.g);
            }
        }
        if (!n5aVar.h.isEmpty()) {
            if (this.i.isEmpty()) {
                this.i = n5aVar.h;
                this.d &= -17;
            } else {
                if ((this.d & 16) != 16) {
                    this.i = new ArrayList(this.i);
                    this.d |= 16;
                }
                this.i.addAll(n5aVar.h);
            }
        }
        d(n5aVar);
        this.a = this.a.e(n5aVar.b);
    }
}
