package ads_mobile_sdk;

/* loaded from: classes.dex */
public final class ta3 implements b.m5 {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f9822c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile b.bb f9823a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f9824b;

    public static b.m5 a(b.bb bbVar) {
        if ((bbVar instanceof ta3) || (bbVar instanceof gj0)) {
            return bbVar;
        }
        ta3 ta3Var = new ta3();
        ta3Var.f9824b = f9822c;
        ta3Var.f9823a = bbVar;
        return ta3Var;
    }

    @Override // b.m5
    public final Object get() {
        Object obj = this.f9824b;
        if (obj != f9822c) {
            return obj;
        }
        b.bb bbVar = this.f9823a;
        if (bbVar == null) {
            return this.f9824b;
        }
        Object obj2 = bbVar.get();
        this.f9824b = obj2;
        this.f9823a = null;
        return obj2;
    }
}
