package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c5a extends g75 implements dz7 {
    public int b;
    public d5a c;
    public long d;
    public float e;
    public double f;
    public int g;
    public int h;
    public int i;
    public h5a j;
    public List k;
    public int l;
    public int m;

    public static c5a e() {
        c5a c5aVar = new c5a();
        c5aVar.c = d5a.BYTE;
        c5aVar.j = h5a.g;
        c5aVar.k = Collections.EMPTY_LIST;
        return c5aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        e5a e5aVarD = d();
        if (e5aVarD.isInitialized()) {
            return e5aVarD;
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
            vf6 r1 = defpackage.e5a.q     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            e5a r1 = new e5a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.g(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            e5a r4 = (defpackage.e5a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        g((e5a) s75Var);
        return this;
    }

    public final Object clone() {
        c5a c5aVarE = e();
        c5aVarE.g(d());
        return c5aVarE;
    }

    public final e5a d() {
        e5a e5aVar = new e5a(this);
        int i = this.b;
        int i2 = (i & 1) != 1 ? 0 : 1;
        e5aVar.c = this.c;
        if ((i & 2) == 2) {
            i2 |= 2;
        }
        e5aVar.d = this.d;
        if ((i & 4) == 4) {
            i2 |= 4;
        }
        e5aVar.e = this.e;
        if ((i & 8) == 8) {
            i2 |= 8;
        }
        e5aVar.f = this.f;
        if ((i & 16) == 16) {
            i2 |= 16;
        }
        e5aVar.g = this.g;
        if ((i & 32) == 32) {
            i2 |= 32;
        }
        e5aVar.h = this.h;
        if ((i & 64) == 64) {
            i2 |= 64;
        }
        e5aVar.i = this.i;
        if ((i & 128) == 128) {
            i2 |= 128;
        }
        e5aVar.j = this.j;
        if ((i & 256) == 256) {
            this.k = DesugarCollections.unmodifiableList(this.k);
            this.b &= -257;
        }
        e5aVar.k = this.k;
        if ((i & 512) == 512) {
            i2 |= 256;
        }
        e5aVar.l = this.l;
        if ((i & 1024) == 1024) {
            i2 |= 512;
        }
        e5aVar.m = this.m;
        e5aVar.b = i2;
        return e5aVar;
    }

    public final void g(e5a e5aVar) {
        h5a h5aVar;
        if (e5aVar == e5a.p) {
            return;
        }
        if ((e5aVar.b & 1) == 1) {
            d5a d5aVar = e5aVar.c;
            d5aVar.getClass();
            this.b = 1 | this.b;
            this.c = d5aVar;
        }
        int i = e5aVar.b;
        if ((i & 2) == 2) {
            long j = e5aVar.d;
            this.b |= 2;
            this.d = j;
        }
        if ((i & 4) == 4) {
            float f = e5aVar.e;
            this.b = 4 | this.b;
            this.e = f;
        }
        if ((i & 8) == 8) {
            double d = e5aVar.f;
            this.b |= 8;
            this.f = d;
        }
        if ((i & 16) == 16) {
            int i2 = e5aVar.g;
            this.b = 16 | this.b;
            this.g = i2;
        }
        if ((i & 32) == 32) {
            int i3 = e5aVar.h;
            this.b = 32 | this.b;
            this.h = i3;
        }
        if ((i & 64) == 64) {
            int i4 = e5aVar.i;
            this.b = 64 | this.b;
            this.i = i4;
        }
        if ((i & 128) == 128) {
            h5a h5aVar2 = e5aVar.j;
            if ((this.b & 128) != 128 || (h5aVar = this.j) == h5a.g) {
                this.j = h5aVar2;
            } else {
                g5a g5aVar = new g5a(0);
                g5aVar.d = Collections.EMPTY_LIST;
                g5aVar.g(h5aVar);
                g5aVar.g(h5aVar2);
                this.j = g5aVar.d();
            }
            this.b |= 128;
        }
        if (!e5aVar.k.isEmpty()) {
            if (this.k.isEmpty()) {
                this.k = e5aVar.k;
                this.b &= -257;
            } else {
                if ((this.b & 256) != 256) {
                    this.k = new ArrayList(this.k);
                    this.b |= 256;
                }
                this.k.addAll(e5aVar.k);
            }
        }
        int i5 = e5aVar.b;
        if ((i5 & 256) == 256) {
            int i6 = e5aVar.l;
            this.b |= 512;
            this.l = i6;
        }
        if ((i5 & 512) == 512) {
            int i7 = e5aVar.m;
            this.b |= 1024;
            this.m = i7;
        }
        this.a = this.a.e(e5aVar.a);
    }
}
