package ads_mobile_sdk;

import a70.d;
import android.content.Context;
import android.content.SharedPreferences;
import b.ua;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class pa2 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f8143a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f8144b;

    /* renamed from: c, reason: collision with root package name */
    public final d f8145c;

    /* renamed from: d, reason: collision with root package name */
    public final d f8146d;

    /* renamed from: e, reason: collision with root package name */
    public final d f8147e;

    public pa2(Context context, jr0 flags) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(context, "context");
        this.f8143a = flags;
        this.f8144b = context;
        this.f8145c = LazyKt.a(new ma2(this, 1));
        this.f8146d = LazyKt.a(new ma2(this, 2));
        this.f8147e = LazyKt.a(new ma2(this, 0));
    }

    public final void a() {
        try {
            Object value = this.f8145c.getValue();
            Intrinsics.f(value, "getValue(...)");
            sa2 sa2Var = (sa2) ((b.q9) value);
            synchronized (sa2.class) {
                sa2Var.f6140f.a(sa2Var.f6138c);
                sa2Var.f6140f.a(sa2Var.f6137a);
            }
        } catch (Exception e3) {
            zi3.a(4, "Exception while clearing PAIDV1", e3);
        }
    }

    public final void b() {
        try {
            Object value = this.f8146d.getValue();
            Intrinsics.f(value, "getValue(...)");
            ua2 ua2Var = (ua2) ((ua) value);
            synchronized (ua2.class) {
                try {
                    x7.c cVar = ua2Var.f6140f;
                    if (((SharedPreferences) cVar.f95127b).contains(ua2Var.f6137a)) {
                        ua2Var.f6140f.a(ua2Var.f6138c);
                        ua2Var.f6140f.a(ua2Var.f6137a);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } catch (Exception e3) {
            zi3.a(4, "Exception while clearing PAIDV2", e3);
        }
    }
}
