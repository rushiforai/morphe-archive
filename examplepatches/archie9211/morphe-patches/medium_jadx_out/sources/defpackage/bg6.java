package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bg6 extends g75 implements dz7 {
    public int b;
    public List c;
    public List d;

    @Override // defpackage.g75
    public final q1 a() {
        fg6 fg6VarD = d();
        if (fg6VarD.isInitialized()) {
            return fg6VarD;
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
            vf6 r1 = defpackage.fg6.h     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            fg6 r1 = new fg6     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.e(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            fg6 r4 = (defpackage.fg6) r4     // Catch: java.lang.Throwable -> Lf
            throw r3     // Catch: java.lang.Throwable -> L17
        L17:
            r3 = move-exception
            r0 = r4
        L19:
            if (r0 == 0) goto L1e
            r2.e(r0)
        L1e:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bg6.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        e((fg6) s75Var);
        return this;
    }

    public final Object clone() {
        bg6 bg6Var = new bg6();
        List list = Collections.EMPTY_LIST;
        bg6Var.c = list;
        bg6Var.d = list;
        bg6Var.e(d());
        return bg6Var;
    }

    public final fg6 d() {
        fg6 fg6Var = new fg6(this);
        int i = this.b;
        if ((i & 1) == 1) {
            this.c = DesugarCollections.unmodifiableList(this.c);
            i = this.b & (-2);
            this.b = i;
        }
        fg6Var.b = this.c;
        if ((i & 2) == 2) {
            this.d = DesugarCollections.unmodifiableList(this.d);
            this.b &= -3;
        }
        fg6Var.c = this.d;
        return fg6Var;
    }

    public final void e(fg6 fg6Var) {
        if (fg6Var == fg6.g) {
            return;
        }
        if (!fg6Var.b.isEmpty()) {
            if (this.c.isEmpty()) {
                this.c = fg6Var.b;
                this.b &= -2;
            } else {
                if ((this.b & 1) != 1) {
                    this.c = new ArrayList(this.c);
                    this.b |= 1;
                }
                this.c.addAll(fg6Var.b);
            }
        }
        if (!fg6Var.c.isEmpty()) {
            if (this.d.isEmpty()) {
                this.d = fg6Var.c;
                this.b &= -3;
            } else {
                if ((this.b & 2) != 2) {
                    this.d = new ArrayList(this.d);
                    this.b |= 2;
                }
                this.d.addAll(fg6Var.c);
            }
        }
        this.a = this.a.e(fg6Var.a);
    }
}
