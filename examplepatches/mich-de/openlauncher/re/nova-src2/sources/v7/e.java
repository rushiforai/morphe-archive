package v7;

import android.content.Context;
import java.util.LinkedHashSet;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public final a8.c f92127a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f92128b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f92129c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashSet f92130d;

    /* renamed from: e, reason: collision with root package name */
    public Object f92131e;

    public e(Context context, a8.c cVar) {
        this.f92127a = cVar;
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "context.applicationContext");
        this.f92128b = applicationContext;
        this.f92129c = new Object();
        this.f92130d = new LinkedHashSet();
    }

    public abstract Object a();

    public final void b(Object obj) {
        synchronized (this.f92129c) {
            Object obj2 = this.f92131e;
            if (obj2 == null || !obj2.equals(obj)) {
                this.f92131e = obj;
                this.f92127a.f461d.execute(new b80.a(19, b70.g.I1(this.f92130d), this));
                Unit unit = Unit.f71706a;
            }
        }
    }

    public abstract void c();

    public abstract void d();
}
