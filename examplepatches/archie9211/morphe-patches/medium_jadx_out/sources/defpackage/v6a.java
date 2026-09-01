package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v6a extends k75 {
    public int d;
    public int e;
    public int f;
    public boolean g;
    public w6a h;
    public List i;
    public List j;

    @Override // defpackage.g75
    public final q1 a() {
        x6a x6aVarE = e();
        if (x6aVarE.isInitialized()) {
            return x6aVarE;
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
            vf6 r1 = defpackage.x6a.n     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            x6a r1 = new x6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.g(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            x6a r4 = (defpackage.x6a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        g((x6a) s75Var);
        return this;
    }

    public final Object clone() {
        v6a v6aVar = new v6a();
        v6aVar.h = w6a.INV;
        List list = Collections.EMPTY_LIST;
        v6aVar.i = list;
        v6aVar.j = list;
        v6aVar.g(e());
        return v6aVar;
    }

    public final x6a e() {
        x6a x6aVar = new x6a(this);
        int i = this.d;
        int i2 = (i & 1) != 1 ? 0 : 1;
        x6aVar.d = this.e;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        x6aVar.e = this.f;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        x6aVar.f = this.g;
        if ((i & 8) == 8) {
            i2 |= 8;
        }
        x6aVar.g = this.h;
        if ((i & 16) == 16) {
            this.i = DesugarCollections.unmodifiableList(this.i);
            i = this.d & (-17);
            this.d = i;
        }
        x6aVar.h = this.i;
        if ((i & 32) == 32) {
            this.j = DesugarCollections.unmodifiableList(this.j);
            this.d &= -33;
        }
        x6aVar.i = this.j;
        x6aVar.c = i2;
        return x6aVar;
    }

    public final void g(x6a x6aVar) {
        if (x6aVar == x6a.m) {
            return;
        }
        int i = x6aVar.c;
        if ((i & 1) == 1) {
            int i2 = x6aVar.d;
            this.d = 1 | this.d;
            this.e = i2;
        }
        if ((i & 2) == 2) {
            int i3 = x6aVar.e;
            this.d = 2 | this.d;
            this.f = i3;
        }
        if ((i & 4) == 4) {
            boolean z = x6aVar.f;
            this.d = 4 | this.d;
            this.g = z;
        }
        if ((i & 8) == 8) {
            w6a w6aVar = x6aVar.g;
            w6aVar.getClass();
            this.d = 8 | this.d;
            this.h = w6aVar;
        }
        if (!x6aVar.h.isEmpty()) {
            if (this.i.isEmpty()) {
                this.i = x6aVar.h;
                this.d &= -17;
            } else {
                if ((this.d & 16) != 16) {
                    this.i = new ArrayList(this.i);
                    this.d |= 16;
                }
                this.i.addAll(x6aVar.h);
            }
        }
        if (!x6aVar.i.isEmpty()) {
            if (this.j.isEmpty()) {
                this.j = x6aVar.i;
                this.d &= -33;
            } else {
                if ((this.d & 32) != 32) {
                    this.j = new ArrayList(this.j);
                    this.d |= 32;
                }
                this.j.addAll(x6aVar.i);
            }
        }
        d(x6aVar);
        this.a = this.a.e(x6aVar.b);
    }
}
