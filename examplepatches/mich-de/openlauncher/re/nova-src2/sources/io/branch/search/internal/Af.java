package io.branch.search.internal;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewTreeObserver;
import io.branch.search.internal.W;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.WeakHashMap;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Af {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3158g2 f62044a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final b f62045b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Rect f62046c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Rect f62047d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final int[] f62048e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final int[] f62049f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public X f62050g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final WeakReference<View> f62051h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f62052i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final c f62053j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public Boolean f62054k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final d f62055l;

    public static final class a {
    }

    public interface b {
        void a(@Nullable List<String> list);
    }

    public static final class c implements ViewTreeObserver.OnDrawListener {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final WeakReference<Af> f62056a;

        public c(@NotNull Af tracker) {
            Intrinsics.g(tracker, "tracker");
            this.f62056a = new WeakReference<>(tracker);
        }

        @Override // android.view.ViewTreeObserver.OnDrawListener
        public final void onDraw() {
            Af af = this.f62056a.get();
            if (af != null) {
                af.a();
            }
        }
    }

    public static final class d implements View.OnAttachStateChangeListener {
        public d() {
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public final void onViewAttachedToWindow(@NotNull View p02) {
            Intrinsics.g(p02, "p0");
            Af.this.e();
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public final void onViewDetachedFromWindow(@NotNull View p02) {
            Intrinsics.g(p02, "p0");
            Af.this.f();
        }
    }

    public Af(@NotNull View view, @NotNull X entity, @NotNull C3158g2 tracking, @NotNull b recordImpression) {
        Intrinsics.g(view, "view");
        Intrinsics.g(entity, "entity");
        Intrinsics.g(tracking, "tracking");
        Intrinsics.g(recordImpression, "recordImpression");
        this.f62044a = tracking;
        this.f62045b = recordImpression;
        this.f62046c = new Rect();
        this.f62047d = new Rect();
        this.f62048e = new int[2];
        this.f62049f = new int[2];
        this.f62051h = new WeakReference<>(view);
        d dVar = new d();
        this.f62055l = dVar;
        this.f62050g = entity;
        this.f62053j = new c(this);
        view.addOnAttachStateChangeListener(dVar);
        WeakHashMap weakHashMap = a5.a1.f250a;
        if (view.isAttachedToWindow()) {
            e();
        }
    }

    public final void a() {
        View view = this.f62051h.get();
        if (view != null && view.isShown() && view.getWidth() > 0 && view.getHeight() > 0) {
            if (!view.getGlobalVisibleRect(this.f62046c)) {
                return;
            }
            view.getWindowVisibleDisplayFrame(this.f62047d);
            view.getLocationInWindow(this.f62048e);
            view.getLocationOnScreen(this.f62049f);
            int[] iArr = this.f62049f;
            int i5 = iArr[0];
            int[] iArr2 = this.f62048e;
            this.f62046c.offset(i5 - iArr2[0], iArr[1] - iArr2[1]);
            if (this.f62046c.intersect(this.f62047d)) {
                a aVar = Companion;
                Rect visibleRect = this.f62046c;
                aVar.getClass();
                Intrinsics.g(visibleRect, "visibleRect");
                float fHeight = (visibleRect.height() * visibleRect.width()) / (view.getHeight() * view.getWidth());
                if (fHeight > (((float) view.getWidth()) * ((float) view.getHeight()) >= 242000.0f ? 0.3f : 0.5f)) {
                    Boolean bool = this.f62054k;
                    if (bool == null) {
                        C3308p0.a("start impression encounter for result: " + this.f62050g.d());
                        if (this.f62044a.a(this.f62050g)) {
                            this.f62045b.a(this.f62050g.a());
                        }
                        this.f62044a.a(this.f62050g, fHeight, System.currentTimeMillis());
                        this.f62054k = Boolean.valueOf(ab.e0.t(Float.valueOf(fHeight), Float.valueOf(1.0f)) == 0);
                        return;
                    }
                    if (bool.equals(Boolean.FALSE)) {
                        List list = (List) this.f62044a.f64547d.get(Integer.valueOf(this.f62050g.c()));
                        if (list != null) {
                            W.b bVar = (W.b) a2.c.e(1, list);
                            if (bVar.f63548a < fHeight) {
                                bVar.f63548a = fHeight;
                                if (Float.compare(fHeight, 1.0f) == 0) {
                                    z = true;
                                }
                            }
                        }
                        this.f62054k = Boolean.valueOf(z);
                        return;
                    }
                    return;
                }
            }
        }
        b();
    }

    public final void b() {
        W.b bVar;
        Long l9;
        if (this.f62054k != null) {
            C3308p0.a("complete impression encounter for result: " + this.f62050g.d());
            C3158g2 c3158g2 = this.f62044a;
            int iC = this.f62050g.c();
            long jCurrentTimeMillis = System.currentTimeMillis();
            List list = (List) c3158g2.f64547d.get(Integer.valueOf(iC));
            if (list != null && (l9 = (bVar = (W.b) a2.c.e(1, list)).f63550c) == null) {
                if (l9 != null) {
                    C3308p0.a("encounter being completed again");
                } else {
                    bVar.f63550c = Long.valueOf(jCurrentTimeMillis - bVar.f63549b);
                }
            }
            this.f62054k = Boolean.FALSE;
        }
    }

    public final void c() {
        e();
        View view = this.f62051h.get();
        if (view != null) {
            view.addOnAttachStateChangeListener(this.f62055l);
            this.f62054k = this.f62044a.a(this.f62050g.c());
        }
    }

    public final void d() {
        f();
        View view = this.f62051h.get();
        if (view != null) {
            view.removeOnAttachStateChangeListener(this.f62055l);
        }
    }

    public final void e() {
        View view;
        if (this.f62052i || (view = this.f62051h.get()) == null) {
            return;
        }
        view.getViewTreeObserver().addOnDrawListener(this.f62053j);
        this.f62052i = true;
    }

    public final void f() {
        if (this.f62052i) {
            View view = this.f62051h.get();
            if (view != null) {
                view.getViewTreeObserver().removeOnDrawListener(this.f62053j);
            }
            this.f62052i = false;
        }
        b();
    }
}
