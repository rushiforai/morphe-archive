package g;

import c3.c1;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final Object f56431a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f56432b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f56433c;

    public r(k executor, c1 c1Var) {
        Intrinsics.g(executor, "executor");
        this.f56431a = new Object();
        this.f56433c = new ArrayList();
    }

    public final void a() {
        synchronized (this.f56431a) {
            try {
                this.f56432b = true;
                Iterator it = this.f56433c.iterator();
                while (it.hasNext()) {
                    ((Function0) it.next()).invoke();
                }
                this.f56433c.clear();
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean b() {
        boolean z11;
        synchronized (this.f56431a) {
            z11 = this.f56432b;
        }
        return z11;
    }
}
