package q40;

import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import b.u4;
import c9.h;
import com.amplitude.Y2;
import java.util.Iterator;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;
import l1.a2;

/* loaded from: classes4.dex */
public final class e extends a {

    /* renamed from: d, reason: collision with root package name */
    public static final Object f83662d;

    /* renamed from: e, reason: collision with root package name */
    public static final Object f83663e;

    /* renamed from: f, reason: collision with root package name */
    public static final WeakHashMap f83664f;

    /* renamed from: g, reason: collision with root package name */
    public static final Object f83665g;

    /* renamed from: b, reason: collision with root package name */
    public final a2 f83666b;

    /* renamed from: c, reason: collision with root package name */
    public final Window.Callback f83667c;

    static {
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71681c;
        f83662d = LazyKt.b(lazyThreadSafetyMode, d.f83657l);
        f83663e = LazyKt.b(lazyThreadSafetyMode, d.f83656k);
        f83664f = new WeakHashMap();
        f83665g = new Object();
    }

    public e(Window.Callback callback) {
        super(callback);
        this.f83667c = callback;
        this.f83666b = new a2(5);
    }

    @Override // android.view.Window.Callback
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        Window.Callback callback = this.f83667c;
        if (keyEvent == null) {
            return callback.dispatchKeyEvent(keyEvent);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f83666b.f73008b).iterator();
        Intrinsics.f(it, "listeners.keyEventInterceptors.iterator()");
        if (it.hasNext()) {
            throw u4.e(it);
        }
        return (callback.dispatchKeyEvent(keyEvent) ? p40.c.f82079b : p40.e.f82080a) instanceof p40.c;
    }

    @Override // android.view.Window.Callback
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        Window.Callback callback = this.f83667c;
        if (motionEvent == null) {
            return callback.dispatchTouchEvent(motionEvent);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f83666b.f73007a).iterator();
        Intrinsics.f(it, "listeners.touchEventInterceptors.iterator()");
        return (it.hasNext() ? ((Y2) it.next()).intercept(motionEvent, new h(6, this, it)) : callback.dispatchTouchEvent(motionEvent) ? p40.c.f82079b : p40.e.f82080a) instanceof p40.c;
    }

    /* JADX WARN: Type inference failed for: r2v3, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    @Override // android.view.Window.Callback
    public final void onContentChanged() {
        Iterator it = ((CopyOnWriteArrayList) this.f83666b.f73009c).iterator();
        while (it.hasNext()) {
            p40.g gVar = (p40.g) it.next();
            ((CopyOnWriteArrayList) gVar.f82081a.f73009c).remove(gVar);
            ?? r22 = gVar.f82083c;
            View viewPeekDecorView = gVar.f82082b.peekDecorView();
            Intrinsics.f(viewPeekDecorView, "peekDecorView()");
            r22.invoke(viewPeekDecorView);
        }
        this.f83667c.onContentChanged();
    }

    @Override // android.view.Window.Callback
    public final void onWindowFocusChanged(boolean z11) {
        Iterator it = ((CopyOnWriteArrayList) this.f83666b.f73010d).iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        this.f83667c.onWindowFocusChanged(z11);
    }
}
