package j3;

import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f68766a;

    /* renamed from: b, reason: collision with root package name */
    public final Function2 f68767b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f68768c;

    public a0(String str, Function2 function2) {
        this.f68766a = str;
        this.f68767b = function2;
    }

    public final void a(b0 b0Var, Object obj) {
        ((k) b0Var).f(this, obj);
    }

    public final String toString() {
        return "AccessibilityKey: " + this.f68766a;
    }

    public /* synthetic */ a0(String str) {
        this(str, u.f68846y);
    }

    public a0(String str, int i5) {
        this(str);
        this.f68768c = true;
    }

    public a0(String str, boolean z11, Function2 function2) {
        this(str, function2);
        this.f68768c = z11;
    }
}
