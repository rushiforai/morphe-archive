package androidx.recyclerview.widget;

import android.app.Notification;
import android.content.ContextWrapper;
import android.content.Intent;
import android.graphics.Typeface;
import android.view.View;
import android.widget.TextView;
import androidx.work.impl.foreground.SystemForegroundService;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class l0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15037a;

    /* renamed from: b, reason: collision with root package name */
    public final int f15038b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f15039c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f15040d;

    public /* synthetic */ l0(ContextWrapper contextWrapper, int i5, Object obj, int i11) {
        this.f15037a = i11;
        this.f15040d = contextWrapper;
        this.f15038b = i5;
        this.f15039c = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f15037a) {
            case 0:
                k0 k0Var = (k0) this.f15039c;
                s2 s2Var = k0Var.f15020e;
                r0 r0Var = (r0) this.f15040d;
                RecyclerView recyclerView = r0Var.f15100r;
                if (recyclerView != null && recyclerView.isAttachedToWindow() && !k0Var.f15026k && s2Var.getAbsoluteAdapterPosition() != -1) {
                    u1 itemAnimator = r0Var.f15100r.getItemAnimator();
                    if (itemAnimator == null || !itemAnimator.isRunning(null)) {
                        ArrayList arrayList = r0Var.f15098p;
                        int size = arrayList.size();
                        for (int i5 = 0; i5 < size; i5++) {
                            if (((k0) arrayList.get(i5)).f15027l) {
                            }
                        }
                        r0Var.f15097m.onSwiped(s2Var, this.f15038b);
                        break;
                    }
                    r0Var.f15100r.post(this);
                    break;
                }
                break;
            case 1:
                ((BottomSheetBehavior) this.f15040d).M((View) this.f15039c, this.f15038b, false);
                break;
            case 2:
                o9.n1 n1Var = (o9.n1) this.f15040d;
                if (n1Var.O != null) {
                    o9.a.M(n1Var, false, 7471103);
                    n1Var.m();
                    n1Var.O.l0(this.f15038b);
                    n1Var.O.postDelayed((ae.m) this.f15039c, 500L);
                    break;
                }
                break;
            case 3:
                ((TextView) this.f15039c).setTypeface((Typeface) this.f15040d, this.f15038b);
                break;
            case 4:
                ((r7.i) this.f15039c).a(this.f15038b, (Intent) this.f15040d);
                break;
            default:
                ((SystemForegroundService) this.f15040d).f15351e.notify(this.f15038b, (Notification) this.f15039c);
                break;
        }
    }

    public /* synthetic */ l0(Object obj, Object obj2, int i5, int i11) {
        this.f15037a = i11;
        this.f15040d = obj;
        this.f15039c = obj2;
        this.f15038b = i5;
    }

    public /* synthetic */ l0(Object obj, boolean z11, Object obj2, int i5, int i11) {
        this.f15037a = i11;
        this.f15039c = obj;
        this.f15040d = obj2;
        this.f15038b = i5;
    }
}
