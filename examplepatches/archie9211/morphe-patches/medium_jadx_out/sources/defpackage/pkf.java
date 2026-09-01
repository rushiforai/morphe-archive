package defpackage;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.preference.PreferenceManager;
import android.support.v4.media.MediaMetadataCompat;
import android.text.TextUtils;
import android.util.Log;
import android.widget.ImageView;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.facebook.FacebookException;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.graphql.fragment.PostMetaData;
import com.medium.proto.event.PaywallViewed;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.KotlinNullPointerException;
import org.json.JSONException;
import retrofit2.HttpException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class pkf implements w84, gd9, v0d, bn1, q09, s3b, i41, w19, veb {
    public static pkf b;
    public static final rz5 c = new rz5(27);
    public static final Object d = new Object();
    public Object a;

    public pkf(int i) {
        switch (i) {
            case 3:
                this.a = new HashMap();
                break;
            case 18:
                this.a = new HashSet();
                break;
            case 19:
                this.a = new Bundle();
                break;
            case 28:
                this.a = new LinkedHashMap();
                break;
            default:
                int i2 = gmf.a;
                this.a = new hha(new eof[]{y3b.m, c});
                break;
        }
    }

    public static synchronized pkf M(Context context) {
        return P(context.getApplicationContext());
    }

    public static synchronized pkf P(Context context) {
        String strE;
        pkf pkfVar = b;
        if (pkfVar != null) {
            return pkfVar;
        }
        pkf pkfVar2 = new pkf();
        zrc zrcVarA = zrc.a(context);
        pkfVar2.a = zrcVarA;
        zrcVarA.b();
        String strE2 = zrcVarA.e("defaultGoogleSignInAccount");
        if (!TextUtils.isEmpty(strE2) && (strE = zrcVarA.e(zrc.f("googleSignInOptions", strE2))) != null) {
            try {
                GoogleSignInOptions.d(strE);
            } catch (JSONException unused) {
            }
        }
        b = pkfVar2;
        return pkfVar2;
    }

    public synchronized Set A() {
        Set setKeySet;
        setKeySet = ((HashMap) this.a).keySet();
        setKeySet.getClass();
        return setKeySet;
    }

    @Override // defpackage.veb
    public void B(String str, String str2, boolean z) {
        str.getClass();
        ko9 ko9Var = (ko9) this.a;
        vx0.c0(f76.F(ko9Var), null, null, new co9(ko9Var, str, z, str2, null, 0), 3);
    }

    @Override // defpackage.gd9
    public long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        o46Var.getClass();
        ip6Var.getClass();
        return (((long) (((o46Var.a + o46Var.c) - ((int) (j2 >> 32))) / 2)) << 32) | (((long) (nk7.w0(((Number) ((ou) this.a).d()).floatValue()) + (o46Var.b - ((int) (j2 & 4294967295L))))) & 4294967295L);
    }

    @Override // defpackage.veb
    public void D(String str, String str2) {
        str.getClass();
    }

    public void E(s79 s79Var) {
        sw9 sw9Var = (sw9) this.a;
        vx0.c0(f76.F(sw9Var), null, null, new mw9(sw9Var, s79Var, gp7.u(s79Var.a()), (n92) null, 0), 3);
    }

    @Override // defpackage.veb
    public void F(String str, String str2) {
        str.getClass();
        ko9 ko9Var = (ko9) this.a;
        vx0.c0(f76.F(ko9Var), null, null, new do9(ko9Var, str, str2, null, 0), 3);
    }

    public void G(s79 s79Var) {
        sw9 sw9Var = (sw9) this.a;
        String str = sw9Var.d;
        String str2 = sw9Var.D0;
        if (sw9Var.t0) {
            return;
        }
        sw9Var.t0 = true;
        String strU = gp7.u(s79Var.a());
        sw9Var.p.f(s79Var.e(), str2, strU, str);
        ax2 ax2Var = sw9Var.q;
        r79 r79VarC = s79Var.c();
        String strD = s79Var.d();
        String strB = s79Var.b();
        ax2Var.getClass();
        r79VarC.getClass();
        strB.getClass();
        rqd.a(ax2Var.b, new PaywallViewed(null, r79VarC.getValue(), strB, strD, null, 17, null), str, strU, false, null, str2, 24);
    }

    public void H(String str, String str2) {
        y70 y70Var = MediaMetadataCompat.c;
        if (!y70Var.containsKey(str) || ((Integer) y70Var.get(str)).intValue() == 1) {
            ((Bundle) this.a).putCharSequence(str, str2);
        } else {
            ay0.e(ev6.x("The ", str, " key cannot be used to put a String"));
        }
    }

    @Override // defpackage.veb
    public void I(String str, String str2) {
        str.getClass();
        hx4 hx4Var = ((ko9) this.a).q;
        hx4Var.getClass();
        sw9 sw9Var = (sw9) hx4Var.b;
        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 7), 3);
    }

    @Override // defpackage.veb
    public void J(String str, String str2) {
        str.getClass();
        ko9 ko9Var = (ko9) this.a;
        vob vobVar = ko9Var.p;
        Set set = (Set) vobVar.a("responses_displayed");
        Set setP1 = set != null ? bu1.p1(set) : new LinkedHashSet();
        if (setP1.add(str)) {
            vobVar.d("responses_displayed", setP1);
            b09.Y(ko9Var.o, str, PostClientVisibilityState.PUBLIC, PostDensity.POST_DENSITY_SMALL_PREVIEW, ko9Var.d, str2, ko9Var.e, false, 448);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.veb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object K(java.lang.String r5, int r6, java.lang.String r7, defpackage.n92 r8) {
        /*
            r4 = this;
            boolean r0 = r8 instanceof defpackage.mo9
            if (r0 == 0) goto L13
            r0 = r8
            mo9 r0 = (defpackage.mo9) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L1a
        L13:
            mo9 r0 = new mo9
            p92 r8 = (defpackage.p92) r8
            r0.<init>(r4, r8)
        L1a:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r4 = r8.a
            return r4
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r8)
            java.lang.Object r4 = r4.a
            ko9 r4 = (defpackage.ko9) r4
            r0.d = r3
            java.lang.Object r4 = r4.f(r5, r6, r7, r0)
            if (r4 != r1) goto L44
            return r1
        L44:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pkf.K(java.lang.String, int, java.lang.String, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object L(java.lang.String r10, java.lang.String r11, gen.model.SourceParameter r12, java.lang.String r13, defpackage.p92 r14) {
        /*
            r9 = this;
            boolean r0 = r14 instanceof defpackage.v7b
            if (r0 == 0) goto L14
            r0 = r14
            v7b r0 = (defpackage.v7b) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r2 = r0
            goto L1a
        L14:
            v7b r0 = new v7b
            r0.<init>(r9, r14)
            goto L12
        L1a:
            java.lang.Object r14 = r2.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r2.f
            r3 = 1
            if (r1 == 0) goto L38
            if (r1 != r3) goto L31
            gen.model.SourceParameter r12 = r2.c
            java.lang.String r10 = r2.b
            defpackage.br7.v(r14)
            bjb r14 = (defpackage.bjb) r14
            java.lang.Object r9 = r14.a
            goto L58
        L31:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            r9 = 0
            return r9
        L38:
            defpackage.br7.v(r14)
            java.lang.Object r9 = r9.a
            r1 = r9
            f88 r1 = (defpackage.f88) r1
            java.lang.String r4 = defpackage.gp7.u(r12)
            java.lang.String r7 = r12.post_id
            r2.b = r10
            r2.c = r12
            r2.f = r3
            r8 = 0
            r3 = r10
            r5 = r11
            r6 = r13
            java.lang.Object r9 = r1.a(r2, r3, r4, r5, r6, r7, r8)
            if (r9 != r0) goto L57
            return r0
        L57:
            r10 = r3
        L58:
            java.lang.Throwable r11 = defpackage.bjb.b(r9)
            if (r11 != 0) goto L6a
            com.medium.android.graphql.fragment.UserBlockData r9 = (com.medium.android.graphql.fragment.UserBlockData) r9
            s7b r11 = new s7b
            java.lang.String r9 = r9.getName()
            r11.<init>(r12, r10, r9)
            return r11
        L6a:
            r7b r9 = new r7b
            b24 r11 = defpackage.m4.I(r11)
            r9.<init>(r10, r12, r11)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pkf.L(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    public synchronized void N() {
        zrc zrcVar = (zrc) this.a;
        ReentrantLock reentrantLock = zrcVar.a;
        reentrantLock.lock();
        try {
            zrcVar.b.edit().clear().apply();
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // defpackage.veb
    public void O(String str, String str2) {
        str.getClass();
        hx4 hx4Var = ((ko9) this.a).q;
        hx4Var.getClass();
        sw9 sw9Var = (sw9) hx4Var.b;
        vx0.c0(f76.F(sw9Var), null, null, new mv9(sw9Var, (PostMetaData) hx4Var.c, str, str2, null), 3);
    }

    public synchronized bxf Q() {
        return ((hha) this.a).u();
    }

    @Override // defpackage.veb
    public void S(String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        hx4 hx4Var = ((ko9) this.a).q;
        hx4Var.getClass();
        sw9 sw9Var = (sw9) hx4Var.b;
        vx0.c0(f76.F(sw9Var), null, null, new sv9(sw9Var, str, str2, (PostMetaData) hx4Var.c, str3, null), 3);
    }

    @Override // defpackage.q09
    public void a(ParagraphEditIframeLayout paragraphEditIframeLayout) {
        EditPostBodyView editPostBodyView = (EditPostBodyView) this.a;
        int iD = editPostBodyView.d(paragraphEditIframeLayout);
        Integer numValueOf = Integer.valueOf(iD);
        if (iD == -1) {
            numValueOf = null;
        }
        if (numValueOf != null) {
            editPostBodyView.p(numValueOf.intValue());
        }
    }

    @Override // defpackage.s3b
    public void accept(Object obj, Object obj2) {
        vb5 vb5Var = (vb5) this.a;
        k66 k66Var = new k66((wfd) obj2, 1);
        su5 su5Var = (su5) ((uu5) ((rib) obj).h());
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken("com.google.android.gms.auth.blockstore.restorecredential.internal.IRestoreCredentialService");
        int i = nxf.a;
        parcelObtain.writeInt(1);
        vb5Var.writeToParcel(parcelObtain, 0);
        parcelObtain.writeStrongBinder(k66Var);
        su5Var.a(2, parcelObtain);
    }

    @Override // defpackage.veb
    public void b(String str, String str2) {
        hx4 hx4Var = ((ko9) this.a).q;
        hx4Var.getClass();
        sw9 sw9Var = (sw9) hx4Var.b;
        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 6), 3);
    }

    @Override // defpackage.w19
    public void c(Uri uri, String str) {
        uri.getClass();
        str.getClass();
        ((r19) this.a).c.f.a(uri);
    }

    @Override // defpackage.w84
    public void d(ca7 ca7Var) {
        ((yd0) this.a).f(ca7Var.a);
    }

    @Override // defpackage.q09
    public void e(ParagraphEditIframeLayout paragraphEditIframeLayout) {
        EditPostBodyView editPostBodyView = (EditPostBodyView) this.a;
        int i = EditPostBodyView.q;
        editPostBodyView.n(paragraphEditIframeLayout);
    }

    @Override // defpackage.veb
    public void g(String str, String str2) {
        str.getClass();
        ko9 ko9Var = (ko9) this.a;
        vx0.c0(f76.F(ko9Var), null, null, new kd7(ko9Var, str, null, 21), 3);
    }

    @Override // defpackage.veb
    public void h(String str, String str2) {
        str.getClass();
        ko9 ko9Var = (ko9) this.a;
        vx0.c0(f76.F(ko9Var), null, null, new ho9(ko9Var, str, str2, null, 1), 3);
    }

    @Override // defpackage.w84
    public void i(FacebookException facebookException) {
        yd0 yd0Var = (yd0) this.a;
        vx0.c0(f76.F(yd0Var), null, null, new j0(yd0Var, facebookException, null, 22), 3);
    }

    public void j(p08 p08Var) {
        p08Var.getClass();
        int i = p08Var.a;
        int i2 = p08Var.b;
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.a;
        Integer numValueOf = Integer.valueOf(i);
        Object treeMap = linkedHashMap.get(numValueOf);
        if (treeMap == null) {
            treeMap = new TreeMap();
            linkedHashMap.put(numValueOf, treeMap);
        }
        TreeMap treeMap2 = (TreeMap) treeMap;
        if (treeMap2.containsKey(Integer.valueOf(i2))) {
            Log.w("ROOM", "Overriding migration " + treeMap2.get(Integer.valueOf(i2)) + " with " + p08Var);
        }
        treeMap2.put(Integer.valueOf(i2), p08Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0024 A[Catch: all -> 0x0050, TryCatch #0 {, blocks: (B:3:0x0001, B:11:0x001a, B:12:0x001e, B:14:0x0024, B:16:0x0036, B:17:0x0040, B:19:0x0046, B:10:0x0017, B:7:0x000b), top: B:27:0x0001, inners: #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void k(defpackage.f89 r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            java.util.Set r0 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L50
            boolean r0 = r0.contains(r4)     // Catch: java.lang.Throwable -> L50
            r1 = 0
            if (r0 == 0) goto Lb
            goto L1a
        Lb:
            java.util.HashMap r0 = r4.a     // Catch: java.lang.Throwable -> L16
            java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> L16
            r0.getClass()     // Catch: java.lang.Throwable -> L16
            r1 = r0
            goto L1a
        L16:
            r0 = move-exception
            defpackage.ec2.a(r4, r0)     // Catch: java.lang.Throwable -> L50
        L1a:
            java.util.Iterator r4 = r1.iterator()     // Catch: java.lang.Throwable -> L50
        L1e:
            boolean r0 = r4.hasNext()     // Catch: java.lang.Throwable -> L50
            if (r0 == 0) goto L52
            java.lang.Object r0 = r4.next()     // Catch: java.lang.Throwable -> L50
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0     // Catch: java.lang.Throwable -> L50
            java.lang.Object r1 = r0.getKey()     // Catch: java.lang.Throwable -> L50
            y3 r1 = (defpackage.y3) r1     // Catch: java.lang.Throwable -> L50
            b1c r1 = r3.y(r1)     // Catch: java.lang.Throwable -> L50
            if (r1 == 0) goto L1e
            java.lang.Object r0 = r0.getValue()     // Catch: java.lang.Throwable -> L50
            java.util.List r0 = (java.util.List) r0     // Catch: java.lang.Throwable -> L50
            java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> L50
        L40:
            boolean r2 = r0.hasNext()     // Catch: java.lang.Throwable -> L50
            if (r2 == 0) goto L1e
            java.lang.Object r2 = r0.next()     // Catch: java.lang.Throwable -> L50
            i40 r2 = (defpackage.i40) r2     // Catch: java.lang.Throwable -> L50
            r1.a(r2)     // Catch: java.lang.Throwable -> L50
            goto L40
        L50:
            r4 = move-exception
            goto L54
        L52:
            monitor-exit(r3)
            return
        L54:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L50
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pkf.k(f89):void");
    }

    @Override // defpackage.bn1
    public an1 l(mn1 mn1Var) {
        an1 an1VarL;
        mn1Var.getClass();
        zx8 zx8Var = (zx8) this.a;
        y05 y05Var = mn1Var.a;
        y05Var.getClass();
        ArrayList<wx8> arrayList = new ArrayList();
        zx8Var.b(y05Var, arrayList);
        for (wx8 wx8Var : arrayList) {
            if ((wx8Var instanceof w01) && (an1VarL = ((w01) wx8Var).j.l(mn1Var)) != null) {
                return an1VarL;
            }
        }
        return null;
    }

    @Override // defpackage.veb
    public void m(String str, String str2) {
        str.getClass();
        hx4 hx4Var = ((ko9) this.a).q;
        hx4Var.getClass();
        sw9 sw9Var = (sw9) hx4Var.b;
        vx0.c0(f76.F(sw9Var), null, null, new nv9(sw9Var, str, str2, null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object n(java.lang.String r10, java.lang.String r11, gen.model.SourceParameter r12, java.lang.String r13, defpackage.p92 r14) {
        /*
            r9 = this;
            boolean r0 = r14 instanceof defpackage.u7b
            if (r0 == 0) goto L14
            r0 = r14
            u7b r0 = (defpackage.u7b) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r2 = r0
            goto L1a
        L14:
            u7b r0 = new u7b
            r0.<init>(r9, r14)
            goto L12
        L1a:
            java.lang.Object r14 = r2.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r2.f
            r3 = 1
            if (r1 == 0) goto L38
            if (r1 != r3) goto L31
            gen.model.SourceParameter r12 = r2.c
            java.lang.String r10 = r2.b
            defpackage.br7.v(r14)
            bjb r14 = (defpackage.bjb) r14
            java.lang.Object r9 = r14.a
            goto L58
        L31:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            r9 = 0
            return r9
        L38:
            defpackage.br7.v(r14)
            java.lang.Object r9 = r9.a
            r1 = r9
            f88 r1 = (defpackage.f88) r1
            java.lang.String r4 = defpackage.gp7.u(r12)
            java.lang.String r7 = r12.post_id
            r2.b = r10
            r2.c = r12
            r2.f = r3
            r8 = 1
            r3 = r10
            r5 = r11
            r6 = r13
            java.lang.Object r9 = r1.a(r2, r3, r4, r5, r6, r7, r8)
            if (r9 != r0) goto L57
            return r0
        L57:
            r10 = r3
        L58:
            java.lang.Throwable r11 = defpackage.bjb.b(r9)
            if (r11 != 0) goto L6a
            com.medium.android.graphql.fragment.UserBlockData r9 = (com.medium.android.graphql.fragment.UserBlockData) r9
            q7b r11 = new q7b
            java.lang.String r9 = r9.getName()
            r11.<init>(r12, r10, r9)
            return r11
        L6a:
            p7b r9 = new p7b
            b24 r11 = defpackage.m4.I(r11)
            r9.<init>(r10, r12, r11)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pkf.n(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    public fva o() {
        gg3 gg3VarP;
        zf3 zf3Var = (zf3) this.a;
        mg3 mg3Var = (mg3) zf3Var.e;
        synchronized (mg3Var.h) {
            zf3Var.d(true);
            gg3VarP = mg3Var.p(((dg3) zf3Var.d).a);
        }
        if (gg3VarP != null) {
            return new fva(gg3VarP);
        }
        return null;
    }

    @Override // defpackage.w84
    public void onCancel() {
        yd0 yd0Var = (yd0) this.a;
        vx0.c0(f76.F(yd0Var), null, null, new rd0(yd0Var, null, 2), 3);
    }

    public boolean p(File file) {
        file.getClass();
        try {
            return oh4.H0(file);
        } catch (FileNotFoundException e) {
            f49.L((f66) this.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 6), e, 48);
            return false;
        } catch (SecurityException e2) {
            f49.L((f66) this.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 7), e2, 48);
            return false;
        }
    }

    @Override // defpackage.veb
    public void q(String str, String str2, boolean z) {
        str.getClass();
        hx4 hx4Var = ((ko9) this.a).q;
        if (z) {
            hx4Var.getClass();
            sw9 sw9Var = (sw9) hx4Var.b;
            vx0.c0(f76.F(sw9Var), null, null, new pv9(sw9Var, str, str2, null), 3);
        } else {
            hx4Var.getClass();
            sw9 sw9Var2 = (sw9) hx4Var.b;
            vx0.c0(f76.F(sw9Var2), null, null, new rv9(sw9Var2, (PostMetaData) hx4Var.c, str, str2, null), 3);
        }
    }

    @Override // defpackage.w19
    public void r(String str, String str2, String str3, Integer num, Integer num2, String str4, ImageView imageView, cx7 cx7Var) {
        str.getClass();
        str2.getClass();
        ((r19) this.a).c.f.e(str, str2, str3, num, num2, str4, imageView, cx7Var);
    }

    public synchronized b1c s(y3 y3Var) {
        y3Var.getClass();
        return (b1c) ((HashMap) this.a).get(y3Var);
    }

    @Override // defpackage.veb
    public void t(String str, String str2) {
        str.getClass();
        hx4 hx4Var = ((ko9) this.a).q;
        hx4Var.getClass();
        sw9 sw9Var = (sw9) hx4Var.b;
        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 5), 3);
    }

    @Override // defpackage.veb
    public void u(String str, String str2) {
        str.getClass();
        hx4 hx4Var = ((ko9) this.a).q;
        hx4Var.getClass();
        sw9 sw9Var = (sw9) hx4Var.b;
        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 4), 3);
    }

    public synchronized int v() {
        int iC;
        Iterator it2 = ((HashMap) this.a).values().iterator();
        iC = 0;
        while (it2.hasNext()) {
            iC += ((b1c) it2.next()).c();
        }
        return iC;
    }

    @Override // defpackage.i41
    public void w(v31 v31Var, Throwable th) {
        v31Var.getClass();
        ((x51) this.a).resumeWith(new ajb(th));
    }

    @Override // defpackage.veb
    public void x(String str, int i, String str2) {
        str.getClass();
        ko9 ko9Var = (ko9) this.a;
        vx0.c0(f76.F(ko9Var), null, null, new qd0(ko9Var, str, i, str2, null, 4), 3);
    }

    public synchronized b1c y(y3 y3Var) {
        Context contextA;
        ra0 ra0VarL;
        b1c b1cVar = (b1c) ((HashMap) this.a).get(y3Var);
        if (b1cVar == null && (ra0VarL = m40.L((contextA = f94.a()))) != null) {
            b1cVar = new b1c(ra0VarL, kyd.T(contextA));
        }
        if (b1cVar == null) {
            return null;
        }
        ((HashMap) this.a).put(y3Var, b1cVar);
        return b1cVar;
    }

    @Override // defpackage.v0d
    public jrg z(Object obj) {
        w1c w1cVar = (w1c) obj;
        lig ligVar = (lig) this.a;
        if (w1cVar == null) {
            Log.w("FirebaseCrashlytics", "Received null app settings at app startup. Cannot send cached reports", null);
            return vp7.x(null);
        }
        jc2 jc2Var = (jc2) ligVar.c;
        fc2 fc2Var = jc2.r;
        jc2Var.f();
        jc2Var.m.C(null, (ud2) jc2Var.e.b);
        jc2Var.q.d(null);
        return vp7.x(null);
    }

    @Override // defpackage.i41
    public void f(v31 v31Var, zcb zcbVar) {
        x51 x51Var = (x51) this.a;
        if (!zcbVar.a.q) {
            x51Var.resumeWith(new ajb(new HttpException(zcbVar)));
            return;
        }
        Object obj = zcbVar.b;
        if (obj != null) {
            x51Var.resumeWith(obj);
            return;
        }
        kbb kbbVarP = v31Var.p();
        kbbVarP.getClass();
        wg6 wg6VarB = n1b.a.b(w76.class);
        Object objCast = vx0.T(wg6VarB).cast(kbbVarP.e.s(wg6VarB));
        objCast.getClass();
        w76 w76Var = (w76) objCast;
        x51Var.resumeWith(new ajb(new KotlinNullPointerException(aJzfoQ.TST + w76Var.a.getName() + '.' + w76Var.c.getName() + " was null but response body type was declared as non-null")));
    }

    public /* synthetic */ pkf(Object obj) {
        this.a = obj;
    }

    public pkf(zpa zpaVar) {
        zpaVar.getClass();
        this.a = zpaVar;
    }

    public pkf(iv2 iv2Var) {
        Context context = (Context) iv2Var.a;
        String str = (String) iv2Var.e;
        String str2 = (String) iv2Var.b;
        if (str != null) {
            Context applicationContext = context.getApplicationContext();
            if (str2 == null) {
                PreferenceManager.getDefaultSharedPreferences(applicationContext).edit();
            } else {
                applicationContext.getSharedPreferences(str2, 0).edit();
            }
            this.a = (hha) iv2Var.h;
            return;
        }
        ay0.e("keysetName cannot be null");
        throw null;
    }

    public pkf(f66 f66Var) {
        f66Var.getClass();
        this.a = f66Var;
    }
}
