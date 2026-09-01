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
public final class z5a extends k75 {
    public int d;
    public int e;
    public int f;
    public int g;
    public s6a h;
    public int i;
    public List j;
    public s6a k;
    public int l;
    public List m;
    public List n;
    public List o;
    public List p;
    public y6a q;
    public List r;
    public p5a s;
    public List t;
    public List u;
    public List v;

    public static z5a g() {
        z5a z5aVar = new z5a();
        z5aVar.e = 6;
        z5aVar.f = 6;
        s6a s6aVar = s6a.t;
        z5aVar.h = s6aVar;
        List list = Collections.EMPTY_LIST;
        z5aVar.j = list;
        z5aVar.k = s6aVar;
        z5aVar.m = list;
        z5aVar.n = list;
        z5aVar.o = list;
        z5aVar.p = list;
        z5aVar.q = y6a.g;
        z5aVar.r = list;
        z5aVar.s = p5a.e;
        z5aVar.t = list;
        z5aVar.u = list;
        z5aVar.v = list;
        return z5aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        a6a a6aVarE = e();
        if (a6aVarE.isInitialized()) {
            return a6aVarE;
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
            vf6 r1 = defpackage.a6a.z     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            a6a r1 = new a6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            a6a r4 = (defpackage.a6a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z5a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((a6a) s75Var);
        return this;
    }

    public final Object clone() {
        z5a z5aVarG = g();
        z5aVarG.h(e());
        return z5aVarG;
    }

    public final a6a e() {
        int i;
        a6a a6aVar = new a6a(this);
        int i2 = this.d;
        int i3 = (i2 & 1) != 1 ? 0 : 1;
        a6aVar.d = this.e;
        if ((i2 & 2) == 2) {
            i3 |= 2;
        }
        a6aVar.e = this.f;
        if ((i2 & 4) == 4) {
            i3 |= 4;
        }
        a6aVar.f = this.g;
        if ((i2 & 8) == 8) {
            i3 |= 8;
        }
        a6aVar.g = this.h;
        if ((i2 & 16) == 16) {
            i3 |= 16;
        }
        a6aVar.h = this.i;
        if ((i2 & 32) == 32) {
            this.j = DesugarCollections.unmodifiableList(this.j);
            i = this.d & (-33);
            this.d = i;
        } else {
            i = i2;
        }
        a6aVar.i = this.j;
        if ((i2 & 64) == 64) {
            i3 |= 32;
        }
        a6aVar.j = this.k;
        if ((i2 & 128) == 128) {
            i3 |= 64;
        }
        a6aVar.k = this.l;
        if ((i & 256) == 256) {
            this.m = DesugarCollections.unmodifiableList(this.m);
            i = this.d & (-257);
            this.d = i;
        }
        a6aVar.l = this.m;
        if ((i & 512) == 512) {
            this.n = DesugarCollections.unmodifiableList(this.n);
            i = this.d & (-513);
            this.d = i;
        }
        a6aVar.m = this.n;
        if ((i & 1024) == 1024) {
            this.o = DesugarCollections.unmodifiableList(this.o);
            i = this.d & (-1025);
            this.d = i;
        }
        a6aVar.o = this.o;
        if ((i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048) {
            this.p = DesugarCollections.unmodifiableList(this.p);
            i = this.d & (-2049);
            this.d = i;
        }
        a6aVar.p = this.p;
        if ((i2 & 4096) == 4096) {
            i3 |= 128;
        }
        a6aVar.q = this.q;
        if ((i & 8192) == 8192) {
            this.r = DesugarCollections.unmodifiableList(this.r);
            i = this.d & (-8193);
            this.d = i;
        }
        a6aVar.r = this.r;
        if ((i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) == 16384) {
            i3 |= 256;
        }
        a6aVar.s = this.s;
        if ((i & 32768) == 32768) {
            this.t = DesugarCollections.unmodifiableList(this.t);
            i = (-32769) & this.d;
            this.d = i;
        }
        a6aVar.t = this.t;
        if ((i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) == 65536) {
            this.u = DesugarCollections.unmodifiableList(this.u);
            i = (-65537) & this.d;
            this.d = i;
        }
        a6aVar.u = this.u;
        if ((i & 131072) == 131072) {
            this.v = DesugarCollections.unmodifiableList(this.v);
            this.d &= -131073;
        }
        a6aVar.v = this.v;
        a6aVar.c = i3;
        return a6aVar;
    }

    public final void h(a6a a6aVar) {
        p5a p5aVar;
        y6a y6aVar;
        s6a s6aVar;
        s6a s6aVar2;
        if (a6aVar == a6a.y) {
            return;
        }
        int i = a6aVar.c;
        if ((i & 1) == 1) {
            int i2 = a6aVar.d;
            this.d = 1 | this.d;
            this.e = i2;
        }
        if ((i & 2) == 2) {
            int i3 = a6aVar.e;
            this.d = 2 | this.d;
            this.f = i3;
        }
        if ((i & 4) == 4) {
            int i4 = a6aVar.f;
            this.d = 4 | this.d;
            this.g = i4;
        }
        if ((i & 8) == 8) {
            s6a s6aVar3 = a6aVar.g;
            if ((this.d & 8) != 8 || (s6aVar2 = this.h) == s6a.t) {
                this.h = s6aVar3;
            } else {
                r6a r6aVarP = s6a.p(s6aVar2);
                r6aVarP.h(s6aVar3);
                this.h = r6aVarP.e();
            }
            this.d |= 8;
        }
        if ((a6aVar.c & 16) == 16) {
            int i5 = a6aVar.h;
            this.d = 16 | this.d;
            this.i = i5;
        }
        if (!a6aVar.i.isEmpty()) {
            if (this.j.isEmpty()) {
                this.j = a6aVar.i;
                this.d &= -33;
            } else {
                if ((this.d & 32) != 32) {
                    this.j = new ArrayList(this.j);
                    this.d |= 32;
                }
                this.j.addAll(a6aVar.i);
            }
        }
        if ((a6aVar.c & 32) == 32) {
            s6a s6aVar4 = a6aVar.j;
            if ((this.d & 64) != 64 || (s6aVar = this.k) == s6a.t) {
                this.k = s6aVar4;
            } else {
                r6a r6aVarP2 = s6a.p(s6aVar);
                r6aVarP2.h(s6aVar4);
                this.k = r6aVarP2.e();
            }
            this.d |= 64;
        }
        if ((a6aVar.c & 64) == 64) {
            int i6 = a6aVar.k;
            this.d |= 128;
            this.l = i6;
        }
        if (!a6aVar.l.isEmpty()) {
            if (this.m.isEmpty()) {
                this.m = a6aVar.l;
                this.d &= -257;
            } else {
                if ((this.d & 256) != 256) {
                    this.m = new ArrayList(this.m);
                    this.d |= 256;
                }
                this.m.addAll(a6aVar.l);
            }
        }
        if (!a6aVar.m.isEmpty()) {
            if (this.n.isEmpty()) {
                this.n = a6aVar.m;
                this.d &= -513;
            } else {
                if ((this.d & 512) != 512) {
                    this.n = new ArrayList(this.n);
                    this.d |= 512;
                }
                this.n.addAll(a6aVar.m);
            }
        }
        if (!a6aVar.o.isEmpty()) {
            if (this.o.isEmpty()) {
                this.o = a6aVar.o;
                this.d &= -1025;
            } else {
                if ((this.d & 1024) != 1024) {
                    this.o = new ArrayList(this.o);
                    this.d |= 1024;
                }
                this.o.addAll(a6aVar.o);
            }
        }
        if (!a6aVar.p.isEmpty()) {
            if (this.p.isEmpty()) {
                this.p = a6aVar.p;
                this.d &= -2049;
            } else {
                if ((this.d & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 2048) {
                    this.p = new ArrayList(this.p);
                    this.d |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
                }
                this.p.addAll(a6aVar.p);
            }
        }
        if ((a6aVar.c & 128) == 128) {
            y6a y6aVar2 = a6aVar.q;
            if ((this.d & 4096) != 4096 || (y6aVar = this.q) == y6a.g) {
                this.q = y6aVar2;
            } else {
                g5a g5aVarG = y6a.g(y6aVar);
                g5aVarG.h(y6aVar2);
                this.q = g5aVarG.e();
            }
            this.d |= 4096;
        }
        if (!a6aVar.r.isEmpty()) {
            if (this.r.isEmpty()) {
                this.r = a6aVar.r;
                this.d &= -8193;
            } else {
                if ((this.d & 8192) != 8192) {
                    this.r = new ArrayList(this.r);
                    this.d |= 8192;
                }
                this.r.addAll(a6aVar.r);
            }
        }
        if ((a6aVar.c & 256) == 256) {
            p5a p5aVar2 = a6aVar.s;
            if ((this.d & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 16384 || (p5aVar = this.s) == p5a.e) {
                this.s = p5aVar2;
            } else {
                o5a o5aVar = new o5a(0);
                o5aVar.d = Collections.EMPTY_LIST;
                o5aVar.i(p5aVar);
                o5aVar.i(p5aVar2);
                this.s = o5aVar.d();
            }
            this.d |= OlympusMakernoteDirectory.TAG_MAIN_INFO;
        }
        if (!a6aVar.t.isEmpty()) {
            if (this.t.isEmpty()) {
                this.t = a6aVar.t;
                this.d &= -32769;
            } else {
                if ((this.d & 32768) != 32768) {
                    this.t = new ArrayList(this.t);
                    this.d |= 32768;
                }
                this.t.addAll(a6aVar.t);
            }
        }
        if (!a6aVar.u.isEmpty()) {
            if (this.u.isEmpty()) {
                this.u = a6aVar.u;
                this.d &= -65537;
            } else {
                if ((this.d & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 65536) {
                    this.u = new ArrayList(this.u);
                    this.d |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
                }
                this.u.addAll(a6aVar.u);
            }
        }
        if (!a6aVar.v.isEmpty()) {
            if (this.v.isEmpty()) {
                this.v = a6aVar.v;
                this.d &= -131073;
            } else {
                if ((this.d & 131072) != 131072) {
                    this.v = new ArrayList(this.v);
                    this.d |= 131072;
                }
                this.v.addAll(a6aVar.v);
            }
        }
        d(a6aVar);
        this.a = this.a.e(a6aVar.b);
    }
}
