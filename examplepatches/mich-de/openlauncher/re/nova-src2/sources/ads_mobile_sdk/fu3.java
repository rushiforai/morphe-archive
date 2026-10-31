package ads_mobile_sdk;

import java.util.function.Supplier;

/* loaded from: classes2.dex */
public final /* synthetic */ class fu3 implements Supplier {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f3527a;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ fu3 f3526c = new fu3(1);

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ fu3 f3525b = new fu3(0);

    public /* synthetic */ fu3(int i5) {
        this.f3527a = i5;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        return this.f3527a != 0 ? vu3.a((Object) null) : new iu3();
    }
}
