package zg;

import android.content.Context;
import c3.a1;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static final b f98526b;

    /* renamed from: a, reason: collision with root package name */
    public a1 f98527a;

    static {
        b bVar = new b();
        bVar.f98527a = null;
        f98526b = bVar;
    }

    public static a1 a(Context context) {
        a1 a1Var;
        b bVar = f98526b;
        synchronized (bVar) {
            try {
                if (bVar.f98527a == null) {
                    if (context.getApplicationContext() != null) {
                        context = context.getApplicationContext();
                    }
                    bVar.f98527a = new a1(context);
                }
                a1Var = bVar.f98527a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return a1Var;
    }
}
