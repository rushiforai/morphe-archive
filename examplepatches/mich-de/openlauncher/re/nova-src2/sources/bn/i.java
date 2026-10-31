package bn;

import android.accounts.Account;
import android.app.Application;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import cl.m1;
import cl.n1;
import cl.p1;
import com.google.android.gms.internal.consent_sdk.h6;
import com.google.android.gms.internal.consent_sdk.k7;
import com.google.android.gms.internal.consent_sdk.l7;
import com.google.android.gms.internal.consent_sdk.m7;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.internal.measurement.be;
import com.google.android.gms.internal.measurement.bg;
import com.google.android.gms.internal.measurement.bh;
import com.google.android.gms.internal.measurement.cf;
import com.google.android.gms.internal.measurement.cg;
import com.google.android.gms.internal.measurement.jg;
import com.google.android.gms.internal.measurement.kf;
import com.google.android.gms.internal.measurement.l6;
import com.google.android.gms.internal.measurement.vd;
import com.google.android.gms.internal.measurement.ze;
import com.google.android.gms.tasks.Tasks;
import com.google.common.util.concurrent.ListenableFuture;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import fe.l1;
import fe.x1;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Pattern;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import r.c2;
import r.z1;
import xk.w2;

/* loaded from: classes3.dex */
public final class i implements l7, mi.c, kw.g0 {

    /* renamed from: a, reason: collision with root package name */
    public Object f18209a;

    /* renamed from: b, reason: collision with root package name */
    public Object f18210b;

    /* renamed from: c, reason: collision with root package name */
    public Object f18211c;

    /* renamed from: d, reason: collision with root package name */
    public Object f18212d;

    /* renamed from: e, reason: collision with root package name */
    public Object f18213e;

    /* renamed from: f, reason: collision with root package name */
    public Object f18214f;

    public /* synthetic */ i(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        this.f18209a = obj;
        this.f18210b = obj2;
        this.f18211c = obj3;
        this.f18212d = obj4;
        this.f18213e = obj5;
        this.f18214f = obj6;
    }

    public static boolean A(Context context, Drawable drawable, int i5) {
        if (i5 == 2131230967) {
            LayerDrawable layerDrawable = (LayerDrawable) drawable;
            Drawable drawableFindDrawableByLayerId = layerDrawable.findDrawableByLayerId(16908288);
            int iC = c2.c(context, 2130968936);
            PorterDuff.Mode mode = r.p.f84832b;
            y(drawableFindDrawableByLayerId, iC, mode);
            y(layerDrawable.findDrawableByLayerId(16908303), c2.c(context, 2130968936), mode);
            y(layerDrawable.findDrawableByLayerId(16908301), c2.c(context, 2130968934), mode);
            return true;
        }
        if (i5 != 2131230958 && i5 != 2131230957 && i5 != 2131230959) {
            return false;
        }
        LayerDrawable layerDrawable2 = (LayerDrawable) drawable;
        Drawable drawableFindDrawableByLayerId2 = layerDrawable2.findDrawableByLayerId(16908288);
        int iB = c2.b(context, 2130968936);
        PorterDuff.Mode mode2 = r.p.f84832b;
        y(drawableFindDrawableByLayerId2, iB, mode2);
        y(layerDrawable2.findDrawableByLayerId(16908303), c2.c(context, 2130968934), mode2);
        y(layerDrawable2.findDrawableByLayerId(16908301), c2.c(context, 2130968934), mode2);
        return true;
    }

    public static boolean i(int[] iArr, int i5) {
        for (int i11 : iArr) {
            if (i11 == i5) {
                return true;
            }
        }
        return false;
    }

    public static ColorStateList m(Context context, int i5) {
        int iC = c2.c(context, 2130968935);
        int iB = c2.b(context, 2130968932);
        int[] iArr = c2.f84688b;
        int[] iArr2 = c2.f84690d;
        int iJ = r4.a.j(iC, i5);
        return new ColorStateList(new int[][]{iArr, iArr2, c2.f84689c, c2.f84692f}, new int[]{iB, iJ, r4.a.j(iC, i5), i5});
    }

