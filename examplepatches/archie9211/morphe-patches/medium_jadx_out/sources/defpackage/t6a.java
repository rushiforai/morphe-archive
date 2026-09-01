package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t6a extends k75 {
    public int d;
    public int e;
    public int f;
    public List g;
    public s6a h;
    public int i;
    public s6a j;
    public int k;
    public List l;
    public List m;
    public List n;

    public static t6a g() {
        t6a t6aVar = new t6a();
        t6aVar.e = 6;
        List list = Collections.EMPTY_LIST;
        t6aVar.g = list;
        s6a s6aVar = s6a.t;
        t6aVar.h = s6aVar;
        t6aVar.j = s6aVar;
        t6aVar.l = list;
        t6aVar.m = list;
        t6aVar.n = list;
        return t6aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        u6a u6aVarE = e();
        if (u6aVarE.isInitialized()) {
            return u6aVarE;
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
            vf6 r1 = defpackage.u6a.q     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            u6a r1 = new u6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            u6a r4 = (defpackage.u6a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((u6a) s75Var);
        return this;
    }

    public final Object clone() {
        t6a t6aVarG = g();
        t6aVarG.h(e());
        return t6aVarG;
    }

    public final u6a e() {
        int i;
        u6a u6aVar = new u6a(this);
        int i2 = this.d;
        int i3 = (i2 & 1) != 1 ? 0 : 1;
        u6aVar.d = this.e;
        if ((i2 & 2) == 2) {
            i3 |= 2;
        }
        u6aVar.e = this.f;
        if ((i2 & 4) == 4) {
            this.g = DesugarCollections.unmodifiableList(this.g);
            i = this.d & (-5);
            this.d = i;
        } else {
            i = i2;
        }
        u6aVar.f = this.g;
        if ((i2 & 8) == 8) {
            i3 |= 4;
        }
        u6aVar.g = this.h;
        if ((i2 & 16) == 16) {
            i3 |= 8;
        }
        u6aVar.h = this.i;
        if ((i2 & 32) == 32) {
            i3 |= 16;
        }
        u6aVar.i = this.j;
        if ((i2 & 64) == 64) {
            i3 |= 32;
        }
        u6aVar.j = this.k;
        if ((i & 128) == 128) {
            this.l = DesugarCollections.unmodifiableList(this.l);
            i = this.d & (-129);
            this.d = i;
        }
        u6aVar.k = this.l;
        if ((i & 256) == 256) {
            this.m = DesugarCollections.unmodifiableList(this.m);
            i = this.d & (-257);
            this.d = i;
        }
        u6aVar.l = this.m;
        if ((i & 512) == 512) {
            this.n = DesugarCollections.unmodifiableList(this.n);
            this.d &= -513;
        }
        u6aVar.m = this.n;
        u6aVar.c = i3;
        return u6aVar;
    }

    public final void h(u6a u6aVar) {
        s6a s6aVar;
        s6a s6aVar2;
        if (u6aVar == u6a.p) {
            return;
        }
        int i = u6aVar.c;
        if ((i & 1) == 1) {
            int i2 = u6aVar.d;
            this.d = 1 | this.d;
            this.e = i2;
        }
        if ((i & 2) == 2) {
            int i3 = u6aVar.e;
            this.d = 2 | this.d;
            this.f = i3;
        }
        if (!u6aVar.f.isEmpty()) {
            if (this.g.isEmpty()) {
                this.g = u6aVar.f;
                this.d &= -5;
            } else {
                if ((this.d & 4) != 4) {
                    this.g = new ArrayList(this.g);
                    this.d |= 4;
                }
                this.g.addAll(u6aVar.f);
            }
        }
        if ((u6aVar.c & 4) == 4) {
            s6a s6aVar3 = u6aVar.g;
            if ((this.d & 8) != 8 || (s6aVar2 = this.h) == s6a.t) {
                this.h = s6aVar3;
            } else {
                r6a r6aVarP = s6a.p(s6aVar2);
                r6aVarP.h(s6aVar3);
                this.h = r6aVarP.e();
            }
            this.d |= 8;
        }
        int i4 = u6aVar.c;
        if ((i4 & 8) == 8) {
            int i5 = u6aVar.h;
            this.d |= 16;
            this.i = i5;
        }
        if ((i4 & 16) == 16) {
            s6a s6aVar4 = u6aVar.i;
            if ((this.d & 32) != 32 || (s6aVar = this.j) == s6a.t) {
                this.j = s6aVar4;
            } else {
                r6a r6aVarP2 = s6a.p(s6aVar);
                r6aVarP2.h(s6aVar4);
                this.j = r6aVarP2.e();
            }
            this.d |= 32;
        }
        if ((u6aVar.c & 32) == 32) {
            int i6 = u6aVar.j;
            this.d |= 64;
            this.k = i6;
        }
        if (!u6aVar.k.isEmpty()) {
            if (this.l.isEmpty()) {
                this.l = u6aVar.k;
                this.d &= -129;
            } else {
                if ((this.d & 128) != 128) {
                    this.l = new ArrayList(this.l);
                    this.d |= 128;
                }
                this.l.addAll(u6aVar.k);
            }
        }
        if (!u6aVar.l.isEmpty()) {
            if (this.m.isEmpty()) {
                this.m = u6aVar.l;
                this.d &= -257;
            } else {
                if ((this.d & 256) != 256) {
                    this.m = new ArrayList(this.m);
                    this.d |= 256;
                }
                this.m.addAll(u6aVar.l);
            }
        }
        if (!u6aVar.m.isEmpty()) {
            if (this.n.isEmpty()) {
                this.n = u6aVar.m;
                this.d &= -513;
            } else {
                if ((this.d & 512) != 512) {
                    this.n = new ArrayList(this.n);
                    this.d |= 512;
                }
                this.n.addAll(u6aVar.m);
            }
        }
        d(u6aVar);
        this.a = this.a.e(u6aVar.b);
    }
}
