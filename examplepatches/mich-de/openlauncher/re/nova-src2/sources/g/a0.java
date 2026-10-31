package g;

import android.os.Build;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import c3.c1;
import java.util.Iterator;
import java.util.ListIterator;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final Runnable f56395a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f56396b = new ArrayDeque();

    /* renamed from: c, reason: collision with root package name */
    public s f56397c;

    /* renamed from: d, reason: collision with root package name */
    public final OnBackInvokedCallback f56398d;

    /* renamed from: e, reason: collision with root package name */
    public OnBackInvokedDispatcher f56399e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f56400f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f56401g;

    public a0(Runnable runnable) {
        OnBackInvokedCallback onBackInvokedCallbackA;
        this.f56395a = runnable;
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 33) {
            if (i5 >= 34) {
                onBackInvokedCallbackA = x.f56443a.a(new t(this, 0), new t(this, 1), new u(this, 0), new u(this, 1));
            } else {
                onBackInvokedCallbackA = v.f56438a.a(new c1(this, 11));
            }
            this.f56398d = onBackInvokedCallbackA;
        }
    }

    public final void a(h6.a0 owner, s onBackPressedCallback) {
        Intrinsics.g(owner, "owner");
        Intrinsics.g(onBackPressedCallback, "onBackPressedCallback");
        h6.u lifecycle = owner.getLifecycle();
        if (lifecycle.b() == h6.t.f59440a) {
            return;
        }
        onBackPressedCallback.addCancellable(new y(this, lifecycle, onBackPressedCallback));
        f();
        onBackPressedCallback.setEnabledChangedCallback$activity_release(new c3.s(0, this, a0.class, "updateEnabledCallbacks", "updateEnabledCallbacks()V", 0, 2));
    }

    public final z b(s onBackPressedCallback) {
        Intrinsics.g(onBackPressedCallback, "onBackPressedCallback");
        this.f56396b.addLast(onBackPressedCallback);
        z zVar = new z(this, onBackPressedCallback);
        onBackPressedCallback.addCancellable(zVar);
        f();
        onBackPressedCallback.setEnabledChangedCallback$activity_release(new c3.s(0, this, a0.class, "updateEnabledCallbacks", "updateEnabledCallbacks()V", 0, 3));
        return zVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.lang.Object] */
    public final void c() {
        s sVarPrevious;
        s sVar = this.f56397c;
        if (sVar == null) {
            ArrayDeque arrayDeque = this.f56396b;
            ListIterator listIterator = arrayDeque.listIterator(arrayDeque.size());
            while (true) {
                if (!listIterator.hasPrevious()) {
                    sVarPrevious = 0;
                    break;
                } else {
                    sVarPrevious = listIterator.previous();
                    if (((s) sVarPrevious).isEnabled()) {
                        break;
                    }
                }
            }
            sVar = sVarPrevious;
        }
        this.f56397c = null;
        if (sVar != null) {
            sVar.handleOnBackCancelled();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.lang.Object] */
    public final void d() {
        s sVarPrevious;
        s sVar = this.f56397c;
        if (sVar == null) {
            ArrayDeque arrayDeque = this.f56396b;
            ListIterator listIterator = arrayDeque.listIterator(arrayDeque.getF71724c());
            while (true) {
                if (!listIterator.hasPrevious()) {
                    sVarPrevious = 0;
                    break;
                } else {
                    sVarPrevious = listIterator.previous();
                    if (((s) sVarPrevious).isEnabled()) {
                        break;
                    }
                }
            }
            sVar = sVarPrevious;
        }
        this.f56397c = null;
        if (sVar != null) {
            sVar.handleOnBackPressed();
        } else {
            this.f56395a.run();
        }
    }

    public final void e(boolean z11) {
        OnBackInvokedCallback onBackInvokedCallback;
        OnBackInvokedDispatcher onBackInvokedDispatcher = this.f56399e;
        if (onBackInvokedDispatcher == null || (onBackInvokedCallback = this.f56398d) == null) {
            return;
        }
        v vVar = v.f56438a;
        if (z11 && !this.f56400f) {
            vVar.b(onBackInvokedDispatcher, 0, onBackInvokedCallback);
            this.f56400f = true;
        } else {
            if (z11 || !this.f56400f) {
                return;
            }
            vVar.c(onBackInvokedDispatcher, onBackInvokedCallback);
            this.f56400f = false;
        }
    }

    public final void f() {
        boolean z11 = this.f56401g;
        boolean z12 = false;
        ArrayDeque arrayDeque = this.f56396b;
        if (arrayDeque == null || !arrayDeque.isEmpty()) {
            Iterator<E> it = arrayDeque.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                } else if (((s) it.next()).isEnabled()) {
                    z12 = true;
                    break;
                }
            }
        }
        this.f56401g = z12;
        if (z12 == z11 || Build.VERSION.SDK_INT < 33) {
            return;
        }
        e(z12);
    }
}
