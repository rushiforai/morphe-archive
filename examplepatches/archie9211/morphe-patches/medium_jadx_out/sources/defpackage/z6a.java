package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z6a extends k75 {
    public int d;
    public int e;
    public int f;
    public s6a g;
    public int h;
    public s6a i;
    public int j;
    public List k;
    public e5a l;

    public static z6a g() {
        z6a z6aVar = new z6a();
        s6a s6aVar = s6a.t;
        z6aVar.g = s6aVar;
        z6aVar.i = s6aVar;
        z6aVar.k = Collections.EMPTY_LIST;
        z6aVar.l = e5a.p;
        return z6aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        a7a a7aVarE = e();
        if (a7aVarE.isInitialized()) {
            return a7aVarE;
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
            vf6 r1 = defpackage.a7a.o     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            a7a r1 = new a7a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            a7a r4 = (defpackage.a7a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((a7a) s75Var);
        return this;
    }

    public final Object clone() {
        z6a z6aVarG = g();
        z6aVarG.h(e());
        return z6aVarG;
    }

    public final a7a e() {
        a7a a7aVar = new a7a(this);
        int i = this.d;
        int i2 = (i & 1) != 1 ? 0 : 1;
        a7aVar.d = this.e;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        a7aVar.e = this.f;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        a7aVar.f = this.g;
        if ((i & 8) == 8) {
            i2 |= 8;
        }
        a7aVar.g = this.h;
        if ((i & 16) == 16) {
            i2 |= 16;
        }
        a7aVar.h = this.i;
        if ((i & 32) == 32) {
            i2 |= 32;
        }
        a7aVar.i = this.j;
        if ((i & 64) == 64) {
            this.k = DesugarCollections.unmodifiableList(this.k);
            this.d &= -65;
        }
        a7aVar.j = this.k;
        if ((i & 128) == 128) {
            i2 |= 64;
        }
        a7aVar.k = this.l;
        a7aVar.c = i2;
        return a7aVar;
    }

    public final void h(a7a a7aVar) {
        e5a e5aVar;
        s6a s6aVar;
        s6a s6aVar2;
        if (a7aVar == a7a.n) {
            return;
        }
        int i = a7aVar.c;
        if ((i & 1) == 1) {
            int i2 = a7aVar.d;
            this.d = 1 | this.d;
            this.e = i2;
        }
        if ((i & 2) == 2) {
            int i3 = a7aVar.e;
            this.d = 2 | this.d;
            this.f = i3;
        }
        if ((i & 4) == 4) {
            s6a s6aVar3 = a7aVar.f;
            if ((this.d & 4) != 4 || (s6aVar2 = this.g) == s6a.t) {
                this.g = s6aVar3;
            } else {
                r6a r6aVarP = s6a.p(s6aVar2);
                r6aVarP.h(s6aVar3);
                this.g = r6aVarP.e();
            }
            this.d |= 4;
        }
        int i4 = a7aVar.c;
        if ((i4 & 8) == 8) {
            int i5 = a7aVar.g;
            this.d = 8 | this.d;
            this.h = i5;
        }
        if ((i4 & 16) == 16) {
            s6a s6aVar4 = a7aVar.h;
            if ((this.d & 16) != 16 || (s6aVar = this.i) == s6a.t) {
                this.i = s6aVar4;
            } else {
                r6a r6aVarP2 = s6a.p(s6aVar);
                r6aVarP2.h(s6aVar4);
                this.i = r6aVarP2.e();
            }
            this.d |= 16;
        }
        if ((a7aVar.c & 32) == 32) {
            int i6 = a7aVar.i;
            this.d = 32 | this.d;
            this.j = i6;
        }
        if (!a7aVar.j.isEmpty()) {
            if (this.k.isEmpty()) {
                this.k = a7aVar.j;
                this.d &= -65;
            } else {
                if ((this.d & 64) != 64) {
                    this.k = new ArrayList(this.k);
                    this.d |= 64;
                }
                this.k.addAll(a7aVar.j);
            }
        }
        if ((a7aVar.c & 64) == 64) {
            e5a e5aVar2 = a7aVar.k;
            if ((this.d & 128) != 128 || (e5aVar = this.l) == e5a.p) {
                this.l = e5aVar2;
            } else {
                c5a c5aVarE = c5a.e();
                c5aVarE.g(e5aVar);
                c5aVarE.g(e5aVar2);
                this.l = c5aVarE.d();
            }
            this.d |= 128;
        }
        d(a7aVar);
        this.a = this.a.e(a7aVar.b);
    }
}
