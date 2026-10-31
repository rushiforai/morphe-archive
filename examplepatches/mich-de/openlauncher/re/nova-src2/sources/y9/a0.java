package y9;

import aa.g0;
import android.animation.ObjectAnimator;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Process;
import android.os.UserHandle;
import b00.z0;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.icons.BitmapInfo;
import com.vungle.ads.internal.protos.Sdk;
import e10.k0;
import e10.y2;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;
import mx.j0;
import o9.g3;
import o9.t1;

/* loaded from: classes.dex */
public abstract class a0 {

    /* renamed from: q, reason: collision with root package name */
    public static final ca.c f96867q = new ca.c("currentPageItemsTransX", 8);

    /* renamed from: a, reason: collision with root package name */
    public final Context f96868a;

    /* renamed from: b, reason: collision with root package name */
    public final FolderIcon f96869b;

    /* renamed from: c, reason: collision with root package name */
    public final int f96870c;

    /* renamed from: j, reason: collision with root package name */
    public final float f96877j;

    /* renamed from: l, reason: collision with root package name */
    public boolean f96879l;

    /* renamed from: d, reason: collision with root package name */
    public float f96871d = -1.0f;

    /* renamed from: e, reason: collision with root package name */
    public int f96872e = -1;

    /* renamed from: f, reason: collision with root package name */
    public int f96873f = -1;

    /* renamed from: g, reason: collision with root package name */
    public Drawable f96874g = null;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f96875h = new ArrayList();

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f96876i = new ArrayList();

    /* renamed from: k, reason: collision with root package name */
    public float f96878k = 0.0f;

    /* renamed from: m, reason: collision with root package name */
    public final z0 f96880m = new z0(this, 22);
    public ObjectAnimator n = null;
    public BitmapInfo o = null;

    /* renamed from: p, reason: collision with root package name */
    public BitmapInfo f96881p = null;

    public a0(FolderIcon folderIcon) {
        Context context = folderIcon.getContext();
        this.f96868a = context;
        this.f96869b = folderIcon;
        this.f96870c = ((za.d) za.d.p(context)).P().T;
        Pattern pattern = g3.f79846a;
        this.f96877j = (int) (1.0f * Resources.getSystem().getDisplayMetrics().density);
    }

    public final void a(int i5, ArrayList arrayList, boolean z11) {
        FolderIcon folderIcon = this.f96869b;
        List listB0 = folderIcon.b0(i5);
        int size = arrayList.size();
        while (listB0.size() < arrayList.size()) {
            arrayList.remove(arrayList.size() - 1);
        }
        while (listB0.size() > arrayList.size()) {
            arrayList.add(new z(0.0f, 0.0f, 0.0f));
        }
        z0 z0Var = (i5 == 0 && arrayList == this.f96875h) ? this.f96880m : null;
        int size2 = i5 == 0 ? listB0.size() : folderIcon.N.b();
        for (int i11 = 0; i11 < arrayList.size(); i11++) {
            z zVar = (z) arrayList.get(i11);
            j(zVar, (ga.j) listB0.get(i11), z0Var);
            if (z11) {
                t tVar = new t(this, zVar, i11, size, i11, size2, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, null);
                t tVar2 = zVar.f97000e;
                if (tVar2 == null) {
                    zVar.f97000e = tVar;
                    tVar.c();
                } else if (!tVar2.b(tVar)) {
                    zVar.f97000e.a();
                    zVar.f97000e = tVar;
                    tVar.c();
                }
            } else {
                t tVar3 = zVar.f97000e;
                if (tVar3 != null) {
                    tVar3.a();
                }
                c(i11, size2, zVar);
                if (this.f96874g == null) {
                    this.f96874g = zVar.f97002g;
                }
            }
        }
    }

    public final void b(int i5, int i11) {
        float f11 = this.f96871d;
        float f12 = i5;
        FolderIcon folderIcon = this.f96869b;
        if (f11 == f12 && this.f96872e == i11 && this.f96873f == folderIcon.getPaddingTop()) {
            return;
        }
        this.f96871d = f12;
        this.f96872e = i11;
        this.f96873f = folderIcon.getPaddingTop();
        int measuredHeight = folderIcon.f20875l;
        int iD = (int) (((fz.d) y2.f51877a.i().l()).d() * measuredHeight);
        if (folderIcon.f20873j) {
            measuredHeight = folderIcon.getMeasuredHeight();
        }
        folderIcon.K.k(folderIcon.getContext(), folderIcon.G, folderIcon, this.f96872e, folderIcon.getPaddingTop(), iD, (measuredHeight - iD) / 2);
        folderIcon.N.c(folderIcon.K.f96986m, this.f96871d, g3.p(folderIcon.getResources()));
        a(0, this.f96875h, false);
    }

