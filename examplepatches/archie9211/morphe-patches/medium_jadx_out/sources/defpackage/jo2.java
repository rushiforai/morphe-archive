package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.view.ContextThemeWrapper;
import com.google.firebase.messaging.FirebaseMessaging;
import com.medium.android.data.database.MediumDatabase;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.unsplash.data.UnsplashApi;
import com.medium.android.unsplash.data.UnsplashImageResultInterceptor;
import com.medium.android.unsplash.data.UnsplashMapper;
import com.medium.android.unsplash.data.UnsplashPhoto;
import com.medium.reader.R;
import gen.model.ImageMetadata;
import java.io.File;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jo2 implements f8a {
    public final ko2 a;
    public final int b;

    public jo2(ko2 ko2Var, int i) {
        this.a = ko2Var;
        this.b = i;
    }

    @Override // defpackage.g8a
    public final Object get() {
        FirebaseMessaging firebaseMessaging;
        ko2 ko2Var = this.a;
        int i = this.b;
        int i2 = 3;
        int i3 = 4;
        int i4 = 27;
        int i5 = 2;
        int i6 = 28;
        int i7 = 1;
        int i8 = 0;
        switch (i) {
            case 0:
                return new n32((vr7) ko2Var.f.get(), (in7) ko2Var.o.get(), new c40((e00) ko2Var.p.get()), (dm4) ko2Var.j.get());
            case 1:
                Context context = ko2Var.a.a;
                fh5 fh5VarJ = ko2Var.j();
                sb2 sb2Var = (sb2) ko2Var.d.get();
                x38 x38Var = (x38) ko2Var.e.get();
                sb2Var.getClass();
                x38Var.getClass();
                SharedPreferences sharedPreferences = context.getSharedPreferences("COMMON_PREF", 0);
                sharedPreferences.getClass();
                return new vr7(sharedPreferences, fh5VarJ, sb2Var, x38Var);
            case 2:
                dh5 dh5Var = new dh5();
                dh5Var.g = true;
                dh5Var.e.add(new jh5());
                dh5Var.c(String.class, new kh5());
                Class cls = Boolean.TYPE;
                dh5Var.c(cls, new mh5());
                dh5Var.c(cls, new mh5());
                return new ch5(dh5Var);
            case 3:
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return o7f.c(flb.p0(qq7.h(), r13Var));
            case 4:
                hz2 hz2Var = new hz2(1);
                hz2Var.b(new n70(i2));
                return new x38(hz2Var);
            case 5:
                kjb kjbVar = (kjb) ko2Var.n.get();
                kjbVar.getClass();
                Object objB = kjbVar.b(in7.class);
                objB.getClass();
                return (in7) objB;
            case 6:
                up8 up8Var = (up8) ko2Var.m.get();
                i03 i03Var = i03.a;
                up8Var.getClass();
                o2b o2bVar = new o2b(1);
                o2bVar.c(i03.g);
                o2bVar.b = up8Var;
                dh5 dh5Var2 = new dh5();
                dh5Var2.e.add(new p6f(0));
                dh5Var2.c(l14.class, new j14());
                dh5Var2.c(a14.class, new z04());
                dh5Var2.c(tw3.class, new sw3());
                int i9 = 0;
                ((ArrayList) o2bVar.d).add(new gh5(i9, new ch5(dh5Var2)));
                ((ArrayList) o2bVar.e).add(new mn7(i9));
                ((ArrayList) o2bVar.e).add(new mn7(i7));
                return o2bVar.d();
            case 7:
                a41 a41Var = new a41(2);
                up8 up8Var2 = (up8) ko2Var.l.get();
                up8Var2.getClass();
                tp8 tp8VarB = up8Var2.b();
                tp8VarB.c.add(a41Var);
                return new up8(tp8VarB);
            case 8:
                d40 d40Var = (d40) ko2Var.k.get();
                Context context2 = ko2Var.a.a;
                tz2 tz2Var = new tz2(context2, new hx4(context2, 20));
                d40Var.getClass();
                tp8 tp8Var = new tp8();
                tp8Var.k = d40Var;
                tp8Var.c.add(tz2Var);
                return new up8(tp8Var);
            case 9:
                u3 u3Var = (u3) ko2Var.h.get();
                i03 i03Var2 = i03.a;
                qn7 qn7Var = (qn7) ko2Var.g.get();
                hx4 hx4Var = new hx4((qn7) ko2Var.g.get(), (dm4) ko2Var.j.get());
                r13 r13Var2 = xg3.a;
                iq7.s(r13Var2);
                sb2 sb2Var2 = (sb2) ko2Var.d.get();
                u3Var.getClass();
                qn7Var.getClass();
                sb2Var2.getClass();
                String str = i03.c;
                return new e22(d46.R(new j89(str, u3Var), new j89(str), new j2f(str, u3Var, r13Var2, sb2Var2, hx4Var), new j89(str, qn7Var)));
            case 10:
                return new u3((vr7) ko2Var.f.get(), (qn7) ko2Var.g.get(), ko2Var.j());
            case 11:
                Context context3 = ko2Var.a.a;
                fh5 fh5VarJ2 = ko2Var.j();
                sb2 sb2Var3 = (sb2) ko2Var.d.get();
                sb2Var3.getClass();
                SharedPreferences sharedPreferences2 = context3.getSharedPreferences("PERSISTED_PREF", 0);
                sharedPreferences2.getClass();
                return new qn7(sharedPreferences2, fh5VarJ2, sb2Var3);
            case 12:
                return new dm4((SharedPreferences) ko2Var.i.get(), on7.b(), (qn7) ko2Var.g.get());
            case 13:
                SharedPreferences sharedPreferences3 = ko2Var.a.a.getSharedPreferences("variants", 0);
                sharedPreferences3.getClass();
                return sharedPreferences3;
            case 14:
                up8 up8Var3 = (up8) ko2Var.l.get();
                i03 i03Var3 = i03.a;
                up8Var3.getClass();
                c00 c00Var = new c00();
                w5d w5dVar = vp8.a;
                c00Var.m = new hf6(up8Var3);
                c00Var.n = new x50(up8Var3);
                String str2 = i03.h;
                str2.getClass();
                c00Var.l = str2;
                c00.b(c00Var, new l13(7));
                c00.b(c00Var, new l13(i7));
                c00 c00Var2 = (c00) gr7.i(c00Var, yd4.CacheFirst);
                wz7 wz7Var = new wz7(19);
                y3b y3bVar = y3b.l;
                cd7 cd7Var = cd7.f;
                ArrayList arrayList = c00Var2.b;
                zw2 zw2Var = new zw2(wz7Var, y3bVar, cd7Var);
                ArrayList<g00> arrayListC = c00Var2.c();
                if (!arrayListC.isEmpty()) {
                    for (g00 g00Var : arrayListC) {
                    }
                }
                ArrayList arrayListC2 = c00Var2.c();
                ArrayList<n00> arrayList2 = new ArrayList();
                for (Object obj : arrayListC2) {
                    if (obj instanceof n00) {
                        arrayList2.add(obj);
                    }
                }
                for (n00 n00Var : arrayList2) {
                    n00Var.getClass();
                    arrayList.remove(n00Var);
                }
                c00.b(c00Var2, new a1f(zw2Var));
                c00.b(c00Var2, ce4.a);
                c00.b(c00Var2, new sz(zw2Var));
                c00Var2.a(new h9f());
                c00Var2.j = c00Var2.j.c(new e31(0));
                ArrayList arrayList3 = c00Var2.f;
                bu1.S0(arrayList3, new nx(1));
                arrayList3.add(new gq0());
                c00Var2.k = Boolean.FALSE;
                c00 c00Var3 = new c00();
                yl2 yl2VarA = c00Var2.a.a();
                xl2 xl2Var = c00Var3.a;
                xl2Var.a.clear();
                xl2Var.a.putAll(yl2VarA.c);
                c00Var3.b.addAll(arrayList);
                c00Var3.c.addAll(c00Var2.c);
                c00Var3.d.addAll(c00Var2.d);
                c00Var3.e.addAll(c00Var2.e);
                s44 s44Var = c00Var2.j;
                s44Var.getClass();
                c00Var3.j = s44Var;
                c00Var3.l = c00Var2.l;
                c00Var3.m = c00Var2.m;
                ArrayList arrayList4 = c00Var2.g;
                ArrayList arrayList5 = c00Var3.f;
                arrayList5.clear();
                arrayList5.addAll(arrayList4);
                c00Var3.k = c00Var2.k;
                c00Var3.n = c00Var2.n;
                ArrayList arrayList6 = c00Var2.i;
                ArrayList arrayList7 = c00Var3.h;
                arrayList7.clear();
                arrayList7.addAll(arrayList6);
                return new e00(c00Var3);
            case 15:
                return new io2(this, 0);
            case 16:
                e00 e00Var = (e00) ko2Var.p.get();
                zk2 zk2Var = (zk2) ko2Var.r.get();
                MediumDatabase mediumDatabase = (MediumDatabase) ko2Var.s.get();
                mediumDatabase.getClass();
                q37 q37VarS = mediumDatabase.s();
                iq7.s(q37VarS);
                MediumDatabase mediumDatabase2 = (MediumDatabase) ko2Var.s.get();
                mediumDatabase2.getClass();
                eo8 eo8VarT = mediumDatabase2.t();
                iq7.s(eo8VarT);
                return new qi1(e00Var, zk2Var, q37VarS, eo8VarT);
            case 17:
                return new zk2((e00) ko2Var.p.get(), (u3) ko2Var.h.get(), (vr7) ko2Var.f.get(), on7.b());
            case 18:
                Context context4 = ko2Var.a.a;
                alb albVar = new alb();
                blb blbVarP = tr7.p(context4, MediumDatabase.class, "medium");
                blbVarP.o = false;
                blbVarP.p = true;
                blbVarP.q = false;
                blbVarP.e.add(albVar);
                return (MediumDatabase) blbVarP.b();
            case 19:
                zk2 zk2Var2 = (zk2) ko2Var.r.get();
                e00 e00Var2 = (e00) ko2Var.p.get();
                MediumDatabase mediumDatabase3 = (MediumDatabase) ko2Var.s.get();
                mediumDatabase3.getClass();
                cp8 cp8VarU = mediumDatabase3.u();
                iq7.s(cp8VarU);
                return new gn9(zk2Var2, e00Var2, cp8VarU);
            case 20:
                return new go8(ko2Var.a.a, on7.b());
            case 21:
                Context context5 = ko2Var.a.a;
                fa4 fa4Var = new fa4(18);
                l2c l2cVarU = ko2Var.u();
                up8 up8Var4 = (up8) ko2Var.l.get();
                go8 go8Var = (go8) ko2Var.v.get();
                zk2 zk2Var3 = (zk2) ko2Var.r.get();
                go8Var.getClass();
                zk2Var3.getClass();
                kq1 kq1Var = new kq1(go8Var, i8, zk2Var3);
                up8Var4.getClass();
                n0c n0cVar = new n0c(context5);
                ArrayList arrayList8 = new ArrayList();
                ArrayList arrayList9 = new ArrayList();
                ArrayList arrayList10 = new ArrayList();
                ArrayList arrayList11 = new ArrayList();
                ArrayList arrayList12 = new ArrayList();
                wd8 wd8Var = new wd8(new yj8(i3, new ef6(up8Var4, i7)));
                s1b s1bVar = n1b.a;
                arrayList11.add(new n(wd8Var, i4, s1bVar.b(d7e.class)));
                arrayList8.add(new kq1(new ContextThemeWrapper(context5, R.style.Theme_Medium_DayNight), i7, new bp7(l2cVarU, l2c.class, "isImageLoadingDisabled", "isImageLoadingDisabled()Z", 0)));
                arrayList8.add(new yw5());
                arrayList9.add(new f09(new bx5(fa4Var, 0), s1bVar.b(ax5.class)));
                arrayList9.add(new f09(new kt(fa4Var), s1bVar.b(sw5.class)));
                arrayList9.add(new f09(new bx5(fa4Var, 2), s1bVar.b(ImageMetadata.class)));
                arrayList9.add(new f09(new bx5(fa4Var, 1), s1bVar.b(ImageMetadataData.class)));
                arrayList8.add(kq1Var);
                if (Build.VERSION.SDK_INT >= 28) {
                    arrayList12.add(new fz1(new qv(), 0));
                } else {
                    arrayList12.add(new fz1(new bd5(), 0));
                }
                n0cVar.d = new gz1(nk7.z0(arrayList8), nk7.z0(arrayList9), nk7.z0(arrayList10), nk7.z0(arrayList11), nk7.z0(arrayList12));
                return n0cVar.t();
            case 22:
                Context context6 = ko2Var.a.a;
                fh5 fh5VarJ3 = ko2Var.j();
                zk2 zk2Var4 = (zk2) ko2Var.r.get();
                sb2 sb2Var4 = (sb2) ko2Var.d.get();
                zk2Var4.getClass();
                sb2Var4.getClass();
                SharedPreferences sharedPreferences4 = context6.getSharedPreferences("USER_PREF", 0);
                sharedPreferences4.getClass();
                return new pu7(sharedPreferences4, fh5VarJ3, sb2Var4, new ju7(new kv4(0, 10, zk2.class, zk2Var4, "id", "getId()Ljava/lang/String;")));
            case 23:
                return new io2(this, 1);
            case 24:
                return new zpa((e00) ko2Var.p.get(), (vr7) ko2Var.f.get());
            case 25:
                return new io2(this, 2);
            case 26:
                sb2 sb2Var5 = (sb2) ko2Var.d.get();
                r13 r13Var3 = xg3.a;
                iq7.s(r13Var3);
                return new o08(sb2Var5, r13Var3, (rp7) ko2Var.B.get(), new j08((e00) ko2Var.p.get(), ko2Var.j()), new hx4(ko2Var.a.a, 20));
            case 27:
                return new rp7(ko2Var.a.a, new hha(ko2Var.j()), on7.b());
            case 28:
                Context context7 = ko2Var.a.a;
                sb2 sb2Var6 = (sb2) ko2Var.d.get();
                r13 r13Var4 = xg3.a;
                ei5 ei5Var = ff7.a;
                iq7.s(ei5Var);
                d40 d40Var2 = (d40) ko2Var.k.get();
                n32 n32Var = (n32) ko2Var.q.get();
                e00 e00Var3 = (e00) ko2Var.p.get();
                cx2 cx2Var = new cx2(ko2Var.x());
                l95 l95VarG = ko2Var.g();
                og3 og3VarF = ko2Var.f();
                mya myaVarA = ko2Var.A();
                yo8 yo8VarN = ko2Var.n();
                zk2 zk2Var5 = (zk2) ko2Var.r.get();
                gn9 gn9Var = (gn9) ko2Var.u.get();
                vr7 vr7Var = (vr7) ko2Var.f.get();
                bud budVar = (bud) ko2Var.F.get();
                l07 l07Var = new l07((zpa) ko2Var.z.get(), (zk2) ko2Var.r.get());
                synchronized (FirebaseMessaging.class) {
                    firebaseMessaging = FirebaseMessaging.getInstance(xj4.d());
                }
                firebaseMessaging.getClass();
                a1a a1aVar = new a1a(l07Var, 6, new olb(i6, firebaseMessaging));
                m50 m50Var = new m50((zpa) ko2Var.z.get(), (zk2) ko2Var.r.get(), on7.a());
                dm4 dm4Var = (dm4) ko2Var.j.get();
                bh2 bh2Var = new bh2(ko2Var.a.a);
                slc slcVar = (slc) ko2Var.G.get();
                sb2Var6.getClass();
                d40Var2.getClass();
                n32Var.getClass();
                e00Var3.getClass();
                zk2Var5.getClass();
                gn9Var.getClass();
                vr7Var.getClass();
                budVar.getClass();
                dm4Var.getClass();
                slcVar.getClass();
                return new pz2(context7, sb2Var6, d40Var2, n32Var, e00Var3, cx2Var, a1aVar, m50Var, yo8VarN, og3VarF, l95VarG, myaVarA, zk2Var5, gn9Var, vr7Var, budVar, new mj8(context7), dm4Var, bh2Var, ei5Var, slcVar);
            case 29:
                Context context8 = ko2Var.a.a;
                sb2 sb2Var7 = (sb2) ko2Var.E.get();
                sk0 sk0Var = new sk0(ko2Var.a.a);
                qn7 qn7Var2 = (qn7) ko2Var.g.get();
                ax2 ax2Var = new ax2(ko2Var.x(), i7);
                sb2Var7.getClass();
                qn7Var2.getClass();
                return new y23(context8, sk0Var, ax2Var, qn7Var2, sb2Var7);
            case 30:
                r13 r13Var5 = xg3.a;
                ei5 ei5Var2 = ff7.a;
                iq7.s(ei5Var2);
                return o7f.c(flb.p0(qq7.h(), ei5Var2));
            case 31:
                Application applicationC = f76.C(ko2Var.a.a);
                dm4 dm4Var2 = (dm4) ko2Var.j.get();
                dm4Var2.getClass();
                return new slc(applicationC, dm4Var2);
            case 32:
                Context context9 = ko2Var.a.a;
                sb2 sb2Var8 = (sb2) ko2Var.d.get();
                hx4 hx4VarH = ko2Var.h();
                l95 l95VarG2 = ko2Var.g();
                og3 og3VarF2 = ko2Var.f();
                yx2 yx2VarL = ko2Var.l();
                vwa vwaVarY = ko2Var.y();
                da5 da5VarI = ko2Var.i();
                ba5 ba5Var = new ba5(ko2Var.p());
                zg7 zg7VarE = ko2Var.e();
                sb2Var8.getClass();
                return new xx2(context9, sb2Var8, hx4VarH, l95VarG2, og3VarF2, yx2VarL, vwaVarY, da5VarI, ba5Var, zg7VarE);
            case 33:
                return new ex2(f76.C(ko2Var.a.a));
            case 34:
                Context context10 = ko2Var.a.a;
                dm4 dm4Var3 = (dm4) ko2Var.j.get();
                u3 u3Var2 = (u3) ko2Var.h.get();
                dm4Var3.getClass();
                u3Var2.getClass();
                return new hy2(context10, dm4Var3, u3Var2);
            case 35:
                return new w50((sb2) ko2Var.d.get(), new cx2(ko2Var.x()), (qn7) ko2Var.g.get(), (pu7) ko2Var.w.get(), ko2Var.A(), (ex2) ko2Var.J.get());
            case 36:
                return new cxd((Map) ko2Var.M.get());
            case 37:
                return new wq7(ko2Var.a.a);
            case 38:
                Context context11 = ko2Var.a.a;
                up8 up8Var5 = (up8) ko2Var.O.get();
                up8Var5.getClass();
                n0c n0cVar2 = new n0c(context11);
                ArrayList arrayList13 = new ArrayList();
                ArrayList arrayList14 = new ArrayList();
                ArrayList arrayList15 = new ArrayList();
                ArrayList arrayList16 = new ArrayList();
                ArrayList arrayList17 = new ArrayList();
                wd8 wd8Var2 = new wd8(new ef6(up8Var5, i5));
                s1b s1bVar2 = n1b.a;
                arrayList16.add(new n(wd8Var2, i4, s1bVar2.b(d7e.class)));
                arrayList13.add(UnsplashImageResultInterceptor.INSTANCE);
                arrayList14.add(new f09(UnsplashMapper.INSTANCE, s1bVar2.b(UnsplashPhoto.class)));
                if (Build.VERSION.SDK_INT >= 28) {
                    arrayList17.add(new fz1(new qv(), i8));
                } else {
                    arrayList17.add(new fz1(new bd5(), i8));
                }
                n0cVar2.d = new gz1(nk7.z0(arrayList13), nk7.z0(arrayList14), nk7.z0(arrayList15), nk7.z0(arrayList16), nk7.z0(arrayList17));
                return n0cVar2.t();
            case 39:
                Context context12 = ko2Var.a.a;
                tp8 tp8Var2 = new tp8();
                File cacheDir = context12.getCacheDir();
                cacheDir.getClass();
                x21 x21Var = new x21(cacheDir);
                tp8Var2.d.add(new y2e());
                tp8Var2.l = x21Var;
                return new up8(tp8Var2);
            case 40:
                return new cba((e00) ko2Var.p.get());
            case 41:
                return new mq5((e00) ko2Var.p.get());
            case 42:
                return new gwa(ko2Var.a.a, ko2Var.v());
            case 43:
                return new dd3((e00) ko2Var.p.get());
            case 44:
                return new uj8((e00) ko2Var.p.get());
            case 45:
                return new nfb((e00) ko2Var.p.get());
            case 46:
                return new ex1((e00) ko2Var.p.get());
            case 47:
                up8 up8Var6 = (up8) ko2Var.O.get();
                x38 x38Var2 = (x38) ko2Var.e.get();
                up8Var6.getClass();
                x38Var2.getClass();
                o2b o2bVar2 = new o2b(1);
                o2bVar2.c("https://api.unsplash.com/");
                o2bVar2.b = up8Var6;
                ((ArrayList) o2bVar2.d).add(new gh5(i7, x38Var2));
                Object objB2 = o2bVar2.d().b(UnsplashApi.class);
                objB2.getClass();
                return (UnsplashApi) objB2;
            default:
                throw new AssertionError(i);
        }
    }
}
