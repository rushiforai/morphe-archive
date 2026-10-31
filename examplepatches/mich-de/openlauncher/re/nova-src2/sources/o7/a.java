package o7;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.provider.Settings;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar;
import com.teslacoilsw.launcher.NovaLauncher;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import e10.y2;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import mx.u0;
import o9.s2;
import org.json.JSONArray;
import org.json.JSONException;
import t70.m0;
import ya.k0;

/* loaded from: classes.dex */
public class a implements q3.i0, ua.f, mb0.e, vk.t, km.a, k0, bm.e {

    /* renamed from: b, reason: collision with root package name */
    public static a f79616b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a f79617c = new a(18);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a f79618d = new a(21);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79619a;

    public /* synthetic */ a(int i5) {
        this.f79619a = i5;
    }

    public static final float A(float f11, float[] fArr, float[] fArr2) {
        float f12;
        float f13;
        float f14;
        float fAbs = Math.abs(f11);
        float fSignum = Math.signum(f11);
        int iBinarySearch = Arrays.binarySearch(fArr, fAbs);
        if (iBinarySearch >= 0) {
            return fSignum * fArr2[iBinarySearch];
        }
        int i5 = -(iBinarySearch + 1);
        int i11 = i5 - 1;
        float f15 = 0.0f;
        if (i11 >= fArr.length - 1) {
            float f16 = fArr[fArr.length - 1];
            float f17 = fArr2[fArr.length - 1];
            if (f16 == 0.0f) {
                return 0.0f;
            }
            return (f17 / f16) * f11;
        }
        if (i11 == -1) {
            f12 = fArr[0];
            f13 = fArr2[0];
            f14 = 0.0f;
        } else {
            float f18 = fArr[i11];
            f12 = fArr[i5];
            f15 = fArr2[i11];
            f13 = fArr2[i5];
            f14 = f18;
        }
        return ph.a.n(f15, f13, f14, f12, fAbs) * fSignum;
    }

    public static final void B(a aVar, NovaLauncher novaLauncher, boolean z11) {
        aVar.getClass();
        if (x20.e.f94986c == (!z11)) {
            return;
        }
        Continuation continuation = null;
        if (z11) {
            x20.e.f94986c = false;
            m0.t(novaLauncher, null, null, new u0(novaLauncher, continuation, 7), 3);
        } else {
            x20.e.f94986c = true;
            m0.t(novaLauncher, null, null, new u0(novaLauncher, continuation, 6), 3);
        }
    }

    public static Typeface C(String str, q3.b0 b0Var, int i5) {
        if (i5 == 0 && Intrinsics.b(b0Var, q3.b0.f83532f) && (str == null || str.length() == 0)) {
            return Typeface.DEFAULT;
        }
        return Typeface.create(str == null ? Typeface.DEFAULT : Typeface.create(str, 0), b0Var.f83539a, i5 == 1);
    }

