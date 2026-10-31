package b3;

/* loaded from: classes.dex */
public final class h implements g2.m {

    /* renamed from: a, reason: collision with root package name */
    public static final h f17227a = new h();

    /* renamed from: b, reason: collision with root package name */
    public static Boolean f17228b;

    @Override // g2.m
    public final void b(boolean z11) {
        f17228b = Boolean.valueOf(z11);
    }

    @Override // g2.m
    public final boolean c() {
        Boolean bool = f17228b;
        if (bool != null) {
            return bool.booleanValue();
        }
        throw a2.c.r("canFocus is read before it is written");
    }
}
