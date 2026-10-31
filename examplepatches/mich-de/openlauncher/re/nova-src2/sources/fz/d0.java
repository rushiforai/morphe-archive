package fz;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.UserHandle;
import b.u4;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.icon.NovaLauncherActivityCachingLogic;
import java.util.Collections;
import java.util.Map;
import java.util.function.Supplier;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import o9.t1;
import o9.z0;

/* loaded from: classes.dex */
public final class d0 extends aa.d0 {
    public final v6 A;
    public final a0 B;
    public final Map C;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f56213v;

    /* renamed from: w, reason: collision with root package name */
    public u f56214w;

    /* renamed from: x, reason: collision with root package name */
    public final u70.d f56215x;

    /* renamed from: y, reason: collision with root package name */
    public final int f56216y;

    /* renamed from: z, reason: collision with root package name */
    public final NovaLauncherActivityCachingLogic f56217z;

    public /* synthetic */ d0(Activity activity, z0 z0Var, u uVar) {
        this(activity, z0Var, null, uVar, true, false);
    }

    public final Bitmap J() {
        gz.f fVar = (gz.f) this.f56214w.f56363e;
        h0 h0VarO = O();
        ComponentName componentName = mx.k0.f77184z;
        Context context = this.f556b;
        Bitmap bitmapC = fVar.c(context, h0VarO, componentName);
        if (bitmapC != null) {
            return bitmapC;
        }
        Bitmap bitmapD = h0.d(O(), context.getResources(), mx.c0.APP_DRAWER.a());
        Intrinsics.d(bitmapD);
        return bitmapD;
    }

    public final BitmapInfo K(Intent intent, UserHandle userHandle) {
        BitmapInfo bitmapInfoP;
        mx.c0 c0VarC = mx.c0.c(intent);
        if (c0VarC != null) {
            return M(c0VarC);
        }
        ShortcutKey shortcutKeyD = ShortcutKey.d(intent, userHandle);
        if (shortcutKeyD != null) {
            BitmapInfo bitmapInfoL = L(shortcutKeyD);
            return bitmapInfoL == null ? h(userHandle) : bitmapInfoL;
        }
        ComponentName component = intent.getComponent();
        return (component == null || (bitmapInfoP = P(new ComponentKey(component, userHandle))) == null) ? h(userHandle) : bitmapInfoP;
    }

    public final BitmapInfo L(ShortcutKey shortcutKey) {
        Drawable drawableX;
        t5.d0 d0VarP = t5.d0.p(this.f556b);
        ShortcutInfo shortcutInfoV = d0VarP.v(shortcutKey);
        if (shortcutInfoV == null || (drawableX = d0VarP.x(shortcutInfoV, this.f56214w.f56360b)) == null) {
            return null;
        }
        return cl.k0.s(shortcutInfoV, drawableX, this);
    }

    public final BitmapInfo M(mx.c0 c0Var) {
        BitmapInfo bitmapInfoB;
        u uVar = this.f56214w;
        Context context = this.f556b;
        mx.k0 k0Var = (mx.k0) aa.g0.A(context, uVar);
        aa.g gVar = k0Var.f77190x;
        try {
            if (c0Var == mx.c0.APP_DRAWER) {
                bitmapInfoB = BitmapInfo.b(J(), gVar);
            } else {
                Bitmap bitmapD = h0.d(O(), context.getResources(), c0Var.a());
                Intrinsics.d(bitmapD);
                bitmapInfoB = BitmapInfo.b(bitmapD, gVar);
            }
            AutoCloseableKt.a(k0Var, null);
            return bitmapInfoB;
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                AutoCloseableKt.a(k0Var, th2);
                throw th3;
            }
        }
    }

    public final mx.k0 N() {
        boolean z11 = this.f56213v;
        Context context = this.f556b;
        if (z11) {
            return (mx.k0) aa.g0.A(context, this.f56214w);
        }
        z0 z0VarA = t1.a(context);
        return new mx.k0(this.f556b, z0VarA.f80271d, z0VarA.f80270c, null, true, null, false, -1, 104);
    }

    public final h0 O() {
        h0 h0Var = this.f572t;
        Intrinsics.e(h0Var, "null cannot be cast to non-null type com.teslacoilsw.launcher.icon.NovaIconProvider");
        return h0Var;
    }

    public final synchronized BitmapInfo P(ComponentKey componentKey) throws Throwable {
        try {
            try {
                return e(componentKey.f21251a, componentKey.f21252b, new aa.r(componentKey, 2), this.A, null, false, false).f17734a;
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object Q(ComponentKey componentKey, ContinuationImpl continuationImpl) {
        b0 b0Var;
        Ref.ObjectRef objectRef;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f56185w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f56185w = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(this, continuationImpl);
            }
        }
        Object obj = b0Var.f56183u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f56185w;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            c0 c0Var = new c0(componentKey, this, objectRefL, null);
            b0Var.f56182t = objectRefL;
            b0Var.f56185w = 1;
            if (t70.m0.y(this.f56215x, c0Var, b0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = b0Var.f56182t;
            ResultKt.b(obj);
        }
        return objectRef.f71863a;
    }

    @Override // aa.d0
    public final void t(final ga.f fVar, boolean z11) {
        if (fVar instanceof iz.a) {
            return;
        }
        synchronized (this) {
            try {
                if (fVar.i() == null) {
                    fVar.f57304r = h(fVar.o);
                    fVar.f57300l = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    fVar.f57301m = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                } else {
                    final Intent intentD = fVar.d();
                    s(fVar, new Supplier() { // from class: aa.b0
                        @Override // java.util.function.Supplier
                        public final Object get() {
                            return this.f538a.f569q.resolveActivity(intentD, fVar.o);
                        }
                    }, true, z11);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public d0(Context context, z0 z0Var, String str, u uVar, boolean z11, boolean z12) {
        super(context, z0Var, str, new h0(context, uVar));
        this.f56213v = z12;
        this.f56214w = uVar;
        Handler handler = this.f559e;
        int i5 = u70.e.f90674a;
        this.f56215x = new u70.d(handler, "iconCache-worker", false);
        this.f56216y = z0Var.f80270c;
        NovaLauncherActivityCachingLogic novaLauncherActivityCachingLogic = this.o;
        Intrinsics.e(novaLauncherActivityCachingLogic, "null cannot be cast to non-null type com.teslacoilsw.launcher.icon.NovaLauncherActivityCachingLogic");
        this.f56217z = novaLauncherActivityCachingLogic;
        this.A = new v6(this, 9);
        if (z11) {
            ba.c cVar = this.f561g;
            Intrinsics.e(cVar, "null cannot be cast to non-null type com.android.launcher3.util.SQLiteCacheHelper");
            cVar.f17741c = true;
        }
        this.B = new a0();
        this.C = Collections.synchronizedMap(new z(25, 0.75f, true));
    }
}
