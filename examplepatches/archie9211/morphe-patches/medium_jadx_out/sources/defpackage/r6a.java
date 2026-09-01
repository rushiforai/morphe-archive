package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r6a extends k75 {
    public int d;
    public List e;
    public boolean f;
    public int g;
    public s6a h;
    public int i;
    public int j;
    public int k;
    public int l;
    public int m;
    public s6a n;
    public int o;
    public s6a p;
    public int q;
    public int r;

    public static r6a g() {
        r6a r6aVar = new r6a();
        r6aVar.e = Collections.EMPTY_LIST;
        s6a s6aVar = s6a.t;
        r6aVar.h = s6aVar;
        r6aVar.n = s6aVar;
        r6aVar.p = s6aVar;
        return r6aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        s6a s6aVarE = e();
        if (s6aVarE.isInitialized()) {
            return s6aVarE;
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
            vf6 r1 = defpackage.s6a.u     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            s6a r1 = new s6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            s6a r4 = (defpackage.s6a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((s6a) s75Var);
        return this;
    }

    public final Object clone() {
        r6a r6aVarG = g();
        r6aVarG.h(e());
        return r6aVarG;
    }

    public final s6a e() {
        s6a s6aVar = new s6a(this);
        int i = this.d;
        if ((i & 1) == 1) {
            this.e = DesugarCollections.unmodifiableList(this.e);
            this.d &= -2;
        }
        s6aVar.d = this.e;
        int i2 = (i & 2) != 2 ? 0 : 1;
        s6aVar.e = this.f;
        if ((i & 4) == 4) {
            i2 |= 2;
        }
        s6aVar.f = this.g;
        if ((i & 8) == 8) {
            i2 |= 4;
        }
        s6aVar.g = this.h;
        if ((i & 16) == 16) {
            i2 |= 8;
        }
        s6aVar.h = this.i;
        if ((i & 32) == 32) {
            i2 |= 16;
        }
        s6aVar.i = this.j;
        if ((i & 64) == 64) {
            i2 |= 32;
        }
        s6aVar.j = this.k;
        if ((i & 128) == 128) {
            i2 |= 64;
        }
        s6aVar.k = this.l;
        if ((i & 256) == 256) {
            i2 |= 128;
        }
        s6aVar.l = this.m;
        if ((i & 512) == 512) {
            i2 |= 256;
        }
        s6aVar.m = this.n;
        if ((i & 1024) == 1024) {
            i2 |= 512;
        }
        s6aVar.n = this.o;
        if ((i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048) {
            i2 |= 1024;
        }
        s6aVar.o = this.p;
        if ((i & 4096) == 4096) {
            i2 |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
        }
        s6aVar.p = this.q;
        if ((i & 8192) == 8192) {
            i2 |= 4096;
        }
        s6aVar.q = this.r;
        s6aVar.c = i2;
        return s6aVar;
    }

    public final r6a h(s6a s6aVar) {
        s6a s6aVar2;
        s6a s6aVar3;
        s6a s6aVar4;
        s6a s6aVar5 = s6a.t;
        if (s6aVar == s6aVar5) {
            return this;
        }
        if (!s6aVar.d.isEmpty()) {
            if (this.e.isEmpty()) {
                this.e = s6aVar.d;
                this.d &= -2;
            } else {
                if ((this.d & 1) != 1) {
                    this.e = new ArrayList(this.e);
                    this.d |= 1;
                }
                this.e.addAll(s6aVar.d);
            }
        }
        int i = s6aVar.c;
        if ((i & 1) == 1) {
            boolean z = s6aVar.e;
            this.d |= 2;
            this.f = z;
        }
        if ((i & 2) == 2) {
            int i2 = s6aVar.f;
            this.d |= 4;
            this.g = i2;
        }
        if ((i & 4) == 4) {
            s6a s6aVar6 = s6aVar.g;
            if ((this.d & 8) != 8 || (s6aVar4 = this.h) == s6aVar5) {
                this.h = s6aVar6;
            } else {
                r6a r6aVarP = s6a.p(s6aVar4);
                r6aVarP.h(s6aVar6);
                this.h = r6aVarP.e();
            }
            this.d |= 8;
        }
        if ((s6aVar.c & 8) == 8) {
            int i3 = s6aVar.h;
            this.d |= 16;
            this.i = i3;
        }
        if (s6aVar.n()) {
            int i4 = s6aVar.i;
            this.d |= 32;
            this.j = i4;
        }
        int i5 = s6aVar.c;
        if ((i5 & 32) == 32) {
            int i6 = s6aVar.j;
            this.d |= 64;
            this.k = i6;
        }
        if ((i5 & 64) == 64) {
            int i7 = s6aVar.k;
            this.d |= 128;
            this.l = i7;
        }
        if ((i5 & 128) == 128) {
            int i8 = s6aVar.l;
            this.d |= 256;
            this.m = i8;
        }
        if ((i5 & 256) == 256) {
            s6a s6aVar7 = s6aVar.m;
            if ((this.d & 512) != 512 || (s6aVar3 = this.n) == s6aVar5) {
                this.n = s6aVar7;
            } else {
                r6a r6aVarP2 = s6a.p(s6aVar3);
                r6aVarP2.h(s6aVar7);
                this.n = r6aVarP2.e();
            }
            this.d |= 512;
        }
        int i9 = s6aVar.c;
        if ((i9 & 512) == 512) {
            int i10 = s6aVar.n;
            this.d |= 1024;
            this.o = i10;
        }
        if ((i9 & 1024) == 1024) {
            s6a s6aVar8 = s6aVar.o;
            if ((this.d & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 2048 || (s6aVar2 = this.p) == s6aVar5) {
                this.p = s6aVar8;
            } else {
                r6a r6aVarP3 = s6a.p(s6aVar2);
                r6aVarP3.h(s6aVar8);
                this.p = r6aVarP3.e();
            }
            this.d |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
        }
        int i11 = s6aVar.c;
        if ((i11 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048) {
            int i12 = s6aVar.p;
            this.d |= 4096;
            this.q = i12;
        }
        if ((i11 & 4096) == 4096) {
            int i13 = s6aVar.q;
            this.d |= 8192;
            this.r = i13;
        }
        d(s6aVar);
        this.a = this.a.e(s6aVar.b);
        return this;
    }
}