    public static LayerDrawable o(z1 z1Var, Context context, int i5) {
        if (i5 == 2131230922) {
            return new LayerDrawable(new Drawable[]{z1Var.d(context, 2131230921), z1Var.d(context, 2131230923)});
        }
        if (i5 == 2131230958) {
            return t(z1Var, context, 2131165243);
        }
        if (i5 == 2131230957) {
            return t(z1Var, context, 2131165244);
        }
        if (i5 == 2131230959) {
            return t(z1Var, context, 2131165245);
        }
        return null;
    }

    public static gf.w p(l1 l1Var, xk.v0 v0Var, gf.w wVar, x1 x1Var) {
        int iB;
        fe.a0 a0Var = (fe.a0) l1Var;
        fe.z1 z1VarO = a0Var.O();
        a0Var.s0();
        if (a0Var.f54691j0.f54764a.p()) {
            iB = 0;
        } else {
            fe.f1 f1Var = a0Var.f54691j0;
            iB = f1Var.f54764a.b(f1Var.f54765b.f57640a);
        }
        Object objL = z1VarO.p() ? null : z1VarO.l(iB);
        int iB2 = (a0Var.X() || z1VarO.p()) ? -1 : z1VarO.f(iB, x1Var, false).b(wf.v.y(a0Var.M()) - x1Var.f55079e);
        for (int i5 = 0; i5 < v0Var.size(); i5++) {
            gf.w wVar2 = (gf.w) v0Var.get(i5);
            if (w(wVar2, objL, a0Var.X(), a0Var.J(), a0Var.K(), iB2)) {
                return wVar2;
            }
        }
        if (v0Var.isEmpty() && wVar != null && w(wVar, objL, a0Var.X(), a0Var.J(), a0Var.K(), iB2)) {
            return wVar;
        }
        return null;
    }

