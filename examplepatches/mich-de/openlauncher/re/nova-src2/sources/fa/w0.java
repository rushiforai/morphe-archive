package fa;

import java.util.function.Predicate;

/* loaded from: classes2.dex */
public final /* synthetic */ class w0 implements Predicate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54521a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f54522b;

    public /* synthetic */ w0(String str, int i5) {
        this.f54521a = i5;
        this.f54522b = str;
    }

    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        switch (this.f54521a) {
            case 0:
                return this.f54522b.equals(((ga.j) obj).M0());
            default:
                return ((ga.a) obj).f57279y.getPackageName().equals(this.f54522b);
        }
    }
}
