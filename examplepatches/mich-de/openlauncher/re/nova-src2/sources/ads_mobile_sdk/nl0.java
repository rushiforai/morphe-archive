package ads_mobile_sdk;

import b.ed;

/* loaded from: classes2.dex */
public final class nl0 {

    /* renamed from: a, reason: collision with root package name */
    public static volatile nl0 f7626a;

    /* renamed from: b, reason: collision with root package name */
    public static volatile nl0 f7627b;

    /* renamed from: c, reason: collision with root package name */
    public static final nl0 f7628c = new nl0();

    public static nl0 a() {
        nl0 nl0VarA;
        int i5 = qe.f8596a;
        nl0 nl0Var = f7626a;
        if (nl0Var != null) {
            return nl0Var;
        }
        synchronized (nl0.class) {
            try {
                nl0VarA = f7626a;
                if (nl0VarA == null) {
                    nl0VarA = ml0.a("getEmptyRegistry");
                    if (nl0VarA == null) {
                        nl0VarA = f7628c;
                    }
                    f7626a = nl0VarA;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return nl0VarA;
    }

    public static nl0 b() {
        nl0 nl0Var = f7627b;
        if (nl0Var != null) {
            return nl0Var;
        }
        synchronized (nl0.class) {
            try {
                nl0 nl0Var2 = f7627b;
                if (nl0Var2 != null) {
                    return nl0Var2;
                }
                int i5 = qe.f8596a;
                nl0 nl0VarA = ml0.a("loadGeneratedRegistry");
                if (nl0VarA == null && (nl0VarA = ed.b()) == null && (nl0VarA = ml0.a("getEmptyRegistry")) == null) {
                    nl0VarA = f7628c;
                }
                f7627b = nl0VarA;
                return nl0VarA;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