    public static LayerDrawable t(z1 z1Var, Context context, int i5) throws Resources.NotFoundException {
        BitmapDrawable bitmapDrawable;
        BitmapDrawable bitmapDrawable2;
        BitmapDrawable bitmapDrawable3;
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(i5);
        Drawable drawableD = z1Var.d(context, 2131230971);
        Drawable drawableD2 = z1Var.d(context, 2131230972);
        if ((drawableD instanceof BitmapDrawable) && drawableD.getIntrinsicWidth() == dimensionPixelSize && drawableD.getIntrinsicHeight() == dimensionPixelSize) {
            bitmapDrawable = (BitmapDrawable) drawableD;
            bitmapDrawable2 = new BitmapDrawable(bitmapDrawable.getBitmap());
        } else {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(dimensionPixelSize, dimensionPixelSize, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            drawableD.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
            drawableD.draw(canvas);
            bitmapDrawable = new BitmapDrawable(bitmapCreateBitmap);
            bitmapDrawable2 = new BitmapDrawable(bitmapCreateBitmap);
        }
        bitmapDrawable2.setTileModeX(Shader.TileMode.REPEAT);
        if ((drawableD2 instanceof BitmapDrawable) && drawableD2.getIntrinsicWidth() == dimensionPixelSize && drawableD2.getIntrinsicHeight() == dimensionPixelSize) {
            bitmapDrawable3 = (BitmapDrawable) drawableD2;
        } else {
            Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(dimensionPixelSize, dimensionPixelSize, Bitmap.Config.ARGB_8888);
            Canvas canvas2 = new Canvas(bitmapCreateBitmap2);
            drawableD2.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
            drawableD2.draw(canvas2);
            bitmapDrawable3 = new BitmapDrawable(bitmapCreateBitmap2);
        }
        LayerDrawable layerDrawable = new LayerDrawable(new Drawable[]{bitmapDrawable, bitmapDrawable3, bitmapDrawable2});
        layerDrawable.setId(0, 16908288);
        layerDrawable.setId(1, 16908303);
        layerDrawable.setId(2, 16908301);
        return layerDrawable;
    }

    public static PorterDuff.Mode v(int i5) {
        if (i5 == 2131230973) {
            return PorterDuff.Mode.MULTIPLY;
        }
        return null;
    }

    public static boolean w(gf.w wVar, Object obj, boolean z11, int i5, int i11, int i12) {
        Object obj2 = wVar.f57640a;
        int i13 = wVar.f57641b;
        if (!obj2.equals(obj)) {
            return false;
        }
        if (z11 && i13 == i5 && wVar.f57642c == i11) {
            return true;
        }
        return !z11 && i13 == -1 && wVar.f57644e == i12;
    }

    public static void y(Drawable drawable, int i5, PorterDuff.Mode mode) {
        Drawable drawableMutate = drawable.mutate();
        if (mode == null) {
            mode = r.p.f84832b;
        }
        drawableMutate.setColorFilter(r.p.d(i5, mode));
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x006d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean B(Context context, Drawable drawable, int i5) {
        PorterDuff.Mode mode;
        int i11;
        boolean z11;
        int iRound;
        PorterDuff.Mode mode2 = r.p.f84832b;
        if (i((int[]) this.f18209a, i5)) {
            i11 = 2130968936;
        } else if (i((int[]) this.f18211c, i5)) {
            i11 = 2130968934;
        } else {
            if (i((int[]) this.f18212d, i5)) {
                mode2 = PorterDuff.Mode.MULTIPLY;
            } else {
                if (i5 == 2131230944) {
                    iRound = Math.round(40.8f);
                    i11 = 16842800;
                    mode = mode2;
                    z11 = true;
                    if (z11) {
                        return false;
                    }
                    Drawable drawableMutate = drawable.mutate();
                    drawableMutate.setColorFilter(r.p.d(c2.c(context, i11), mode));
                    if (iRound != -1) {
                        drawableMutate.setAlpha(iRound);
                    }
                    return true;
                }
                if (i5 != 2131230925) {
                    mode = mode2;
                    i11 = 0;
                    z11 = false;
                    iRound = -1;
                    if (z11) {
                    }
                }
            }
            mode = mode2;
            iRound = -1;
            i11 = 16842801;
            z11 = true;
            if (z11) {
            }
        }
        mode = mode2;
        z11 = true;
        iRound = -1;
        if (z11) {
        }
    }

    @Override // kw.g0
    public ArrayList C() {
        return (ArrayList) this.f18214f;
    }

    public void D(nm.c cVar) {
        this.f18214f = cVar;
    }

    public void E(fe.z1 z1Var) {
        c30.c cVarA = xk.x0.a();
        if (((xk.v0) this.f18210b).isEmpty()) {
            g(cVarA, (gf.w) this.f18213e, z1Var);
            if (!ps.v.q((gf.w) this.f18214f, (gf.w) this.f18213e)) {
                g(cVarA, (gf.w) this.f18214f, z1Var);
            }
            if (!ps.v.q((gf.w) this.f18212d, (gf.w) this.f18213e) && !ps.v.q((gf.w) this.f18212d, (gf.w) this.f18214f)) {
                g(cVarA, (gf.w) this.f18212d, z1Var);
            }
        } else {
            for (int i5 = 0; i5 < ((xk.v0) this.f18210b).size(); i5++) {
                g(cVarA, (gf.w) ((xk.v0) this.f18210b).get(i5), z1Var);
            }
            if (!((xk.v0) this.f18210b).contains((gf.w) this.f18212d)) {
                g(cVarA, (gf.w) this.f18212d, z1Var);
            }
        }
        this.f18211c = cVarA.c(true);
    }

    public cl.s F() {
        AtomicLong atomicLong;
        long j11;
        final int i5;
        ListenableFuture listenableFutureS;
        Executor executor = cl.m0.f20038a;
        m1 m1Var = (m1) this.f18214f;
        if (m1Var.isDone()) {
            return m1Var;
        }
        do {
            atomicLong = (AtomicLong) this.f18210b;
            j11 = atomicLong.get();
            i5 = (int) (j11 >>> 32);
        } while (!atomicLong.compareAndSet(j11, ((((int) j11) + 1) & 4294967295L) | (i5 << 32)));
        AtomicReference atomicReference = (AtomicReference) this.f18212d;
        m1 m1Var2 = new m1();
        ListenableFuture listenableFuture = (ListenableFuture) atomicReference.getAndSet(m1Var2);
        if (listenableFuture == null) {
            l6 l6VarA = bh.a(new ag(this, i5));
            p1 p1Var = new p1();
            p1Var.f20059h = new n1(p1Var, l6VarA);
            executor.execute(p1Var);
            listenableFutureS = p1Var;
        } else {
            cl.d0 d0Var = new cl.d0() { // from class: com.google.android.gms.internal.measurement.zf
                @Override // cl.d0
                public final /* synthetic */ ListenableFuture apply(Object obj) {
                    return this.f33298a.K(i5);
                }
            };
            int i11 = bh.f32414a;
            listenableFutureS = cl.c.s(listenableFuture, Throwable.class, new be(4, jg.a(), d0Var), (cl.l1) this.f18213e);
        }
        m1Var2.p(listenableFutureS);
        bg bgVar = new bg(this, i5);
        m1Var2.b(new ab.y(13, this, m1Var2, bgVar, false), executor);
        return bgVar;
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    /* renamed from: G, reason: merged with bridge method [inline-methods] */
    public com.google.android.gms.internal.consent_sdk.v zzb() {
        Application application = (Application) ((m7) this.f18209a).zzb();
        com.google.android.gms.internal.consent_sdk.t tVar = (com.google.android.gms.internal.consent_sdk.t) ((k7) this.f18210b).zzb();
        Handler handler = com.google.android.gms.internal.consent_sdk.i0.f32098a;
        com.google.android.gms.internal.consent_sdk.c.a(handler);
        com.google.android.gms.internal.consent_sdk.h0 h0Var = com.google.android.gms.internal.consent_sdk.i0.f32099b;
        com.google.android.gms.internal.consent_sdk.c.a(h0Var);
        return new com.google.android.gms.internal.consent_sdk.v(application, tVar, handler, h0Var, (com.google.android.gms.internal.consent_sdk.v0) ((m7) this.f18211c).zzb(), ((com.google.android.gms.internal.consent_sdk.g) ((m7) this.f18212d)).zzb(), (com.google.android.gms.internal.consent_sdk.m) ((h6) this.f18213e).zzb(), (com.google.android.gms.internal.consent_sdk.h) ((m7) this.f18214f).zzb());
    }

    public void H(String str) {
        com.google.android.gms.internal.measurement.h.e("Module must match [a-z]+(_[a-z]+)*: %s", new Object[]{str}, cf.f32439a.matcher(str).matches());
        com.google.android.gms.internal.measurement.h.e("Module name is reserved and cannot be used: %s", new Object[]{str}, !cf.f32441c.contains(str));
        this.f18211c = str;
    }

    public void I(String str) {
        if (str.startsWith("/")) {
            str = str.substring(1);
        }
        Pattern pattern = cf.f32439a;
        this.f18213e = str;
    }

    public Uri J() {
        String strR;
        String str = (String) this.f18210b;
        String str2 = (String) this.f18211c;
        Account account = ze.f33297a;
        Account account2 = (Account) this.f18212d;
        com.google.android.gms.internal.measurement.h.e("Account type contains ':'.", new Object[0], account2.type.indexOf(58) == -1);
        com.google.android.gms.internal.measurement.h.e("Account type contains '/'.", new Object[0], account2.type.indexOf(47) == -1);
        com.google.android.gms.internal.measurement.h.e("Account name contains '/'.", new Object[0], account2.name.indexOf(47) == -1);
        if (ze.f33297a.equals(account2)) {
            strR = "shared";
        } else {
            String str3 = account2.type;
            String str4 = account2.name;
            strR = b.c0.r(new StringBuilder(String.valueOf(str3).length() + 1 + String.valueOf(str4).length()), str3, ":", str4);
        }
        String str5 = (String) this.f18213e;
        StringBuilder sb2 = new StringBuilder(strR.length() + str2.length() + str.length() + 2 + 1 + 1 + String.valueOf(str5).length());
        b.c0.D(sb2, "/", str, "/", str2);
        return new Uri.Builder().scheme("android").authority((String) this.f18209a).path(b.c0.s(sb2, "/", strR, "/", str5)).encodedFragment(kf.a(((xk.s0) this.f18214f).f())).build();
    }

    public cl.s K(int i5) {
        cl.m0 m0Var;
        AtomicLong atomicLong = (AtomicLong) this.f18210b;
        if (((int) (atomicLong.get() >>> 32)) > i5) {
            cl.x0 x0Var = cl.x0.f20087h;
            return x0Var != null ? x0Var : new cl.x0();
        }
        cg cgVar = new cg(i5);
        while (true) {
            AtomicReference atomicReference = (AtomicReference) this.f18211c;
            cg cgVar2 = (cg) atomicReference.get();
            if (cgVar2 != null && cgVar2.f32443h > i5) {
                cl.x0 x0Var2 = cl.x0.f20087h;
                return x0Var2 != null ? x0Var2 : new cl.x0();
            }
            while (!atomicReference.compareAndSet(cgVar2, cgVar)) {
                if (atomicReference.get() != cgVar2) {
                    break;
                }
            }
            if (((int) (atomicLong.get() >>> 32)) > i5) {
                cgVar.cancel(true);
                while (!atomicReference.compareAndSet(cgVar, null) && atomicReference.get() == cgVar) {
                }
                return cgVar;
            }
            vd vdVar = (vd) this.f18209a;
            cl.c0 c0Var = (cl.c0) vdVar.f33144b;
            if (c0Var == null || (m0Var = (cl.m0) vdVar.f33145c) == null) {
                cgVar.p((m1) this.f18214f);
                return cgVar;
            }
            l6 l6VarA = bh.a(c0Var);
            p1 p1Var = new p1();
            p1Var.f20059h = new n1(p1Var, l6VarA);
            m0Var.execute(p1Var);
            cgVar.p(p1Var);
            return cgVar;
        }
    }

    @Override // kw.g0
    public String a(String rawValue) {
        ArrayList arrayList = (ArrayList) this.f18210b;
        Intrinsics.g(rawValue, "rawValue");
        ArrayList arrayList2 = (ArrayList) this.f18209a;
        return arrayList2.contains(rawValue) ? (String) arrayList.get(arrayList2.indexOf(rawValue)) : (String) arrayList.get(0);
    }

    @Override // kw.g0
    public String d(int i5) {
        return (String) ((ArrayList) this.f18210b).get(i5);
    }

    @Override // ni.d
    public void e() {
        Function1 function1 = (Function1) this.f18209a;
        long jCurrentTimeMillis = System.currentTimeMillis();
        String str = (String) this.f18210b;
        String str2 = (String) this.f18211c;
        String str3 = (String) this.f18212d;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        function1.invoke(new dx.p(jCurrentTimeMillis, str, str2, str3, (String) this.f18213e));
    }

    @Override // ni.d
    public void f(ni.m mVar) {
        Function1 function1 = (Function1) this.f18209a;
        long jCurrentTimeMillis = System.currentTimeMillis();
        String str = (String) this.f18210b;
        String str2 = (String) this.f18211c;
        String str3 = (String) this.f18212d;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        function1.invoke(new dx.s(jCurrentTimeMillis, str, str2, str3, (String) this.f18213e, mVar.f78293b, mVar.f78294c, g90.k.p0(mVar.f78292a), ((ex.b) this.f18214f).f53063f));
    }

    public void g(c30.c cVar, gf.w wVar, fe.z1 z1Var) {
        if (wVar == null) {
            return;
        }
        if (z1Var.b(wVar.f57640a) != -1) {
            cVar.p(wVar, z1Var);
            return;
        }
        fe.z1 z1Var2 = (fe.z1) ((w2) this.f18211c).get(wVar);
        if (z1Var2 != null) {
            cVar.p(wVar, z1Var2);
        }
    }

    @Override // kw.g0
    public ResolvableString getLabel() {
        return (IdentifierResolvableString) this.f18212d;
    }

    public void h(Context context) {
        this.f18209a = context;
    }

    public void j(CoroutineContext coroutineContext) {
        this.f18210b = coroutineContext;
    }

    public void k(CoroutineContext coroutineContext) {
        this.f18211c = coroutineContext;
    }

    public j l() {
        cl.l0.s(Context.class, (Context) this.f18209a);
        cl.l0.s(CoroutineContext.class, (CoroutineContext) this.f18210b);
        cl.l0.s(CoroutineContext.class, (CoroutineContext) this.f18211c);
        cl.l0.s(ul.g.class, (ul.g) this.f18212d);
        cl.l0.s(om.e.class, (om.e) this.f18213e);
        cl.l0.s(nm.c.class, (nm.c) this.f18214f);
        Context context = (Context) this.f18209a;
        CoroutineContext coroutineContext = (CoroutineContext) this.f18210b;
        CoroutineContext coroutineContext2 = (CoroutineContext) this.f18211c;
        ul.g gVar = (ul.g) this.f18212d;
        om.e eVar = (om.e) this.f18213e;
        nm.c cVar = (nm.c) this.f18214f;
        j jVar = new j();
        jVar.f18218a = b5.f.a(gVar);
        b5.f fVarA = b5.f.a(context);
        jVar.f18219b = fVarA;
        jVar.f18220c = dn.a.a(new n(fVarA, 2));
        jVar.f18221d = dn.a.a(s.f18276a);
        jVar.f18222e = b5.f.a(eVar);
        jVar.f18223f = dn.a.a(new n(jVar.f18218a, 1));
        b5.f fVarA2 = b5.f.a(coroutineContext2);
        jVar.f18224g = fVarA2;
        jVar.f18225h = dn.a.a(new c0(jVar.f18223f, fVarA2));
        jVar.f18226i = b5.f.a(coroutineContext);
        int i5 = 27;
        jVar.f18227j = dn.a.a(new u0(jVar.f18220c, dn.a.a(new s0(jVar.f18221d, jVar.f18222e, jVar.f18223f, jVar.f18225h, dn.a.a(new mg.l(i5, jVar.f18226i, jVar.f18221d, dn.a.a(new io.sentry.internal.debugmeta.c(jVar.f18219b, jVar.f18224g)))))), 1));
        dn.c cVarA = dn.a.a(s.f18277b);
        jVar.f18228k = cVarA;
        jVar.f18229l = dn.a.a(new u0(jVar.f18221d, cVarA, 0));
        int i11 = 0;
        jVar.f18230m = dn.a.a(new s0(jVar.f18218a, jVar.f18222e, jVar.f18227j, dn.a.a(new n(b5.f.a(cVar), i11)), jVar.f18226i, 0));
        int i12 = 10;
        jVar.n = dn.a.a(new mg.l(i12, jVar.f18219b, jVar.f18224g, dn.a.a(new i0(jVar.f18229l, i11))));
        dn.c cVarA2 = dn.a.a(new d1(jVar.f18227j, jVar.f18229l, jVar.f18230m, jVar.f18221d, jVar.n, dn.a.a(new c0(jVar.f18219b, jVar.f18228k)), jVar.f18226i));
        jVar.o = cVarA2;
        jVar.f18231p = dn.a.a(new tm.o(jVar.f18218a, jVar.f18227j, jVar.f18226i, dn.a.a(new i0(cVarA2, 1)), 6));
        return jVar;
    }

    @Override // kw.g0
    public kw.f0 n() {
        return (kw.e0) this.f18211c;
    }

    @Override // ni.d
    public void onAdClicked() {
        Function1 function1 = (Function1) this.f18209a;
        long jCurrentTimeMillis = System.currentTimeMillis();
        String str = (String) this.f18210b;
        String str2 = (String) this.f18211c;
        String str3 = (String) this.f18212d;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        function1.invoke(new dx.g(jCurrentTimeMillis, str, str2, str3, (String) this.f18213e));
    }

    @Override // kw.g0
    public List q() {
        return (ArrayList) this.f18213e;
    }

    public void r(ul.g gVar) {
        this.f18212d = gVar;
    }

    public void s(om.e eVar) {
        this.f18213e = eVar;
    }

    public ColorStateList u(Context context, int i5) {
        if (i5 == 2131230926) {
            return o4.a.b(context, 2131099669);
        }
        if (i5 == 2131230974) {
            return o4.a.b(context, 2131099672);
        }
        if (i5 != 2131230973) {
            if (i5 == 2131230914) {
                return m(context, c2.c(context, 2130968932));
            }
            if (i5 == 2131230908) {
                return m(context, 0);
            }
            if (i5 == 2131230913) {
                return m(context, c2.c(context, 2130968930));
            }
            if (i5 == 2131230968 || i5 == 2131230970) {
                return o4.a.b(context, 2131099671);
            }
            if (i((int[]) this.f18210b, i5)) {
                return c2.d(context, 2130968936);
            }
            if (i((int[]) this.f18213e, i5)) {
                return o4.a.b(context, 2131099668);
            }
            if (i((int[]) this.f18214f, i5)) {
                return o4.a.b(context, 2131099667);
            }
            if (i5 == 2131230965) {
                return o4.a.b(context, 2131099670);
            }
            return null;
        }
        int[][] iArr = new int[3][];
        int[] iArr2 = new int[3];
        ColorStateList colorStateListD = c2.d(context, 2130968987);
        if (colorStateListD == null || !colorStateListD.isStateful()) {
            iArr[0] = c2.f84688b;
            iArr2[0] = c2.b(context, 2130968987);
            iArr[1] = c2.f84691e;
            iArr2[1] = c2.c(context, 2130968934);
            iArr[2] = c2.f84692f;
            iArr2[2] = c2.c(context, 2130968987);
        } else {
            int[] iArr3 = c2.f84688b;
            iArr[0] = iArr3;
            iArr2[0] = colorStateListD.getColorForState(iArr3, 0);
            iArr[1] = c2.f84691e;
            iArr2[1] = c2.c(context, 2130968934);
            iArr[2] = c2.f84692f;
            iArr2[2] = colorStateListD.getDefaultColor();
        }
        return new ColorStateList(iArr, iArr2);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0100 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0157 A[ADDED_TO_REGION, ORIG_RETURN, RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void x(String str, Bundle bundle, boolean z11) {
        String str2;
        String strEncodeToString;
        lm.g gVar;
        boolean zE;
        int i5;
        bundle.putString("scope", "*");
        bundle.putString("sender", str);
        bundle.putString("subtype", str);
        ul.g gVar2 = (ul.g) this.f18212d;
        gVar2.a();
        bundle.putString("gmp_app_id", gVar2.f91322c.f91336b);
        bundle.putString("gmsv", Integer.toString(((ja.d) this.f18209a).j()));
        bundle.putString(com.moloco.sdk.acm.b.f36015c, Integer.toString(Build.VERSION.SDK_INT));
        bundle.putString("app_ver", ((ja.d) this.f18209a).h());
        ja.d dVar = (ja.d) this.f18209a;
        synchronized (dVar) {
            try {
                if (((String) dVar.f69287f) == null) {
                    dVar.m();
                }
                str2 = (String) dVar.f69287f;
            } finally {
            }
        }
        bundle.putString("app_ver_name", str2);
        ul.g gVar3 = (ul.g) this.f18212d;
        gVar3.a();
        try {
            strEncodeToString = Base64.encodeToString(MessageDigest.getInstance("SHA-1").digest(gVar3.f91321b.getBytes()), 11);
        } catch (NoSuchAlgorithmException unused) {
            strEncodeToString = "[HASH-ERROR]";
        }
        bundle.putString("firebase-app-name-hash", strEncodeToString);
        if (z11) {
            ul.g gVar4 = (ul.g) this.f18212d;
            gVar4.a();
            bundle.putString("Goog-Api-Key", gVar4.f91322c.f91335a);
        }
        try {
            String str3 = ((om.b) Tasks.await(((om.d) ((om.e) this.f18213e)).e())).f80504a;
            if (TextUtils.isEmpty(str3)) {
                Log.w("FirebaseMessaging", "FIS auth token is empty");
            } else {
                bundle.putString("Goog-Firebase-Installations-Auth", str3);
            }
        } catch (InterruptedException e3) {
            e = e3;
            Log.e("FirebaseMessaging", "Failed to get FIS auth token", e);
            bundle.putString("appid", (String) Tasks.await(((om.d) ((om.e) this.f18213e)).c()));
            bundle.putString("cliv", "fcm-25.1.1");
            gVar = (lm.g) ((nm.c) this.f18211c).get();
            vm.b bVar = (vm.b) ((nm.c) this.f18214f).get();
            if (gVar == null) {
                return;
            } else {
                return;
            }
        } catch (ExecutionException e11) {
            e = e11;
            Log.e("FirebaseMessaging", "Failed to get FIS auth token", e);
            bundle.putString("appid", (String) Tasks.await(((om.d) ((om.e) this.f18213e)).c()));
            bundle.putString("cliv", "fcm-25.1.1");
            gVar = (lm.g) ((nm.c) this.f18211c).get();
            vm.b bVar2 = (vm.b) ((nm.c) this.f18214f).get();
            if (gVar == null) {
            }
        }
        bundle.putString("appid", (String) Tasks.await(((om.d) ((om.e) this.f18213e)).c()));
        bundle.putString("cliv", "fcm-25.1.1");
        gVar = (lm.g) ((nm.c) this.f18211c).get();
        vm.b bVar22 = (vm.b) ((nm.c) this.f18214f).get();
        if (gVar == null || bVar22 == null) {
            return;
        }
        lm.d dVar2 = (lm.d) gVar;
        synchronized (dVar2) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            lm.j jVar = (lm.j) dVar2.f75040a.get();
            synchronized (jVar) {
                zE = jVar.e(lm.j.f75049b, jCurrentTimeMillis);
            }
            if (zE) {
                synchronized (jVar) {
                    jVar.f75052a.a(new com.moloco.sdk.internal.publisher.nativead.ui.h(jVar, lm.j.b(System.currentTimeMillis())));
                }
                i5 = 3;
            } else {
                i5 = 1;
            }
        }
        if (i5 != 1) {
            bundle.putString("Firebase-Client-Log-Type", Integer.toString(b.c0.F(i5)));
            bundle.putString("Firebase-Client", bVar22.a());
        }
    }

    @Override // kw.g0
    public boolean z() {
        return false;
    }

    public /* synthetic */ i(Context context) {
        this.f18210b = "files";
        this.f18211c = "common";
        this.f18212d = cf.f32440b;
        this.f18213e = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f18214f = xk.v0.l();
        com.google.android.gms.internal.measurement.h.e("Context cannot be null", new Object[0], context != null);
        this.f18209a = context.getPackageName();
    }

    public i(cl.c0 c0Var) {
        long j11 = Integer.MIN_VALUE;
        this.f18210b = new AtomicLong((j11 & 4294967295L) | (j11 << 32));
        this.f18211c = new AtomicReference(null);
        this.f18212d = new AtomicReference(null);
        cl.m0 m0Var = cl.m0.f20038a;
        this.f18213e = new cl.l1(m0Var);
        m1 m1Var = new m1();
        this.f18214f = m1Var;
        vd vdVar = new vd();
        vdVar.f33144b = c0Var;
        vdVar.f33145c = m0Var;
        this.f18209a = vdVar;
        m1Var.b(vdVar, m0Var);
    }
}
