package com.google.firebase.auth;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.api.Status;
import com.google.firebase.auth.internal.GenericIdpActivity;
import defpackage.a6;
import defpackage.awa;
import defpackage.c99;
import defpackage.clf;
import defpackage.d2f;
import defpackage.dwf;
import defpackage.h8a;
import defpackage.im8;
import defpackage.iq1;
import defpackage.jrg;
import defpackage.ka1;
import defpackage.knf;
import defpackage.kvf;
import defpackage.lxf;
import defpackage.mmf;
import defpackage.mrg;
import defpackage.myf;
import defpackage.nwf;
import defpackage.o2b;
import defpackage.oof;
import defpackage.p66;
import defpackage.qw3;
import defpackage.rlf;
import defpackage.sv0;
import defpackage.ujf;
import defpackage.umf;
import defpackage.uz5;
import defpackage.vp7;
import defpackage.wfd;
import defpackage.wmf;
import defpackage.xj4;
import defpackage.xmf;
import defpackage.y56;
import defpackage.zb0;
import defpackage.zj4;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class FirebaseAuth implements y56 {
    public final xj4 a;
    public final CopyOnWriteArrayList b;
    public final CopyOnWriteArrayList c;
    public final CopyOnWriteArrayList d;
    public final d2f e;
    public xmf f;
    public final Object g;
    public final Object h;
    public String i;
    public uz5 j;
    public final awa k;
    public final awa l;
    public final awa m;
    public final o2b n;
    public final myf o;
    public final h8a p;
    public ujf q;
    public final Executor r;
    public final Executor s;
    public final Executor t;

    public static void g(FirebaseAuth firebaseAuth, xmf xmfVar) {
        if (xmfVar != null) {
            Log.d("FirebaseAuth", "Notifying auth state listeners about user ( " + xmfVar.b.a + " ).");
        } else {
            Log.d("FirebaseAuth", "Notifying auth state listeners about a sign-out event.");
        }
        firebaseAuth.t.execute(new mrg(firebaseAuth));
    }

    public static FirebaseAuth getInstance() {
        wmf wmfVar = (wmf) xj4.d().b(wmf.class);
        vp7.p(wmfVar);
        return wmfVar.a();
    }

    public static void j(FirebaseAuth firebaseAuth, xmf xmfVar) {
        if (xmfVar != null) {
            Log.d("FirebaseAuth", "Notifying id token listeners about user ( " + xmfVar.b.a + " ).");
        } else {
            Log.d("FirebaseAuth", "Notifying id token listeners about a sign-out event.");
        }
        firebaseAuth.t.execute(new mrg(firebaseAuth, new p66(xmfVar != null ? xmfVar.a.b : null)));
    }

    public xmf a() {
        return this.f;
    }

    public final void b() {
        synchronized (this.g) {
        }
    }

    public jrg c() {
        nwf nwfVar = this.o.a;
        nwfVar.getClass();
        if (System.currentTimeMillis() - nwfVar.b < 3600000) {
            return nwfVar.a;
        }
        return null;
    }

    public jrg d(lxf lxfVar) {
        a6 a6Var;
        zb0 zb0VarE = lxfVar.e();
        if (!(zb0VarE instanceof qw3)) {
            boolean z = zb0VarE instanceof c99;
            String str = this.i;
            xj4 xj4Var = this.a;
            d2f d2fVar = this.e;
            if (!z) {
                zj4 zj4Var = new zj4(this);
                d2fVar.getClass();
                mmf mmfVar = new mmf(zb0VarE, str, 2);
                mmfVar.b(xj4Var);
                mmfVar.e = zj4Var;
                return d2fVar.D0(mmfVar);
            }
            zj4 zj4Var2 = new zj4(this);
            d2fVar.getClass();
            oof.a.clear();
            umf umfVar = new umf((c99) zb0VarE, 1);
            umfVar.b(xj4Var);
            umfVar.e = zj4Var2;
            return d2fVar.D0(umfVar);
        }
        qw3 qw3Var = (qw3) zb0VarE;
        String str2 = qw3Var.c;
        if (TextUtils.isEmpty(str2)) {
            String str3 = qw3Var.a;
            String str4 = qw3Var.b;
            vp7.p(str4);
            String str5 = this.i;
            return new rlf(this, str3, false, null, str4, str5).D(this, str5, this.l);
        }
        vp7.n(str2);
        int i = a6.c;
        vp7.n(str2);
        try {
            a6Var = new a6(str2);
        } catch (IllegalArgumentException unused) {
            a6Var = null;
        }
        if (a6Var != null && !TextUtils.equals(this.i, a6Var.b)) {
            return vp7.w(knf.a(new Status(17072, null, null, null)));
        }
        return new clf(this, false, null, qw3Var).D(this, this.i, this.k);
    }

    public void e() {
        o2b o2bVar = this.n;
        vp7.p(o2bVar);
        SharedPreferences sharedPreferences = (SharedPreferences) o2bVar.d;
        xmf xmfVar = this.f;
        if (xmfVar != null) {
            sharedPreferences.edit().remove(ka1.r("com.google.firebase.auth.GET_TOKEN_RESPONSE.", xmfVar.b.a)).apply();
            this.f = null;
        }
        sharedPreferences.edit().remove("com.google.firebase.auth.FIREBASE_USER").apply();
        j(this, null);
        g(this, null);
        ujf ujfVar = this.q;
        if (ujfVar != null) {
            kvf kvfVar = (kvf) ujfVar.b;
            kvfVar.c.removeCallbacks(kvfVar.d);
        }
    }

    public jrg f(Activity activity, im8 im8Var) {
        vp7.p(activity);
        wfd wfdVar = new wfd();
        sv0 sv0Var = this.o.b;
        if (sv0Var.b) {
            return vp7.w(knf.a(new Status(17057, null, null, null)));
        }
        dwf dwfVar = new dwf(sv0Var, activity, wfdVar, this);
        sv0Var.c = dwfVar;
        iq1.C(activity).L(dwfVar, new IntentFilter("com.google.firebase.auth.ACTION_RECEIVE_FIREBASE_AUTH_INTENT"));
        sv0Var.b = true;
        Context applicationContext = activity.getApplicationContext();
        vp7.p(applicationContext);
        SharedPreferences.Editor editorEdit = applicationContext.getSharedPreferences("com.google.firebase.auth.internal.ProcessDeathHelper", 0).edit();
        xj4 xj4Var = this.a;
        xj4Var.a();
        editorEdit.putString("firebaseAppName", xj4Var.b);
        editorEdit.commit();
        Intent intent = new Intent("com.google.firebase.auth.internal.NONGMSCORE_SIGN_IN");
        intent.setClass(activity, GenericIdpActivity.class);
        intent.setPackage(activity.getPackageName());
        intent.putExtras(im8Var.a);
        activity.startActivity(intent);
        return wfdVar.a;
    }

    public final synchronized uz5 i() {
        return this.j;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:21:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x00bc  */
    /* JADX WARN: Type inference failed for: r5v13, types: [jyf, yj4] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public FirebaseAuth(defpackage.xj4 r16, defpackage.h8a r17, java.util.concurrent.Executor r18, java.util.concurrent.Executor r19, java.util.concurrent.ScheduledExecutorService r20, java.util.concurrent.Executor r21) {
        /*
            Method dump skipped, instruction units count: 864
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.firebase.auth.FirebaseAuth.<init>(xj4, h8a, java.util.concurrent.Executor, java.util.concurrent.Executor, java.util.concurrent.ScheduledExecutorService, java.util.concurrent.Executor):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:167:0x0141 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:178:0x016d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0171  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void h(com.google.firebase.auth.FirebaseAuth r19, defpackage.xmf r20, defpackage.zpf r21, boolean r22, boolean r23) {
        /*
            Method dump skipped, instruction units count: 899
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.firebase.auth.FirebaseAuth.h(com.google.firebase.auth.FirebaseAuth, xmf, zpf, boolean, boolean):void");
    }

    public static FirebaseAuth getInstance(xj4 xj4Var) {
        wmf wmfVar = (wmf) xj4Var.b(wmf.class);
        vp7.p(wmfVar);
        return wmfVar.a();
    }
}
