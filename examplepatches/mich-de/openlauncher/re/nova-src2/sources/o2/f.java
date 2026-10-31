package o2;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import androidx.datastore.core.CorruptionException;
import b.i8;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Executors;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import o9.s2;

/* loaded from: classes.dex */
public final class f implements q3.h0, vd.b, t5.b, ua.f, mb0.b, mb0.e, yl.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79249a;

    public /* synthetic */ f(int i5) {
        this.f79249a = i5;
    }

    public static final x80.m0 k(x80.m0 m0Var) {
        if ((m0Var != null ? m0Var.f95559g : null) == null) {
            return m0Var;
        }
        x80.l0 l0VarD = m0Var.d();
        l0VarD.f95528g = null;
        return l0VarD.a();
    }

    public static z1.f l() {
        return (z1.f) z1.k.f97942b.h();
    }

    public static boolean n(String str) {
        return ("Connection".equalsIgnoreCase(str) || "Keep-Alive".equalsIgnoreCase(str) || "Proxy-Authenticate".equalsIgnoreCase(str) || "Proxy-Authorization".equalsIgnoreCase(str) || "TE".equalsIgnoreCase(str) || "Trailers".equalsIgnoreCase(str) || "Transfer-Encoding".equalsIgnoreCase(str) || "Upgrade".equalsIgnoreCase(str)) ? false : true;
    }

    public static z1.f q(z1.f fVar) {
        if (fVar instanceof z1.e0) {
            z1.e0 e0Var = (z1.e0) fVar;
            if (e0Var.f97918t == x1.f.c()) {
                e0Var.f97916r = null;
                return fVar;
            }
        }
        if (fVar instanceof z1.f0) {
            z1.f0 f0Var = (z1.f0) fVar;
            if (f0Var.f97927i == x1.f.c()) {
                f0Var.f97926h = null;
                return fVar;
            }
        }
        z1.f fVarH = z1.k.h(fVar, null, false);
        fVarH.j();
        return fVarH;
    }

    public static Object r(Function0 function0, Function1 function1) {
        z1.f e0Var;
        if (function1 == null) {
            return function0.invoke();
        }
        z1.f fVar = (z1.f) z1.k.f97942b.h();
        if (fVar instanceof z1.e0) {
            z1.e0 e0Var2 = (z1.e0) fVar;
            if (e0Var2.f97918t == x1.f.c()) {
                Function1 function12 = e0Var2.f97916r;
                Function1 function13 = e0Var2.f97917s;
                try {
                    ((z1.e0) fVar).f97916r = z1.k.l(function1, function12, true);
                    ((z1.e0) fVar).f97917s = function13;
                    return function0.invoke();
                } finally {
                    e0Var2.f97916r = function12;
                    e0Var2.f97917s = function13;
                }
            }
        }
        if (fVar == null || (fVar instanceof z1.b)) {
            e0Var = new z1.e0(fVar instanceof z1.b ? (z1.b) fVar : null, function1, null, true, false);
        } else {
            if (function1 == null) {
                return function0.invoke();
            }
            e0Var = fVar.u(function1);
        }
        try {
            z1.f fVarJ = e0Var.j();
            try {
                Object objInvoke = function0.invoke();
                z1.f.q(fVarJ);
                e0Var.c();
                return objInvoke;
            } catch (Throwable th2) {
                z1.f.q(fVarJ);
                throw th2;
            }
        } catch (Throwable th3) {
            e0Var.c();
            throw th3;
        }
    }

    public static void w(z1.f fVar, z1.f fVar2, Function1 function1) {
        if (fVar != fVar2) {
            fVar2.getClass();
            z1.f.q(fVar);
            fVar2.c();
        } else if (fVar instanceof z1.e0) {
            ((z1.e0) fVar).f97916r = function1;
        } else if (fVar instanceof z1.f0) {
            ((z1.f0) fVar).f97926h = function1;
        } else {
            throw new IllegalStateException(("Non-transparent snapshot was reused: " + fVar).toString());
        }
    }

    @Override // ua.f
    public int a(View view) {
        return view.getLeft();
    }

    @Override // mb0.b
    /* renamed from: b */
    public void mo5b(Object obj) {
        ub0.d.f90783d.a().getClass();
    }

    @Override // ua.f
    public void c(Canvas canvas, ll.i iVar, float f11) {
        iVar.b(f11, 0.0f, canvas);
    }

    @Override // ua.f
    public float d(MotionEvent motionEvent, int i5) {
        return motionEvent.getX(i5);
    }

    @Override // ua.f
    public int e(s2 s2Var, Rect rect) {
        return ((((s2Var.getMeasuredHeight() + s2Var.getPaddingTop()) + rect.top) - rect.bottom) - s2Var.getPaddingBottom()) / 2;
    }

    @Override // ua.f
    public int f(int i5, int i11) {
        return i11;
    }

    @Override // ua.f
    public int g(View view) {
        return view.getScrollX();
    }

    @Override // w60.a
    public Object get() {
        switch (this.f79249a) {
            case 7:
                return new a8.b(Executors.newSingleThreadExecutor(), 2);
            default:
                i8 i8Var = new i8(19);
                HashMap map = new HashMap();
                Set set = Collections.EMPTY_SET;
                if (set == null) {
                    throw new NullPointerException("Null flags");
                }
                map.put(qd.d.f83918a, new ae.b(30000L, 86400000L, set));
                if (set == null) {
                    throw new NullPointerException("Null flags");
                }
                map.put(qd.d.f83920c, new ae.b(1000L, 86400000L, set));
                if (set == null) {
                    throw new NullPointerException("Null flags");
                }
                Set setUnmodifiableSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(ae.d.f12744b)));
                if (setUnmodifiableSet == null) {
                    throw new NullPointerException("Null flags");
                }
                map.put(qd.d.f83919b, new ae.b(86400000L, 86400000L, setUnmodifiableSet));
                if (map.keySet().size() < qd.d.values().length) {
                    throw new IllegalStateException("Not all priorities have been configured");
                }
                new HashMap();
                return new ae.a(i8Var, map);
        }
    }

    @Override // ua.f
    public float h(float f11, float f12) {
        return f11;
    }

    @Override // ua.f
    public int i(s2 s2Var, Rect rect) {
        return (s2Var.getWidth() - s2Var.getPaddingRight()) - rect.right;
    }

    @Override // t5.b
    public Object j(CorruptionException corruptionException) throws CorruptionException {
        throw corruptionException;
    }

    @Override // ua.f
    public void m(int i5, AccessibilityEvent accessibilityEvent) {
        accessibilityEvent.setMaxScrollX(i5);
    }

    @Override // ua.f
    public int o(int i5, int i11) {
        return i5;
    }

    @Override // ua.f
    public float p(float f11, float f12) {
        return f12;
    }

    @Override // ua.f
    public int s(s2 s2Var, Rect rect) {
        return s2Var.getPaddingLeft() + rect.left;
    }

    @Override // ua.f
    public void t(s2 s2Var, ll.i iVar, int i5) {
        iVar.i(s2Var, i5, 0);
    }

    @Override // ua.f
    public a5.z u(View view, int i5, int i11, boolean z11) {
        int measuredWidth = view.getMeasuredWidth();
        int i12 = i5 + measuredWidth;
        int measuredHeight = view.getMeasuredHeight();
        int i13 = i11 - (measuredHeight / 2);
        if (z11) {
            view.layout(i5, i13, i12, measuredHeight + i13);
        }
        return new a5.z(measuredWidth, i12);
    }

    @Override // ua.f
    public float v(VelocityTracker velocityTracker, int i5) {
        return velocityTracker.getXVelocity(i5);
    }

    @Override // ua.f
    public float x(s2 s2Var) {
        return s2Var.getScaleX();
    }

    @Override // ua.f
    public int y(View view) {
        return view.getMeasuredWidth();
    }

    @Override // mb0.e
    public Object b(Object obj) {
        switch (this.f79249a) {
            case 11:
                ib0.i iVar = (ib0.i) obj;
                ub0.d.f90783d.b().getClass();
                return iVar;
            default:
                Throwable th2 = (Throwable) obj;
                ub0.d.f90783d.b().getClass();
                return th2;
        }
    }
}
