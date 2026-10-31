package ga;

import android.app.Person;
import java.util.function.Function;

/* loaded from: classes2.dex */
public final /* synthetic */ class i implements Function {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57321a;

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        int i5 = this.f57321a;
        return ((Person) obj).getKey();
    }
}
