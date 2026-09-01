package defpackage;

import android.app.Activity;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.inputmethod.InputMethodManager;
import com.google.android.material.sidesheet.SideSheetBehavior;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.atomic.AtomicMarkableReference;
import java.util.concurrent.atomic.AtomicReference;
import sprig.b.g;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b2a implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ b2a(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    private final void a() {
        boolean z;
        String str;
        lod lodVar = (lod) this.b;
        synchronized (((AtomicMarkableReference) lodVar.g)) {
            try {
                z = false;
                if (((AtomicMarkableReference) lodVar.g).isMarked()) {
                    str = (String) ((AtomicMarkableReference) lodVar.g).getReference();
                    ((AtomicMarkableReference) lodVar.g).set(str, false);
                    z = true;
                } else {
                    str = null;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        if (z) {
            ((oz7) lodVar.a).i((String) lodVar.c, str);
        }
    }

    private final void b() {
        zf3 zf3Var = (zf3) this.b;
        Map mapA = null;
        ((AtomicReference) zf3Var.b).set(null);
        synchronized (zf3Var) {
            try {
                if (((AtomicMarkableReference) zf3Var.d).isMarked()) {
                    mapA = ((cl6) ((AtomicMarkableReference) zf3Var.d).getReference()).a();
                    AtomicMarkableReference atomicMarkableReference = (AtomicMarkableReference) zf3Var.d;
                    atomicMarkableReference.set((cl6) atomicMarkableReference.getReference(), false);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        if (mapA != null) {
            lod lodVar = (lod) zf3Var.e;
            ((oz7) lodVar.a).h((String) lodVar.c, mapA, zf3Var.c);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.lang.Runnable
    public final void run() {
        View viewFindFocus;
        Boolean bool = null;
        Object[] objArr = 0;
        int i = 0;
        switch (this.a) {
            case 0:
                d2a d2aVar = (d2a) this.b;
                ky6 ky6Var = d2aVar.f;
                if (d2aVar.b == 0) {
                    d2aVar.c = true;
                    ky6Var.e(ux6.ON_PAUSE);
                }
                if (d2aVar.a == 0 && d2aVar.c) {
                    ky6Var.e(ux6.ON_STOP);
                    d2aVar.d = true;
                    return;
                }
                return;
            case 1:
                okb.setRippleState$lambda$1((okb) this.b);
                return;
            case 2:
                glb glbVar = (glb) this.b;
                Object[] objArr2 = glbVar.c > 0;
                if (glbVar.p.compareAndSet(false, true) && objArr2 == true) {
                    k92 k92Var = glbVar.l.a;
                    if (k92Var != null) {
                        vx0.c0(k92Var, glbVar.s, null, new ilb(glbVar, objArr == true ? 1 : 0, i), 2);
                        return;
                    } else {
                        g76.g0("coroutineScope");
                        throw null;
                    }
                }
                return;
            case 3:
                vwa vwaVar = (vwa) this.b;
                synchronized (((ArrayDeque) vwaVar.c)) {
                    SharedPreferences.Editor editorEdit = ((SharedPreferences) vwaVar.b).edit();
                    StringBuilder sb = new StringBuilder();
                    Iterator it2 = ((ArrayDeque) vwaVar.c).iterator();
                    while (it2.hasNext()) {
                        sb.append((String) it2.next());
                        sb.append(",");
                    }
                    editorEdit.putString("topic_operation_queue", sb.toString()).apply();
                    break;
                }
                return;
            case 4:
                wv0 wv0Var = (wv0) this.b;
                wv0Var.c = false;
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) wv0Var.e;
                cue cueVar = sideSheetBehavior.i;
                if (cueVar != null && cueVar.f()) {
                    wv0Var.c(wv0Var.b);
                    return;
                } else {
                    if (sideSheetBehavior.h == 2) {
                        sideSheetBehavior.w(wv0Var.b);
                        return;
                    }
                    return;
                }
            case 5:
                View view = (View) this.b;
                ((InputMethodManager) view.getContext().getSystemService("input_method")).showSoftInput(view, 0);
                return;
            case 6:
                j6d j6dVar = ((l6d) this.b).a;
                ViewParent parent = j6dVar.getParent();
                if (parent instanceof ViewGroup) {
                    ((ViewGroup) parent).removeView(j6dVar);
                    return;
                }
                return;
            case 7:
                cjd cjdVar = (cjd) this.b;
                ku3 ku3Var = cjdVar.b;
                cjdVar.n = null;
                o78 o78Var = cjdVar.m;
                View view2 = cjdVar.a;
                if (!view2.isFocused() && (viewFindFocus = view2.getRootView().findFocus()) != null && viewFindFocus.onCheckIsTextEditor()) {
                    o78Var.i();
                    return;
                }
                Object[] objArr3 = o78Var.a;
                int i2 = o78Var.c;
                Boolean boolValueOf = null;
                for (int i3 = 0; i3 < i2; i3++) {
                    ajd ajdVar = (ajd) objArr3[i3];
                    int i4 = bjd.a[ajdVar.ordinal()];
                    if (i4 == 1) {
                        bool = Boolean.TRUE;
                    } else if (i4 == 2) {
                        bool = Boolean.FALSE;
                    } else if (i4 != 3 && i4 != 4) {
                        ygf.a();
                        return;
                    } else {
                        if (!g76.L(bool, Boolean.FALSE)) {
                            boolValueOf = Boolean.valueOf(ajdVar == ajd.ShowKeyboard);
                        }
                    }
                    boolValueOf = bool;
                }
                o78Var.i();
                if (g76.L(bool, Boolean.TRUE)) {
                    ((InputMethodManager) ((vq6) ku3Var.c).getValue()).restartInput((View) ku3Var.b);
                }
                if (boolValueOf != null) {
                    if (boolValueOf.booleanValue()) {
                        ((qlb) ((hha) ku3Var.d).a).x();
                    } else {
                        ((qlb) ((hha) ku3Var.d).a).g();
                    }
                }
                if (g76.L(bool, Boolean.FALSE)) {
                    ((InputMethodManager) ((vq6) ku3Var.c).getValue()).restartInput((View) ku3Var.b);
                    return;
                }
                return;
            case 8:
                a();
                return;
            case 9:
                b();
                return;
            case 10:
                xue xueVar = (xue) this.b;
                if (ec2.a.contains(xue.class)) {
                    return;
                }
                try {
                    WeakReference weakReference = xueVar.a;
                    View viewE = r40.E((Activity) weakReference.get());
                    Activity activity = (Activity) weakReference.get();
                    if (viewE != null && activity != null) {
                        for (View view3 : x0d.a(viewE)) {
                            if (!jzb.y(view3)) {
                                String strD = x0d.d(view3);
                                if (strD.length() > 0 && strD.length() <= 300) {
                                    HashSet hashSet = zue.e;
                                    String localClassName = activity.getLocalClassName();
                                    localClassName.getClass();
                                    wo7.g(view3, viewE, localClassName);
                                }
                            }
                            break;
                        }
                        return;
                    }
                    return;
                } catch (Exception unused) {
                    return;
                } catch (Throwable th) {
                    ec2.a(xue.class, th);
                    return;
                }
            case 11:
                y6f y6fVar = (y6f) this.b;
                Log.w("FirebaseMessaging", "Service took too long to process intent: " + y6fVar.a.getAction() + " finishing.");
                y6fVar.b.d(null);
                return;
            case 12:
                o2b o2bVar = (o2b) this.b;
                ((fnb) o2bVar.e).I(new o19(17, o2bVar));
                return;
            default:
                g.a((ViewGroup) this.b);
                return;
        }
    }
}