    public static boolean D() {
        if (x20.e.f94988e == null) {
            Context context = mx.g0.f77088a;
            x20.e.f94988e = Boolean.valueOf(o4.a.a(mx.g0.e(), "android.permission.WRITE_SECURE_SETTINGS") == 0);
        }
        Boolean bool = x20.e.f94988e;
        Intrinsics.d(bool);
        return bool.booleanValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0023  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean E() {
        if (x20.e.f94989f == null) {
            y2.f51877a.getClass();
            if (((Boolean) y2.V0().l()).booleanValue()) {
                q10.b bVar = q10.b.f83431e;
                boolean z11 = ul.b.M();
                x20.e.f94989f = Boolean.valueOf(z11);
            }
        }
        Boolean bool = x20.e.f94989f;
        Intrinsics.d(bool);
        return bool.booleanValue();
    }

    public static boolean F() {
        if (x20.e.f94987d == null) {
            Context context = mx.g0.f77088a;
            x20.e.f94987d = Boolean.valueOf(mx.g0.o() && o4.a.a(mx.g0.e(), "android.permission.STATUS_BAR") == 0);
        }
        Boolean bool = x20.e.f94987d;
        Intrinsics.d(bool);
        return bool.booleanValue();
    }

    public static void I(ContentResolver contentResolver, boolean z11) {
        Iterable iterableE1;
        String string = Settings.Secure.getString(contentResolver, "icon_blacklist");
        if (string == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        List listH1 = r70.k.h1(string, new char[]{AbstractJsonLexerKt.COMMA}, 6);
        if (listH1.isEmpty()) {
            iterableE1 = EmptyList.f71733a;
        } else {
            ListIterator listIterator = listH1.listIterator(listH1.size());
            while (listIterator.hasPrevious()) {
                if (((String) listIterator.previous()).length() != 0) {
                    iterableE1 = b70.g.E1(listH1, listIterator.nextIndex() + 1);
                    break;
                }
            }
            iterableE1 = EmptyList.f71733a;
        }
        Set setM1 = b70.g.M1(iterableE1);
        if (z11) {
            setM1.remove("clock");
        } else {
            setM1.add("clock");
        }
        try {
            Settings.Secure.putString(contentResolver, "icon_blacklist", b70.g.f1(setM1, ",", null, null, 0, null, 62));
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }

    public static final String z(JSONArray jSONArray) throws JSONException {
        String[] strArr = q20.p.f83512h;
        if (jSONArray.length() != 0) {
            String string = jSONArray.getJSONObject((jSONArray.length() - 1) / 2).getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            if (string.length() != 0) {
                return string;
            }
        }
        return null;
    }

    @Override // ua.f
    public int a(View view) {
        return view.getTop();
    }

    @Override // mb0.e
    public Object b(Object obj) {
        switch (this.f79619a) {
            case 9:
                ib0.b bVar = (ib0.b) obj;
                ub0.d.f90783d.b().getClass();
                return bVar;
            case 10:
            default:
                ib0.c cVar = (ib0.c) obj;
                ub0.d.f90783d.b().getClass();
                return cVar;
            case 11:
                mb0.a aVar = (mb0.a) obj;
                ub0.d.f90783d.d().getClass();
                return aVar;
        }
    }

    @Override // ua.f
    public void c(Canvas canvas, ll.i iVar, float f11) {
        iVar.b(0.0f, f11, canvas);
    }

    @Override // ua.f
    public float d(MotionEvent motionEvent, int i5) {
        return motionEvent.getY(i5);
    }

    @Override // ua.f
    public int e(s2 s2Var, Rect rect) {
        return ((((s2Var.getMeasuredWidth() + s2Var.getPaddingLeft()) + rect.left) - rect.right) - s2Var.getPaddingRight()) / 2;
    }

    @Override // ua.f
    public int f(int i5, int i11) {
        return i5;
    }

    @Override // ua.f
    public int g(View view) {
        return view.getScrollY();
    }

    @Override // ua.f
    public float h(float f11, float f12) {
        return f12;
    }

    @Override // ua.f
    public int i(s2 s2Var, Rect rect) {
        return (s2Var.getHeight() - s2Var.getPaddingBottom()) - rect.bottom;
    }

    @Override // q3.i0
    public Typeface j(q3.d0 d0Var, q3.b0 b0Var, int i5) {
        return C(d0Var.f83545d, b0Var, i5);
    }

    @Override // ya.k0
    public boolean k(MotionEvent motionEvent) {
        return false;
    }

    @Override // ya.k0
    public boolean l(MotionEvent motionEvent) {
        return false;
    }

    @Override // ua.f
    public void m(int i5, AccessibilityEvent accessibilityEvent) {
        accessibilityEvent.setMaxScrollY(i5);
    }

    @Override // ua.f
    public int o(int i5, int i11) {
        return i11;
    }

    @Override // ua.f
    public float p(float f11, float f12) {
        return f11;
    }

    @Override // bm.e
    public /* synthetic */ Object q(bm.t tVar) {
        return AnalyticsConnectorRegistrar.lambda$getComponents$0(tVar);
    }

    @Override // q3.i0
    public Typeface r(q3.b0 b0Var, int i5) {
        return C(null, b0Var, i5);
    }

    @Override // ua.f
    public int s(s2 s2Var, Rect rect) {
        return s2Var.getPaddingTop() + rect.top;
    }

    @Override // ua.f
    public void t(s2 s2Var, ll.i iVar, int i5) {
        iVar.i(s2Var, 0, i5);
    }

    @Override // ua.f
    public a5.z u(View view, int i5, int i11, boolean z11) {
        int measuredHeight = view.getMeasuredHeight();
        int i12 = i5 + measuredHeight;
        int measuredWidth = view.getMeasuredWidth();
        int i13 = i11 - (measuredWidth / 2);
        if (z11) {
            view.layout(i13, i5, measuredWidth + i13, i12);
        }
        return new a5.z(measuredHeight, i12);
    }

    @Override // ua.f
    public float v(VelocityTracker velocityTracker, int i5) {
        return velocityTracker.getYVelocity(i5);
    }

    @Override // vk.t
    public Iterator w(cz.b bVar, CharSequence charSequence) {
        return new vk.q(bVar, charSequence);
    }

    @Override // ua.f
    public float x(s2 s2Var) {
        return s2Var.getScaleY();
    }

    @Override // ua.f
    public int y(View view) {
        return view.getMeasuredHeight();
    }
}