    public final z c(int i5, int i11, z zVar) {
        FolderIcon folderIcon = this.f96869b;
        if (i5 != -1) {
            nz.c cVar = folderIcon.N;
            return cVar.e(i5, i11, zVar, cVar.h(i5, i11));
        }
        float f11 = folderIcon.G.P().D;
        float f12 = (folderIcon.K.f96986m - f11) / 2.0f;
        zVar.a(f12, f12, f11 / this.f96874g.getIntrinsicWidth());
        return zVar;
    }

    public final t d(boolean z11, x4.j jVar) {
        ArrayList arrayList = this.f96875h;
        return z11 ? new t(this, (z) arrayList.get(0), 0, 2, -1, -1, 200, jVar) : new t(this, (z) arrayList.get(0), -1, -1, 0, 2, 350, jVar);
    }

    public void e(Canvas canvas, boolean z11) {
        a0 a0Var;
        Canvas canvas2;
        float f11;
        int saveCount = canvas.getSaveCount();
        FolderIcon folderIcon = this.f96869b;
        Path pathE = folderIcon.K.e();
        boolean z12 = this.f96879l;
        float f12 = this.f96877j;
        if (z12) {
            boolean zB = folderIcon.f21131d0.b();
            ArrayList arrayList = this.f96876i;
            if (!zB || (folderIcon.N instanceof nz.f)) {
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    ((z) arrayList.get(size)).f97004i = Math.max(0, (int) (((200.0f - (this.f96878k * 2.0f)) * 255.0f) / 200.0f));
                }
            }
            a0Var = this;
            canvas2 = canvas;
            a0Var.f(canvas2, arrayList, folderIcon.H.T.f51685i == k0.f51621c ? new PointF(r1.n, r1.o + this.f96878k) : new PointF(r1.n + this.f96878k, r1.o), this.f96878k > f12, pathE);
            f11 = a0Var.f96878k - 200.0f;
        } else {
            a0Var = this;
            canvas2 = canvas;
            f11 = 0.0f;
        }
        a0Var.f(canvas2, a0Var.f96875h, folderIcon.H.T.f51685i == k0.f51621c ? new PointF(r1.n, r1.o + f11) : new PointF(r1.n + f11, r1.o), f11 < (-f12), pathE);
        canvas2.restoreToCount(saveCount);
    }

    public final void f(Canvas canvas, ArrayList arrayList, PointF pointF, boolean z11, Path path) {
        Canvas canvas2;
        PointF pointF2;
        Path path2;
        k0 k0Var = this.f96869b.H.T.f51685i;
        k0 k0Var2 = k0.f51620b;
        int size = arrayList.size() - 1;
        while (size >= 0) {
            z zVar = (z) arrayList.get(size);
            if (zVar.f97001f) {
                canvas2 = canvas;
                pointF2 = pointF;
                path2 = path;
            } else {
                canvas2 = canvas;
                pointF2 = pointF;
                path2 = path;
                g(canvas2, zVar, pointF2, (zVar.f96996a == -2.0f) | z11, path2);
            }
            size--;
            canvas = canvas2;
            pointF = pointF2;
            path = path2;
        }
    }

    public void g(Canvas canvas, z zVar, PointF pointF, boolean z11, Path path) {
        canvas.save();
        if (z11) {
            canvas.clipPath(path);
        }
        canvas.translate(pointF.x + zVar.f96997b, pointF.y + zVar.f96998c);
        float f11 = zVar.f96999d;
        canvas.scale(f11, f11);
        Drawable drawable = zVar.f97002g;
        if (drawable != null) {
            Rect bounds = drawable.getBounds();
            canvas.save();
            canvas.translate(-bounds.left, -bounds.top);
            canvas.scale(this.f96871d / bounds.width(), this.f96871d / bounds.height());
            drawable.setAlpha(zVar.f97004i);
            drawable.draw(canvas);
            canvas.restore();
        }
        canvas.restore();
    }

    public final void h(int i5, boolean z11) {
        ArrayList arrayList = this.f96875h;
        int iMax = Math.max(arrayList.size() - this.f96869b.N.b(), 0) + i5;
        z zVar = iMax < arrayList.size() ? (z) arrayList.get(iMax) : null;
        if (zVar != null) {
            zVar.f97001f = z11;
        }
    }

    public final void i() {
        int measuredWidth;
        FolderIcon folderIcon = this.f96869b;
        if (folderIcon.f20873j) {
            measuredWidth = (folderIcon.getPaddingLeft() * 2) + folderIcon.f20875l;
        } else {
            measuredWidth = folderIcon.getMeasuredWidth();
        }
        Drawable drawable = this.f96874g;
        if (drawable != null) {
            b(drawable.getIntrinsicWidth(), measuredWidth);
        } else {
            j0 j0VarP = folderIcon.G.P();
            b(Math.max(j0VarP.f77140e0, j0VarP.D), measuredWidth);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x006c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void j(z zVar, ga.j jVar, z0 z0Var) {
        boolean z11;
        int i5;
        Intent intent = jVar.f57322x;
        Context context = this.f96868a;
        if (intent != null && intent.getComponent() != null) {
            ComponentName component = jVar.f57322x.getComponent();
            UserHandle userHandle = jVar.o;
            if (component == null || !Intrinsics.b(userHandle, Process.myUserHandle())) {
                z11 = false;
                if (z11) {
                    if (this.o == null) {
                        this.o = FolderIcon.a0(context);
                    }
                    zVar.f97002g = new aa.n(this.o);
                }
            } else if ("com.teslacoilsw.launcher".equals(component.getPackageName()) && r70.j.I0(component.getClassName(), "FOLDER:", false)) {
                String strSubstring = component.getClassName().substring(7);
                Intrinsics.f(strSubstring, "substring(...)");
                try {
                    i5 = Integer.parseInt(strSubstring);
                } catch (NumberFormatException unused) {
                }
                if (i5 == -1) {
                }
                if (z11) {
                }
            } else {
                i5 = -1;
                if (i5 == -1) {
                    z11 = true;
                }
                if (z11) {
                }
            }
        } else if ((jVar.N0() || (jVar.f57305s & 3072) != 0) && !jVar.f57304r.e()) {
            z9.d dVarM = z9.d.m(context, jVar);
            dVarM.setLevel(jVar.f0());
            zVar.f97002g = dVarM;
        } else if (jVar.N0()) {
            if (this.f96881p == null) {
                com.teslacoilsw.launcher.icon.a aVarF = com.teslacoilsw.launcher.icon.a.f(context.getResources(), 2131231032, context.getTheme());
                g0 g0VarW = g0.w(context);
                try {
                    BitmapInfo bitmapInfoD = g0VarW.d(aVarF, Process.myUserHandle(), true);
                    g0VarW.D();
                    this.f96881p = bitmapInfoD;
                } catch (Throwable th2) {
                    g0VarW.D();
                    throw th2;
                }
            }
            zVar.f97002g = new aa.n(this.f96881p);
        } else if (!jVar.f57304r.e() || z0Var == null) {
            zVar.f97002g = jVar.r0(context, true);
        } else {
            ComponentName componentName = mx.k0.f77184z;
            BitmapInfo bitmapInfo = jVar.f57304r;
            aa.n j0Var = BitmapInfo.f21149c == bitmapInfo.f21151a ? new aa.j0(bitmapInfo, context) : new aa.n(bitmapInfo.f21151a, bitmapInfo.f21152b, false);
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new int[]{2130969100});
            float f11 = typedArrayObtainStyledAttributes.getFloat(0, 1.0f);
            typedArrayObtainStyledAttributes.recycle();
            j0Var.f632g = f11;
            j0Var.j(jVar.m());
            zVar.f97002g = j0Var;
            ((t1) t1.f80131h.h(context)).f80135d.D(z0Var, jVar);
        }
        Drawable drawable = zVar.f97002g;
        int i11 = this.f96870c;
        drawable.setBounds(0, 0, i11, i11);
        zVar.f97003h = jVar;
        zVar.f97002g.setCallback(this.f96869b);
    }

    public final void k(z zVar, ga.j jVar, int i5, int i11, int i12) {
        j(zVar, jVar, null);
        t tVar = new t(this, zVar, i5, i12, i11, i12, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, null);
        t tVar2 = zVar.f97000e;
        if (tVar2 != null && !tVar2.b(tVar)) {
            zVar.f97000e.a();
        }
        zVar.f97000e = tVar;
    }
}
