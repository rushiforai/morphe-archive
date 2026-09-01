package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.location.LocationManager;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import com.google.android.gms.common.api.Status;
import com.google.android.recaptcha.internal.zzfx;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import java.lang.reflect.Method;
import java.security.GeneralSecurityException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicReference;
import kotlinx.coroutines.TimeoutCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class vwa implements x60, pob, iof, xq8 {
    public static vwa e;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;
    public Object d;

    public vwa(int i) {
        this.a = i;
        switch (i) {
            case 5:
                this.b = new bd7(8);
                break;
            case 9:
                this.b = new WeakHashMap();
                this.c = new WeakHashMap();
                this.d = new WeakHashMap();
                break;
            case 15:
                List list = Collections.EMPTY_LIST;
                this.b = list;
                this.c = list;
                break;
            default:
                this.b = new AtomicReference(n01.n);
                this.d = new Object();
                break;
        }
    }

    public static final /* synthetic */ zzfx G(vwa vwaVar, Exception exc) {
        v60 v60Var = (v60) vwaVar.c;
        d87 d87Var = d87.U0;
        int i = 8;
        return exc instanceof TimeoutCancellationException ? v60Var.a(exc, new zzfx(d87Var, d87.f, exc.getMessage(), i)) : exc instanceof zzfx ? v60Var.a(exc, (zzfx) exc) : v60Var.a(exc, new zzfx(d87Var, d87.o, exc.getMessage(), i));
    }

    public static vwa x(Context context, AttributeSet attributeSet, int[] iArr, int i) {
        return new vwa(context, context.obtainStyledAttributes(attributeSet, iArr, i, 0));
    }

    private final void y() {
    }

    public void A(vwa vwaVar, l3b l3bVar) {
        Exception exc;
        Exception exc2;
        int i;
        j68 j68Var = (j68) this.b;
        int i2 = j68Var.b;
        x68 x68Var = (x68) this.c;
        x68 x68Var2 = new x68();
        int i3 = 0;
        int i4 = 0;
        while (i3 < i2) {
            int i5 = i3 + 1;
            try {
                try {
                    switch (j68Var.c(i3)) {
                        case 0:
                            vwaVar.i();
                            i3 = i5;
                            break;
                        case 1:
                            int i6 = i4 + 1;
                            vwaVar.d(x68Var.f(i4));
                            i4 = i6;
                            i3 = i5;
                            break;
                        case 2:
                            int i7 = i3 + 2;
                            i3 += 3;
                            vwaVar.g(j68Var.c(i5), j68Var.c(i7));
                            break;
                        case 3:
                            int i8 = i3 + 2;
                            try {
                                i = i3 + 3;
                            } catch (Exception e2) {
                                exc = e2;
                                i3 = i8;
                            }
                            try {
                                i3 += 4;
                                vwaVar.f(j68Var.c(i5), j68Var.c(i8), j68Var.c(i));
                            } catch (Exception e3) {
                                exc = e3;
                                i3 = i;
                                throw new h12(x68Var, x68Var2, j68Var, i3 - 1, exc);
                            }
                            break;
                        case 4:
                            vwaVar.b();
                            i3 = i5;
                            break;
                        case 5:
                            i3 += 2;
                            int i9 = i4 + 1;
                            vwaVar.c(j68Var.c(i5), x68Var.f(i4));
                            i4 = i9;
                            break;
                        case 6:
                            i3 += 2;
                            try {
                                j68Var.c(i5);
                                int i10 = i4 + 1;
                                i4 = i10;
                            } catch (Exception e4) {
                                exc2 = e4;
                                exc = exc2;
                                throw new h12(x68Var, x68Var2, j68Var, i3 - 1, exc);
                            }
                            break;
                        case 7:
                            int i11 = i4 + 1;
                            Object objF = x68Var.f(i4);
                            objF.getClass();
                            pwd.B(2, objF);
                            i4 += 2;
                            ((b55) objF).invoke(vwaVar.p(), x68Var.f(i11));
                            i3 = i5;
                            break;
                        case 8:
                            Object obj = vwaVar.c;
                            if (obj instanceof f12) {
                                f12 f12Var = (f12) obj;
                                if (((o78) l3bVar.e).l(f12Var)) {
                                    f12Var.b();
                                }
                            }
                            x68Var2.a(obj);
                            vwaVar.e();
                            i3 = i5;
                            break;
                        default:
                            i3 = i5;
                            break;
                    }
                } catch (Exception e5) {
                    exc2 = e5;
                    i3 = i5;
                    exc = exc2;
                    throw new h12(x68Var, x68Var2, j68Var, i3 - 1, exc);
                }
            } catch (Throwable th) {
                vwaVar.l();
                throw th;
            }
        }
        if (i4 != x68Var.b) {
            b22.a("Applier operation size mismatch");
        }
        x68Var.d();
        j68Var.b = 0;
        vwaVar.l();
    }

    public void B(ux6 ux6Var) {
        l0c l0cVar = (l0c) this.d;
        if (l0cVar != null) {
            l0cVar.run();
        }
        l0c l0cVar2 = new l0c((ky6) this.b, ux6Var);
        this.d = l0cVar2;
        ((Handler) this.c).postAtFrontOfQueue(l0cVar2);
    }

    public void C() {
        ((TypedArray) this.c).recycle();
    }

    public boolean D(Object obj) {
        boolean zRemove;
        synchronized (((ArrayDeque) this.c)) {
            zRemove = ((ArrayDeque) this.c).remove(obj);
            if (zRemove) {
                ((ScheduledThreadPoolExecutor) this.d).execute(new b2a(3, this));
            }
        }
        return zRemove;
    }

    public void E(Object obj) {
        long j = to7.j();
        if (j == hld.a) {
            this.c = obj;
            return;
        }
        synchronized (this.d) {
            cld cldVar = (cld) ((AtomicReference) this.b).get();
            int iA = cldVar.a(j);
            if (iA < 0) {
                ((AtomicReference) this.b).set(cldVar.b(j, obj));
            } else {
                cldVar.c[iA] = obj;
            }
        }
    }

    public void F() {
        f78 f78Var = (f78) this.b;
        String str = (String) this.c;
        List list = (List) f78Var.k(str);
        if (list != null) {
            list.remove((m45) this.d);
        }
        if (list == null || list.isEmpty()) {
            return;
        }
        f78Var.m(str, list);
    }

    public j1g H() throws GeneralSecurityException {
        ujf ujfVar;
        qvg qvgVarB;
        p1g p1gVar = (p1g) this.b;
        if (p1gVar == null || (ujfVar = (ujf) this.c) == null) {
            ygf.l("Cannot build without parameters and/or key material");
            return null;
        }
        if (p1gVar.a != ((qvg) ujfVar.b).a.length) {
            ygf.l("Key size mismatch");
            return null;
        }
        if (p1gVar.a() && ((Integer) this.d) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (!((p1g) this.b).a() && ((Integer) this.d) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        d1g d1gVar = ((p1g) this.b).d;
        if (d1gVar == d1g.h) {
            qvgVarB = mhg.a;
        } else if (d1gVar == d1g.g) {
            qvgVarB = mhg.a(((Integer) this.d).intValue());
        } else {
            if (d1gVar != d1g.f) {
                ygf.f("Unknown AesEaxParameters.Variant: ".concat(String.valueOf(d1gVar)));
                return null;
            }
            qvgVarB = mhg.b(((Integer) this.d).intValue());
        }
        return new j1g((p1g) this.b, (ujf) this.c, qvgVarB, (Integer) this.d);
    }

    public r1g I() throws GeneralSecurityException {
        ujf ujfVar;
        qvg qvgVarB;
        g2g g2gVar = (g2g) this.b;
        if (g2gVar == null || (ujfVar = (ujf) this.c) == null) {
            ygf.l("Cannot build without parameters and/or key material");
            return null;
        }
        if (g2gVar.a != ((qvg) ujfVar.b).a.length) {
            ygf.l("Key size mismatch");
            return null;
        }
        if (g2gVar.a() && ((Integer) this.d) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (!((g2g) this.b).a() && ((Integer) this.d) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        d2g d2gVar = ((g2g) this.b).d;
        if (d2gVar == d2g.e) {
            qvgVarB = mhg.a;
        } else if (d2gVar == d2g.d) {
            qvgVarB = mhg.a(((Integer) this.d).intValue());
        } else {
            if (d2gVar != d2g.c) {
                ygf.f("Unknown AesGcmParameters.Variant: ".concat(String.valueOf(d2gVar)));
                return null;
            }
            qvgVarB = mhg.b(((Integer) this.d).intValue());
        }
        return new r1g((g2g) this.b, (ujf) this.c, qvgVarB, (Integer) this.d);
    }

    public j2g J() throws GeneralSecurityException {
        ujf ujfVar;
        qvg qvgVarB;
        r2g r2gVar = (r2g) this.b;
        if (r2gVar == null || (ujfVar = (ujf) this.c) == null) {
            ygf.l("Cannot build without parameters and/or key material");
            return null;
        }
        if (r2gVar.a != ((qvg) ujfVar.b).a.length) {
            ygf.l("Key size mismatch");
            return null;
        }
        if (r2gVar.a() && ((Integer) this.d) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (!((r2g) this.b).a() && ((Integer) this.d) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        d1g d1gVar = ((r2g) this.b).b;
        if (d1gVar == d1g.k) {
            qvgVarB = mhg.a;
        } else if (d1gVar == d1g.j) {
            qvgVarB = mhg.a(((Integer) this.d).intValue());
        } else {
            if (d1gVar != d1g.i) {
                ygf.f("Unknown AesGcmSivParameters.Variant: ".concat(String.valueOf(d1gVar)));
                return null;
            }
            qvgVarB = mhg.b(((Integer) this.d).intValue());
        }
        return new j2g((r2g) this.b, (ujf) this.c, qvgVarB, (Integer) this.d);
    }

    public void K(String str, Object obj) {
        vwa vwaVar = new vwa(22, false);
        ((vwa) this.d).c = vwaVar;
        this.d = vwaVar;
        vwaVar.d = obj;
        vwaVar.b = str;
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        rmb rmbVar = (rmb) this.b;
        String str = (String) this.c;
        ScheduledFuture scheduledFuture = (ScheduledFuture) this.d;
        synchronized (rmbVar.a) {
            rmbVar.a.remove(str);
        }
        scheduledFuture.cancel(false);
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a */
    public void mo105a(String str) {
        switch (this.a) {
            case 16:
                ((ing) this.c).mo105a(str);
                break;
            case 17:
                ((vwa) this.c).mo105a(str);
                break;
            case 18:
                ((zjf) this.c).b(hp7.K(str));
                break;
            case 19:
                ((vwa) this.c).mo105a(str);
                break;
            default:
                ((zjf) this.c).b(hp7.K(str));
                break;
        }
    }

    public void b() {
        ((ArrayList) this.b).clear();
        this.c = this.d;
        ((aq6) this.d).P();
    }

    @Override // defpackage.x60
    public void c(int i, Object obj) {
        switch (this.a) {
            case 0:
                j68 j68Var = (j68) this.b;
                j68Var.a(5);
                j68Var.a(i);
                ((x68) this.c).a(obj);
                break;
            default:
                ((aq6) this.c).B(i, (aq6) obj);
                break;
        }
    }

    @Override // defpackage.x60
    public void d(Object obj) {
        switch (this.a) {
            case 0:
                ((j68) this.b).a(1);
                ((x68) this.c).a(obj);
                break;
            default:
                ((ArrayList) this.b).add(this.c);
                this.c = obj;
                break;
        }
    }

    @Override // defpackage.x60
    public void e() {
        cxa rectManager;
        lm lmVar;
        cxa rectManager2;
        switch (this.a) {
            case 0:
                ((j68) this.b).a(8);
                break;
            default:
                aq6 aq6Var = (aq6) this.c;
                hj0 hj0Var = aq6Var.F;
                if (!aq6Var.H()) {
                    b26.a("onReuse is only expected on attached node");
                }
                due dueVar = aq6Var.o;
                if (dueVar != null) {
                    View view = dueVar.b;
                    if (view.getParent() != dueVar) {
                        dueVar.addView(view);
                    } else {
                        dueVar.f.invoke();
                    }
                }
                nq6 nq6Var = aq6Var.H;
                if (nq6Var != null) {
                    nq6Var.i(false);
                }
                aq6Var.t = false;
                if (aq6Var.Q) {
                    aq6Var.Q = false;
                } else {
                    q28 q28Var = (ffd) aq6Var.F.f;
                    for (q28 q28Var2 = q28Var; q28Var2 != null; q28Var2 = q28Var2.e) {
                        if (q28Var2.n) {
                            q28Var2.D0();
                        }
                    }
                    for (q28 q28Var3 = q28Var; q28Var3 != null; q28Var3 = q28Var3.e) {
                        if (q28Var3.n) {
                            q28Var3.F0();
                        }
                    }
                    while (q28Var != null) {
                        if (q28Var.n) {
                            q28Var.x0();
                        }
                        q28Var = q28Var.e;
                    }
                }
                int i = aq6Var.b;
                mx8 mx8Var = aq6Var.n;
                if (mx8Var != null && (rectManager2 = ((mn) mx8Var).getRectManager()) != null) {
                    rectManager2.g(aq6Var);
                }
                aq6Var.b = wxb.a.addAndGet(1);
                mx8 mx8Var2 = aq6Var.n;
                if (mx8Var2 != null) {
                    mn mnVar = (mn) mx8Var2;
                    mnVar.getLayoutNodes().g(i);
                    mnVar.getLayoutNodes().i(aq6Var.b, aq6Var);
                }
                for (q28 q28Var4 = (q28) hj0Var.g; q28Var4 != null; q28Var4 = q28Var4.f) {
                    q28Var4.w0();
                }
                hj0Var.g();
                if (hj0Var.e(8)) {
                    aq6Var.F();
                }
                aq6.W(aq6Var);
                mx8 mx8Var3 = aq6Var.n;
                if (mx8Var3 != null) {
                    mn mnVar2 = (mn) mx8Var3;
                    if (mn.g() && (lmVar = mnVar2.N) != null) {
                        mn mnVar3 = lmVar.c;
                        sk0 sk0Var = lmVar.a;
                        l68 l68Var = lmVar.h;
                        if (l68Var.g(i)) {
                            sk0Var.e(mnVar3, i, false);
                        }
                        txb txbVarX = aq6Var.x();
                        if (txbVarX != null && txbVarX.a.b(eyb.r)) {
                            l68Var.a(aq6Var.b);
                            sk0Var.e(mnVar3, aq6Var.b, true);
                        }
                    }
                }
                mx8 mx8Var4 = aq6Var.n;
                if (mx8Var4 != null && (rectManager = ((mn) mx8Var4).getRectManager()) != null) {
                    rectManager.f(aq6Var);
                    break;
                }
                break;
        }
    }

    @Override // defpackage.x60
    public void f(int i, int i2, int i3) {
        switch (this.a) {
            case 0:
                j68 j68Var = (j68) this.b;
                j68Var.a(3);
                j68Var.a(i);
                j68Var.a(i2);
                j68Var.a(i3);
                break;
            default:
                ((aq6) this.c).L(i, i2, i3);
                break;
        }
    }

    @Override // defpackage.x60
    public void g(int i, int i2) {
        switch (this.a) {
            case 0:
                j68 j68Var = (j68) this.b;
                j68Var.a(2);
                j68Var.a(i);
                j68Var.a(i2);
                break;
            default:
                ((aq6) this.c).Q(i, i2);
                break;
        }
    }

    @Override // defpackage.iof
    public void h(xnf xnfVar) {
        switch (this.a) {
            case 16:
                rqf rqfVar = (rqf) xnfVar;
                ((ujf) this.d).s(new zpf(rqfVar.b, rqfVar.a, Long.valueOf(rqfVar.c)), null, "password", Boolean.FALSE, null, (zjf) this.b, this);
                break;
            case 17:
                zjf zjfVar = (zjf) this.b;
                rrf rrfVar = (rrf) xnfVar;
                if (!TextUtils.isEmpty(rrfVar.e)) {
                    zjfVar.l(new Status(17025, null, null, null), new c99(null, null, rrfVar.f, rrfVar.e, true));
                } else {
                    ((ujf) ((vwa) this.d).d).s(new zpf(rrfVar.b, rrfVar.a, Long.valueOf(rrfVar.c)), null, "phone", Boolean.valueOf(rrfVar.d), null, zjfVar, (vwa) this.c);
                }
                break;
            case 18:
                ft2 ft2Var = (ft2) this.b;
                ft2Var.f = ((zpf) xnfVar).b;
                bh4 bh4Var = (bh4) ((ujf) this.d).b;
                vwa vwaVar = new vwa(17, this, (zjf) this.c, this, false);
                unf unfVar = (unf) bh4Var.b;
                qk7.D(unfVar.t("/verifyPhoneNumber", (String) bh4Var.a), ft2Var, vwaVar, new rrf(), (o2b) unfVar.b);
                break;
            case 19:
                ujf.q((ujf) ((vwa) this.d).d, (irf) xnfVar, (zjf) this.b, this);
                break;
            default:
                frf frfVar = (frf) this.b;
                frfVar.o = true;
                String str = ((zpf) xnfVar).b;
                vp7.n(str);
                frfVar.b = str;
                bh4 bh4Var2 = (bh4) ((ujf) this.d).b;
                vwa vwaVar2 = new vwa(19, this, (zjf) this.c, this, false);
                unf unfVar2 = (unf) bh4Var2.b;
                qk7.D(unfVar2.t("/verifyAssertion", (String) bh4Var2.a), frfVar, vwaVar2, new irf(), (o2b) unfVar2.b);
                break;
        }
    }

    @Override // defpackage.x60
    public void i() {
        switch (this.a) {
            case 0:
                ((j68) this.b).a(0);
                break;
            default:
                this.c = ((ArrayList) this.b).remove(r0.size() - 1);
                break;
        }
    }

    @Override // defpackage.x60
    public void k(int i, Object obj) {
        switch (this.a) {
            case 0:
                j68 j68Var = (j68) this.b;
                j68Var.a(6);
                j68Var.a(i);
                ((x68) this.c).a(obj);
                break;
            default:
                break;
        }
    }

    @Override // defpackage.x60
    public void l() {
        switch (this.a) {
            case 0:
                break;
            default:
                mx8 mx8Var = ((aq6) this.d).n;
                if (mx8Var != null) {
                    ((mn) mx8Var).y();
                }
                break;
        }
    }

    public Object m() {
        long j = to7.j();
        if (j == hld.a) {
            return this.c;
        }
        cld cldVar = (cld) ((AtomicReference) this.b).get();
        int iA = cldVar.a(j);
        if (iA >= 0) {
            return cldVar.c[iA];
        }
        return null;
    }

    @Override // defpackage.x60
    public void n(b55 b55Var, Object obj) {
        switch (this.a) {
            case 0:
                ((j68) this.b).a(7);
                x68 x68Var = (x68) this.c;
                x68Var.a(b55Var);
                x68Var.a(obj);
                break;
            default:
                b55Var.invoke(p(), obj);
                break;
        }
    }

    public ColorStateList o(int i) {
        int resourceId;
        ColorStateList colorStateListL;
        TypedArray typedArray = (TypedArray) this.c;
        return (!typedArray.hasValue(i) || (resourceId = typedArray.getResourceId(i, 0)) == 0 || (colorStateListL = nm.l((Context) this.b, resourceId)) == null) ? typedArray.getColorStateList(i) : colorStateListL;
    }

    public Object p() {
        return this.c;
    }

    public Drawable q(int i) {
        int resourceId;
        TypedArray typedArray = (TypedArray) this.c;
        return (!typedArray.hasValue(i) || (resourceId = typedArray.getResourceId(i, 0)) == 0) ? typedArray.getDrawable(i) : guc.E((Context) this.b, resourceId);
    }

    public Drawable r(int i) {
        int resourceId;
        Drawable drawableG;
        if (!((TypedArray) this.c).hasValue(i) || (resourceId = ((TypedArray) this.c).getResourceId(i, 0)) == 0) {
            return null;
        }
        j20 j20VarA = j20.a();
        Context context = (Context) this.b;
        synchronized (j20VarA) {
            drawableG = j20VarA.a.g(context, resourceId, true);
        }
        return drawableG;
    }

    public Typeface s(int i, int i2, h30 h30Var) {
        int resourceId = ((TypedArray) this.c).getResourceId(i, 0);
        if (resourceId == 0) {
            return null;
        }
        TypedValue typedValue = (TypedValue) this.d;
        if (typedValue == null) {
            typedValue = new TypedValue();
            this.d = typedValue;
        }
        TypedValue typedValue2 = typedValue;
        Context context = (Context) this.b;
        ThreadLocal threadLocal = wcb.a;
        if (context.isRestricted()) {
            return null;
        }
        return wcb.c(context, resourceId, typedValue2, i2, h30Var, true);
    }

    public bo4 t() {
        return w2g.r(m40.J(new pja(m40.J(new zh(mya.w((mya) this.b, null, 7), 23)), this, 12)), (kb2) this.d);
    }

    public String toString() {
        String str = "";
        switch (this.a) {
            case 23:
                StringBuilder sb = new StringBuilder(32);
                sb.append((String) this.b);
                sb.append('{');
                zjf zjfVar = (zjf) ((zjf) this.c).c;
                while (zjfVar != null) {
                    Object obj = zjfVar.b;
                    sb.append(str);
                    if (obj == null || !obj.getClass().isArray()) {
                        sb.append(obj);
                    } else {
                        sb.append((CharSequence) Arrays.deepToString(new Object[]{obj}), 1, r4.length() - 1);
                    }
                    zjfVar = (zjf) zjfVar.c;
                    str = ", ";
                }
                sb.append('}');
                return sb.toString();
            case 24:
                StringBuilder sb2 = new StringBuilder(32);
                sb2.append((String) this.b);
                sb2.append('{');
                vwa vwaVar = (vwa) ((vwa) this.c).c;
                while (vwaVar != null) {
                    Object obj2 = vwaVar.d;
                    sb2.append(str);
                    String str2 = (String) vwaVar.b;
                    if (str2 != null) {
                        sb2.append(str2);
                        sb2.append('=');
                    }
                    if (obj2 == null || !obj2.getClass().isArray()) {
                        sb2.append(obj2);
                    } else {
                        sb2.append((CharSequence) Arrays.deepToString(new Object[]{obj2}), 1, r4.length() - 1);
                    }
                    vwaVar = (vwa) vwaVar.c;
                    str = ", ";
                }
                sb2.append('}');
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object u(java.lang.String r18, java.lang.String r19, java.lang.String r20, long r21, gen.model.MediumMembershipType r23, com.medium.android.core.membership.UpsellInfo r24, java.lang.String r25, java.lang.String r26, java.lang.String r27, java.lang.String r28, defpackage.p92 r29) {
        /*
            Method dump skipped, instruction units count: 344
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vwa.u(java.lang.String, java.lang.String, java.lang.String, long, gen.model.MediumMembershipType, com.medium.android.core.membership.UpsellInfo, java.lang.String, java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object v(java.lang.String r26, java.lang.String r27, java.lang.String r28, java.lang.String r29, java.lang.String r30, defpackage.p92 r31) {
        /*
            Method dump skipped, instruction units count: 399
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vwa.v(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public boolean w() {
        if (((upc) this.b).getValue() != this.d) {
            return true;
        }
        vwa vwaVar = (vwa) this.c;
        return vwaVar != null && vwaVar.w();
    }

    public String z() {
        String str;
        synchronized (((ArrayDeque) this.c)) {
            str = (String) ((ArrayDeque) this.c).peek();
        }
        return str;
    }

    public static vwa j(SharedPreferences sharedPreferences, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
        vwa vwaVar = new vwa(sharedPreferences, scheduledThreadPoolExecutor);
        synchronized (((ArrayDeque) vwaVar.c)) {
            try {
                ((ArrayDeque) vwaVar.c).clear();
                String string = ((SharedPreferences) vwaVar.b).getString(mBTDfueQiGWRV.laPBxH, "");
                if (!TextUtils.isEmpty(string) && string.contains(",")) {
                    String[] strArrSplit = string.split(",", -1);
                    if (strArrSplit.length == 0) {
                        Log.e("FirebaseMessaging", "Corrupted queue. Please check the queue contents and item separator provided");
                    }
                    for (String str : strArrSplit) {
                        if (!TextUtils.isEmpty(str)) {
                            ((ArrayDeque) vwaVar.c).add(str);
                        }
                    }
                    return vwaVar;
                }
                return vwaVar;
            } finally {
            }
        }
    }

    public /* synthetic */ vwa(int i, boolean z) {
        this.a = i;
    }

    public /* synthetic */ vwa(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public vwa(String str, int i) {
        this.a = i;
        switch (i) {
            case 24:
                vwa vwaVar = new vwa(22, false);
                this.c = vwaVar;
                this.d = vwaVar;
                this.b = str;
                break;
            default:
                zjf zjfVar = new zjf(5);
                this.c = zjfVar;
                this.d = zjfVar;
                this.b = str;
                break;
        }
    }

    public vwa(qy6 qy6Var) {
        this.a = 2;
        this.b = new ky6(qy6Var, true);
        this.c = new Handler(Looper.getMainLooper());
    }

    public /* synthetic */ vwa(int i, Object obj, Object obj2, Object obj3, boolean z) {
        this.a = i;
        this.b = obj2;
        this.c = obj3;
        this.d = obj;
    }

    public vwa(SharedPreferences sharedPreferences, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
        this.a = 3;
        this.c = new ArrayDeque();
        this.b = sharedPreferences;
        this.d = scheduledThreadPoolExecutor;
    }

    public vwa(Context context, TypedArray typedArray) {
        this.a = 6;
        this.b = context;
        this.c = typedArray;
    }

    public vwa(Context context, LocationManager locationManager) {
        this.a = 7;
        this.d = new ur();
        this.b = context;
        this.c = locationManager;
    }

    public vwa(n46 n46Var, List[] listArr, Method method) {
        this.a = 13;
        n46Var.getClass();
        this.b = n46Var;
        this.c = listArr;
        this.d = method;
    }

    public vwa(gyd gydVar, vwa vwaVar) {
        this.a = 8;
        this.b = gydVar;
        this.c = vwaVar;
        this.d = gydVar.getValue();
    }

    public vwa(aq6 aq6Var) {
        this.a = 10;
        this.d = aq6Var;
        this.b = new ArrayList();
        this.c = aq6Var;
    }

    public vwa(Object obj) {
        this.a = 0;
        this.b = new j68();
        this.c = new x68();
        this.d = obj;
    }
}
