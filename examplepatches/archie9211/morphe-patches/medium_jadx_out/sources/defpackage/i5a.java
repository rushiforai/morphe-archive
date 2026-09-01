package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.UninitializedMessageException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i5a extends k75 {
    public List A;
    public int d;
    public int e;
    public int f;
    public int g;
    public List h;
    public List i;
    public List j;
    public List k;
    public List l;
    public List m;
    public List n;
    public List o;
    public List p;
    public List q;
    public List r;
    public List s;
    public int t;
    public s6a u;
    public int v;
    public List w;
    public y6a x;
    public List y;
    public f7a z;

    public static i5a g() {
        i5a i5aVar = new i5a();
        i5aVar.e = 6;
        List list = Collections.EMPTY_LIST;
        i5aVar.h = list;
        i5aVar.i = list;
        i5aVar.j = list;
        i5aVar.k = list;
        i5aVar.l = list;
        i5aVar.m = list;
        i5aVar.n = list;
        i5aVar.o = list;
        i5aVar.p = list;
        i5aVar.q = list;
        i5aVar.r = list;
        i5aVar.s = list;
        i5aVar.u = s6a.t;
        i5aVar.w = list;
        i5aVar.x = y6a.g;
        i5aVar.y = list;
        i5aVar.z = f7a.e;
        i5aVar.A = list;
        return i5aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        k5a k5aVarE = e();
        if (k5aVarE.isInitialized()) {
            return k5aVarE;
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
            vf6 r1 = defpackage.k5a.H     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            k5a r1 = new k5a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            k5a r4 = (defpackage.k5a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((k5a) s75Var);
        return this;
    }

    public final Object clone() {
        i5a i5aVarG = g();
        i5aVarG.h(e());
        return i5aVarG;
    }

    public final k5a e() {
        int i;
        k5a k5aVar = new k5a(this);
        int i2 = this.d;
        int i3 = (i2 & 1) != 1 ? 0 : 1;
        k5aVar.d = this.e;
        if ((i2 & 2) == 2) {
            i3 |= 2;
        }
        k5aVar.e = this.f;
        if ((i2 & 4) == 4) {
            i3 |= 4;
        }
        k5aVar.f = this.g;
        if ((i2 & 8) == 8) {
            this.h = DesugarCollections.unmodifiableList(this.h);
            i = this.d & (-9);
            this.d = i;
        } else {
            i = i2;
        }
        k5aVar.g = this.h;
        if ((i & 16) == 16) {
            this.i = DesugarCollections.unmodifiableList(this.i);
            i = this.d & (-17);
            this.d = i;
        }
        k5aVar.h = this.i;
        if ((i & 32) == 32) {
            this.j = DesugarCollections.unmodifiableList(this.j);
            i = this.d & (-33);
            this.d = i;
        }
        k5aVar.i = this.j;
        if ((i & 64) == 64) {
            this.k = DesugarCollections.unmodifiableList(this.k);
            i = this.d & (-65);
            this.d = i;
        }
        k5aVar.k = this.k;
        if ((i & 128) == 128) {
            this.l = DesugarCollections.unmodifiableList(this.l);
            i = this.d & (-129);
            this.d = i;
        }
        k5aVar.m = this.l;
        if ((i & 256) == 256) {
            this.m = DesugarCollections.unmodifiableList(this.m);
            i = this.d & (-257);
            this.d = i;
        }
        k5aVar.n = this.m;
        if ((i & 512) == 512) {
            this.n = DesugarCollections.unmodifiableList(this.n);
            i = this.d & (-513);
            this.d = i;
        }
        k5aVar.p = this.n;
        if ((i & 1024) == 1024) {
            this.o = DesugarCollections.unmodifiableList(this.o);
            i = this.d & (-1025);
            this.d = i;
        }
        k5aVar.q = this.o;
        if ((i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048) {
            this.p = DesugarCollections.unmodifiableList(this.p);
            i = this.d & (-2049);
            this.d = i;
        }
        k5aVar.r = this.p;
        if ((i & 4096) == 4096) {
            this.q = DesugarCollections.unmodifiableList(this.q);
            i = this.d & (-4097);
            this.d = i;
        }
        k5aVar.s = this.q;
        if ((i & 8192) == 8192) {
            this.r = DesugarCollections.unmodifiableList(this.r);
            i = this.d & (-8193);
            this.d = i;
        }
        k5aVar.t = this.r;
        if ((i & OlympusMakernoteDirectory.TAG_MAIN_INFO) == 16384) {
            this.s = DesugarCollections.unmodifiableList(this.s);
            i = this.d & (-16385);
            this.d = i;
        }
        k5aVar.u = this.s;
        if ((i2 & 32768) == 32768) {
            i3 |= 8;
        }
        k5aVar.w = this.t;
        if ((i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) == 65536) {
            i3 |= 16;
        }
        k5aVar.x = this.u;
        if ((i2 & 131072) == 131072) {
            i3 |= 32;
        }
        k5aVar.y = this.v;
        if ((i & 262144) == 262144) {
            this.w = DesugarCollections.unmodifiableList(this.w);
            i = this.d & (-262145);
            this.d = i;
        }
        k5aVar.z = this.w;
        if ((i2 & 524288) == 524288) {
            i3 |= 64;
        }
        k5aVar.A = this.x;
        if ((i & 1048576) == 1048576) {
            this.y = DesugarCollections.unmodifiableList(this.y);
            i = this.d & (-1048577);
            this.d = i;
        }
        k5aVar.B = this.y;
        if ((i2 & 2097152) == 2097152) {
            i3 |= 128;
        }
        k5aVar.C = this.z;
        if ((i & 4194304) == 4194304) {
            this.A = DesugarCollections.unmodifiableList(this.A);
            this.d &= -4194305;
        }
        k5aVar.D = this.A;
        k5aVar.c = i3;
        return k5aVar;
    }

    public final void h(k5a k5aVar) {
        f7a f7aVar;
        y6a y6aVar;
        s6a s6aVar;
        if (k5aVar == k5a.G) {
            return;
        }
        int i = k5aVar.c;
        if ((i & 1) == 1) {
            int i2 = k5aVar.d;
            this.d = 1 | this.d;
            this.e = i2;
        }
        if ((i & 2) == 2) {
            int i3 = k5aVar.e;
            this.d |= 2;
            this.f = i3;
        }
        if ((i & 4) == 4) {
            int i4 = k5aVar.f;
            this.d = 4 | this.d;
            this.g = i4;
        }
        if (!k5aVar.g.isEmpty()) {
            if (this.h.isEmpty()) {
                this.h = k5aVar.g;
                this.d &= -9;
            } else {
                if ((this.d & 8) != 8) {
                    this.h = new ArrayList(this.h);
                    this.d |= 8;
                }
                this.h.addAll(k5aVar.g);
            }
        }
        if (!k5aVar.h.isEmpty()) {
            if (this.i.isEmpty()) {
                this.i = k5aVar.h;
                this.d &= -17;
            } else {
                if ((this.d & 16) != 16) {
                    this.i = new ArrayList(this.i);
                    this.d |= 16;
                }
                this.i.addAll(k5aVar.h);
            }
        }
        if (!k5aVar.i.isEmpty()) {
            if (this.j.isEmpty()) {
                this.j = k5aVar.i;
                this.d &= -33;
            } else {
                if ((this.d & 32) != 32) {
                    this.j = new ArrayList(this.j);
                    this.d |= 32;
                }
                this.j.addAll(k5aVar.i);
            }
        }
        if (!k5aVar.k.isEmpty()) {
            if (this.k.isEmpty()) {
                this.k = k5aVar.k;
                this.d &= -65;
            } else {
                if ((this.d & 64) != 64) {
                    this.k = new ArrayList(this.k);
                    this.d |= 64;
                }
                this.k.addAll(k5aVar.k);
            }
        }
        if (!k5aVar.m.isEmpty()) {
            if (this.l.isEmpty()) {
                this.l = k5aVar.m;
                this.d &= -129;
            } else {
                if ((this.d & 128) != 128) {
                    this.l = new ArrayList(this.l);
                    this.d |= 128;
                }
                this.l.addAll(k5aVar.m);
            }
        }
        if (!k5aVar.n.isEmpty()) {
            if (this.m.isEmpty()) {
                this.m = k5aVar.n;
                this.d &= -257;
            } else {
                if ((this.d & 256) != 256) {
                    this.m = new ArrayList(this.m);
                    this.d |= 256;
                }
                this.m.addAll(k5aVar.n);
            }
        }
        if (!k5aVar.p.isEmpty()) {
            if (this.n.isEmpty()) {
                this.n = k5aVar.p;
                this.d &= -513;
            } else {
                if ((this.d & 512) != 512) {
                    this.n = new ArrayList(this.n);
                    this.d |= 512;
                }
                this.n.addAll(k5aVar.p);
            }
        }
        if (!k5aVar.q.isEmpty()) {
            if (this.o.isEmpty()) {
                this.o = k5aVar.q;
                this.d &= -1025;
            } else {
                if ((this.d & 1024) != 1024) {
                    this.o = new ArrayList(this.o);
                    this.d |= 1024;
                }
                this.o.addAll(k5aVar.q);
            }
        }
        if (!k5aVar.r.isEmpty()) {
            if (this.p.isEmpty()) {
                this.p = k5aVar.r;
                this.d &= -2049;
            } else {
                if ((this.d & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 2048) {
                    this.p = new ArrayList(this.p);
                    this.d |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
                }
                this.p.addAll(k5aVar.r);
            }
        }
        if (!k5aVar.s.isEmpty()) {
            if (this.q.isEmpty()) {
                this.q = k5aVar.s;
                this.d &= -4097;
            } else {
                if ((this.d & 4096) != 4096) {
                    this.q = new ArrayList(this.q);
                    this.d |= 4096;
                }
                this.q.addAll(k5aVar.s);
            }
        }
        if (!k5aVar.t.isEmpty()) {
            if (this.r.isEmpty()) {
                this.r = k5aVar.t;
                this.d &= -8193;
            } else {
                if ((this.d & 8192) != 8192) {
                    this.r = new ArrayList(this.r);
                    this.d |= 8192;
                }
                this.r.addAll(k5aVar.t);
            }
        }
        if (!k5aVar.u.isEmpty()) {
            if (this.s.isEmpty()) {
                this.s = k5aVar.u;
                this.d &= -16385;
            } else {
                if ((this.d & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 16384) {
                    this.s = new ArrayList(this.s);
                    this.d |= OlympusMakernoteDirectory.TAG_MAIN_INFO;
                }
                this.s.addAll(k5aVar.u);
            }
        }
        int i5 = k5aVar.c;
        if ((i5 & 8) == 8) {
            int i6 = k5aVar.w;
            this.d |= 32768;
            this.t = i6;
        }
        if ((i5 & 16) == 16) {
            s6a s6aVar2 = k5aVar.x;
            if ((this.d & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 65536 || (s6aVar = this.u) == s6a.t) {
                this.u = s6aVar2;
            } else {
                r6a r6aVarP = s6a.p(s6aVar);
                r6aVarP.h(s6aVar2);
                this.u = r6aVarP.e();
            }
            this.d |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((k5aVar.c & 32) == 32) {
            int i7 = k5aVar.y;
            this.d |= 131072;
            this.v = i7;
        }
        if (!k5aVar.z.isEmpty()) {
            if (this.w.isEmpty()) {
                this.w = k5aVar.z;
                this.d &= -262145;
            } else {
                if ((this.d & 262144) != 262144) {
                    this.w = new ArrayList(this.w);
                    this.d |= 262144;
                }
                this.w.addAll(k5aVar.z);
            }
        }
        if ((k5aVar.c & 64) == 64) {
            y6a y6aVar2 = k5aVar.A;
            if ((this.d & 524288) != 524288 || (y6aVar = this.x) == y6a.g) {
                this.x = y6aVar2;
            } else {
                g5a g5aVarG = y6a.g(y6aVar);
                g5aVarG.h(y6aVar2);
                this.x = g5aVarG.e();
            }
            this.d |= 524288;
        }
        if (!k5aVar.B.isEmpty()) {
            if (this.y.isEmpty()) {
                this.y = k5aVar.B;
                this.d &= -1048577;
            } else {
                if ((this.d & 1048576) != 1048576) {
                    this.y = new ArrayList(this.y);
                    this.d |= 1048576;
                }
                this.y.addAll(k5aVar.B);
            }
        }
        if ((k5aVar.c & 128) == 128) {
            f7a f7aVar2 = k5aVar.C;
            if ((this.d & 2097152) != 2097152 || (f7aVar = this.z) == f7a.e) {
                this.z = f7aVar2;
            } else {
                o5a o5aVar = new o5a(2);
                o5aVar.d = Collections.EMPTY_LIST;
                o5aVar.l(f7aVar);
                o5aVar.l(f7aVar2);
                this.z = o5aVar.h();
            }
            this.d |= 2097152;
        }
        if (!k5aVar.D.isEmpty()) {
            if (this.A.isEmpty()) {
                this.A = k5aVar.D;
                this.d &= -4194305;
            } else {
                if ((this.d & 4194304) != 4194304) {
                    this.A = new ArrayList(this.A);
                    this.d |= 4194304;
                }
                this.A.addAll(k5aVar.D);
            }
        }
        d(k5aVar);
        this.a = this.a.e(k5aVar.b);
    }
}
