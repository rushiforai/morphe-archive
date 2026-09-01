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
public final class h6a extends k75 {
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
    public a7a p;
    public int q;
    public int r;
    public List s;
    public List t;
    public List u;
    public List v;
    public List w;
    public List x;
    public List y;
    public List z;

    public static h6a g() {
        h6a h6aVar = new h6a();
        h6aVar.e = 518;
        h6aVar.f = 2054;
        s6a s6aVar = s6a.t;
        h6aVar.h = s6aVar;
        List list = Collections.EMPTY_LIST;
        h6aVar.j = list;
        h6aVar.k = s6aVar;
        h6aVar.m = list;
        h6aVar.n = list;
        h6aVar.o = list;
        h6aVar.p = a7a.n;
        h6aVar.s = list;
        h6aVar.t = list;
        h6aVar.u = list;
        h6aVar.v = list;
        h6aVar.w = list;
        h6aVar.x = list;
        h6aVar.y = list;
        h6aVar.z = list;
        return h6aVar;
    }

    @Override // defpackage.g75
    public final q1 a() {
        i6a i6aVarE = e();
        if (i6aVarE.isInitialized()) {
            return i6aVarE;
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
            vf6 r1 = defpackage.i6a.D     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.getClass()     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            i6a r1 = new i6a     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r1.<init>(r3, r4)     // Catch: java.lang.Throwable -> Lf kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L11
            r2.h(r1)
            return r2
        Lf:
            r3 = move-exception
            goto L19
        L11:
            r3 = move-exception
            q1 r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            i6a r4 = (defpackage.i6a) r4     // Catch: java.lang.Throwable -> Lf
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h6a.b(tp1, q74):g75");
    }

    @Override // defpackage.g75
    public final /* bridge */ /* synthetic */ g75 c(s75 s75Var) {
        h((i6a) s75Var);
        return this;
    }

    public final Object clone() {
        h6a h6aVarG = g();
        h6aVarG.h(e());
        return h6aVarG;
    }

    public final i6a e() {
        int i;
        i6a i6aVar = new i6a(this);
        int i2 = this.d;
        int i3 = (i2 & 1) != 1 ? 0 : 1;
        i6aVar.d = this.e;
        if ((i2 & 2) == 2) {
            i3 |= 2;
        }
        i6aVar.e = this.f;
        if ((i2 & 4) == 4) {
            i3 |= 4;
        }
        i6aVar.f = this.g;
        if ((i2 & 8) == 8) {
            i3 |= 8;
        }
        i6aVar.g = this.h;
        if ((i2 & 16) == 16) {
            i3 |= 16;
        }
        i6aVar.h = this.i;
        if ((i2 & 32) == 32) {
            this.j = DesugarCollections.unmodifiableList(this.j);
            i = this.d & (-33);
            this.d = i;
        } else {
            i = i2;
        }
        i6aVar.i = this.j;
        if ((i2 & 64) == 64) {
            i3 |= 32;
        }
        i6aVar.j = this.k;
        if ((i2 & 128) == 128) {
            i3 |= 64;
        }
        i6aVar.k = this.l;
        if ((i & 256) == 256) {
            this.m = DesugarCollections.unmodifiableList(this.m);
            i = this.d & (-257);
            this.d = i;
        }
        i6aVar.l = this.m;
        if ((i & 512) == 512) {
            this.n = DesugarCollections.unmodifiableList(this.n);
            i = this.d & (-513);
            this.d = i;
        }
        i6aVar.m = this.n;
        if ((i & 1024) == 1024) {
            this.o = DesugarCollections.unmodifiableList(this.o);
            i = this.d & (-1025);
            this.d = i;
        }
        i6aVar.o = this.o;
        if ((i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 2048) {
            i3 |= 128;
        }
        i6aVar.p = this.p;
        if ((i2 & 4096) == 4096) {
            i3 |= 256;
        }
        i6aVar.q = this.q;
        if ((i2 & 8192) == 8192) {
            i3 |= 512;
        }
        i6aVar.r = this.r;
        if ((i & OlympusMakernoteDirectory.TAG_MAIN_INFO) == 16384) {
            this.s = DesugarCollections.unmodifiableList(this.s);
            i = this.d & (-16385);
            this.d = i;
        }
        i6aVar.s = this.s;
        if ((i & 32768) == 32768) {
            this.t = DesugarCollections.unmodifiableList(this.t);
            i = (-32769) & this.d;
            this.d = i;
        }
        i6aVar.t = this.t;
        if ((i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) == 65536) {
            this.u = DesugarCollections.unmodifiableList(this.u);
            i = (-65537) & this.d;
            this.d = i;
        }
        i6aVar.u = this.u;
        if ((i & 131072) == 131072) {
            this.v = DesugarCollections.unmodifiableList(this.v);
            i = (-131073) & this.d;
            this.d = i;
        }
        i6aVar.v = this.v;
        if ((i & 262144) == 262144) {
            this.w = DesugarCollections.unmodifiableList(this.w);
            i = (-262145) & this.d;
            this.d = i;
        }
        i6aVar.w = this.w;
        if ((i & 524288) == 524288) {
            this.x = DesugarCollections.unmodifiableList(this.x);
            i = (-524289) & this.d;
            this.d = i;
        }
        i6aVar.x = this.x;
        if ((i & 1048576) == 1048576) {
            this.y = DesugarCollections.unmodifiableList(this.y);
            i = (-1048577) & this.d;
            this.d = i;
        }
        i6aVar.y = this.y;
        if ((i & 2097152) == 2097152) {
            this.z = DesugarCollections.unmodifiableList(this.z);
            this.d &= -2097153;
        }
        i6aVar.z = this.z;
        i6aVar.c = i3;
        return i6aVar;
    }

    public final void h(i6a i6aVar) {
        a7a a7aVar;
        s6a s6aVar;
        s6a s6aVar2;
        if (i6aVar == i6a.C) {
            return;
        }
        int i = i6aVar.c;
        if ((i & 1) == 1) {
            int i2 = i6aVar.d;
            this.d = 1 | this.d;
            this.e = i2;
        }
        if ((i & 2) == 2) {
            int i3 = i6aVar.e;
            this.d = 2 | this.d;
            this.f = i3;
        }
        if ((i & 4) == 4) {
            int i4 = i6aVar.f;
            this.d = 4 | this.d;
            this.g = i4;
        }
        if ((i & 8) == 8) {
            s6a s6aVar3 = i6aVar.g;
            if ((this.d & 8) != 8 || (s6aVar2 = this.h) == s6a.t) {
                this.h = s6aVar3;
            } else {
                r6a r6aVarP = s6a.p(s6aVar2);
                r6aVarP.h(s6aVar3);
                this.h = r6aVarP.e();
            }
            this.d |= 8;
        }
        if ((i6aVar.c & 16) == 16) {
            int i5 = i6aVar.h;
            this.d = 16 | this.d;
            this.i = i5;
        }
        if (!i6aVar.i.isEmpty()) {
            if (this.j.isEmpty()) {
                this.j = i6aVar.i;
                this.d &= -33;
            } else {
                if ((this.d & 32) != 32) {
                    this.j = new ArrayList(this.j);
                    this.d |= 32;
                }
                this.j.addAll(i6aVar.i);
            }
        }
        if ((i6aVar.c & 32) == 32) {
            s6a s6aVar4 = i6aVar.j;
            if ((this.d & 64) != 64 || (s6aVar = this.k) == s6a.t) {
                this.k = s6aVar4;
            } else {
                r6a r6aVarP2 = s6a.p(s6aVar);
                r6aVarP2.h(s6aVar4);
                this.k = r6aVarP2.e();
            }
            this.d |= 64;
        }
        if ((i6aVar.c & 64) == 64) {
            int i6 = i6aVar.k;
            this.d |= 128;
            this.l = i6;
        }
        if (!i6aVar.l.isEmpty()) {
            if (this.m.isEmpty()) {
                this.m = i6aVar.l;
                this.d &= -257;
            } else {
                if ((this.d & 256) != 256) {
                    this.m = new ArrayList(this.m);
                    this.d |= 256;
                }
                this.m.addAll(i6aVar.l);
            }
        }
        if (!i6aVar.m.isEmpty()) {
            if (this.n.isEmpty()) {
                this.n = i6aVar.m;
                this.d &= -513;
            } else {
                if ((this.d & 512) != 512) {
                    this.n = new ArrayList(this.n);
                    this.d |= 512;
                }
                this.n.addAll(i6aVar.m);
            }
        }
        if (!i6aVar.o.isEmpty()) {
            if (this.o.isEmpty()) {
                this.o = i6aVar.o;
                this.d &= -1025;
            } else {
                if ((this.d & 1024) != 1024) {
                    this.o = new ArrayList(this.o);
                    this.d |= 1024;
                }
                this.o.addAll(i6aVar.o);
            }
        }
        if ((i6aVar.c & 128) == 128) {
            a7a a7aVar2 = i6aVar.p;
            if ((this.d & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 2048 || (a7aVar = this.p) == a7a.n) {
                this.p = a7aVar2;
            } else {
                z6a z6aVarG = z6a.g();
                z6aVarG.h(a7aVar);
                z6aVarG.h(a7aVar2);
                this.p = z6aVarG.e();
            }
            this.d |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
        }
        int i7 = i6aVar.c;
        if ((i7 & 256) == 256) {
            int i8 = i6aVar.q;
            this.d |= 4096;
            this.q = i8;
        }
        if ((i7 & 512) == 512) {
            int i9 = i6aVar.r;
            this.d |= 8192;
            this.r = i9;
        }
        if (!i6aVar.s.isEmpty()) {
            if (this.s.isEmpty()) {
                this.s = i6aVar.s;
                this.d &= -16385;
            } else {
                if ((this.d & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 16384) {
                    this.s = new ArrayList(this.s);
                    this.d |= OlympusMakernoteDirectory.TAG_MAIN_INFO;
                }
                this.s.addAll(i6aVar.s);
            }
        }
        if (!i6aVar.t.isEmpty()) {
            if (this.t.isEmpty()) {
                this.t = i6aVar.t;
                this.d &= -32769;
            } else {
                if ((this.d & 32768) != 32768) {
                    this.t = new ArrayList(this.t);
                    this.d |= 32768;
                }
                this.t.addAll(i6aVar.t);
            }
        }
        if (!i6aVar.u.isEmpty()) {
            if (this.u.isEmpty()) {
                this.u = i6aVar.u;
                this.d &= -65537;
            } else {
                if ((this.d & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 65536) {
                    this.u = new ArrayList(this.u);
                    this.d |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
                }
                this.u.addAll(i6aVar.u);
            }
        }
        if (!i6aVar.v.isEmpty()) {
            if (this.v.isEmpty()) {
                this.v = i6aVar.v;
                this.d &= -131073;
            } else {
                if ((this.d & 131072) != 131072) {
                    this.v = new ArrayList(this.v);
                    this.d |= 131072;
                }
                this.v.addAll(i6aVar.v);
            }
        }
        if (!i6aVar.w.isEmpty()) {
            if (this.w.isEmpty()) {
                this.w = i6aVar.w;
                this.d &= -262145;
            } else {
                if ((this.d & 262144) != 262144) {
                    this.w = new ArrayList(this.w);
                    this.d |= 262144;
                }
                this.w.addAll(i6aVar.w);
            }
        }
        if (!i6aVar.x.isEmpty()) {
            if (this.x.isEmpty()) {
                this.x = i6aVar.x;
                this.d &= -524289;
            } else {
                if ((this.d & 524288) != 524288) {
                    this.x = new ArrayList(this.x);
                    this.d |= 524288;
                }
                this.x.addAll(i6aVar.x);
            }
        }
        if (!i6aVar.y.isEmpty()) {
            if (this.y.isEmpty()) {
                this.y = i6aVar.y;
                this.d &= -1048577;
            } else {
                if ((this.d & 1048576) != 1048576) {
                    this.y = new ArrayList(this.y);
                    this.d |= 1048576;
                }
                this.y.addAll(i6aVar.y);
            }
        }
        if (!i6aVar.z.isEmpty()) {
            if (this.z.isEmpty()) {
                this.z = i6aVar.z;
                this.d &= -2097153;
            } else {
                if ((this.d & 2097152) != 2097152) {
                    this.z = new ArrayList(this.z);
                    this.d |= 2097152;
                }
                this.z.addAll(i6aVar.z);
            }
        }
        d(i6aVar);
        this.a = this.a.e(i6aVar.b);
    }
}
