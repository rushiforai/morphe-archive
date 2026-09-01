package defpackage;

import android.app.Activity;
import android.content.ContentProviderClient;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.Window;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.firebase.auth.FirebaseAuth;
import gen.model.SourceParameter;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeoutException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class md5 implements jy7, cw2, pq3, iz4, qnc, c8 {
    public static volatile md5 c;
    public static final bv8 d = new bv8(1);
    public static final bv8 e = new bv8(0);
    public static final cd7 f = new cd7();
    public final /* synthetic */ int a;
    public final Object b;

    public md5(int i) {
        this.a = i;
        switch (i) {
            case 2:
                int i2 = g3g.a;
                this.b = new ujf(20, new a7g[]{xsa.j, f});
                break;
            case 12:
                this.b = gsa.W(Looper.getMainLooper());
                break;
            case 27:
                this.b = Build.VERSION.SDK_INT >= 28 ? new ep6() : new y3b(21);
                break;
            default:
                this.b = new HashSet();
                break;
        }
    }

    @Override // defpackage.c8
    /* JADX INFO: renamed from: A, reason: merged with bridge method [inline-methods] */
    public void toJson(ae6 ae6Var, yl2 yl2Var, yv8 yv8Var) {
        yl2Var.getClass();
        yv8Var.getClass();
        ((c8) this.b).toJson(ae6Var, yl2Var, yv8Var.a);
    }

    @Override // defpackage.cw2
    public Object B(ha3 ha3Var, Object obj) {
        StringBuilder sb = (StringBuilder) obj;
        w83 w83Var = (w83) this.b;
        w83Var.getClass();
        w83Var.x(sb, ha3Var, null);
        g93 g93Var = ha3Var.g;
        g93Var.getClass();
        w83Var.f0(g93Var, sb);
        w83Var.J(ha3Var, sb);
        sb.append(w83Var.H("typealias"));
        sb.append(" ");
        w83Var.O(ha3Var, sb, true);
        w83Var.b0(sb, ha3Var.g0(), false);
        w83Var.z(ha3Var, sb);
        sb.append(" = ");
        sb.append(w83Var.W(ha3Var.A0()));
        return c1e.a;
    }

    public void C(float f2, float f3) {
        ((m50) this.b).x().p(f2, f3);
    }

    @Override // defpackage.cw2
    public Object D(c38 c38Var, Object obj) {
        ((w83) this.b).O(c38Var, (StringBuilder) obj, true);
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01d3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void E(defpackage.s55 r10, java.lang.StringBuilder r11) {
        /*
            Method dump skipped, instruction units count: 495
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.md5.E(s55, java.lang.StringBuilder):void");
    }

    public void F(o4a o4aVar, StringBuilder sb, String str) {
        w83 w83Var = (w83) this.b;
        g52 g52Var = w83Var.a.H;
        fj6 fj6Var = a93.Y[32];
        g52Var.getClass();
        fj6Var.getClass();
        int i = u83.a[((p4a) g52Var.a).ordinal()];
        if (i == 1) {
            w83Var.J(o4aVar, sb);
            sb.append(str.concat(" for "));
            w83Var.T(o4aVar.i, sb);
        } else if (i == 2) {
            E(o4aVar, sb);
        } else {
            if (i == 3) {
                return;
            }
            ygf.a();
        }
    }

    @Override // defpackage.cw2
    public Object H(r4a r4aVar, Object obj) {
        ((w83) this.b).T(r4aVar, (StringBuilder) obj);
        return c1e.a;
    }

    @Override // defpackage.cw2
    public /* bridge */ /* synthetic */ Object J(s55 s55Var, Object obj) {
        E(s55Var, (StringBuilder) obj);
        return c1e.a;
    }

    @Override // defpackage.pq3
    public void L(String str) {
        ht3 ht3Var = (ht3) this.b;
        ht3Var.j.d("post_id", str);
        ht3Var.i(str);
        SourceParameter sourceParameter = ht3Var.v;
        ht3Var.v = sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : str, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null);
    }

    @Override // defpackage.cw2
    public Object Q(y28 y28Var, Object obj) throws IOException {
        zm1 zm1VarO0;
        String str;
        StringBuilder sb = (StringBuilder) obj;
        w83 w83Var = (w83) this.b;
        a93 a93Var = w83Var.a;
        int i = 1;
        boolean z = y28Var.b0() == qn1.ENUM_ENTRY;
        if (!w83Var.q()) {
            List listA0 = y28Var.a0();
            listA0.getClass();
            w83Var.B(sb, listA0);
            w83Var.x(sb, y28Var, null);
            if (!z) {
                g93 visibility = y28Var.getVisibility();
                visibility.getClass();
                w83Var.f0(visibility, sb);
            }
            if ((y28Var.b0() != qn1.INTERFACE || y28Var.o() != c28.ABSTRACT) && (!y28Var.b0().isSingleton() || y28Var.o() != c28.FINAL)) {
                c28 c28VarO = y28Var.o();
                c28VarO.getClass();
                w83Var.K(c28VarO, sb, w83.u(y28Var));
            }
            w83Var.J(y28Var, sb);
            w83Var.M(sb, w83Var.p().contains(y83.INNER) && y28Var.g(), "inner");
            w83Var.M(sb, w83Var.p().contains(y83.DATA) && y28Var.r0(), "data");
            w83Var.M(sb, w83Var.p().contains(y83.INLINE) && y28Var.isInline(), "inline");
            w83Var.M(sb, w83Var.p().contains(y83.VALUE) && y28Var.t0(), "value");
            w83Var.M(sb, w83Var.p().contains(y83.FUN) && y28Var.s0(), "fun");
            if (y28Var.q0()) {
                str = "companion object";
            } else {
                switch (q83.a[y28Var.b0().ordinal()]) {
                    case 1:
                        str = "class";
                        break;
                    case 2:
                        str = "interface";
                        break;
                    case 3:
                        str = "enum class";
                        break;
                    case 4:
                        str = "object";
                        break;
                    case 5:
                        str = "annotation class";
                        break;
                    case 6:
                        str = "enum entry";
                        break;
                    default:
                        ygf.a();
                        return null;
                }
            }
            sb.append(w83Var.H(str));
        }
        if (d93.l(y28Var)) {
            g52 g52Var = a93Var.G;
            fj6 fj6Var = a93.Y[31];
            g52Var.getClass();
            fj6Var.getClass();
            if (((Boolean) g52Var.a).booleanValue()) {
                if (w83Var.q()) {
                    sb.append("companion object");
                }
                w83.V(sb);
                yv2 yv2VarH = y28Var.h();
                if (yv2VarH != null) {
                    sb.append("of ");
                    n98 name = yv2VarH.getName();
                    name.getClass();
                    sb.append(w83Var.N(name, false));
                }
            }
            if (w83Var.t() || !g76.L(y28Var.getName(), olc.b)) {
                if (!w83Var.q()) {
                    w83.V(sb);
                }
                n98 name2 = y28Var.getName();
                name2.getClass();
                sb.append(w83Var.N(name2, true));
            }
        } else {
            if (!w83Var.q()) {
                w83.V(sb);
            }
            w83Var.O(y28Var, sb, true);
        }
        if (!z) {
            List listG0 = y28Var.g0();
            listG0.getClass();
            w83Var.b0(sb, listG0, false);
            w83Var.z(y28Var, sb);
            if (!y28Var.b0().isSingleton()) {
                g52 g52Var2 = a93Var.i;
                fj6 fj6Var2 = a93.Y[7];
                g52Var2.getClass();
                fj6Var2.getClass();
                if (((Boolean) g52Var2.a).booleanValue() && (zm1VarO0 = y28Var.o0()) != null) {
                    sb.append(" ");
                    w83Var.x(sb, zm1VarO0, null);
                    g93 visibility2 = zm1VarO0.getVisibility();
                    visibility2.getClass();
                    w83Var.f0(visibility2, sb);
                    sb.append(w83Var.H("constructor"));
                    List listI = zm1VarO0.I();
                    listI.getClass();
                    w83Var.e0(sb, listI, zm1VarO0.u());
                }
            }
            g52 g52Var3 = a93Var.x;
            fj6 fj6Var3 = a93.Y[22];
            g52Var3.getClass();
            fj6Var3.getClass();
            if (!((Boolean) g52Var3.a).booleanValue() && !vm6.E(y28Var.T())) {
                Collection collectionB = y28Var.n().b();
                collectionB.getClass();
                if (!collectionB.isEmpty() && (collectionB.size() != 1 || !vm6.x((mn6) collectionB.iterator().next()))) {
                    w83.V(sb);
                    sb.append(": ");
                    bu1.E0(collectionB, sb, ", ", null, null, new t83(w83Var, i), 60);
                }
            }
            w83Var.g0(sb, listG0);
        }
        return c1e.a;
    }

    @Override // defpackage.cw2
    public Object X(xx8 xx8Var, Object obj) {
        StringBuilder sb = (StringBuilder) obj;
        w83 w83Var = (w83) this.b;
        w83Var.getClass();
        y05 y05Var = xx8Var.f;
        sb.append(w83Var.H("package-fragment"));
        z05 z05Var = y05Var.a;
        z05Var.getClass();
        String strN = w83Var.n(aq7.B(z05.f(z05Var)));
        if (strN.length() > 0) {
            sb.append(" ");
            sb.append(strN);
        }
        if (w83Var.a.o()) {
            sb.append(" in ");
            w83Var.O(xx8Var.h(), sb, false);
        }
        return c1e.a;
    }

    public eb2 a(eb2 eb2Var) {
        return eb2Var instanceof c3b ? eb2Var : new ib(-((dk7) this.b).f(), eb2Var);
    }

    @Override // defpackage.jy7
    public void b(lx7 lx7Var, boolean z) {
        e20 e20Var;
        int i = this.a;
        Object obj = this.b;
        int i2 = 0;
        switch (i) {
            case 3:
                if (lx7Var instanceof dvc) {
                    ((dvc) lx7Var).z.k().c(false);
                }
                jy7 jy7Var = ((h6) obj).e;
                if (jy7Var != null) {
                    jy7Var.b(lx7Var, z);
                }
                break;
            default:
                f20 f20Var = (f20) obj;
                lx7 lx7VarK = lx7Var.k();
                boolean z2 = lx7VarK != lx7Var;
                if (z2) {
                    lx7Var = lx7VarK;
                }
                e20[] e20VarArr = f20Var.L;
                int length = e20VarArr != null ? e20VarArr.length : 0;
                while (true) {
                    if (i2 >= length) {
                        e20Var = null;
                    } else {
                        e20Var = e20VarArr[i2];
                        if (e20Var == null || e20Var.h != lx7Var) {
                            i2++;
                        }
                    }
                }
                if (e20Var != null) {
                    if (!z2) {
                        f20Var.r(e20Var, z);
                    } else {
                        f20Var.p(e20Var.a, e20Var, lx7VarK);
                        f20Var.r(e20Var, true);
                    }
                }
                break;
        }
    }

    public void c() {
        ((l22) this.b).getClass();
    }

    @Override // defpackage.iz4
    public void close() {
        ContentProviderClient contentProviderClient = (ContentProviderClient) this.b;
        if (contentProviderClient != null) {
            contentProviderClient.release();
        }
    }

    @Override // defpackage.qnc
    public void d(Intent intent, int i) {
        ((Activity) this.b).startActivityForResult(intent, i);
    }

    public long e() {
        int i = uu1.i;
        long j = ((Parcel) this.b).readLong();
        long j2 = 63 & j;
        return j2 < 16 ? j : (j & (-64)) | (j2 + 1);
    }

    @Override // defpackage.qnc
    public Activity f() {
        return (Activity) this.b;
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        return new yv8(((c8) this.b).fromJson(fd6Var, yl2Var));
    }

    public long g() {
        Parcel parcel = (Parcel) this.b;
        byte b = parcel.readByte();
        long j = b == 1 ? 4294967296L : b == 2 ? 8589934592L : 0L;
        return rkd.a(j, 0L) ? qkd.c : en7.M(parcel.readFloat(), j);
    }

    public Set h() {
        Set setUnmodifiableSet;
        synchronized (((HashSet) this.b)) {
            setUnmodifiableSet = DesugarCollections.unmodifiableSet((HashSet) this.b);
        }
        return setUnmodifiableSet;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0046  */
    @Override // defpackage.cw2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object h0(defpackage.zm1 r11, java.lang.Object r12) {
        /*
            Method dump skipped, instruction units count: 317
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.md5.h0(zm1, java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.cw2
    public Object i(s4a s4aVar, Object obj) {
        F(s4aVar, (StringBuilder) obj, "getter");
        return c1e.a;
    }

    @Override // defpackage.pq3
    public void k(or3 or3Var) {
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object l(java.lang.String r8, defpackage.yd4 r9, defpackage.p92 r10) {
        /*
            r7 = this;
            boolean r0 = r10 instanceof defpackage.ge4
            if (r0 == 0) goto L13
            r0 = r10
            ge4 r0 = (defpackage.ge4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ge4 r0 = new ge4
            r0.<init>(r7, r10)
        L18:
            java.lang.Object r10 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            r5 = 0
            if (r2 == 0) goto L33
            if (r2 != r3) goto L2d
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r7 = r10.a
            goto L4d
        L2d:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L33:
            java.lang.String r2 = "Fetch publication: "
            java.lang.String r10 = defpackage.wgd.u(r10, r2, r8)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r6 = new java.lang.Object[r4]
            defpackage.km4.I(r2, r5, r10, r6, r10)
            java.lang.Object r7 = r7.b
            kla r7 = (defpackage.kla) r7
            r0.d = r3
            java.lang.Object r7 = r7.i(r8, r9, r0)
            if (r7 != r1) goto L4d
            return r1
        L4d:
            boolean r8 = r7 instanceof defpackage.ajb
            if (r8 != 0) goto L5d
            r8 = r7
            com.medium.android.graphql.fragment.CollectionProfileData r8 = (com.medium.android.graphql.fragment.CollectionProfileData) r8
            uld r8 = defpackage.wld.a
            java.lang.Object[] r9 = new java.lang.Object[r4]
            java.lang.String r10 = "Fetch publication successful"
            defpackage.km4.I(r8, r5, r10, r9, r10)
        L5d:
            java.lang.Throwable r8 = defpackage.bjb.b(r7)
            if (r8 == 0) goto L6c
            uld r9 = defpackage.wld.a
            java.lang.Object[] r10 = new java.lang.Object[r4]
            java.lang.String r0 = "Fetch current publication failed"
            r9.e(r8, r0, r10)
        L6c:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.md5.l(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object m(java.lang.String r9, java.lang.String r10, defpackage.p92 r11) {
        /*
            r8 = this;
            boolean r0 = r11 instanceof defpackage.tj5
            if (r0 == 0) goto L13
            r0 = r11
            tj5 r0 = (defpackage.tj5) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            tj5 r0 = new tj5
            r0.<init>(r8, r11)
        L18:
            java.lang.Object r11 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            r5 = 0
            java.lang.String r6 = "Hide repost note for postId="
            if (r2 == 0) goto L37
            if (r2 != r3) goto L31
            java.lang.String r9 = r0.b
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r8 = r11.a
            goto L64
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r5
        L37:
            defpackage.br7.v(r11)
            java.lang.StringBuilder r11 = new java.lang.StringBuilder
            r11.<init>(r6)
            r11.append(r9)
            java.lang.String r2 = " userId="
            r11.append(r2)
            r11.append(r10)
            java.lang.String r11 = r11.toString()
            uld r2 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r4]
            defpackage.km4.I(r2, r5, r11, r7, r11)
            java.lang.Object r8 = r8.b
            gn9 r8 = (defpackage.gn9) r8
            r0.b = r9
            r0.e = r3
            java.lang.Object r8 = r8.o(r9, r10, r0)
            if (r8 != r1) goto L64
            return r1
        L64:
            boolean r10 = r8 instanceof defpackage.ajb
            if (r10 != 0) goto L78
            r10 = r8
            c1e r10 = (defpackage.c1e) r10
            java.lang.String r10 = " successful"
            java.lang.String r10 = defpackage.ev6.x(r6, r9, r10)
            uld r11 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r4]
            defpackage.km4.I(r11, r5, r10, r0, r10)
        L78:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 == 0) goto L8b
            java.lang.String r11 = " failed"
            java.lang.String r9 = defpackage.ev6.x(r6, r9, r11)
            uld r11 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r4]
            r11.e(r10, r9, r0)
        L8b:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.md5.m(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.cw2
    public Object n(lqe lqeVar, Object obj) {
        ((w83) this.b).d0(lqeVar, true, (StringBuilder) obj, true);
        return c1e.a;
    }

    @Override // defpackage.cw2
    public Object o(c3 c3Var, Object obj) {
        ((w83) this.b).Z(c3Var, (StringBuilder) obj, true);
        return c1e.a;
    }

    @Override // defpackage.pq3
    public void p(or3 or3Var) {
    }

    @Override // defpackage.jy7
    public boolean q(lx7 lx7Var) {
        Window.Callback callback;
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 3:
                h6 h6Var = (h6) obj;
                if (lx7Var != h6Var.c) {
                    sx7 sx7Var = ((dvc) lx7Var).A;
                    jy7 jy7Var = h6Var.e;
                    if (jy7Var != null) {
                        return jy7Var.q(lx7Var);
                    }
                }
                return false;
            default:
                f20 f20Var = (f20) obj;
                if (lx7Var != lx7Var.k() || !f20Var.F || (callback = f20Var.l.getCallback()) == null || f20Var.Q) {
                    return true;
                }
                callback.onMenuOpened(108, lx7Var);
                return true;
        }
    }

    @Override // defpackage.cw2
    public Object r(yq6 yq6Var, Object obj) {
        ((StringBuilder) obj).append(yq6Var.getName());
        return c1e.a;
    }

    public void s(String str, Bundle bundle) {
        f94 f94Var = f94.a;
        if (mme.c()) {
            ((g50) this.b).g(str, bundle);
        }
    }

    public void t(View view) {
        if (view.getParent() != null) {
            view.setVisibility(8);
        }
        ((jo0) this.b).a(0);
    }

    public void u(iv2 iv2Var, Thread thread, Throwable th) {
        jc2 jc2Var = (jc2) this.b;
        synchronized (jc2Var) {
            String str = "Handling uncaught exception \"" + th + "\" from thread " + thread.getName();
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", str, null);
            }
            bgf.E();
            try {
                ipe.a(((ud2) jc2Var.e.b).b(new hc2(jc2Var, System.currentTimeMillis(), th, thread, iv2Var)));
            } catch (TimeoutException unused) {
                Log.e("FirebaseCrashlytics", "Cannot send reports. Timed out while fetching settings.", null);
            } catch (Exception e2) {
                Log.e("FirebaseCrashlytics", "Error handling uncaught exception", e2);
            }
        }
    }

    @Override // defpackage.iz4
    public Cursor v(Uri uri, String[] strArr, String[] strArr2) {
        ContentProviderClient contentProviderClient = (ContentProviderClient) this.b;
        if (contentProviderClient == null) {
            return null;
        }
        try {
            return contentProviderClient.query(uri, strArr, "query = ?", strArr2, null, null);
        } catch (RemoteException e2) {
            Log.w("FontsProvider", "Unable to query the content provider", e2);
            return null;
        }
    }

    @Override // defpackage.cw2
    public Object w(x4a x4aVar, Object obj) {
        F(x4aVar, (StringBuilder) obj, "setter");
        return c1e.a;
    }

    @Override // defpackage.cw2
    public Object x(rv6 rv6Var, Object obj) {
        StringBuilder sb = (StringBuilder) obj;
        w83 w83Var = (w83) this.b;
        w83Var.getClass();
        y05 y05Var = rv6Var.e;
        sb.append(w83Var.H("package"));
        z05 z05Var = y05Var.a;
        z05Var.getClass();
        String strN = w83Var.n(aq7.B(z05.f(z05Var)));
        if (strN.length() > 0) {
            sb.append(" ");
            sb.append(strN);
        }
        if (w83Var.a.o()) {
            sb.append(" in context of ");
            w83Var.O(rv6Var.d, sb, false);
        }
        return c1e.a;
    }

    public void y(float f2, long j) {
        e61 e61VarX = ((m50) this.b).x();
        int i = (int) (j >> 32);
        int i2 = (int) (j & 4294967295L);
        e61VarX.p(Float.intBitsToFloat(i), Float.intBitsToFloat(i2));
        e61VarX.c(f2);
        e61VarX.p(-Float.intBitsToFloat(i), -Float.intBitsToFloat(i2));
    }

    public void z(float f2, float f3, long j) {
        e61 e61VarX = ((m50) this.b).x();
        int i = (int) (j >> 32);
        int i2 = (int) (j & 4294967295L);
        e61VarX.p(Float.intBitsToFloat(i), Float.intBitsToFloat(i2));
        e61VarX.b(f2, f3);
        e61VarX.p(-Float.intBitsToFloat(i), -Float.intBitsToFloat(i2));
    }

    public void j(float f2, float f3, float f4, float f5) {
        m50 m50Var = (m50) this.b;
        e61 e61VarX = m50Var.x();
        float fIntBitsToFloat = Float.intBitsToFloat((int) (m50Var.B() >> 32)) - (f4 + f2);
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (m50Var.B() & 4294967295L)) - (f5 + f3))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
        if (Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)) < 0.0f || Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)) < 0.0f) {
            a26.a(AXoTRPEGKEve.saUxlxHtXO);
        }
        m50Var.Q(jFloatToRawIntBits);
        e61VarX.p(f2, f3);
    }

    public md5(zk2 zk2Var) {
        this.a = 18;
        zk2Var.getClass();
        this.b = zk2Var;
    }

    public md5(gn9 gn9Var) {
        this.a = 19;
        gn9Var.getClass();
        this.b = gn9Var;
    }

    public md5(FirebaseAuth firebaseAuth) {
        String str;
        this.a = 25;
        Bundle bundle = new Bundle();
        this.b = bundle;
        Bundle bundle2 = new Bundle();
        xj4 xj4Var = firebaseAuth.a;
        xj4Var.a();
        bundle.putString("com.google.firebase.auth.KEY_API_KEY", xj4Var.c.a);
        bundle.putString("com.google.firebase.auth.KEY_PROVIDER_ID", "twitter.com");
        bundle.putBundle("com.google.firebase.auth.KEY_PROVIDER_CUSTOM_PARAMS", bundle2);
        bundle.putString("com.google.firebase.auth.internal.CLIENT_VERSION", d87.m().n());
        synchronized (firebaseAuth.h) {
            str = firebaseAuth.i;
        }
        bundle.putString("com.google.firebase.auth.KEY_TENANT_ID", str);
        xj4Var.a();
        bundle.putString("com.google.firebase.auth.KEY_FIREBASE_APP_NAME", xj4Var.b);
        bundle.putString("com.google.firebase.auth.KEY_CUSTOM_AUTH_DOMAIN", null);
    }

    public md5(Context context) {
        this.a = 20;
        this.b = new g50(context, (String) null);
    }

    public md5(Context context, String str) {
        this.a = 20;
        this.b = new g50(context, str);
    }

    public /* synthetic */ md5(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public md5(em6 em6Var) {
        this.a = 21;
        em6Var.getClass();
        this.b = new ArrayList(1);
    }

    public md5(n68 n68Var, t41 t41Var) {
        this.a = 1;
        this.b = t41Var;
    }

    public md5(c8 c8Var) {
        this.a = 29;
        c8Var.getClass();
        this.b = c8Var;
    }

    public md5(String str) {
        this.a = 11;
        Parcel parcelObtain = Parcel.obtain();
        this.b = parcelObtain;
        byte[] bArrDecode = Base64.decode(str, 0);
        parcelObtain.unmarshall(bArrDecode, 0, bArrDecode.length);
        parcelObtain.setDataPosition(0);
    }

    public md5(Context context, Uri uri) {
        this.a = 17;
        this.b = context.getContentResolver().acquireUnstableContentProviderClient(uri);
    }

    public md5(Activity activity) {
        this.a = 23;
        activity.getClass();
        this.b = activity;
    }
}
