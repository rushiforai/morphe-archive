package e10;

import android.content.SharedPreferences;
import com.amplitude.android.migration.DatabaseConstants;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.properties.ReadOnlyProperty;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public class s2 implements f10.v, ReadOnlyProperty {

    /* renamed from: a, reason: collision with root package name */
    public final Object f51806a;

    /* renamed from: b, reason: collision with root package name */
    public final Function2 f51807b;

    /* renamed from: c, reason: collision with root package name */
    public final String f51808c;

    /* renamed from: d, reason: collision with root package name */
    public String f51809d;

    /* renamed from: e, reason: collision with root package name */
    public Object f51810e;

    /* renamed from: f, reason: collision with root package name */
    public final a70.d f51811f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f51812g;

    public s2(Object obj, String str, Function2 function2) {
        this.f51806a = obj;
        this.f51807b = function2;
        this.f51808c = str;
        final int i5 = 0;
        this.f51811f = LazyKt.a(new Function0(this) { // from class: e10.k2

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ s2 f51626b;

            {
                this.f51626b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        ib0.d dVar = y2.f51889d;
                        if (dVar == null) {
                            Intrinsics.m("sharedPreferencesObservable");
                            throw null;
                        }
                        ib0.d dVarB = ib0.d.b(new nb0.p(dVar, new ae.i(new l2(this.f51626b, 1), 21), 0));
                        AtomicReference atomicReference = new AtomicReference();
                        return ib0.d.b(new nb0.t(new nb0.a0(new nb0.w(atomicReference), dVarB, atomicReference)));
                    default:
                        w70.n1 n1Var = y2.f51893e;
                        if (n1Var == null) {
                            Intrinsics.m("sharedPreferencesFlow");
                            throw null;
                        }
                        s2 s2Var = this.f51626b;
                        return w70.u1.x(new q2(3, new q2(0, n1Var, s2Var), s2Var), t70.l1.f88818a, w70.y1.a(3), 1);
                }
            }
        });
        final int i11 = 1;
        Function0 function0 = new Function0(this) { // from class: e10.k2

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ s2 f51626b;

            {
                this.f51626b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        ib0.d dVar = y2.f51889d;
                        if (dVar == null) {
                            Intrinsics.m("sharedPreferencesObservable");
                            throw null;
                        }
                        ib0.d dVarB = ib0.d.b(new nb0.p(dVar, new ae.i(new l2(this.f51626b, 1), 21), 0));
                        AtomicReference atomicReference = new AtomicReference();
                        return ib0.d.b(new nb0.t(new nb0.a0(new nb0.w(atomicReference), dVarB, atomicReference)));
                    default:
                        w70.n1 n1Var = y2.f51893e;
                        if (n1Var == null) {
                            Intrinsics.m("sharedPreferencesFlow");
                            throw null;
                        }
                        s2 s2Var = this.f51626b;
                        return w70.u1.x(new q2(3, new q2(0, n1Var, s2Var), s2Var), t70.l1.f88818a, w70.y1.a(3), 1);
                }
            }
        };
        dy.k kVar = lx.d.f75158a;
        this.f51812g = LazyKt.b(LazyThreadSafetyMode.f71681c, function0);
    }

    public final void a() {
        SharedPreferences sharedPreferences = y2.f51885c;
        if (sharedPreferences != null) {
            sharedPreferences.edit().remove(d()).apply();
        } else {
            Intrinsics.m("sharedPreferences");
            throw null;
        }
    }

    @Override // f10.v
    public final ib0.d b() {
        ib0.d dVar = (ib0.d) this.f51811f.getValue();
        String strD = d();
        dVar.getClass();
        ib0.d dVarB = ib0.d.b(new nb0.g(new Object[]{rb0.g.e(strD), dVar}, 1));
        return ib0.d.b(new nb0.p(dVarB instanceof rb0.g ? ((rb0.g) dVarB).f() : ib0.d.b(new nb0.g(dVarB, 0)), new ae.i(new l2(this, 0), 20), 2));
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    public final w70.m c() {
        return (w70.m) this.f51812g.getValue();
    }

    public final String d() {
        String str = this.f51809d;
        if (str != null) {
            return str;
        }
        Intrinsics.m(DatabaseConstants.KEY_FIELD);
        throw null;
    }

    public Object e(Object obj, String str) {
        Object string;
        try {
            if (obj instanceof Boolean) {
                SharedPreferences sharedPreferences = y2.f51885c;
                if (sharedPreferences == null) {
                    Intrinsics.m("sharedPreferences");
                    throw null;
                }
                string = Boolean.valueOf(sharedPreferences.getBoolean(str, ((Boolean) obj).booleanValue()));
            } else if (obj instanceof Integer) {
                SharedPreferences sharedPreferences2 = y2.f51885c;
                if (sharedPreferences2 == null) {
                    Intrinsics.m("sharedPreferences");
                    throw null;
                }
                string = Integer.valueOf(sharedPreferences2.getInt(str, ((Number) obj).intValue()));
            } else if (obj instanceof Long) {
                SharedPreferences sharedPreferences3 = y2.f51885c;
                if (sharedPreferences3 == null) {
                    Intrinsics.m("sharedPreferences");
                    throw null;
                }
                string = Long.valueOf(sharedPreferences3.getLong(str, ((Number) obj).longValue()));
            } else if (obj instanceof Float) {
                SharedPreferences sharedPreferences4 = y2.f51885c;
                if (sharedPreferences4 == null) {
                    Intrinsics.m("sharedPreferences");
                    throw null;
                }
                string = Float.valueOf(sharedPreferences4.getFloat(str, ((Number) obj).floatValue()));
            } else {
                if (!(obj instanceof String)) {
                    throw new IllegalStateException("Unable to load pref '" + str + "' with type '" + obj.getClass() + "'");
                }
                SharedPreferences sharedPreferences5 = y2.f51885c;
                if (sharedPreferences5 == null) {
                    Intrinsics.m("sharedPreferences");
                    throw null;
                }
                string = sharedPreferences5.getString(str, (String) obj);
            }
            Intrinsics.e(string, "null cannot be cast to non-null type T of com.teslacoilsw.launcher.preferences.Pref3.Pref");
            return string;
        } catch (ClassCastException unused) {
            return obj;
        }
    }

    @Override // f10.v
    public final Object f() {
        return l();
    }

    public void g(y2 y2Var, KProperty kProperty) {
        String name = this.f51808c;
        if (name == null) {
            name = kProperty.getName();
        }
        this.f51809d = name;
        y2.f51897f.put(kProperty.getName(), this);
    }

    @Override // kotlin.properties.ReadOnlyProperty
    public final Object getValue(Object obj, KProperty kProperty) {
        return this;
    }

    public final boolean h(Object obj) {
        if (this.f51810e == null || Intrinsics.b(l(), obj)) {
            return false;
        }
        i(obj);
        return true;
    }

    public final void i(Object obj) {
        this.f51810e = obj;
        SharedPreferences sharedPreferences = y2.f51885c;
        if (sharedPreferences == null) {
            Intrinsics.m("sharedPreferences");
            throw null;
        }
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        j(editorEdit, obj);
        editorEdit.apply();
    }

    public SharedPreferences.Editor j(SharedPreferences.Editor editor, Object obj) {
        if (obj instanceof Boolean) {
            return editor.putBoolean(d(), ((Boolean) obj).booleanValue());
        }
        if (obj instanceof Integer) {
            return editor.putInt(d(), ((Number) obj).intValue());
        }
        if (obj instanceof Long) {
            return editor.putLong(d(), ((Number) obj).longValue());
        }
        if (obj instanceof Float) {
            return editor.putFloat(d(), ((Number) obj).floatValue());
        }
        if (obj instanceof String) {
            return editor.putString(d(), (String) obj);
        }
        throw new IllegalStateException("Unable to save pref '" + d() + "' with type '" + this.f51806a.getClass() + "'");
    }

    @Override // f10.v
    public final void k(Object obj) {
        h(obj);
    }

    public final Object l() {
        Object obj = this.f51810e;
        Continuation continuation = null;
        Object obj2 = this.f51806a;
        if (obj == null) {
            this.f51810e = e(obj2, d());
            t70.m0.t(t70.l1.f88818a, null, null, new a60.d(this, continuation, 24), 3);
        }
        Object obj3 = this.f51810e;
        if (obj3 != null) {
            return this.f51807b.invoke(obj3, obj2);
        }
        Intrinsics.m("_value");
        throw null;
    }

    public final String toString() {
        return "Pref(" + d() + ", " + l() + ", " + this.f51806a + ")";
    }

    public /* synthetic */ s2(Object obj, String str, Function2 function2, int i5) {
        this(obj, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? m2.f51658d : function2);
    }

    public /* synthetic */ s2(Boolean bool, Function1 function1) {
        this((String) null, bool, function1);
    }

    public s2(String str, Object obj, Function1 function1) {
        this(obj, str, new j2(function1, 0));
    }
}
